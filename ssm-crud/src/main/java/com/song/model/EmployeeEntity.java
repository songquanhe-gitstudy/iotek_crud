package com.song.model;

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

	public DepartmentEntity getDepartmentEntity() {
		return departmentEntity;
	}

	public void setDepartmentEntity(DepartmentEntity departmentEntity) {
		this.departmentEntity = departmentEntity;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getdId() {
        return dId;
    }

    public void setdId(Integer dId) {
        this.dId = dId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName == null ? null : empName.trim();
    }

    public String getEmpGender() {
        return empGender;
    }

    public void setEmpGender(String empGender) {
        this.empGender = empGender == null ? null : empGender.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

	@Override
	public String toString() {
		return "id" + id + ", dId=" + dId + ",Name=" + empName + ",Gender=" + empGender
				+ ", email=" + email + ", d_id=" + departmentEntity.getId() + "d_name="+departmentEntity.getDeptName();
	}
    
    
}