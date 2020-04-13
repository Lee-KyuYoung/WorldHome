package com.hk.whome.management;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.whome.domain.HomeImgInfoDomain;
import com.hk.whome.domain.HomeInfoDomain;

@Repository
public class ManagementDAOImpl implements ManagementDAO{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertHomeInfoTemp(HomeInfoDomain homeInfo) {
		sqlSession.insert("com.hk.whome.management.sql.insertHomeInfoTemp",homeInfo);
	}

	@Override
	public void updateHomeInfoTemp(HomeInfoDomain homeInfo) {
		sqlSession.update("com.hk.whome.management.sql.updateHomeInfoTemp",homeInfo);
	}

	@Override
	public void insertHomeInfo(String homeID) {
		sqlSession.update("com.hk.whome.management.sql.insertHomeInfo",homeID);
	}

	@Override
	public HomeInfoDomain getHomeInfoTemp(String homeID) {
		return sqlSession.selectOne("com.hk.whome.management.sql.getHomeInfoTemp",homeID);
	}

	@Override
	public List<HomeImgInfoDomain> getHomeImgInfo(String homeID) {
		return sqlSession.selectList("com.hk.whome.management.sql.getHomeImgInfo",homeID);
	}
	
	
}
