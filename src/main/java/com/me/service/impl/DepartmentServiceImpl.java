package com.me.service.impl;

import com.me.bean.Department;
import com.me.dao.DepartmentMapper;
import com.me.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author HAN
 * @version 1.0
 * @create 03-01-5:32
 */
@Service
public class DepartmentServiceImpl implements DepartmentService {

    @Autowired
    DepartmentMapper departmentMapper;

    @Override
    public List<Department> getDepts() {
        return departmentMapper.selectByExample(null);
    }
}
