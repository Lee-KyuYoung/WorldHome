package com.hk.whome.login;

import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class loginController {


	@Autowired
	private LoginService loginService;
	
	private Logger logger = LoggerFactory.getLogger(loginController.class);

	/**
	 * 로그인 페이지
	 */
	@RequestMapping(value = "/login")
	public String login(Model model, HttpServletRequest req) {
		
		if(req.getSession().getAttribute("user_info") != null) {
			return "redirect:./";
		}
		
		return "login/login";
	}
	
	/**
	 * 로그아웃
	 * @param req
	 * @return
	 */
	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest req) {
		req.getSession().invalidate();
		return "redirect:/";
	}
	
	/**
	 * 권한없을때 보여주는 페이지
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/accessDeniedPage", method = RequestMethod.GET)
	public String loginInvalidCheck(Model model) {
		return "login/accessDeniedPage";
	}

}
