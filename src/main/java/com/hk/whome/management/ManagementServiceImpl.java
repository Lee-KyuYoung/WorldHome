package com.hk.whome.management;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(value="TransactionManager", rollbackFor= {Exception.class})
public class ManagementServiceImpl implements ManagementService{

	@Autowired
	private ManagementDAO managementDAO;
	
}
