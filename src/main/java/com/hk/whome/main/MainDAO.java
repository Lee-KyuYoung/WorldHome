package com.hk.whome.main;

import java.util.HashMap;
import java.util.List;

import com.hk.whome.domain.HomeListDomain;

public interface MainDAO {

	List selectImgList(HomeListDomain homeListDomain);
	HashMap selectDetailHome(HashMap map);
	List selectPostscriptList(HashMap postscriptListParam);
}
