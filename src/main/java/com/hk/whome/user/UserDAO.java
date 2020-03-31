package com.hk.whome.user;

import org.springframework.ui.Model;

import com.hk.whome.domain.UserInfoDomain;

public interface UserDAO {

	public int userIDCheck(String user_id);
	
	public void insertUserInfo(UserInfoDomain userInfo);
	
	public UserInfoDomain getUserInfo(Model userInfo);
	
	public void updateUserInfo(UserInfoDomain userInfo);
}
