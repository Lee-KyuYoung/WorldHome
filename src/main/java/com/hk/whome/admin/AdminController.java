package com.hk.whome.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.hk.whome.domain.CodeDomain;
import com.hk.whome.util.EmptyUtils;
import com.hk.whome.util.SelectKeySeqUtil;
import com.hk.whome.util.WhomeUtilDAO;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private SelectKeySeqUtil selectKeySeq;
	
	@Autowired
	private WhomeUtilDAO whomeUtilDAO;
	
	private Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	/**
	 * 관리자 페이지 코드 관리
	 * @param model
	 * @param paramMap
	 * @return
	 */
	@RequestMapping(value = "/codeManagement", method = RequestMethod.GET)
	public String codeManageMent(Model model , @RequestParam Map<String,String> paramMap ) {
		
		List<CodeDomain> codeList = adminService.getCodeDefine(null);
		
		model.addAttribute("codeList",codeList);
		
		return "admin/admin_code_management";
	}
	
	/**
	 * 코등 등록
	 * @param paramMap
	 * @return
	 */
//	@ResponseBody
//	@RequestMapping(value = "/insertCode", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
//	public Map<String,String> insertCode(@RequestParam Map<String,String> paramMap) {
//		
//		String resCode = "E001";
//		String codeName = paramMap.get("code_name");
//		String codeMent = paramMap.get("code_ment");
//		
//		String getKeySep = whomeUtilDAO.getKeySep();
//		String generatedKey = selectKeySeq.selectSeqKey(getKeySep); 
//		
//		CodeDomain codeDomain = new CodeDomain();
//		codeDomain.setCodeKey(generatedKey);
//		codeDomain.setCodeColName("KEY_SEP");
//		codeDomain.setCodeNum(getKeySep);
//		codeDomain.setCodeName(codeName);
//		codeDomain.setCodeComment(codeMent);
//		
//		logger.info(codeDomain.toString());
//		
//		try {
//			adminService.insertCodeDefine(codeDomain);
//		}catch (Exception e) {
//			resCode = "E002";
//			e.printStackTrace();
//		}
//
//		Map<String,String> resMap = new HashMap<>();
//		resMap.put("resCode", resCode);
//		
//		return resMap;
//	}
	
	/**
	 * 코드 등록
	 * @param path
	 * @param paramMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/insertCode/{path}", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public Map<String,String> insertCode(@PathVariable("path") String path , @RequestParam Map<String,String> paramMap) {
		
		String resCode = "E001";
		String codeName = paramMap.get("code_name");
		String codeMent = paramMap.get("code_ment");
		String cateInfo = paramMap.get("cate_info");
		String subGroupKey = "no";
		String cateGroupKey = "";
		String getKeySep = ""; 

		//메인 카테고리 등록 시 SEQ_KEY 테이블에 새로운 SEQ발급
		if(!EmptyUtils.isEmpty(path) && path.equals("main")) { 
			getKeySep = whomeUtilDAO.getKeySep();
		}else {
			try {
				getKeySep = cateInfo.split("/")[0];
				cateGroupKey = cateInfo.split("/")[1];
				subGroupKey = "yes";
			}catch(ArrayIndexOutOfBoundsException e) {
				e.printStackTrace();
				resCode = "E002";
			}
		}

		if(resCode == "E001") {
			
			String generatedKey = selectKeySeq.selectSeqKey(getKeySep); 
			CodeDomain codeDomain = new CodeDomain();
			codeDomain.setCodeGroupKey(cateGroupKey);
			codeDomain.setCodeKey(generatedKey);
			codeDomain.setCodeColName("KEY_SEP");
			codeDomain.setCodeNum(getKeySep);
			codeDomain.setCodeName(codeName);
			codeDomain.setCodeComment(codeMent);
			codeDomain.setCodeSubGroupKey(subGroupKey);
			
			logger.info(codeDomain.toString());
			
			try {
				adminService.insertCodeDefine(codeDomain);
			}catch (Exception e) {
				resCode = "E002";
				e.printStackTrace();
			}
		}

		Map<String,String> resMap = new HashMap<>();
		resMap.put("resCode", resCode);
		
		return resMap;
	}

	/**
	 * 코드 정보 가져오기
	 * @param paramMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/getCodeDefine" , method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String getCodeDefine(@RequestParam Map<String,String> paramMap){
		
		String groupKey = paramMap.get("group_key");
		String codeType = paramMap.get("code_type");
		
		Map<String,String> param = new HashMap<>();
		
		try {
			param.put("groupKey", groupKey.split("/")[1]);
			param.put("codeType", codeType);
		}catch(ArrayIndexOutOfBoundsException e) {
			e.printStackTrace();
		}
		
		List<CodeDomain> codeList = adminService.getCodeDefine(param);
		return new Gson().toJson(codeList);
	}
	
	
}
