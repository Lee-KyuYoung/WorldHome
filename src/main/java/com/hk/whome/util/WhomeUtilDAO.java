package com.hk.whome.util;

/**
 * DB가 필요한 유틸은 여기에 모음
 * @author LKY
 *
 */
public interface WhomeUtilDAO {
		
	public String getKeySep();
		
	public void createKeySeq(String keySep);
	
	public String selectKeySeq(String keySep);
}
