package com.hk.whome.security.handler;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class LoginFailureHandler implements AuthenticationFailureHandler {

	@Autowired
	private MessageSource messageSource;
	
	private String loginidname;
    private String loginpwdname;
    private String errormsgname;
    private String defaultFailureUrl;
    private Logger logger = LoggerFactory.getLogger(LoginFailureHandler.class);
    
    @Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
    	
    	logger.info("=====================   onAuthenticationFailure START   ===============================");
    	
    	
    	String username = request.getParameter(loginidname);
    	String password = request.getParameter(loginpwdname);
    	String errormsg = "";
    	
        if(exception instanceof BadCredentialsException) {
            errormsg = messageSource.getMessage("login.info.L201",null,"default text",new Locale("ko"));
        } else if(exception instanceof InternalAuthenticationServiceException) {
        	errormsg = messageSource.getMessage("login.info.L201",null,"default text",new Locale("ko"));
        } else if(exception instanceof DisabledException) {
        	errormsg = messageSource.getMessage("login.info.L201",null,"default text",new Locale("ko"));
        } else if(exception instanceof CredentialsExpiredException) {
        	errormsg = messageSource.getMessage("login.info.L201",null,"default text",new Locale("ko"));
        }
    	
    	request.setAttribute(loginidname, username);
    	request.setAttribute(loginpwdname, password);
    	request.setAttribute(errormsgname, errormsg);
    	request.getRequestDispatcher(defaultFailureUrl).forward(request, response);
    }

	public String getLoginidname() {
		return loginidname;
	}

	public void setLoginidname(String loginidname) {
		this.loginidname = loginidname;
	}

	public String getLoginpwdname() {
		return loginpwdname;
	}

	public void setLoginpwdname(String loginpwdname) {
		this.loginpwdname = loginpwdname;
	}

	public String getErrormsgname() {
		return errormsgname;
	}

	public void setErrormsgname(String errormsgname) {
		this.errormsgname = errormsgname;
	}

	public String getDefaultFailureUrl() {
		return defaultFailureUrl;
	}

	public void setDefaultFailureUrl(String defaultFailureUrl) {
		this.defaultFailureUrl = defaultFailureUrl;
	}
}
