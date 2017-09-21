package com.song.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.song.dao.IloginDao;
import com.song.model.LoginEntity;

/**
* create by: song on 2017年9月20日
* 
* 类说明:
*/

@Service
public class LoginServiceImpl {
	@Autowired
	private IloginDao loginDao;

	public LoginEntity find(LoginEntity entity) {
		return loginDao.findByEntity(entity);
	}

}
