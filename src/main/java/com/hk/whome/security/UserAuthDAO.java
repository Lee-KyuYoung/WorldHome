package com.hk.whome.security;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserAuthDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public CustomUserDetails getUserInfo(String userId) {
		return sqlSession.selectOne("com.hk.whome.user.sql.getLoginInfo",userId);
	}
	
}
