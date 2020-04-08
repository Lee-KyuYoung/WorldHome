package com.hk.whome.main;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.whome.domain.HomeListDomain;
import com.hk.whome.util.EmptyUtils;



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
		return "main/home";
	}
	
	@RequestMapping(value = "/detailHome", method = RequestMethod.GET)
	public String detailReg(Model model,HttpServletRequest req) {
		model.getAttribute("");
		
		String homeId = req.getParameter("homeId");
		
		HashMap detailMap = mainService.selectDetailHome(homeId);
		/* model.addAttribute("detailMap", detailMap); */
		System.out.println("::::::::::::"+detailMap);
		model.addAttribute("detailMap",detailMap);
		return "main/detailHome";
	}
	
	@RequestMapping(value = "/selectPostscriptList", method = RequestMethod.GET)
	public List selectPostscriptList(@RequestParam Map<String,String> paramMap, Locale locale) {
		System.out.println("여기오냥:::::::::");
		List<HashMap> postscriptList = new ArrayList<HashMap>();
		HashMap postscriptListParam = new HashMap();
		postscriptListParam.put("homeId", paramMap.get("homeId"));
		postscriptListParam.put("page", paramMap.get("page"));
		System.out.println("여기는!!!:::::::::"+postscriptListParam);
		postscriptList = mainService.selectPostscriptList(postscriptListParam);
		
		return postscriptList;
	}
	
	
	/**
	 * 숙소 조회
	 * @param model
	 * @return 숙소 List
	 */
	@ResponseBody
	@RequestMapping(value = "/homeList", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public List homeList(@RequestParam Map<String,String> paramMap, Locale locale) {
		System.out.println("good");
		
		List<HashMap> homeList = new ArrayList<HashMap>();
		HashMap homeMap = new HashMap();
		HomeListDomain homeListDomain = new HomeListDomain();
		String homeAdd = paramMap.get("homeAdd");
		String homeDateIn = paramMap.get("homeDateIn");
		String homeDateOut = paramMap.get("homeDateOut");
		String homeGuest = paramMap.get("homeGuest");
		System.out.println("::::::::::"+homeAdd);
		System.out.println("::::::::::"+homeDateIn);
		System.out.println("::::::::::"+homeDateOut);
		System.out.println("::::::::::"+homeGuest);
		
		if(!EmptyUtils.isEmpty(homeAdd)) {
			homeListDomain.setHomeAdd(homeAdd);
		}
		if(!EmptyUtils.isEmpty(homeDateIn)) {
			homeListDomain.setHomeDateIn(homeDateIn);
		}
		if(!EmptyUtils.isEmpty(homeDateOut)) {
			homeListDomain.setHomeDateOut(homeDateOut);
		}
		if(!EmptyUtils.isEmpty(homeGuest)) {
			homeListDomain.setHomeGuest(homeGuest);
		}
		homeList = mainService.selectImgList(homeListDomain);
        
        
        
        return homeList;
	}
	
}
