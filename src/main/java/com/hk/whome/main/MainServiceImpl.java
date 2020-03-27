package com.hk.whome.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(value = "transactionManager" , rollbackFor = {Exception.class})
public class MainServiceImpl implements MainService{

	@Autowired
	private MainDAO mainDAO;
	
}
