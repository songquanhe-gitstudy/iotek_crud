package com.song.test;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.song.dao.DepartmentEntityDao;
import com.song.dao.EmployeeEntityDao;
import com.song.model.DepartmentEntity;
import com.song.model.EmployeeEntity;

/**
 *author:song
 *date:2017年7月22日
*/

public class SqlTest extends SongBaseTest{
	@Autowired
	private DepartmentEntityDao departmentEntityDao;
	@Autowired
	private EmployeeEntityDao employeeEntityDao;
	@Autowired
	private SqlSession sqlSession;

	@Test
	public void test() {
		DepartmentEntity departmentEntity = new DepartmentEntity();
		departmentEntity.setDeptName("上海网鱼信息科技有限公司");
		System.out.println("-----"+departmentEntity.getDeptName()+"----------");
		
		departmentEntityDao.insertSelective(new DepartmentEntity(null, "桌面组"));
		/*employeeEntityDao.insertSelective(new EmployeeEntity(null, 1, "千寻", "女", "qianxun@qq.com"));
		 */
		//批量插入
		/*EmployeeEntityDao mapper = sqlSession.getMapper(EmployeeEntityDao.class);
		
		for (int i = 1; i < 1000; i++) {
			String name = UUID.randomUUID().toString().substring(0, 5)+i;
			mapper.insertSelective(new EmployeeEntity(null, 1, name, "男", name+"@qq.com"));
		}*/
		/*//联合查找
		List<EmployeeEntity> list = employeeEntityDao.findAll();
		for (EmployeeEntity employeeEntity : list) {
			System.out.println(employeeEntity);
		}*/
		/*Map<String, Integer> map = new HashMap<>();
		map.put("songId", 1109);
		EmployeeEntity findByid = employeeEntityDao.findByid(map);
		System.out.println(findByid.getEmpName());*/
		
		System.out.println("---------------完成-------------------");
		
	}

}












