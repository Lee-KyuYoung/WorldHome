package com.hk.whome.management;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ManagementDAOImpl implements ManagementDAO{

	@Autowired
	private ManagementDAO managementDAO;
	
}
