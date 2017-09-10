package com.song.model;

import lombok.Data;

@Data
public class EmployeeEntity {
    private Integer id;

    private Integer dId;

    private String empName;

    private String empGender;

    private String email;
    
    private DepartmentEntity departmentEntity;
    
    public EmployeeEntity() {
		super();
	}

	public EmployeeEntity(Integer id, Integer dId, String empName, String empGender, String email) {
		super();
		this.id = id;
		this.dId = dId;
		this.empName = empName;
		this.empGender = empGender;
		this.email = email;
	}

}