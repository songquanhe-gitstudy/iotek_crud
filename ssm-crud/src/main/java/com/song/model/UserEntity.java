package com.song.model;

import java.util.Date;

import lombok.Data;

/**
* create by: song on 2017年9月20日
* 
* 类说明:
*/

@Data
public class UserEntity {
	
	private int userId;
	private String jobNumber;
	private String userName;
	private String gender;
	private String email;
	private Date birthDay;
	private String education;
	private int majorId;
	

	public UserEntity() {
		super();
	}

	public UserEntity(int userId, String jobNumber, String userName, String gender, String email, Date birthDay,
			String education, int majorId) {
		super();
		this.userId = userId;
		this.jobNumber = jobNumber;
		this.userName = userName;
		this.gender = gender;
		this.email = email;
		this.birthDay = birthDay;
		this.education = education;
		this.majorId = majorId;
	}
	
}
