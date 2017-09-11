package com.song.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.song.model.EmployeeEntity;
import com.song.service.EmploeeEntityService;
import com.song.utils.CommonMsg;

/**
 * author:song date:2017年7月22日
 **/

@RestController
public class EmployeeEntityController {
	@Autowired
	private EmploeeEntityService employeeEntityService;

	/**
	 * @param pn 页码
	 * @return
	 */
	@RequestMapping("/emps")
	public CommonMsg getEntityWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		// 传入第pn页， 显示5条数据
		PageHelper.startPage(pn, 5);
		List<EmployeeEntity> list = employeeEntityService.getList();
		// 连续要显示的5页
		PageInfo pageInfo = new PageInfo(list, 5);
		return CommonMsg.success().add("pageInfo", pageInfo);
	}

	/*@RequestMapping("/emps")
	public String emps(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
		// 传入第pn页， 显示5条数据
		PageHelper.startPage(pn, 5);

		List<EmployeeEntity> list = employeeEntityService.getList();

		// 连续要显示的5页
		PageInfo pageInfo = new PageInfo(list, 5);
		model.addAttribute("pageInfo", pageInfo);
		return "list";
	}*/

}
