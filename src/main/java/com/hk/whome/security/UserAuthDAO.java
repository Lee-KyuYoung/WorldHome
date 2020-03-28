package com.hk.whome.security;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserAuthDAO {

	@Autowired
	private SqlSession sqlsession;
	
	public CustomUserDetails getUserInfo(String userName) {
		CustomUserDetails detail = new CustomUserDetails();
		detail.setUser_id("kr4530");
		detail.setName("이규영");
		detail.setUser_pw("12345");
		detail.setAuthority("ROLE_USER");
		detail.setEnabled(true);
		
		return detail;
	}
	
}
