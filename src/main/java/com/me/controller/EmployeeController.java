package com.me.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.me.bean.Employee;
import com.me.bean.Message;
import com.me.service.EmployeeService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author HAN
 * @version 1.0
 * @create 02-28-6:58
 */
@Controller
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;

    /**
     * 删除员工
     */
    @DeleteMapping("/emp/{ids}")
    @ResponseBody
    public Message deleteEmpById(@PathVariable("ids") String ids) {
        if (ids.contains("-")) {
            String[] str_ids = ids.split("-");
            List<Integer> del_ids = new ArrayList<>();
            for (String id : str_ids) {
                del_ids.add(Integer.valueOf(id));
            }

            employeeService.deleteBatch(del_ids);

//            for (String id : str_ids) {
//                employeeService.deleteEmpById(Integer.parseInt(ids));
//            }

//            for (int i = 0; i < ids.length(); i += 2) {
//                employeeService.deleteEmpById(Integer.parseInt(String.valueOf(ids.charAt(i))));
//            }
        } else {
            employeeService.deleteEmpById(Integer.parseInt(ids));
        }

        return Message.success();
    }

    /**
     * 更新员工
     */
    @PutMapping("/emp/{empId}")
    @ResponseBody
    public Message updateEmp(@Valid Employee employee, BindingResult result) {
        if (result.hasErrors()) {
            Map<String, Object> map = new HashMap<>();
            List<FieldError> fieldErrors = result.getFieldErrors();
            fieldErrors.forEach(fieldError -> {
                map.put(fieldError.getField(), fieldError.getDefaultMessage());
            });
            return Message.fail().add("errorFields", map);
        }
        int status = employeeService.updateEmp(employee);
        return Message.success();
    }

    /**
     * 保存员工，规定只能为post请求
     * 引入JSR303校验
     */
    @PostMapping(value = "/emp")
    @ResponseBody
    public Message saveEmp(@Valid Employee employee, BindingResult result) {
        if (result.hasErrors()) {
            Map<String, Object> map = new HashMap<>();
            List<FieldError> fieldErrors = result.getFieldErrors();
            fieldErrors.forEach(fieldError -> {
                map.put(fieldError.getField(), fieldError.getDefaultMessage());
            });
            return Message.fail().add("errorFields", map);
        }

        employeeService.saveEmp(employee);
        return Message.success();
    }

    /**
     * 检查用户名是否可用
     */
    @RequestMapping("/checkName")
    @ResponseBody
    public Message checkName(@RequestParam("empName") String empName) {
        boolean check = employeeService.checkName(empName);
        if (check) {
            return Message.success();
        }
        return Message.fail();
    }

    /**
     * 按照员工id查询员工
     */
    @GetMapping(value = "/emp/{id}")
    @ResponseBody
    public Message getEmp(@PathVariable("id") Integer id) {
        Employee employee = employeeService.getEmp(id);
        return Message.success().add("emp", employee);
    }

    /**
     * 使用json代替下面方法
     *
     * @param pageNumber 第几页
     */
    @RequestMapping("/emps")
    @ResponseBody
    public Message getEmpsWithJson(@RequestParam(value = "pageNumber", defaultValue = "1") Integer pageNumber) {
        // 传入页码以及分页
        PageHelper.startPage(pageNumber, 10);
        List<Employee> emps = employeeService.getAll();
        // 使用PageInfo包装查询后的结果，只需要将pageInfo交给页面，内部封装了详细的分页信息
        // 第二个参数为传入连续显示的页数
        PageInfo<Employee> pageInfo = new PageInfo<>(emps, 5);
        return Message.success().add("pageInfo", pageInfo);
    }

    /**
     * 查询员工数据(分页查询)
     *
     * @return 视图
     * @deprecated
     */
//    @RequestMapping("/emps")
    public ModelAndView getEmps(@RequestParam(value = "pageNumber", defaultValue = "1") Integer pageNumber) {
        ModelAndView modelAndView = new ModelAndView();
        // 传入页码以及分页
        PageHelper.startPage(pageNumber, 5);
        List<Employee> emps = employeeService.getAll();
        // 使用PageInfo包装查询后的结果，只需要将pageInfo交给页面，内部封装了详细的分页信息
        // 第二个参数为传入连续显示的页数
        PageInfo<Employee> pageInfo = new PageInfo<>(emps, 5);

        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.setViewName("list");
        return modelAndView;
    }

}
