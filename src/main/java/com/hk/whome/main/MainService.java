package com.hk.whome.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface MainService {

	List selectImgList(HashMap homeMap);
	Map selectDetailHome(HashMap homeMap);
}
