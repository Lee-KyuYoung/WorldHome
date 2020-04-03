package com.hk.whome.util;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class SelectKeySeqDaoImpl implements SelectKeySeqDao{

	
	@Autowired
	private SqlSession sqlsession;

	@Override
	public String selectKeySeq(String keySep) {
		// TODO Auto-generated method stub
		String dateKeySeq   = "";
		dateKeySeq=sqlsession.selectOne("SelectKeySeq",keySep);
		return dateKeySeq;
	}

	
	
}
