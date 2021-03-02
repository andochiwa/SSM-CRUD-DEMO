package com.me.service;

import com.me.bean.Employee;

import java.util.List;

/**
 * @author HAN
 * @version 1.0
 * @create 02-28-7:06
 */
public interface EmployeeService {

    /**
     * 查询所有员工
     * @return 员工信息
     */
    List<Employee> getAll();

    /**
     * 删除单个员工
     * @param id 员工id
     * @return 影响行数
     */
    int deleteEmpById(Integer id);

    /**
     * 删除多个员工
     * @param ids id的list
     * @return 影响行数
     */
    int deleteBatch(List<Integer> ids);

    /**
     * 员工更新
     */
    int updateEmp(Employee employee);

    /**
     * 插入员工到数据库
     */
    void saveEmp(Employee employee);

    /**
     * 检验用户名是否可用
     * @param name 传入的用户名
     * @return true 可用
     */
    boolean checkName(String name);

    /**
     * 查询单个员工
     * @param id 传入的id
     * @return 员工信息
     */
    Employee getEmp(Integer id);

}
