package com.song.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.song.model.UserEntity;
import com.song.service.RegisterServiceImpl;
import com.song.utils.CommonMsg;

/**
* create by: song on 2017年9月20日
* 
* 类说明:注册
*/

@Controller
public class RegisterController {
	@Autowired
	private RegisterServiceImpl registerService;
	
	@RequestMapping(value="register", method=RequestMethod.POST)
	@ResponseBody
	public CommonMsg registerUser(UserEntity entity) {
		entity.setMajorId(1);
		registerService.save(entity);
		return CommonMsg.success();
	}

}
