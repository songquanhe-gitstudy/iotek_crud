package com.song.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.song.dao.IRegisterDao;
import com.song.model.UserEntity;

/**
* create by: song on 2017年9月20日
* 
* 类说明:
*/

@Service
public class RegisterServiceImpl {
	@Autowired
	private IRegisterDao registerDao;

	public void save(UserEntity entity) {
		registerDao.save(entity);
	}

}
