package com.song.model;

import lombok.Data;

/**
* create by: song on 2017年9月20日
* 
* 类说明:登录实体类
*/

@Data
public class LoginEntity {
	private String id;
	private String jobNumber;
	private String password;
	private int roleId;
	
	public LoginEntity() {
		super();
	}
	
	public LoginEntity(String id, String jobNumber, String password, int roleId) {
		super();
		this.id = id;
		this.jobNumber = jobNumber;
		this.password = password;
		this.roleId = roleId;
	}

	
}
