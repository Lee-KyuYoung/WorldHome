package com.hk.whome.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hk.whome.domain.CodeDomain;

@Service
@Transactional(value="transactionManager", rollbackFor= {Exception.class})
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDAO adminDAO;

	@Override
	public void insertCodeDefine(CodeDomain codeDomain) throws Exception{
		adminDAO.insertCodeDefine(codeDomain);
	}

	@Override
	public List<CodeDomain> getCodeDefine(Map<String,Object> param) {
		return adminDAO.getCodeDefine(param);
	}

	
	
}
