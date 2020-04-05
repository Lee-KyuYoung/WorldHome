package com.hk.whome.admin;

import java.util.List;
import java.util.Map;

import com.hk.whome.domain.CodeDomain;

public interface AdminDAO {

	public void insertCodeDefine(CodeDomain codeDomain) throws Exception;
	
	public List<CodeDomain> getCodeDefine(Map<String,String> param);
	
}
