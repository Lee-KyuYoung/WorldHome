package com.hk.whome.user;

import java.io.File;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hk.whome.domain.UserInfoDomain;
import com.hk.whome.security.CustomUserDetails;
import com.hk.whome.util.EmptyUtils;
import com.hk.whome.util.FileUtils;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private MessageSource messageSource;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private FileUtils fileUtils;
	
	private Logger logger = LoggerFactory.getLogger(UserController.class);
	
	/**
	 * 회원가입 페이지
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join(Model model) {
		return "user/user_join.tiles";
	}
	
	/**
	 * 회원가입
	 * @param model
	 * @param paramMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/joinProcess", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public Map<String,String> joinProcess(Model model, @RequestParam Map<String,String> paramMap, 
			Locale locale, MultipartHttpServletRequest mreq, HttpServletRequest req) {

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
		String userIntro = paramMap.get("user_introduce");
		
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
			userInfo.setUserIntroduce(userIntro);
			userInfo.setUserAuth("ROLE_MEMBER"); //권한을 넣을 시 ROLE_권한이름 이런식으로 앞에 ROLE_을 붙여줘야한다.
			
			try {
				//이미지 업로드
				String imgName = fileUtils.uploadUserImg(mreq, userId, req);
				if(!imgName.equals("")) {
					userInfo.setUserImg(imgName);
				}
				
				//유저 정보 저장
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
		String messageCode = "";
		String resCode = "";
		
		int idCheck = userService.userIDCheck(userId);
		
		if(idCheck >= 1) {
			messageCode = "join.info.J301";
			resCode = "E001";
		}else {
			messageCode = "join.info.J302";
			resCode = "E002";
		}
				
		Map<String,String> resultMap = new HashMap<>();
		resultMap.put("resCode", resCode);
		resultMap.put("resMessage", messageSource.getMessage(messageCode,null,"default text",locale));
		
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
		
		return "user/user_modify.tiles";
	}
	
	/**
	 * 회원정보 수정
	 * @param paramMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/modifyProcess", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public Map<String,String> modifyProcess(@RequestParam Map<String,String> paramMap, Locale locale, MultipartHttpServletRequest mreq, HttpServletRequest req) {
		
		String resCode = "E001";
		String messageCode = "";
		String userID = paramMap.get("userID");
		String userPw = paramMap.get("userPw");
		String userAddress1 = paramMap.get("userAddress1");
		String userAddress2 = paramMap.get("userAddress2");
		String userEmail = paramMap.get("userEmail");
		String userPhone = paramMap.get("userPhone");
		String userIntro = paramMap.get("userIntroduce");
		
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
		if(!EmptyUtils.isEmpty(userIntro)) {
			userInfo.setUserIntroduce(userIntro);
		}
		
		try {
			
			String imgName = fileUtils.uploadUserImg(mreq, userID, req);
			if(!imgName.equals("")) {
				userInfo.setUserImg(imgName);
			}
			
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
		String userName = paramMap.get("user_name");
		String messageCode = "";
		String resCode = ""; 
		
		Map<String,String> resultMap = new HashMap<>();
		Model userInfoModel = new ExtendedModelMap();
		
		userInfoModel.addAttribute("userEmail",userEmail);
		userInfoModel.addAttribute("userName",userName);

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
	 * @param paramMap
	 * @param locale
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/findUserPw", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public Map<String,Object> findUserPw(@RequestParam Map<String,String> paramMap, Locale locale){
		
		String userName = paramMap.get("user_name");
		String userId = paramMap.get("user_id");
		String messageCode = "";
		String resCode = "";
		
		Map<String,Object> resultMap = new HashMap<>();
		Model userInfoModel = new ExtendedModelMap();
		
		userInfoModel.addAttribute("userName",userName);
		userInfoModel.addAttribute("userId",userId);
		
		UserInfoDomain userInfoDomain = userService.getUserInfo(userInfoModel);
		
		//회원정보 유효성 체크
		if(userInfoDomain == null) {
			resCode = "E003";
			messageCode = "join.info.J307";
		}

		if(resCode == "") {
			
			try {
				//임시비번 발급
				int randomPw = ((int)(Math.random()*999999)+1);
				
				UserInfoDomain userInfo = new UserInfoDomain();
				userInfo.setUserId(userId);
				userInfo.setUserPw(passwordEncoder.encode(String.valueOf(randomPw)));
				
				//비번 업데이트
				userService.updateUserInfo(userInfo);
				
				messageCode = "join.info.J308";
				resCode = "E001";
				
				resultMap.put("user_pw", randomPw);
				
			}catch(Exception e) {
				resCode = "E002";
				messageCode = "common.error.E001";
				e.printStackTrace();
			}
		}
		resultMap.put("resCode", resCode);
		resultMap.put("resMessage", messageSource.getMessage(messageCode, null , "", locale));
		
		return resultMap;
	}
	
}
