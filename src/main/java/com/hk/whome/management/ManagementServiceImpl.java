package com.hk.whome.management;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hk.whome.domain.HomeImgInfoDomain;
import com.hk.whome.domain.HomeInfoDomain;

@Service
@Transactional(value="transactionManager", rollbackFor= {Exception.class})
public class ManagementServiceImpl implements ManagementService{

	@Autowired
	private ManagementDAO managementDAO;

	@Override
	public void insertHomeInfoTemp(HomeInfoDomain homeInfo) {
		managementDAO.insertHomeInfoTemp(homeInfo);
	}

	@Override
	public void updateHomeInfoTemp(HomeInfoDomain homeInfo) {
		managementDAO.updateHomeInfoTemp(homeInfo);
	}

	/**
	 * 마지막 집 등록 절차 
	 */
	@Override
	public void lastRegStepHomeInfoTemp(HomeInfoDomain homeInfo) {
		managementDAO.updateHomeInfoTemp(homeInfo);
		insertHomeInfo(homeInfo.getHomeID());
	}

	@Override
	public void insertHomeInfo(String homeID) {
		managementDAO.insertHomeInfo(homeID);
	}

	@Override
	public HomeInfoDomain getHomeInfoTemp(String homeID) {
		return managementDAO.getHomeInfoTemp(homeID);
	}

	@Override
	public List<HomeImgInfoDomain> getHomeImgInfo(String homeID) {
		return managementDAO.getHomeImgInfo(homeID);
	}
	
}
