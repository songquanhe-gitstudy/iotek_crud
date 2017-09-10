package com.song.model;

import lombok.Data;

@Data
public class DepartmentEntity {
    private Integer id;

    private String deptName;
    
    public DepartmentEntity() {
    	super();
    }
    
	public DepartmentEntity(Integer id, String deptName) {
		super();
		this.id = id;
		this.deptName = deptName;
	}
    
}