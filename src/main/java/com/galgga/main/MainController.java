package com.galgga.main;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.galgga.businessLods.service.BusinessLodService;

@Controller("MainController")
@RequestMapping(value = "/", method = RequestMethod.GET)
public class MainController {
	@Autowired
	private BusinessLodService businessLodService;
   
   @RequestMapping(value= "/main/main.do" ,method={RequestMethod.POST,RequestMethod.GET})
   public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception{
      String viewName = (String)request.getAttribute("viewName"); 
      ModelAndView mav = new ModelAndView(viewName);
      
      mav.addObject("lodsListValue", businessLodService.valueLods());
      mav.addObject("lodsListReserve", businessLodService.reserveLods());
      return mav;
   }
   
   @RequestMapping(value="/*/*.do" ,method={RequestMethod.POST,RequestMethod.GET})
	protected  ModelAndView viewForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
}