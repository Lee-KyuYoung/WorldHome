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
		return sqlsession.selectList("com.hk.whome.main.sql.selectImgList", homeListDomain);
	}


	@Override
	public Map<String,Object> selectDetailHome(HashMap<String,String> postscriptListParam) {
		return sqlsession.selectOne("com.hk.whome.main.sql.selectDetailHome", postscriptListParam);
	}

	@Override
	public List selectPostscriptList(HashMap postscriptListParam) {
		// TODO Auto-generated method stub
		System.out.println("::여기에 뭐가 들었나요:::"+postscriptListParam);
		return sqlsession.selectList("com.hk.whome.main.sql.selectPostscriptList", postscriptListParam);
	}

	@Override
	public int getHomeListTotalCount(HomeListDomain homeListDomain) {
		return sqlsession.selectOne("com.hk.whome.main.sql.getHomeListTotalCount", homeListDomain);
	}

	
	
}
