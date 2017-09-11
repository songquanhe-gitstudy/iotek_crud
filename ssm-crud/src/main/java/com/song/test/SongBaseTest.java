package com.song.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.song.dao.DepartmentEntityDao;

/**
 *author:song
 *date:2017年7月22日
**/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class SongBaseTest {
	@Autowired
	private DepartmentEntityDao departmentEntityDao;
	
	@Test
	@Transactional   
	public void test() {
		System.out.println("-------------------"+departmentEntityDao);
	}

}
