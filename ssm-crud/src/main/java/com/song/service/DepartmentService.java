package com.song.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.song.dao.DepartmentEntityDao;
import com.song.model.DepartmentEntity;

@Service
public class DepartmentService {
	@Autowired
	private DepartmentEntityDao departmentEntityDao;

	public List<DepartmentEntity> findallDepts() {
		return departmentEntityDao.findAllDept();
	}
	

}
