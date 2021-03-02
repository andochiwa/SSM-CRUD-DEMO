package com.me.controller;

import com.github.pagehelper.PageInfo;
import com.me.bean.Employee;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.junit.jupiter.SpringJUnitConfig;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

/**
 * @author HAN
 * @version 1.0
 * @create 02-28-7:26
 */
@WebAppConfiguration
@SpringJUnitConfig(locations = {"classpath:conf/applicationContext.xml", "classpath:conf/dispatcherServlet.xml"})
class EmployeeControllerTest {

    // 传入springmvc的context
    @Autowired
    WebApplicationContext context;

    MockMvc mockMvc;

    @BeforeEach
    public void initMockMvc() {
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    void getEmps() throws Exception {
        // 模拟请求拿到返回值
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps")
                .param("pageNumber", "1")).andReturn();
        // 请求成功后，在request域中会有pageInfo
        MockHttpServletRequest request = result.getRequest();
        PageInfo<Employee> pageInfo = (PageInfo<Employee>) request.getAttribute("pageInfo");
        System.out.println("当前页码:" + pageInfo.getPageNum());
        System.out.println("总页码:" + pageInfo.getPages());
        System.out.println("总记录数:" + pageInfo.getTotal());
        System.out.println("连续显示的页码:");
        int[] nums = pageInfo.getNavigatepageNums();
        for (int num : nums) {
            System.out.print(" " + num);
        }

        // 获取员工数据
        List<Employee> list = pageInfo.getList();
        list.forEach(System.out::println);

    }
}