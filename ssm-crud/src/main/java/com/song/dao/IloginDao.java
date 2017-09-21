package com.song.dao;

import com.song.model.LoginEntity;

/**
* create by: song on 2017年9月20日
* 
* 类说明:
*/

public interface IloginDao extends IBaseDao<LoginEntity>{

	LoginEntity findByEntity(LoginEntity entity);

}
