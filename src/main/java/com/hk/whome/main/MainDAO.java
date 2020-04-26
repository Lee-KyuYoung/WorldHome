package com.hk.whome.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hk.whome.domain.HomeListDomain;

public interface MainDAO {

	public List<Map<String,Object>> selectImgList(HomeListDomain homeListDomain);
	
	public Map<String,Object> selectDetailHome(HashMap<String,String> map);
	
	public List selectPostscriptList(HashMap postscriptListParam);
	
	public int getHomeListTotalCount(HomeListDomain homeListDomain);
}
