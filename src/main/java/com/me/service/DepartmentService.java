package com.me.service;

import com.me.bean.Department;

import java.util.List;

/**
 * @author HAN
 * @version 1.0
 * @create 03-01-5:31
 */
public interface DepartmentService {

    /**
     * 返回所有部门信息
     */
    List<Department> getDepts();
}
