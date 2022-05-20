package com.galgga.error.errController;

import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

public class errController {
@ExceptionHandler(Exception.class)

private  ModelAndView errormv(Exception ex) {
	
	ModelAndView modelAndView = new ModelAndView();
	 modelAndView.setViewName("/errors/"); 
	modelAndView.addObject("exception", ex);
	
	return modelAndView;
	
	
}
}
