package com.hk.whome.management;

import java.util.List;
import java.util.Map;

import com.hk.whome.domain.HomeImgInfoDomain;
import com.hk.whome.domain.HomeInfoDomain;

public interface ManagementDAO {
	
	public void insertHomeInfoTemp(HomeInfoDomain homeInfo);
	
	public void updateHomeInfoTemp(HomeInfoDomain homeInfo);
	
	public void insertHomeInfo(String homeID);
	
	public HomeInfoDomain getHomeInfoTemp(String homeID);
	
	public List<HomeImgInfoDomain> getHomeImgInfo(String homeID);
	
	public List<HomeInfoDomain> getHomeInfoTempList(Map<String,String> paramMap);
	
	public void updateHomeImg(HomeImgInfoDomain homeImgInfo);
	
	public void updateHomeInfo(HomeInfoDomain homeInfo);
	
	public HomeInfoDomain getHomeInfo(String homeID);
	
	public List<HomeInfoDomain> getHomeInfoList(Map<String,String> paramMap);
}
