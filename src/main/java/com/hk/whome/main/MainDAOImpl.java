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
		return sqlsession.selectList("selectImgList", map);
	}


	@Override
	public HashMap selectDetailHome(HashMap homeIdMap) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("selectDetailHome", homeIdMap);
	}

	
}
