package com.hk.whome.main;

import java.util.HashMap;
import java.util.List;

import com.hk.whome.domain.HomeListDomain;

public interface MainService {

	List selectImgList(HomeListDomain homeListDomain);
	HashMap selectDetailHome(String homeMap);
	List selectPostscriptList(HashMap postscriptListParam);
}
