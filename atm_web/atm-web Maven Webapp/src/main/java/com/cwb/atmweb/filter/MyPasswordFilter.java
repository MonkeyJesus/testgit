package com.cwb.atmweb.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.web.env.IniWebEnvironment;
import org.apache.shiro.web.filter.mgt.FilterChainResolver;
import org.apache.shiro.web.servlet.OncePerRequestFilter;
import org.apache.shiro.web.servlet.ShiroFilter;

public class MyPasswordFilter extends OncePerRequestFilter {

	@Override
	protected void doFilterInternal(ServletRequest request,
			ServletResponse response, FilterChain chain)
			throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		SecureRandomNumberGenerator secureRandomNumberGenerator = new SecureRandomNumberGenerator(); 
		String salt = secureRandomNumberGenerator.nextBytes().toHex();
		String password_t = new SimpleHash("md5",password, username+salt, 2).toHex();
		
		request.setAttribute("username", username);
		request.setAttribute("password", password_t);
		request.setAttribute("salt", salt);
		request.setAttribute("role_select", request.getParameter("role_select"));
		chain.doFilter(request, response);
	}

}
