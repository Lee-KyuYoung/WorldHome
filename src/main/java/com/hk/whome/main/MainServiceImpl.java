package com.hk.whome.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(value = "transactionManager" , rollbackFor = {Exception.class})
public class MainServiceImpl implements MainService{

	@Autowired
	private MainDAO mainDAO;

	
	@Override
	public List selectImgList(HashMap map) {
		List aa = mainDAO.selectImgList(map);
		return aa;
	}


	@Override
	public HashMap selectDetailHome(String homeId) {
		// TODO Auto-generated method stub
		HashMap homeIdMap = new HashMap();
		homeIdMap.put("homeId", homeId);
		
		return mainDAO.selectDetailHome(homeIdMap);
	}
	

	
	
	
}
