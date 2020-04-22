package com.hk.whome.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.whome.domain.HomeListDomain;

@Repository
public class MainDAOImpl implements MainDAO{

	@Autowired
	private SqlSession sqlsession;
	

	@Override
	public List<Map<String,Object>> selectImgList(HomeListDomain homeListDomain) {
		// TODO Auto-generated method stub
		System.out.println(":::::::::::::"+homeListDomain.getHomeAdd());
		System.out.println(":::::::::::::"+homeListDomain.getHomeDateIn());
		System.out.println(":::::::::::::"+homeListDomain.getHomeDateOut());
		return sqlsession.selectList("com.hk.whome.main.sql.selectImgList", homeListDomain);
	}


	@Override
	public Map<String,Object> selectDetailHome(HashMap<String,String> postscriptListParam) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("com.hk.whome.main.sql.selectDetailHome", postscriptListParam);
	}


	@Override
	public List selectPostscriptList(HashMap postscriptListParam) {
		// TODO Auto-generated method stub
		System.out.println("::여기에 뭐가 들었나요:::"+postscriptListParam);
		return sqlsession.selectList("com.hk.whome.main.sql.selectPostscriptList", postscriptListParam);
	}

	
}
