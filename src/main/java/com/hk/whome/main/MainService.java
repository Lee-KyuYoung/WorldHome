package com.hk.whome.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hk.whome.domain.HomeListDomain;

public interface MainService {

	public List<Map<String,Object>> selectImgList(HomeListDomain homeListDomain);
	
	public Map<String,Object> selectDetailHome(String homeMap);
	
	public List selectPostscriptList(HashMap postscriptListParam);
	
	public int getHomeListTotalCount(HomeListDomain homeListDomain);
}
