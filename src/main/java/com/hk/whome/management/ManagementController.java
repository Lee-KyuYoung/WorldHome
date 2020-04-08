package com.hk.whome.management;



import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.multipart.MultipartFile;

import com.hk.whome.admin.AdminService;
import com.hk.whome.domain.CodeDomain;
import com.hk.whome.domain.HomeImgInfoDomain;
import com.hk.whome.domain.HomeInfoDomain;
import com.hk.whome.security.CustomUserDetails;
import com.hk.whome.util.EmptyUtils;
import com.hk.whome.util.FileUtils;
import com.hk.whome.util.SelectKeySeqUtil;




@Controller
@RequestMapping(value = "/management")
public class ManagementController {

	@Autowired
	private ManagementService managementSerive;
	
	@Autowired
	private SelectKeySeqUtil selectKeySeq;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private FileUtils fileUtils;
	
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
	public String registration(Model model, @PathVariable("path") String path, @RequestParam Map<String,String> paramMap, HttpServletRequest req) {		

		String homeID = paramMap.get("homeid");
		
		if(!EmptyUtils.isEmpty(homeID)) {
			HomeInfoDomain homeInfoDomain = managementSerive.getHomeInfoTemp(homeID);
			model.addAttribute("homeInfo" , homeInfoDomain);
		}

		if(path.equals("step1") || path.equals("step4") ||  path.equals("step7")) {
			
			Map<String,Object> getCodeDefineParam = new HashMap<String,Object>(); 
			
			if(path.equals("step1")) { //집 종류 카테고리 가져오기 
				getCodeDefineParam.put("codeType", "main");
				getCodeDefineParam.put("groupKey", "1001"); // 집 종류
			}
			else if(path.equals("step4")) { //숙소에서 제공하는 옵션 가져오기
				getCodeDefineParam.put("codeType", "main");
				getCodeDefineParam.put("codeNo", new ArrayList<>(Arrays.asList("11,12,13")));
			}
			else if(path.equals("step7")){
				getCodeDefineParam.put("codeType", "main");
				getCodeDefineParam.put("codeNo", new ArrayList<>(Arrays.asList("21,22")));
			}

			List<CodeDomain> homeCodeList = adminService.getCodeDefine(getCodeDefineParam);
			model.addAttribute("codeList",homeCodeList);
		}
		else if(path.equals("step5")) { //숙소 이미지 가져오기
			List<HomeImgInfoDomain> homeImgInfoList = managementSerive.getHomeImgInfo(homeID);
			model.addAttribute("homeImgInfoList", homeImgInfoList);
		}

		model.addAttribute("homeid",homeID);
		
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
	public Map<String,String> RegistrationStep1(@RequestParam Map<String,String> paramMap , HttpServletRequest req) {
		
		String resCode = "E001";
		String homeID = paramMap.get("homeid");
		String homeType = paramMap.get("home_type");
		String homeRange = paramMap.get("home_range");
		String isOnlyGuest = paramMap.get("is_only_guest");
		CustomUserDetails userDetail = ((CustomUserDetails)req.getSession().getAttribute("user_info"));
		
		Map<String,String> resultMap = new HashMap<>();
		
		if(userDetail == null) {
			resCode = "E002";
		}
		else if(EmptyUtils.isEmpty(homeType)) {
			resCode = "E003";
		}
		else if(EmptyUtils.isEmpty(homeRange)) {
			resCode = "E004";
		}
		else if(EmptyUtils.isEmpty(isOnlyGuest)) {
			resCode = "E005";
		}
		if(resCode.equals("E001")) {
			
			HomeInfoDomain homeInfo = new HomeInfoDomain();
			homeInfo.setHomeType(homeType);
			homeInfo.setHomeRange(homeRange);
			homeInfo.setHomeIsOnlyGuest(isOnlyGuest);			

			if(!EmptyUtils.isEmpty(homeID)){ //homeID가 있을경우 업데이트 없으면 신규 INSERT

				homeInfo.setHomeID(homeID);
				
				try {
					managementSerive.updateHomeInfoTemp(homeInfo);
					resultMap.put("homeID", homeID);
					
				}catch(Exception e) {
					resCode = "E006";
					e.printStackTrace();
				}
			}else {
				String generatedKey = selectKeySeq.selectSeqKey("10");
				homeInfo.setHomeID(generatedKey);
				homeInfo.setHomeRegStep("01");
				homeInfo.setUserID(userDetail.getUser_id());
				
				try {
					managementSerive.insertHomeInfoTemp(homeInfo);
				}catch (Exception e) {
					e.printStackTrace();
					resCode = "E006";
				}
				resultMap.put("homeID", generatedKey);
			}
		}
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
		String homeID = paramMap.get("homeid");
		String maxGeople = paramMap.get("max_guest");
		String bedCount = paramMap.get("bed_count");
		String bathroomCount = paramMap.get("bathroom_count");
		
		if(EmptyUtils.isEmpty(homeID)) {
			resCode = "E002";
		}
		else if(EmptyUtils.isEmpty(maxGeople)) {
			resCode = "E003";
		}
		else if(EmptyUtils.isEmpty(bedCount)) {
			resCode = "E004";
		}
		else if(EmptyUtils.isEmpty(bathroomCount)) {
			resCode = "E005";
		}
		if(resCode.equals("E001")) {
			
			HomeInfoDomain homeInfo = new HomeInfoDomain();
			homeInfo.setHomeID(homeID);
			homeInfo.setHomemaxGuest(maxGeople);
			homeInfo.setHomeBedCnt(Integer.parseInt(bedCount));
			homeInfo.setHomeBathroomCnt(Integer.parseInt(bathroomCount));
			
			try {
				managementSerive.updateHomeInfoTemp(homeInfo);
			}catch (Exception e) {
				e.printStackTrace();
				resCode = "E006";
			}
		}
		Map<String,String> resultMap = new HashMap<>();
		resultMap.put("resCode",resCode);
		return resultMap;
	}
	
	/**
	 * 등록 3단계
	 * 주소 , 우편번호 등록
	 * @param paramMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/homeRegProcStep3", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public Map<String,String> registrationStep3(@RequestParam Map<String,String> paramMap){
		
		String resCode = "E001";
		String homeID = paramMap.get("homeid");
		String address1 = paramMap.get("user_address_1");
		String address2 = paramMap.get("user_address_2");
		String postCode = paramMap.get("user_postcode");
		
		if(EmptyUtils.isEmpty(homeID)) {
			resCode = "E002";
		}
		else if(EmptyUtils.isEmpty(address1)) {
			resCode = "E003";
		}
		else if(EmptyUtils.isEmpty(postCode)) {
			resCode = "E004";
		}
		
		if(resCode.equals("E001")) {
			
			HomeInfoDomain homeInfo = new HomeInfoDomain();
			homeInfo.setHomeID(homeID);
			homeInfo.setHomeAddr1(address1);
			homeInfo.setHomeAddr2(address2);
			homeInfo.setHomePostCode(postCode);
			
			try {
				managementSerive.updateHomeInfoTemp(homeInfo);
			}catch (Exception e) {
				e.printStackTrace();
				resCode = "E005";
			}
		}
		Map<String,String> resultMap = new HashMap<>();
		resultMap.put("resCode", resCode);
		return resultMap;
	}
	
	
	/**
	 * 등록 4단계
	 * 숙소에 편의시설 제공 등록
	 * @param paramMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/homeRegProcStep4", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public Map<String,String> registrationStep4(@RequestParam Map<String,String> paramMap, @RequestParam("home_facility") String[] homeFacility){
		
		String resCode = "E001";
		String homeID = paramMap.get("homeid");
		String seperatedHomeFacility = "";
			
		for(int i = 0; i < homeFacility.length; i ++) {
			seperatedHomeFacility += homeFacility[i];
			if(i < homeFacility.length - 1) {
				seperatedHomeFacility+=",";
			}
		}
		if(EmptyUtils.isEmpty(homeID)) {
			resCode = "E002";
		}
		if(resCode.equals("E001")) {
			
			HomeInfoDomain homeInfo = new HomeInfoDomain();
			homeInfo.setHomeID(homeID);
			homeInfo.setHomeFacility(seperatedHomeFacility);
			
			try {
				managementSerive.updateHomeInfoTemp(homeInfo);
			}catch (Exception e) {
				e.printStackTrace();
				resCode = "E003";
			}
		}
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
	public Map<String,String> registrationStep5(@RequestParam Map<String,String> paramMap, @RequestParam("home_detail_img") MultipartFile[] files, HttpServletRequest req){

		String resCode = "E001";
		String homeID = paramMap.get("homeid");
		String uploadPath = req.getSession().getServletContext().getRealPath("/resources/imgFile/home_detail/");
		
		if(EmptyUtils.isEmpty(homeID)) {
			resCode = "E002";
		}
		if(resCode.equals("E001")) {
			
			try {
				fileUtils.uploadFiles(files, uploadPath, homeID);
			} catch (Exception e) {
				resCode = "E003";
				e.printStackTrace();
			} 
		}
		Map<String,String> resultMap = new HashMap<>();
		resultMap.put("resCode", resCode);
		return resultMap;
	}
	
	/**
	 * 등록 6단계
	 * 숙소에 대한 설명을 적는다.
	 * 
	 * @param paramMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/homeRegProcStep6", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public Map<String,String> registrationStep6(@RequestParam Map<String,String> paramMap){
		
		String resCode = "E001";
		String homeID = paramMap.get("homeid");
		String homeName = paramMap.get("home_name");
		String homeIntroduceMain = paramMap.get("home_introduce_main");
		String homeIntroduceDetail = paramMap.get("home_introduce_detail");
		String homeIntroduceNearby = paramMap.get("home_introduce_nearby");
		String homeIntroduceTraffic = paramMap.get("home_introduce_traffic");
		
		if(EmptyUtils.isEmpty(homeID)) {
			resCode = "E002";
		}
		else if(EmptyUtils.isEmpty(homeName)) {
			resCode = "E003";
		}
		else if(EmptyUtils.isEmpty(homeIntroduceMain)) {
			resCode = "E004";
		}
		if(resCode.equals("E001")) {
			
			HomeInfoDomain homeInfo = new HomeInfoDomain();
			homeInfo.setHomeID(homeID);
			homeInfo.setHomeTitle(homeName);
			homeInfo.setHomeComment(homeIntroduceMain);
			homeInfo.setHomeSurround(homeIntroduceNearby);
			homeInfo.setHomeTraffic(homeIntroduceTraffic);
			homeInfo.setHomeETCComment(homeIntroduceDetail);
			
			try {
				managementSerive.updateHomeInfoTemp(homeInfo);
			}catch (Exception e) {
				e.printStackTrace();
				resCode = "E003";
			}
		}
		Map<String,String> resultMap = new HashMap<>();
		resultMap.put("resCode", resCode);
		return resultMap;
	}
	
	/**
	 * 등록 7단계
	 * 게스트가 지켜야 할 숙소 규칙 , 숙소에 대해 얄아 두어야 할 세부 사항 등록
	 * @param paramMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/homeRegProcStep7", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public Map<String,String> registrationStep7(@RequestParam Map<String,String> paramMap, HttpServletRequest req, @RequestParam(value = "home_precaution" , required = false) String[] homePrecaution){
		
		String resCode = "E001";
		String homeID = paramMap.get("homeid");
		String guestRule = "";
		String precuatuin = "";
		
		Iterator<Entry<String, String>> iter =  paramMap.entrySet().iterator();

		while (iter.hasNext()) {
			Entry<String, String> param = iter.next();
			String paramName = param.getKey();
			if(paramName.startsWith("guest_rule_")) {
				if(!req.getParameter(paramName).equals("N")) {
					guestRule += param.getValue()+",";
				}
			}
		}
		guestRule = guestRule.substring(0 , guestRule.length() - 1);

		for(int i = 0; i < homePrecaution.length; i++) {
			precuatuin += homePrecaution[i];
			if(i < homePrecaution.length - 1) {
				precuatuin+=",";
			}
		}
		if(EmptyUtils.isEmpty(homeID)) {
			resCode = "E002";
		}
		if(resCode.equals("E001")) {
			
			HomeInfoDomain homeInfo = new HomeInfoDomain();
			homeInfo.setHomeID(homeID);
			homeInfo.setHomeGuestRule(guestRule);
			homeInfo.setHomePrecaution(precuatuin);
			
			try {
				managementSerive.updateHomeInfoTemp(homeInfo);
			}catch (Exception e) {
				e.printStackTrace();
				resCode = "E003";
			}
		}
		Map<String,String> resultMap = new HashMap<>();
		resultMap.put("resCode", resCode);
		return resultMap;
	}
	
	/**
	 * 예약 가능 날짜 및 요금 설정
	 * @param paramMap
	 * @param req
	 * @param homePrecaution
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/homeRegProcStep8", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public Map<String,String> registrationStep8(@RequestParam Map<String,String> paramMap){
		
		String resCode = "E001";
		String homeID = paramMap.get("homeid");
		String reservAvailableDay = paramMap.get("reserv_date");
		String strPeakSeasonPay = paramMap.get("peak_season_pay");
		String strOffPeakSeasonPay = paramMap.get("offpeak_season_pay");
		String reservAvailableStartDay = "";
		String reservAvailableEndDay = "";
		int peakSeasonPay = 0;
		int offPeakSeasonPay = 0;
		
		if(EmptyUtils.isEmpty(homeID)) {
			resCode = "E002";
		}
		else if(EmptyUtils.isEmpty(reservAvailableDay)) {
			resCode = "E003";
		}
		else if(EmptyUtils.isEmpty(strPeakSeasonPay)) {
			resCode = "E004";
		}
		else if(EmptyUtils.isEmpty(strOffPeakSeasonPay)) {
			resCode = "E005";
		}
		if(resCode.equals("E001")) {
			
			HomeInfoDomain homeInfo = new HomeInfoDomain();
			homeInfo.setHomeID(homeID);
			
			try {
				
				reservAvailableStartDay = reservAvailableDay.split("~")[0];
				reservAvailableEndDay = reservAvailableDay.split("~")[1];
				peakSeasonPay = Integer.parseInt(strPeakSeasonPay.replaceAll(",", ""));
				offPeakSeasonPay = Integer.parseInt(strOffPeakSeasonPay.replaceAll(",", ""));
				
				homeInfo.setHighPay(peakSeasonPay);
				homeInfo.setRowPay(offPeakSeasonPay);
				homeInfo.setHomeAvailableReservStartDay(reservAvailableStartDay);
				homeInfo.setHomeAvailableReservEndDay(reservAvailableEndDay);
				homeInfo.setHomeRegStep("02");
				managementSerive.lastRegStepHomeInfoTemp(homeInfo);
				
			}catch (Exception e) {
				e.printStackTrace();
				resCode = "E006";
			}
		}
		
		Map<String,String> resultMap = new HashMap<>();
		resultMap.put("resCode", resCode);
		return resultMap;
	}
}

