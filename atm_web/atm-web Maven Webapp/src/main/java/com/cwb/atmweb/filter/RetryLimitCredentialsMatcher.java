package com.cwb.atmweb.filter;

import java.util.concurrent.atomic.AtomicInteger;

import javax.servlet.http.HttpServletRequest;

import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authc.credential.SimpleCredentialsMatcher;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.apache.shiro.crypto.hash.Sha384Hash;

public class RetryLimitCredentialsMatcher extends HashedCredentialsMatcher {

	public static Cache<String, AtomicInteger> passwordRetryCache;
	
	
	public RetryLimitCredentialsMatcher(EhCacheManager cacheManager) {
		if(this.passwordRetryCache == null){
			this.passwordRetryCache = cacheManager.getCache("passwordRetryCache");
		}
	}

	@Override
	public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) {
		String username = (String) token.getPrincipal();
		AtomicInteger element = passwordRetryCache.get(username);
		if(element == null) {  
            element = new AtomicInteger(0);
            passwordRetryCache.put(username, element); 
        }  
        AtomicInteger retryCount = element; 
        
        
        if(retryCount.incrementAndGet() > 10) {  
            //if retry count > 5 throw  
            throw new ExcessiveAttemptsException();  
        }  
        boolean matches = super.doCredentialsMatch(token, info);  
        if(matches) {  
            passwordRetryCache.remove(username);  
        }  
        return matches; 
	}
}
