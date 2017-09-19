package com.song.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.song.model.DepartmentEntity;
import com.song.service.DepartmentService;
import com.song.utils.CommonMsg;

@RestController
public class DepartmentController {
	@Autowired
	private DepartmentService departmentService;
	
	@RequestMapping("/depts")
	public CommonMsg getDepts() {
		List<DepartmentEntity> list = departmentService.findallDepts();
		return CommonMsg.success().add("list", list);
	}
	

}
