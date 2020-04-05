package com.hk.whome.management;

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

import com.hk.whome.admin.AdminService;
import com.hk.whome.domain.CodeDomain;
import com.hk.whome.util.EmptyUtils;

@Controller
@RequestMapping(value = "/management")
public class ManagementController {

	@Autowired
	private ManagementService managementSerive;
	
	@Autowired
	private AdminService adminService;
	
	private Logger logger = LoggerFactory.getLogger(ManagementController.class);
	
	/**
	 *  숙소를 등록하면 단계별로 home_temp 테이블에 저장이되고 
	 *  등록이 완료되면 home테이블에 저장됨
	 * @param model
	 * @param path
	 * @param paramMap
	 * @return
	 */
	@RequestMapping(value = "/homeReg/{path}", method = RequestMethod.GET)
	public String registration(Model model, @PathVariable("path") String path, @RequestParam Map<String,String> paramMap) {
		
		//임시저장된 정보를 진행할 경우 홈아이디를 가져옴
		String tempRegHomeId = paramMap.get("temp_reg_home_id");
		
		if(!EmptyUtils.isEmpty(tempRegHomeId)) {
			
			
		}else {
			//step1일때 임시저장된 숙소 정보가 있는지 확인한다.
			if(path.equals("step1")) {
				
				Map<String,String> getCodeDefineParam = new HashMap<String,String>(); 
				getCodeDefineParam.put("codeType", "main");
				getCodeDefineParam.put("codeType", "1001"); // 집 종류
				
				List<CodeDomain> homeCodeList = adminService.getCodeDefine(getCodeDefineParam);
				
				model.addAttribute("homeType",homeCodeList);
			}
		}
		
		return "management/home_reg_"+path;
	}
	
	/**
	 * 
	 * 등록 1단계
	 * 임시 저장 테이블에 집 유형, 인원수, 주소를 등록한다.
	 * @param paramMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/homeRegProcStep1" , method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public Map<String,String> RegistrationStep1(@RequestParam Map<String,String> paramMap) {
		String resCode = "E001";
		Map<String,String> resultMap = new HashMap<>();
		resultMap.put("resCode",resCode);
		return resultMap;
	}
		
	/**
	 * 등록 2단계 
	 * 임시 저장 테이블에 최대인원 , 침대 개수, 욕실 개수를 등록한다.
	 * @param paramMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/homeRegProcStep2", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public Map<String,String> registrationStep2(@RequestParam Map<String,String> paramMap){
		String resCode = "E001";
		Map<String,String> resultMap = new HashMap<>();
		resultMap.put("resCode",resCode);
		return resultMap;
	}
	
	/**
	 * 등록 3단계
	 * @param paramMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/homeRegProcStep3", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public Map<String,String> registrationStep3(@RequestParam Map<String,String> paramMap){
		String resCode = "E001";
		Map<String,String> resultMap = new HashMap<>();
		resultMap.put("resCode", resCode);
		return resultMap;
	}
	
	
	/**
	 * 등록 4단계
	 * 임시 저장테이블에 숙소의 주소를 저장한다.
	 * @param paramMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/homeRegProcStep4", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public Map<String,String> registrationStep4(@RequestParam Map<String,String> paramMap){
		String resCode = "E001";
		Map<String,String> resultMap = new HashMap<>();
		resultMap.put("resCode", resCode);
		return resultMap;
	}
	
	/**
	 * 등록 5단계
	 * 임시 저장테이블에 숙소의 이미지를 저장한다.
	 * 
	 * @param paramMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/homeRegProcStep5", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public Map<String,String> registrationStep5(@RequestParam Map<String,String> paramMap){
		String resCode = "E001";
		Map<String,String> resultMap = new HashMap<>();
		resultMap.put("resCode", resCode);
		return resultMap;
	}
	
	/**
	 * 등록 6단계
	 * 임시 저장테이블에 숙소의 이미지를 저장한다.
	 * 
	 * @param paramMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/homeRegProcStep6", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public Map<String,String> registrationStep6(@RequestParam Map<String,String> paramMap){
		String resCode = "E001";
		Map<String,String> resultMap = new HashMap<>();
		resultMap.put("resCode", resCode);
		return resultMap;
	}
}
