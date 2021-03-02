package com.me.dao;

import com.me.bean.Department;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit.jupiter.SpringJUnitConfig;

/**
 * 导入springTest模块
 * 使用@SpringJUnitConfig(locations = "路径")
 */
@SpringJUnitConfig(locations = "classpath:conf/applicationContext.xml")
class DepartmentMapperTest {

    @Autowired
    DepartmentMapper departmentMapper;

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
//        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
//        DepartmentMapper departmentMapper = context.getBean(DepartmentMapper.class);
        // 使用spring的单元测试
        departmentMapper.insertSelective(new Department(null, "开发部"));
        departmentMapper.insertSelective(new Department(null, "测试部"));


    }

    @Test
    void selectByExample() {
    }

    @Test
    void selectByPrimaryKey() {
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