package com.song.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.song.model.LoginEntity;
import com.song.serviceImpl.LoginServiceImpl;

/**
* create by: song on 2017年9月20日
* 
* 类说明:登录功能
*/

@Controller
public class LoginController {
	@Autowired
	private LoginServiceImpl loginService;
	
	/**
	 * 登录
	 * @param entity
	 * @return
	 */
	@RequestMapping(value="/login", method=RequestMethod.POST)
//	@ResponseBody
	public String  login(LoginEntity entity) {
		LoginEntity loginer = loginService.find(entity);
		if(loginer != null) {
			return "success";
		}
		return "fail"; 
		
//		ModelAndView mv = new ModelAndView();  
	/*	if(loginer != null) {
			mv.setViewName("redirect:/index.jsp");
		}else {
			mv.setViewName("redirect:/fail.jsp");
		}
		
		return mv;*/
		
	}
}
