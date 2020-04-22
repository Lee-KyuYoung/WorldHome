package com.hk.whome.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hk.whome.domain.HomeListDomain;

public interface MainService {

	List<Map<String,Object>> selectImgList(HomeListDomain homeListDomain);
	Map<String,Object> selectDetailHome(String homeMap);
	List selectPostscriptList(HashMap postscriptListParam);
}
