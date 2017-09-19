package com.song.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.song.dao.EmployeeEntityDao;
import com.song.model.EmployeeEntity;

/**
 *author:song
 *date:2017年7月22日
**/
@Service
public class EmploeeEntityService {
	@Autowired
	private EmployeeEntityDao employeeEntityDao;

	public List<EmployeeEntity> getList() {
		List<EmployeeEntity> list = employeeEntityDao.findAll();
		
		return list;
	}

	public void save(EmployeeEntity entity) {
		employeeEntityDao.insertSelective(entity);
	}

	public EmployeeEntity findById(Integer id) {
		return employeeEntityDao.selectByPrimaryKey(id);
	}

	public void update(EmployeeEntity entity) {
		employeeEntityDao.updateByPrimaryKeySelective(entity);		
	}

}
