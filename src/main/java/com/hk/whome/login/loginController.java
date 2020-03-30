package com.hk.whome.login;

import java.util.Enumeration;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	@RequestMapping(value = "/login")
	public String login(Model model, HttpServletRequest req) {

		HttpSession session = req.getSession();
		Enumeration<String> e =  session.getAttributeNames();
		Iterator<String> i = e.asIterator();
		while(i.hasNext()) {
			System.out.println("SESSION : : : "+i.next());
		}
		
		if(session.getAttribute("user_info") != null) {
			return "redirect:./";
		}
		
		return "login/login";
	}
	
	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest req) {
		req.getSession().invalidate();
		return "redirect:/";
	}
	
	//권한 없을 때 띄어주는 페이지
	@RequestMapping(value = "/accessDeniedPage", method = RequestMethod.GET)
	public String loginInvalidCheck(Model model) {
		return "login/accessDeniedPage";
	}

}
