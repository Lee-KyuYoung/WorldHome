package com.hk.whome.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface MainDAO {

	List selectImgList(HashMap map);
	HashMap selectDetailHome(HashMap map);
}
