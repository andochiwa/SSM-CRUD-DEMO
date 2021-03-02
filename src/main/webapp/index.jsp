<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>首页</title>
    <base href="<%=basePath%>">


    <link href="static/css/bootstrap.min.css" rel="stylesheet">
    <script src="static/js/jquery-3.5.1.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
</head>
<body>

<!-- 添加员工的模态框 -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">员工添加</h4>
            </div>
            <div class="modal-body">
                <%--表单--%>
                <form class="form-horizontal" id="emp_add_form">
                    <div class="form-group">
                        <label for="empName_input" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_input" placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_input" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_input" placeholder="email@you.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_input" class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="男" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="女"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_input" class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <%--部门应该从数据库中查询--%>
                            <select class="form-control" name="deptId" id="dept_add_select">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_add">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- 修改员工的模态框 -->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">员工修改</h4>
            </div>
            <div class="modal-body">
                <%--表单--%>
                <form class="form-horizontal" id="emp_update_form">
                    <div class="form-group">
                        <label for="empName_input" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_input" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update" placeholder="email@you.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_input" class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" value="男" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" value="女"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_input" class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <%--部门应该从数据库中查询--%>
                            <select class="form-control" name="deptId" id="dept_update_select">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_update">更新</button>
            </div>
        </div>
    </div>
</div>

<div class="container-fluid">
    <%--标题--%>
    <div class="row">
        <div class="col-xs-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <%--按钮--%>
    <div class="row">
        <div class="col-xs-4 col-md-offset-8">
            <button class="btn btn-primary" id="emp_add_modal_btn">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                新增
            </button>
            <button class="btn btn-danger" id="emp_delete_modal_btn">
                <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
                删除
            </button>
        </div>
    </div>
    <%--表格数据--%>
    <div class="row">
        <div class="col-xs-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="check_all">
                    </th>
                    <th>id</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                </tbody>

            </table>
        </div>
    </div>
    <%--分页信息--%>
    <div class="row">
        <%--分页文字信息--%>
        <div class="col-xs-6" id="page_info_area">
        </div>
        <%--分页条信息--%>
        <div class="col-xs-6" id="page_nav_area">
        </div>
    </div>
</div>

