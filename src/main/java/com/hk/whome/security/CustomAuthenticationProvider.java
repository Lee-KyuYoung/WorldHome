package com.hk.whome.security;

import java.util.Collection;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;



public class CustomAuthenticationProvider implements AuthenticationProvider{
	
	@Autowired
	private UserDetailsService userDetailsService;
	
	private Logger logger = LoggerFactory.getLogger(CustomAuthenticationProvider.class);
	
	@SuppressWarnings("unchecked")
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		logger.info("=====================  authenticate  ====================");
				
		String user_id = (String) authentication.getPrincipal();
		String user_pw = (String) authentication.getCredentials();
		
		logger.info("user_id  ::::  "+user_id);
		logger.info("user_pw  ::::  "+user_pw);
		
		//DB로직 처리
		CustomUserDetails user = (CustomUserDetails) userDetailsService.loadUserByUsername(user_id);
		Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>) user.getAuthorities();
		
        if(!matchPassword(user_pw, user.getUser_pw())) {
        	logger.info("비밀번호가 틀립니다.");
            throw new BadCredentialsException(user_id);
        }
 
        if(!user.isEnabled() ||  !user.isCredentialsNonExpired()) {
        	logger.info("불가능한 사용자입니다.");
            throw new BadCredentialsException(user_id);
        }

        UsernamePasswordAuthenticationToken result = new UsernamePasswordAuthenticationToken(user_id, user_pw, authorities);
        result.setDetails(user);
        
        System.out.println("ID : "+user.getUser_id()+"    PW : "+user.getUser_pw()+"    Authorit : "+user.getAuthority());
            
        return result;

	}

	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}
	
    private boolean matchPassword(String loginPwd, String password) {
        return loginPwd.equals(password);
    }


}

