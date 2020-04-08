package com.hk.whome.main;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.whome.domain.HomeListDomain;

@Repository
public class MainDAOImpl implements MainDAO{

	@Autowired
	private SqlSession sqlsession;
	

	@Override
	public List selectImgList(HomeListDomain homeListDomain) {
		// TODO Auto-generated method stub
		System.out.println(":::::::::::::"+homeListDomain.getHomeAdd());
		System.out.println(":::::::::::::"+homeListDomain.getHomeDateIn());
		System.out.println(":::::::::::::"+homeListDomain.getHomeDateOut());
		return sqlsession.selectList("selectImgList", homeListDomain);
	}


	@Override
	public HashMap selectDetailHome(HashMap postscriptListParam) {
		// TODO Auto-generated method stub
		
		return sqlsession.selectOne("selectDetailHome", postscriptListParam);
	}


	@Override
	public List selectPostscriptList(HashMap postscriptListParam) {
		// TODO Auto-generated method stub
		System.out.println("::여기에 뭐가 들었나요:::"+postscriptListParam);
		return sqlsession.selectList("selectPostscriptList", postscriptListParam);
	}

	
}
