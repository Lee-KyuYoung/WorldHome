package com.hk.whome.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.hk.whome.domain.UserInfoDomain;

@Service
@Transactional(value = "transactionManager", rollbackFor= {Exception.class})
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDAO userDAO;

	@Override
	public int userIDCheck(String user_id) {
		return userDAO.userIDCheck(user_id);
	}

	@Override
	public void insertUserInfo(UserInfoDomain userInfo) throws Exception {
		userDAO.insertUserInfo(userInfo);
	}

	@Override
	public UserInfoDomain getUserInfo(Model userInfo) {
		return userDAO.getUserInfo(userInfo);
	}

	@Override
	public void updateUserInfo(UserInfoDomain userInfo) throws Exception{
		userDAO.updateUserInfo(userInfo);		
	}
}
