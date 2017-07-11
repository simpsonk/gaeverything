package com.bitschool.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.bitschool.dto.MemberDTO;

public class Interceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		MemberDTO member = (MemberDTO)request.getSession().getAttribute("member");
		boolean isLogin = member!=null?true:false;
		if(!isLogin){
			String url = "login_page";
			response.sendRedirect(url);
			return false;
		}
		return true;
	}
}
