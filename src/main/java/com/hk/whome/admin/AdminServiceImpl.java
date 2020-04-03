package com.hk.whome.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(value="transactionManager", rollbackFor= {Exception.class})
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDAO adminDAO;

}
