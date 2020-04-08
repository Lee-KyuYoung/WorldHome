package com.hk.whome.main;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hk.whome.domain.HomeListDomain;

@Service
@Transactional(value = "transactionManager" , rollbackFor = {Exception.class})
public class MainServiceImpl implements MainService{

	@Autowired
	private MainDAO mainDAO;

	
	@Override
	public List selectImgList(HomeListDomain homeListDomain) {
		List aa = mainDAO.selectImgList(homeListDomain);
		return aa;
	}


	@Override
	public HashMap selectDetailHome(String homeId) {
		// TODO Auto-generated method stub
		HashMap homeIdMap = new HashMap();
		homeIdMap.put("homeId", homeId);
		
		return mainDAO.selectDetailHome(homeIdMap);
	}


	@Override
	public List selectPostscriptList(HashMap postscriptListParam) {
		// TODO Auto-generated method stub
		System.out.println("여기오냥service:::::::::"+postscriptListParam);
		int page = (int) postscriptListParam.get("page");
		if (page==1){
			System.out.println("문제1service:::::::::");
			postscriptListParam.put("startPag", page);
			postscriptListParam.put("endPag", 20);  //데이터를 20개씩 가져오겠다.
			System.out.println("문제2service:::::::::");
        }else{
        	postscriptListParam.put("startPag",page+(19*(page-1)));
        	postscriptListParam.put("endPag", page*20);  //데이터를 20개씩 가져오겠다.
        }
		System.out.println("d어디서service:::::::::");
		
		
		return mainDAO.selectPostscriptList(postscriptListParam);
	}
	

	
	
	
}
