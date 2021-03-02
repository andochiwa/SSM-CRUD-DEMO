package com.me.dao;

import com.me.bean.Employee;
import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit.jupiter.SpringJUnitConfig;

import java.util.List;
import java.util.UUID;

@SpringJUnitConfig(locations = "classpath:conf/applicationContext.xml")
class EmployeeMapperTest {

    @Autowired
    EmployeeMapper employeeMapper;

    @Autowired
    SqlSession sqlSession;

    @Test
    void countByExample() {
    }

    @Test
    void deleteByExample() {
    }

    @Test
    void deleteByPrimaryKey() {
    }

    @Test
    void insert() {
    }

    @Test
    void insertSelective() {
//        employeeMapper.insertSelective(new Employee(null, "Jerry", "女", "Jerry@g.com", 1));
        EmployeeMapper employeeMapper = sqlSession.getMapper(EmployeeMapper.class);
        for(int i = 0; i < 1000; i++) {
            String uid = UUID.randomUUID().toString().substring(0, 5) + i;
            employeeMapper.insertSelective(new Employee(null, uid, "男", uid + "@g.com", 1));
        }
    }

    @Test
    void selectByExample() {
    }

    @Test
    void selectByPrimaryKey() {
    }

    @Test
    void selectByExampleWithDept() {
        List<Employee> employees = employeeMapper.selectByExampleWithDept(null);
        employees.forEach(System.out::println);
    }

    @Test
    void selectByPrimaryKeyWithDept() {
    }

    @Test
    void updateByExampleSelective() {
    }

    @Test
    void updateByExample() {
    }

    @Test
    void updateByPrimaryKeySelective() {
    }

    @Test
    void updateByPrimaryKey() {
    }
}