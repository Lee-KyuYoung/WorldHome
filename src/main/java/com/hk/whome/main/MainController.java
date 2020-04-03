package com.hk.whome.main;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

<<<<<<< HEAD
import com.hk.whome.domain.homeListDomain;
=======
import com.hk.whome.domain.HomeListDomain;
>>>>>>> f9a671b81976cbc41d52e0dfd4cf4f8e6d52226e



@Controller
public class MainController {

	@Autowired
	private MainService mainService;
	
	@Autowired
	MessageSource message;
	
	private Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping(value="/{errorPage}")
	public String errorPage(@PathVariable("errorPage") String page) {
		return "error/"+page;
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(Model model, Locale locale, HomeListDomain homeData) {
		String a = homeData.getHomeAdd(); // 
        System.out.println("::::::::::::::"+a);
		System.out.println("설마여기오냐");
		return "main/home";
	}
	
	@RequestMapping(value = "/detailHome", method = RequestMethod.GET)
	public String detailReg(Model model,HttpServletRequest req) {
		model.getAttribute("");
		
		String homeId = req.getParameter("homeId");
		
		HashMap detailMap = mainService.selectDetailHome(homeId);
		model.addAttribute("detailMap", detailMap);
		return "main/detailHome";
	}
	
	
	/**
	 * 숙소 조회
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/homeList", method = RequestMethod.POST)
	public List homeList(HomeListDomain homeData) {
		System.out.println("good");
		
		List<HashMap> homeList = new ArrayList<HashMap>();
        HashMap homeMap= new HashMap();
        
        String a = homeData.getHomeAdd(); // 
        System.out.println("::::::::::::::"+a);
        homeList = mainService.selectImgList(homeMap);
        
        
        
        return homeList;
	}
	
}
