package com.song.model;

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

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName == null ? null : deptName.trim();
    }

	@Override
	public String toString() {
		return "id=" + id + ", deptName=" + deptName;
	}
    
}