package com.hk.whome.util;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.hk.whome.domain.HomeImgInfoDomain;

@Repository
@Transactional(value="transactionManager" , rollbackFor = {Exception.class})
public class WhomeUtilDAOImpl implements WhomeUtilDAO{

	@Autowired
	private SqlSession sqlSession;

	
	@Override
	public String getKeySep() {
		return sqlSession.selectOne("com.hk.whome.keySeq.sql.getKeySep");
	}

	@Override
	public String selectKeySeq(String keySep) {
		return sqlSession.selectOne("com.hk.whome.keySeq.sql.selectKeySeq",keySep);
	}

	@Override
	public void createKeySeq(String keySep) {
		sqlSession.update("com.hk.whome.keySeq.sql.createKeySeq",keySep);
	}

	@Override
	public void insertImgInfo(HomeImgInfoDomain homeImgInfoDomain) {
		sqlSession.insert("com.hk.whome.management.sql.insertImgInfo",homeImgInfoDomain);
	}

	
	
}
