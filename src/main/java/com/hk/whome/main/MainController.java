package com.hk.whome.main;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class MainController {

	@Autowired
	private MainService mainService;
	
	@Autowired
	MessageSource message;
	
	private Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping(value="/{errorPage}", method=RequestMethod.GET)
	public String errorPage(@PathVariable("errorPage") String page) {
		return "error/"+page;
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(Model model, Locale locale) {
	
		return "main/home";
	}
	
}
