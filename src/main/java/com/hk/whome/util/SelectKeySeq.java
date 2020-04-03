package com.hk.whome.util;

import org.springframework.beans.factory.annotation.Autowired;

public class SelectKeySeq {
	
	@Autowired
	private CreateKeySeqDao createKeySeqDao;
	@Autowired
	private SelectKeySeqDao selectKeySeqDao;
	
	public String selectSeqKey(String keySep) {
		String key = "";
		String dateKeySeq = "";
		String outputKey ="";
		String keyDate ="";
		String keySeq = "";
		createKeySeqDao.createKeySeq(keySep);
		dateKeySeq = selectKeySeqDao.selectKeySeq(keySep);
		
		keyDate = dateKeySeq.substring(8);
		keySeq = dateKeySeq.substring(8,2);
		outputKey=keyDate+keySep+String.format("%04d",keySeq);
		return outputKey;
	}
}
