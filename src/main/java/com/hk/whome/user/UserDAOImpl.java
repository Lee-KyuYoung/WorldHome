package com.hk.whome.user;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.hk.whome.domain.UserInfoDomain;

@Repository
public class UserDAOImpl implements UserDAO{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int userIDCheck(String user_id) {
		return sqlSession.selectOne("com.hk.whome.user.sql.userIDCheck",user_id);
	}

	@Override
	public void insertUserInfo(UserInfoDomain userInfo) {
		sqlSession.insert("com.hk.whome.user.sql.insertUserInfo", userInfo);
	}

	@Override
	public UserInfoDomain getUserInfo(Model userInfo) {
		return sqlSession.selectOne("com.hk.whome.user.sql.getUserInfo", userInfo);
	}

	@Override
	public void updateUserInfo(UserInfoDomain userInfo) {
		sqlSession.update("com.hk.whome.user.sql.updateUserInfo",userInfo);
		
	}
}
