package com.hk.whome.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.hk.whome.domain.CodeDomain;

@Component
public class SelectKeySeqUtil {
	
	@Autowired
	private WhomeUtilDAO whomeUtilDAO;
	
	public String selectSeqKey(String keySep) {

		String dateKeySeq = "";
		String outputKey ="";
		String keyDate ="";
		String keySeq = "";
		
		whomeUtilDAO.createKeySeq(keySep);
		dateKeySeq = whomeUtilDAO.selectKeySeq(keySep);
		
		keyDate = dateKeySeq.substring(0,8);
		keySeq = dateKeySeq.substring(8,dateKeySeq.length());
		outputKey = keyDate + keySep + String.format("%04d",Integer.parseInt(keySeq));
		
		return outputKey;
	}

}
