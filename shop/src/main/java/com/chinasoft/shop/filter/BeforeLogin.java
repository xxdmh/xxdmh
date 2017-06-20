package com.chinasoft.shop.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class BeforeLogin extends HandlerInterceptorAdapter {
	private String[] url ={"",""};

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		for (String string : url) {
			
		}
		return true;
	}
	

}
