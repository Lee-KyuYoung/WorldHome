package com.hk.whome.main;

import java.util.ArrayList;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ResponseBody;
import com.hk.whome.admin.AdminService;
import com.hk.whome.domain.CodeDomain;
import com.hk.whome.domain.HomeListDomain;
import com.hk.whome.domain.PagingDomain;
import com.hk.whome.domain.UserInfoDomain;
import com.hk.whome.reservation.ReservationService;
import com.hk.whome.user.UserService;
import com.hk.whome.util.DateUtils;
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
	private ReservationService reservationService;
	
	@Autowired
	MessageSource message;
	
	private Logger logger = LoggerFactory.getLogger(MainController.class);
	private final int PAGE_SIZE = 5;
	private final int LIST_SIZE = 15;
	
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
		
		int pageNo = EmptyUtils.isEmpty(paramMap.get("page_no")) ? 1 : Integer.parseInt(paramMap.get("page_no"));
		String message = paramMap.get("message");
		String area = paramMap.get("area");
		String reservD = paramMap.get("reserv_d");
		String reservP = paramMap.get("reserv_p");
		
		List<Map<String,Object>> homeList = new ArrayList<>();
		HomeListDomain homeListDomain = new HomeListDomain();
		PagingDomain paging = null;
		
		if(!EmptyUtils.isEmpty(area)) {
			homeListDomain.setArea(area);
		}
		if(!EmptyUtils.isEmpty(reservD)) {
			homeListDomain.setHomeDateIn(reservD.split("~")[0]);
			homeListDomain.setHomeDateOut(reservD.split("~")[1]);
		}
		if(!EmptyUtils.isEmpty(reservP)) {
			homeListDomain.setHomeGuest(reservP);
		}
		
		try {
			//숙소 리스트 총 개수
			int totalListCount = mainService.getHomeListTotalCount(homeListDomain);
			
			paging = new PagingDomain(pageNo, PAGE_SIZE, LIST_SIZE, totalListCount);
			homeListDomain.setStartListNo(paging.getStartListNo());
			homeListDomain.setEndListNo(paging.getEndListNo());
			
			//숙소 리스트
			homeList = mainService.selectImgList(homeListDomain);
			
			//집 이미지 분리
			for(Map<String,Object> m : homeList) {
				String[] tempHomeImg = ((String)m.get("HOME_IMG")).split(","); 
				m.put("HOME_IMG", tempHomeImg);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("area",area);
		model.addAttribute("paging",paging);
		model.addAttribute("message",message);
		model.addAttribute("reserv_d",reservD);
		model.addAttribute("reserv_p",reservP);
		model.addAttribute("homeList",homeList);
		
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
				String homeImg = (String)homeDetailInfo.get("HOME_IMG");
				
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
				if(!EmptyUtils.isEmpty(homeImg)) {
					model.addAttribute("homeImg",homeImg.split(","));
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
	

	/**
	 * 예약 불가능한 날짜 가져오기
	 * @param paramMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/getDisableDates", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public Map<String,Object> getDisableDates(@RequestParam Map<String,String> paramMap) {
		
		String resCode = "E001";
		String homeID = paramMap.get("homeID");
		
		if(!EmptyUtils.isEmpty(homeID)) {
			resCode = "E002";
		}

		List<String> disableDates = new ArrayList<>(); 
		
		try {
			//현재 예약된 정보를 가져와서 예약 이미 예약된 날짜를 만들어 달력에 표시한다.
			List<Map<String,String>> reservDate = reservationService.getReservDate(homeID);
			
			if(!EmptyUtils.isEmpty(reservDate)) {
				
				for(Map<String,String> date : reservDate) {
					String start = date.get("STR_DT");
					String end = date.get("END_DT");
					
					disableDates = DateUtils.getBetweenDay(disableDates, start, end);
				}
				for(String s : disableDates) {
					logger.info(" =============== > "+s);
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
			resCode = "E003";
		}
		
		Map<String,Object> resMap = new HashMap<>();
		resMap.put("resCode", resCode);
		resMap.put("disableDates", disableDates);
		
		return resMap;
	}
	
}
