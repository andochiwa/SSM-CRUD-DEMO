package com.me.controller;

import com.me.bean.Department;
import com.me.bean.Message;
import com.me.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 处理和部门有关的请求
 * @author HAN
 * @version 1.0
 * @create 03-01-5:30
 */
@Controller
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    /**
     * 返回所有部门信息
     */
    @RequestMapping("/depts")
    @ResponseBody
    public Message getDepts() {
        List<Department> depts = departmentService.getDepts();
        return Message.success().add("depts", depts);
    }

}
