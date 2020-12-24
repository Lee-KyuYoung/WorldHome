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
import org.springframework.security.crypto.password.PasswordEncoder;



public class CustomAuthenticationProvider implements AuthenticationProvider{
	
	@Autowired
	private UserDetailsService userDetailsService;
	
	@Autowired
	private PasswordEncoder passwordEncoder; 
	
	@SuppressWarnings("unused")
	private Logger logger = LoggerFactory.getLogger(CustomAuthenticationProvider.class);
	
	@SuppressWarnings("unchecked")
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
				
		String userID = (String) authentication.getPrincipal();
		String userPw = (String) authentication.getCredentials();
		
		//DB로직 처리
		CustomUserDetails user = (CustomUserDetails) userDetailsService.loadUserByUsername(userID);
		Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>) user.getAuthorities();
		
        if(!passwordEncoder.matches(userPw, user.getUser_pw())) {
            throw new BadCredentialsException(userID);
        }

        UsernamePasswordAuthenticationToken result = new UsernamePasswordAuthenticationToken(userID, userPw, authorities);
        result.setDetails(user);
            
        return result;

	}

	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

}

