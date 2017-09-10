package com.song.dao;

import com.song.model.DepartmentEntity;

public interface DepartmentEntityDao extends IBaseDao<DepartmentEntity>{
    int deleteByPrimaryKey(Integer id);

    int insert(DepartmentEntity record);

    int insertSelective(DepartmentEntity record);

    DepartmentEntity selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(DepartmentEntity record);

    int updateByPrimaryKey(DepartmentEntity record);
}