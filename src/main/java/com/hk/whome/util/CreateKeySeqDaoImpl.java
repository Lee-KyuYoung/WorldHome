package com.hk.whome.util;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class CreateKeySeqDaoImpl implements CreateKeySeqDao{

	
	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public void createKeySeq(String keySep) {
		// TODO Auto-generated method stub
		sqlsession.update("createSeqKey",keySep);
	}
	
	
}
