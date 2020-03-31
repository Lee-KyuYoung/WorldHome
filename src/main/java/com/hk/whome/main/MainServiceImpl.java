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
		System.out.println("::::::::::::::::::::::::오나요");
		List aa = mainDAO.selectImgList(map);
		System.out.println(aa+"후처리");
		return aa;
	}


	@Override
	public Map selectDetailHome(HashMap homeMap) {
		// TODO Auto-generated method stub
		mainDAO.selectDetailHome(homeMap);
		return null;
	}
	

	
	
	
}
