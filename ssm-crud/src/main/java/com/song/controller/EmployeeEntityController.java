package com.song.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	 * 增加员工
	 * @param entity
	 * @return
	 */
	@RequestMapping(value="/addEmp", method=RequestMethod.POST)
	public CommonMsg addEmp(EmployeeEntity entity) {
		employeeEntityService.save(entity);
		
		return CommonMsg.success();
	}
	
	/**
	 * 查询员工
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/getEmpById/{id}", method=RequestMethod.GET)
	public CommonMsg getEmpById(@PathVariable("id") Integer id) {
		EmployeeEntity entity = employeeEntityService.findById(id);
		return CommonMsg.success().add("entity", entity);
	}
	
	/**
	 * 更新员工信息
	 */
	@RequestMapping(value="/updateEmp/{id}", method=RequestMethod.POST)
	public CommonMsg updateEmp(EmployeeEntity entity) {
		employeeEntityService.update(entity);
		
		return CommonMsg.success();
	}

	/**
	 * 需要导入jackson包
	 * @param pn 页码
	 * @return
	 */
	@RequestMapping("/emps")
	@ResponseBody
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
