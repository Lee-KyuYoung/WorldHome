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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.whom.domain.homeListDomain;



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
	public String main(Model model, Locale locale) {
		return "main/home";
	}
	
	@RequestMapping(value = "/detailHome", method = RequestMethod.GET)
	public String detailReg(Model model, Locale locale) {
		model.getAttribute("");
		
		//mainService.selectDetailHome(homeMap);
		model.addAttribute("test_comm", "들어갔는지 확인해보자");
		
		return "main/detailHome";
	}
	
	
	
	
	@ResponseBody
	@RequestMapping(value = "/homeList", method = RequestMethod.POST)
	public List homeList(Model model) {
		
		List<HashMap> homeList = new ArrayList<HashMap>();
        homeListDomain homeData = new homeListDomain();
        
        homeData.setHomeComm("홍길동전");
        homeData.setHomeComm("꽃향기나는 펜션");
        
        HashMap homeMap= new HashMap();
        
        homeMap.put("homeImgPath", homeData.getHomeComm());
        homeMap.put("homeComm", homeData.getHomeComm());
        
        homeData = new homeListDomain();
        homeData.setHomeComm("레미제라블");
        homeData.setHomeComm("하늘을보며 잠드는 곳");
        homeMap = new HashMap<String, Object>(); 
        homeMap.put("homeImgPath", homeData.getHomeComm());
        homeMap.put("homeComm", homeData.getHomeComm());
        homeList.add(homeMap);
        
        System.out.println("___________________________________여기다");
        homeList = mainService.selectImgList(homeMap);
        
        
        
        return homeList;
	}
	
}
