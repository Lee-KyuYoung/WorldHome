package com.hk.whome.util;

import com.hk.whome.domain.HomeImgInfoDomain;

/**
 * DB가 필요한 유틸은 여기에 모음
 * @author LKY
 *
 */
public interface WhomeUtilDAO {
		
	public String getKeySep();

	public void createKeySeq(String keySep);
	
	public String selectKeySeq(String keySep);
	
	//이미지 파일 정보 insert
	public void insertImgInfo(HomeImgInfoDomain homeImgInfoDomain);
}
