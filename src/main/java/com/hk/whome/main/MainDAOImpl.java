package com.hk.whome.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainDAOImpl implements MainDAO{

	@Autowired
	private SqlSession sqlsession;
	

	@Override
	public List selectImgList(HashMap map) {
		// TODO Auto-generated method stub
		
		System.out.println("여기오는지 확인");
		return sqlsession.selectList("selectImgList", map);
	}


	@Override
	public Map selectDetailHome(HashMap map) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
