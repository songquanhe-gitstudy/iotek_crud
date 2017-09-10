package com.song.dao;

import java.util.List;

/**
 *author:song
 *date:2017年8月30日
**/
public interface IBaseDao<T> {
	int save(T t);
	int update(T t);
	int delete(String id);
	T findById(String id);
	List<T> findAll();
	
}
