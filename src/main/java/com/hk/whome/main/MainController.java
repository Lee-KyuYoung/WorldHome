package com.hk.whome.main;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.hk.whome.admin.AdminService;
import com.hk.whome.domain.CodeDomain;
import com.hk.whome.domain.HomeListDomain;
import com.hk.whome.domain.UserInfoDomain;
import com.hk.whome.user.UserService;
import com.hk.whome.util.EmptyUtils;



@Controller
public class MainController {

	@Autowired
	private MainService mainService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	MessageSource message;
	
	private Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping(value="/{errorPage}")
	public String errorPage(@PathVariable("errorPage") String page) {
		return "error/"+page;
	}
	
	/**
	 * 메인 화면 
	 * @param model
	 * @param locale
	 * @param homeData
	 * @return
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(Model model, Locale locale, HomeListDomain homeData, @RequestParam Map<String,String> paramMap) {
		
		String message = paramMap.get("message");
		
		List<Map<String,Object>> homeList = new ArrayList<>();
		HomeListDomain homeListDomain = new HomeListDomain();
		
		try {
			homeList = mainService.selectImgList(homeListDomain);
			
			//집 이미지
			for(Map<String,Object> m : homeList) {
				String[] tempHomeImg = ((String)m.get("HOME_IMG")).split(","); 
				m.put("HOME_IMG", tempHomeImg);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("homeList",homeList);
		model.addAttribute("message",message);
		
		return "main/home_main.tiles";
	}
	
	/**
	 * 등록된 집 상세 보기
	 * @param model
	 * @param paramMap
	 * @return
	 */
	@RequestMapping(value = "/homeDetail")
	public String homeDetail(Model model, @RequestParam Map<String,String> paramMap) {
		
		String homeId = paramMap.get("homeId");
		String errorCode = "";
		
		if(EmptyUtils.isEmpty(homeId)) {
			errorCode = "E101";
		}
		
		if(errorCode.equals("")) {
			
			try {
				//집 상세 정보
				Map<String,Object> homeDetailInfo = mainService.selectDetailHome(homeId);
				
				//유저 정보
				Model userInfoModel = new ExtendedModelMap();
				userInfoModel.addAttribute("userId",homeDetailInfo.get("USR_ID"));
				UserInfoDomain userInfo = userService.getUserInfo(userInfoModel);
				
				//코드 정보( 집 종류, 시설, 규칙 등 정의된 정보 ) 
				List<CodeDomain> homeCodeList = adminService.getCodeDefine(null);
				
				//String으로 되어있는 집 종류, 집에서 제공하는 시설, 게스트 규칙, 알아야할 사항을 String배열로 만든다. 
				String homeType = (String)homeDetailInfo.get("HOME_TYPE");
				String homeFacility = (String)homeDetailInfo.get("HOME_FACILITY");
				String homeGuestRule = (String)homeDetailInfo.get("HOME_GUEST_RULE");
				String homePrecautions = (String)homeDetailInfo.get("HOME_PRECAUTIONS");
				
				if(!EmptyUtils.isEmpty(homeType)) {
					model.addAttribute("homeType",homeType.split(","));
				}
				if(!EmptyUtils.isEmpty(homeFacility)) {
					model.addAttribute("homeFacility",homeFacility.split(","));
				}
				if(!EmptyUtils.isEmpty(homeGuestRule)) {
					model.addAttribute("homeGuestRule",homeGuestRule.split(","));
				}
				if(!EmptyUtils.isEmpty(homePrecautions)) {
					model.addAttribute("homePrecautions",homePrecautions.split(","));
				}
				
				if(EmptyUtils.isEmpty(homeDetailInfo)) {
					errorCode = "E102";
				}
				else {
					model.addAttribute("homeCodeList",homeCodeList);
					model.addAttribute("homeDetailInfo" , homeDetailInfo);
					model.addAttribute("userInfo",userInfo);
				}
			}catch (Exception e) {
				e.printStackTrace();
				errorCode ="E103";
			}
		}
		model.addAttribute("errorCode", errorCode);
		
		return "main/home_detail.tiles";
	}
	

}
