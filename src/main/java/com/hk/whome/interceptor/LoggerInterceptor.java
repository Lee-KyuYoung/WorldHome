package com.hk.whome.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import com.google.gson.Gson;


public class LoggerInterceptor extends HandlerInterceptorAdapter{

	private Logger logger = LoggerFactory.getLogger(LoggerInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		logger.info("=================================================================================");
		logger.info("URI         ::::    "+request.getRequestURI());
		logger.info("PARAMETER   ::::    "+new Gson().toJson(request.getParameterMap()));
		
		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		logger.info("=================================================================================");
		super.postHandle(request, response, handler, modelAndView);
	}

}
