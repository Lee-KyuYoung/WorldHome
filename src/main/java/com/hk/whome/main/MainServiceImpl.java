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
		int page = Integer.parseInt(postscriptListParam.get("page")+"");
		if (page==1){
			postscriptListParam.put("startPag", page);
			postscriptListParam.put("endPag", 10);  //데이터를 20개씩 가져오겠다.
        }else{
        	postscriptListParam.put("startPag",page+(9*(page-1)));
        	postscriptListParam.put("endPag", page*10);  //데이터를 20개씩 가져오겠다.
        }
		
		
		return mainDAO.selectPostscriptList(postscriptListParam);
	}
	

	
	
	
}