<script type="text/javascript">

    // 保存总记录数
    let totalRecord = 0;
    // 保存当前页面
    let currentNum = 0;

    // 页面加载完成后，直接发送一个ajax请求，获得分页数据
    $(function () {
        toPage(1);
    })

    /**
     * 进入哪一页
     * @param pageNumber 页数
     */
    function toPage(pageNumber) {
        $.ajax({
            url: "emps",
            data: "pageNumber=" + pageNumber,
            type: "GET",
            success: (function (res) {
                // 显示员工数据
                buildEmpsTable(res);
                // 显示分页数据
                buildPageInfo(res);
                // 显示分页条数据
                buildPageNav(res);
            })
        })
    }

    // 解析显示员工数据
    function buildEmpsTable(result) {
        // 清空table表格
        $("#emps_table tbody").empty();
        let emps = result.extend.pageInfo.list;
        $.each(emps, function (i, item) {
            let checkBoxTd = $("<td></td>").append("<input type='checkbox' class='check_item'/>");
            let empIdTd = $("<td></td>").append(item.empId);
            let empNameTd = $("<td></td>").append(item.empName);
            let empGenderTd = $("<td></td>").append(item.gender);
            let empEmailTd = $("<td></td>").append(item.email);
            let deptNameTd = $("<td></td>").append(item.department.deptName);
            let editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                .append("编辑");
            // 为编辑按钮添加自定义属性
            editBtn.attr("edit-id", item.empId);
            let deleteBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-minus"))
                .append("删除");
            deleteBtn.attr("delete-id", item.empId);
            let btnTd = $("<td></td>").append(editBtn).append(deleteBtn);

            $("<tr></tr>").append(checkBoxTd)
                .append(empIdTd)
                .append(empNameTd)
                .append(empGenderTd)
                .append(empEmailTd)
                .append(deptNameTd)
                .append(btnTd)
                .appendTo("#emps_table tbody");

        });
    }

    // 解析显示分页信息
    function buildPageInfo(result) {
        let tab = $("#page_info_area");
        // 清空分页数据
        tab.empty();
        tab.append("当前第" + result.extend.pageInfo.pageNum +
            "页, 总页数" + result.extend.pageInfo.pages +
            ", 总记录" + result.extend.pageInfo.total);
        totalRecord = result.extend.pageInfo.total;
        currentNum = result.extend.pageInfo.pageNum;
    }

    // 解析显示分页条
    function buildPageNav(result) {
        let tab = $("#page_nav_area");
        // 清空分页条
        tab.empty();
        let ul = $("<ul></ul>").addClass("pagination");
        // 首页按钮
        let firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("herf", "#"));
        if (result.extend.pageInfo.isFirstPage) {
            firstPageLi.addClass("disabled");
        } else {
            // 为首页按钮添加单击事件
            firstPageLi.click(function() {
                toPage(1);
            })
        }

        // 上一页按钮
        let prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if (!result.extend.pageInfo.hasPreviousPage) {
            prePageLi.addClass("disabled");
        } else {
            // 为上一页按钮添加单击事件
            prePageLi.click(function() {
                toPage(result.extend.pageInfo.pageNum - 1);
            })
        }

        // 下一页按钮
        let nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        if (!result.extend.pageInfo.hasNextPage) {
            nextPageLi.addClass("disabled");
        } else {
            // 为下一页按钮添加单击事件
            nextPageLi.click(function() {
                toPage(result.extend.pageInfo.pageNum + 1)
            })
        }

        // 末页按钮
        let lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("herf", "#"));
        if (result.extend.pageInfo.isLastPage) {
            lastPageLi.addClass("disabled");
        } else {
            // 为末页按钮添加单击事件
            lastPageLi.click(function() {
                toPage(result.extend.pageInfo.pages);
            })
        }

        // 添加上一页和首页的提示
        ul.append(firstPageLi).append(prePageLi);
        $.each(result.extend.pageInfo.navigatepageNums, function(i, item) {
            let numLi = $("<li></li>").append($("<a></a>").append(item));
            if (result.extend.pageInfo.pageNum === item) {
                numLi.addClass("active");
            } else {
                // 给页码添加单击事件
                numLi.click(function() {
                    toPage(item);
                })
            }
            // 遍历添加页码提示
            ul.append(numLi);
        });
        // 添加下一页和末页的提示
        ul.append(nextPageLi).append(lastPageLi);


        // 把ul加入到nav
        let navEle = $("<nav></nav>").append(ul);
        tab.append(navEle);
    }

    // 给单个删除绑定单击事件
    $(document).on("click", ".delete_btn", function() {
        // 弹出确认删除会话框
        let name = $(this).parents("tr").find("td:eq(2)").text();
        if(confirm("确认删除[" + name + "]吗？")) {
            $.ajax({
                url: "emp/" + $(this).attr("delete-id"),
                type: "DELETE",
                success: function(result) {
                    if (result.code === 100) {
                        alert("删除成功");
                        toPage(currentNum);
                    } else {
                        alert("发生未知错误，删除失败");
                        return false;
                    }
                }
            })
        } else {
            alert("注意别手抖了喔！");
            return false;
        }
        return true;
    })

    /**
     * 给编辑按钮绑定单击事件
     * 因为单击按钮是由ajax请求而绑定的，如果直接绑定会在按钮还没加入之前就进行而无法绑定
     * 这里使用$(document).on("事件", "标识"， function()) 可以进行动态绑定
     */
    $(document).on("click", ".edit_btn", function() {
        let tab = $("#empUpdateModal");
        // 重置模态框
        resetForm("#emp_update_form");
        // 查出员工信息
        getEmp($(this).attr("edit-id"));
        // 把员工id传递给模态框的更新按钮
        $("#emp_save_update").attr("edit-id", $(this).attr("edit-id"));
        // 查出部门信息并显示在下拉框
        getDepts("#dept_update_select")
        tab.modal({
            backdrop: "static"
        });
    })

    function getEmp(id) {
        $.ajax({
            url: "emp/" + id,
            type: "GET",
            success: function(result) {
                let empData = result.extend.emp;
                $("#empName_update_static").text(empData.empName);
                $("#email_update").val(empData.email);
                $("#empUpdateModal input[name=gender]").val([empData.gender]);
                $("#dept_update_select").val([empData.deptId]);
            }
        })
    }

    // 为更新按钮添加单击事件
    $("#emp_save_update").click(function() {
        if ($(this).attr("email-status") != null && $(this).attr("email-status") !== "error") {
            $.ajax({
                url: "emp/" + $(this).attr("edit-id"),
                type: "PUT",
                data: $("#emp_update_form").serialize(),
                success: function(result) {
                    // 进行后端校验
                    if(result.code === 100) {
                        $("#empUpdateModal").modal("hide");
                        toPage(currentNum);
                    } else {
                        // 显示失败信息
                        if (result.extend.errorFields.email !== undefined) {
                            showValidateMsg($("#email_update"), "error", result.extend.errorFields.email)
                        }
                        return false;
                    }
                }
            })
        } else {
            showValidateMsg($("#email_update"), "error", "邮箱格式不正确")
            return false;
        }
        return true;
    })

    // 表单重置
    function resetForm(tag) {
        $(tag)[0].reset();
        $(tag).find("*").removeClass("has-error has-success");
        $(tag).find(".help-block").text("");
    }

    // 点进新增按钮弹出模态框
    $("#emp_add_modal_btn").click(function() {
        // 表单重置
        resetForm("#emp_add_form");
        // 发送ajax请求，查出部门信息，显示在下拉列表
        getDepts("#dept_add_select");
        // 弹出模态框
        $("#empAddModal").modal({
            backdrop: "static"
        })
    })

    // 查出所有部门信息并显示在下拉列表中
    function getDepts(ele) {
        $(ele).empty();
        $.ajax({
            url: "depts",
            type: "GET",
            success: function(result) {
                // 显示部门信息到下拉列表
                $.each(result.extend.depts, function() {
                    let optionEle = $("<option></option>").append(this.deptName).attr("value", this.deptId);
                    optionEle.appendTo(ele);
                })
            }
        })
    }

    // 校验表单数据
    function validateAddForm() {
        let empNameTag = $("#empName_input");
        let empName = empNameTag.val();
        let regName = /(^[a-zA-Z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
        if(!regName.test(empName)) {
            showValidateMsg(empNameTag, "error", "用户名必须是2-5位中文或者3-16位英文数字的组合")
        }
        let emailTag = $("#email_input");
        let email = emailTag.val();
        let regEmail = /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
        if(!regEmail.test(email)) {
            showValidateMsg(emailTag, "error", "邮箱格式不正确")
        }
    }


    function showValidateMsg(tag, status, msg) {
        // 清除当前元素校验状态
        tag.parent().removeClass("has-success has-error");
        if("success" === status) {
            tag.parent().addClass("has-success");
            tag.next("span").text(msg);
        } else if("error" === status) {
            tag.parent().addClass("has-error");
            tag.next("span").text(msg);
        }
    }

    // 为添加员工的保存按钮绑定单击事件
    $("#emp_save_add").click(function() {
        // 对提交给服务器的数据进行校验
        if($(this).attr("empName-status") != null && $(this).attr("empName-status") !== "error" &&
           $(this).attr("email-status") != null && $(this).attr("email-status") !== "error") {
            // 模态框中填写的表单数据进行保存
            // serialize()可以获取表单内容，仅限ajax
            let tab = $("#emp_add_form");
            $.ajax({
                url: "emp",
                type: "POST",
                data: tab.serialize(),
                success: function(result) {
                    // 校验后端数据
                    if (result.code === 100) {
                        // 员工保存成功后要关闭模态框，并且跳转到最后一页
                        $("#empAddModal").modal("hide");
                        toPage(totalRecord);
                    } else {
                        // 显示失败信息
                        if (result.extend.errorFields.email !== undefined) {
                            showValidateMsg($("#email_input"), "error", result.extend.errorFields.email)
                        }
                        if (result.extend.errorFields.empName !== undefined) {
                            showValidateMsg($("#empName_input"), "error", result.extend.errorFields.empName)
                        }
                    }

                }
            })
        } else {
            validateAddForm()
            return false;
        }
    })

    // 对添加name校验添加焦点移除事件
    $("#empName_input").blur(function() {
        let tab = this;
        let empName = $(tab).val();
        let regName = /(^[a-zA-Z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
        if(!regName.test(empName)) {
            showValidateMsg($(tab), "error", "用户名必须是2-5位中文或者3-16位英文数字的组合")
            $("#emp_save_add").attr("empName-status", "error");
            return false;
        } else {
            // 发送ajax请求进一步检验用户名是否可用
            $.ajax({
                url: "checkName",
                data: "empName=" + this.value,
                type: "POST",
                success: function(result) {
                    if (result.code === 100) {
                        showValidateMsg($(tab), "success", "用户名可用");
                        $("#emp_save_add").attr("empName-status", "success");
                    } else {
                        showValidateMsg($(tab), "error", "用户名不可用");
                        $("#emp_save_add").attr("empName-status", "error");
                        return false;
                    }
                }
            })
        }
        return true;
    })

    // 对添加email校验添加焦点移除事件
    $("#email_input").blur(function() {
        let email = $(this).val();
        let regEmail = /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
        if(!regEmail.test(email)) {
            showValidateMsg($(this), "error", "邮箱格式不正确")
            $("#emp_save_add").attr("email-status", "error");
            return false;
        } else {
            showValidateMsg($(this), "success", "")
            $("#emp_save_add").attr("email-status", "success");
        }
        return true;
    })

    // 对更新email校验添加焦点移除事件
    $("#email_update").blur(function() {
        let email = $(this).val();
        let regEmail = /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
        if(!regEmail.test(email)) {
            showValidateMsg($(this), "error", "邮箱格式不正确")
            $("#emp_save_update").attr("email-status", "error");
            return false;
        } else {
            showValidateMsg($(this), "success", "")
            $("#emp_save_update").attr("email-status", "success");
        }
        return true;
    })

    // 完全全选/全不选功能
    $("#check_all").click(function() {
        $(".check_item").prop("checked", $(this).prop("checked"));
    })

    $(document).on("click", ".check_item", function() {
        let flag = $(".check_item:checked").length === $(".check_item").length;
        $("#check_all").prop("checked", flag);
    })

    // 批量删除
    $("#emp_delete_modal_btn").click(function() {
        let del_idstr = "";
        $.each($(".check_item:checked"), function() {
            del_idstr += $(this).parents("tr").find("td:eq(1)").text() + "-";
        })
        del_idstr = del_idstr.substring(0, del_idstr.length - 1);
        if (confirm("确定删除选定的员工吗？")) {
            $.ajax({
                url: "emp/" + del_idstr,
                type: "DELETE",
                success: function(result) {
                    alert("删除成功");
                    toPage(currentNum);
                }
            })
        } else {
            alert("注意别手抖喔！");
        }
    })

</script>

</body>
</html>
