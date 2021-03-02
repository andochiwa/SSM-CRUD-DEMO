package com.me.service.impl;

import com.me.bean.Employee;
import com.me.bean.EmployeeExample;
import com.me.dao.EmployeeMapper;
import com.me.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author HAN
 * @version 1.0
 * @create 02-28-7:03
 */
@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    EmployeeMapper employeeMapper;

    @Override
    public List<Employee> getAll() {
        return employeeMapper.selectByExampleWithDept(null);
    }

    @Override
    public int deleteEmpById(Integer id) {
        return employeeMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int deleteBatch(List<Integer> ids) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        // delete from xxx where emp_id in(ids...)
        criteria.andEmpIdIn(ids);
        employeeMapper.deleteByExample(example);
        return 0;
    }

    @Override
    public int updateEmp(Employee employee) {
        return employeeMapper.updateByPrimaryKeySelective(employee);
    }

    @Override
    public void saveEmp(Employee employee) {
        employeeMapper.insertSelective(employee);
    }

    @Override
    public boolean checkName(String name) {
        EmployeeExample employeeExample = new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        criteria.andEmpNameEqualTo(name);
        long count = employeeMapper.countByExample(employeeExample);
        return count == 0;
    }

    @Override
    public Employee getEmp(Integer id) {
        return employeeMapper.selectByPrimaryKey(id);
    }
}
