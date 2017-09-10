package com.song.dao;

import java.util.List;
import java.util.Map;

import com.song.model.EmployeeEntity;

public interface EmployeeEntityDao extends IBaseDao<EmployeeEntity> {
    int deleteByPrimaryKey(Integer id);

    int insert(EmployeeEntity record);

    int insertSelective(EmployeeEntity record);

    EmployeeEntity selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(EmployeeEntity record);

    int updateByPrimaryKey(EmployeeEntity record);
    
    List<EmployeeEntity> findAll();
    
    EmployeeEntity findByid(Map<String, Integer> map);
}