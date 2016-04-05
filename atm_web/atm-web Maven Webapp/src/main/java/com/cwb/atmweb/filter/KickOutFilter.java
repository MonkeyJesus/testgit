package com.cwb.atmweb.filter;

import java.io.Serializable;
import java.util.Deque;
import java.util.LinkedList;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.DefaultSessionKey;
import org.apache.shiro.session.mgt.SessionManager;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.apache.shiro.web.util.WebUtils;

public class KickOutFilter extends AccessControlFilter {

	//踢出后到的地址
	private String kickOutUrl;
	//最大允许同时在线数
	private int maxSession;
	//是否踢出之后登陆的人
	private boolean kickOutAfter;
	
	private SessionManager sessionManager;
    private Cache<String, Deque<Serializable>> cache;
	

	public void setKickOutUrl(String kickOutUrl) {
		this.kickOutUrl = kickOutUrl;
	}

	public void setMaxSession(int maxSession) {
		this.maxSession = maxSession;
	}

	public void setKickOutAfter(boolean kickOutAfter) {
		this.kickOutAfter = kickOutAfter;
	}

	public void setSessionManager(SessionManager sessionManager) {
		this.sessionManager = sessionManager;
	}

	public void setCacheManager(CacheManager cacheManager) {
		this.cache = cacheManager.getCache("shiro-kickout-session");
	}

	@Override
	protected boolean isAccessAllowed(ServletRequest request,
			ServletResponse response, Object mappedValue) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	protected boolean onAccessDenied(ServletRequest request,
			ServletResponse response) throws Exception {
		
		System.out.println("===========kickout");
		
		Subject subject = getSubject(request, response);
        if(!subject.isAuthenticated() && subject.isRemembered()) {
        	
        	System.out.println("未登录");
        	
            //如果没有登录，直接进行之后的流程
            return true;
        }

        Session session = subject.getSession();
        String username = (String) subject.getPrincipal();
        Serializable sessionId = session.getId();

        Deque<Serializable> deque = cache.get(username);
        if(deque == null) {
            deque = new LinkedList<Serializable>();
            cache.put(username, deque);
            for(String s:cache.keys()){
            	System.out.println(s+"===="+cache.get(s));
            }
        }

        //如果队列里没有此sessionId，且用户没有被踢出；放入队列
        if(!deque.contains(sessionId) && session.getAttribute("kickout") == null) {
            deque.push(sessionId);
        }

        //如果队列里的sessionId数超出最大会话数，开始踢人
        while(deque.size() > maxSession) {
            Serializable kickoutSessionId = null;
            if(kickOutAfter) { //如果踢出后者
                kickoutSessionId = deque.removeFirst();
            } else { //否则踢出前者
                kickoutSessionId = deque.removeLast();
            }
            try {
                Session kickoutSession = sessionManager.getSession(new DefaultSessionKey(kickoutSessionId));
                if(kickoutSession != null) {
                    //设置会话的kickout属性表示踢出了
                    kickoutSession.setAttribute("kickout", true);
                }
            } catch (Exception e) {//ignore exception
            }
        }
        System.out.println("==========="+deque+"--"+kickOutUrl+"--"+kickOutAfter+"--"+maxSession);
        
        //如果被踢出了，直接退出，重定向到踢出后的地址
        if (session.getAttribute("kickout") != null) {
            //会话被踢出了
            try {
                subject.logout();
            } catch (Exception e) { //ignore
            }
            saveRequest(request);
            WebUtils.issueRedirect(request, response, kickOutUrl);
            return false;
        }
        return true;
	}

}
