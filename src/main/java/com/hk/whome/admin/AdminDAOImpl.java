package com.hk.whome.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.whome.domain.CodeDomain;

@Repository
public class AdminDAOImpl implements AdminDAO{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertCodeDefine(CodeDomain codeDomain) throws Exception{
		sqlSession.insert("com.hk.whome.admin.sql.insertCodeDefine",codeDomain);
	}
	
	@Override
	public List<CodeDomain> getCodeDefine(Map<String,Object> param) {
		return sqlSession.selectList("com.hk.whome.admin.sql.getCodeDefine",param);
	}
	
	

	
}
