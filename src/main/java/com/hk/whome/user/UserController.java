package com.hk.whome.user;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.whome.domain.UserInfoDomain;
import com.hk.whome.security.CustomUserDetails;
import com.hk.whome.util.EmptyUtils;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private MessageSource messageSource;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	/**
	 * 회원가입 페이지
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join(Model model) {
		return "user/user_join";
	}
	
	/**
	 * 회원가입
	 * @param model
	 * @param paramMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/joinProcess", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public Map<String,String> joinProcess(Model model, @RequestParam Map<String,String> paramMap, Locale locale) {

		String resCode = "";
		String messageCode = "";
		String userId = paramMap.get("user_id");
		String userPw = paramMap.get("user_password");
		String userName = paramMap.get("user_name");
		String userBirthYear = paramMap.get("user_birth_year");
		String userBirthMonth = paramMap.get("user_birth_month");
		String userBirthDay = paramMap.get("user_birth_day");
		String userAddress1 = paramMap.get("user_address_1");
		String userAddress2 = paramMap.get("user_address_2");
		String userEmail = paramMap.get("user_email");
		String userPhone = paramMap.get("user_phone");
		
		Map<String,String> resultMap = new HashMap<>();
		
		//기본사항 체크
		if(EmptyUtils.isEmpty(userId)) {
			messageCode = "join.info.J201";
		}else if(EmptyUtils.isEmpty(userPw)) {
			messageCode = "join.info.J202";
		}else if(EmptyUtils.isEmpty(userName)) {
			messageCode = "join.info.J204";
		}else if(EmptyUtils.isEmpty(userBirthYear) || EmptyUtils.isEmpty(userBirthMonth) || EmptyUtils.isEmpty(userBirthDay)) {
			messageCode = "join.info.J205";
		}else if(EmptyUtils.isEmpty(userAddress1)) {
			messageCode = "join.info.J206";
		}else if(EmptyUtils.isEmpty(userEmail)) {
			messageCode = "join.info.J207";
		}else if(EmptyUtils.isEmpty(userPhone)) {
			messageCode = "join.info.J208";
		}

		if(messageCode == "") {
			//유저 아이디 중복 체크
			int idCheck = userService.userIDCheck(userId);
			if(idCheck >= 1) {
				messageCode = "join.info.J301";
			}
		}
		if(messageCode == "") {
			//유저정보 저장
			UserInfoDomain userInfo = new UserInfoDomain();
			userInfo.setUserId(userId);
			userInfo.setUserPw(passwordEncoder.encode(userPw));
			userInfo.setUserName(userName);
			userInfo.setUserBirth(userBirthYear+"-"+userBirthMonth+"-"+userBirthDay);
			userInfo.setUserAddress1(userAddress1);
			userInfo.setUserAddress2(userAddress2);
			userInfo.setUserEmail(userEmail);
			userInfo.setUserPhone(userPhone);
			userInfo.setUserAuth("MEMBER");
			try {
				userService.insertUserInfo(userInfo);
			} catch (Exception e) {
				messageCode = "common.error.E001";
				e.printStackTrace();
			}
		}
		if(messageCode == "") {
			resCode = "E001";
			messageCode = "join.info.J303";
		}
		
		resultMap.put("resCode", resCode);
		resultMap.put("resMessage", messageSource.getMessage(messageCode,null,"default text",locale));
		
		return resultMap;
	}
	
	/**
	 * 유저 아이디 중복 체크
	 * @param model
	 * @param paramMap
	 * @param locale
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/userIDCheck", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public Map<String,String> userIDCheck(Model model, @RequestParam Map<String,String> paramMap, Locale locale) {
		
		String userId = paramMap.get("user_id");
		String resMessage = "";
		String resCode = "";
		
		int idCheck = userService.userIDCheck(userId);
		
		if(idCheck >= 1) {
			resMessage = messageSource.getMessage("join.info.J301",null,"default text",locale);
			resCode = "E001";
		}else {
			resMessage = messageSource.getMessage("join.info.J302",null,"default text",locale);
			resCode = "E002";
		}
				
		Map<String,String> resultMap = new HashMap<>();
		resultMap.put("resCode", resCode);
		resultMap.put("resMessage", resMessage);
		
		return resultMap;
	}
	
	/**
	 * 회원정보 수정 페이지
	 * @return
	 */
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String userModify(HttpServletRequest req, Model model) {
		
		if(req.getSession().getAttribute("user_info") == null) {
			return "redirect:/";
		}
		
		String userID = ((CustomUserDetails)req.getSession().getAttribute("user_info")).getUser_id();
		Model userInfoModel = new ExtendedModelMap();
		userInfoModel.addAttribute("userId",userID);
		
		UserInfoDomain userInfo = userService.getUserInfo(userInfoModel);
		model.addAttribute("user_info" , userInfo);
		
		return "user/user_modify";
	}
	
	/**
	 * 회원정보 수정
	 * @param paramMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/modifyProcess", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public Map<String,String> modifyProcess(@RequestParam Map<String,String> paramMap, Locale locale) {
		
		String resCode = "E001";
		String messageCode = "";
		String userID = paramMap.get("userID");
		String userPw = paramMap.get("userPw");
		String userAddress1 = paramMap.get("userAddress1");
		String userAddress2 = paramMap.get("userAddress2");
		String userEmail = paramMap.get("userEmail");
		String userPhone = paramMap.get("userPhone");
		
		UserInfoDomain userInfo = new UserInfoDomain();
		userInfo.setUserId(userID);
		
		if(!EmptyUtils.isEmpty(userPw)) {
			userInfo.setUserPw(passwordEncoder.encode(userPw));
		}
		if(!EmptyUtils.isEmpty(userAddress1)) {
			userInfo.setUserAddress1(userAddress1);
		}
		if(!EmptyUtils.isEmpty(userAddress2)) {
			userInfo.setUserAddress2(userAddress2);
		}
		if(!EmptyUtils.isEmpty(userEmail)) {
			userInfo.setUserEmail(userEmail);
		}
		if(!EmptyUtils.isEmpty(userPhone)) {
			userInfo.setUserPhone(userPhone);
		}
		
		try {
			userService.updateUserInfo(userInfo);
			messageCode = "join.info.J304";
		}catch(Exception e) {
			messageCode = "common.error.E001";
			resCode = "E002";
			e.printStackTrace();
		}
		
		Map<String,String> resultMap = new HashMap<>();
		resultMap.put("resCode",resCode);
		resultMap.put("resMessage", messageSource.getMessage(messageCode,null,"",locale));
		
		return resultMap;
	}
	
	/**
	 * 회원 아이디 찾기
	 * @param paramMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/findUserID", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public Map<String,String> findUserID(@RequestParam Map<String,String> paramMap, Locale locale){
		
		String userEmail = paramMap.get("user_email");
		String messageCode = "";
		String resCode = ""; 
		
		Map<String,String> resultMap = new HashMap<>();
		Model userInfoModel = new ExtendedModelMap();
		
		userInfoModel.addAttribute("userEmail",userEmail);

		UserInfoDomain userInfo = userService.getUserInfo(userInfoModel);

		try {
			resultMap.put("userID", userInfo.getUserId());
			resCode = "E001";
		}catch(NullPointerException e) {
			messageCode = "join.info.J305";
			resCode = "E002";
		}
		
		resultMap.put("resMessage", messageSource.getMessage(messageCode, null, "", locale));
		resultMap.put("resCode",resCode);
				
		return resultMap;
	}
	
	/**
	 * 회원 비번 찾기
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/findUserPw", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public Map<String,String> findUserPw(){
		Map<String,String> resultMap = new HashMap<>();
		return resultMap;
	}
}
