package com.hk.whome.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<Map<String,Object>> selectImgList(HomeListDomain homeListDomain) {
		return mainDAO.selectImgList(homeListDomain);
	}

	@Override
	public Map<String,Object> selectDetailHome(String homeId) {

		HashMap<String,String> homeIdMap = new HashMap<>();
		homeIdMap.put("homeId", homeId);
		
		return mainDAO.selectDetailHome(homeIdMap);
	}

	@Override
	public int getHomeListTotalCount(HomeListDomain homeListDomain) {
		return mainDAO.getHomeListTotalCount(homeListDomain);
	}
	
}
