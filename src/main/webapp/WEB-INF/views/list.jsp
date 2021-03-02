<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap 101 Template</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>


    <link href="${APP_PATH}/static/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/js/jquery-3.5.1.js"></script>
    <script src="${APP_PATH}/static/js/bootstrap.min.js"></script>
</head>
<body>

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
            <button class="btn btn-primary">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                新增
            </button>
            <button class="btn btn-danger">
                <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
                删除
            </button>
        </div>
    </div>
    <%--表格数据--%>
    <div class="row">
        <div class="col-xs-12">
            <table class="table table-hover">
                <tr>
                    <th>id</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pageInfo.list}" var="emp">
                    <tr>
                        <th>${emp.empId}</th>
                        <th>${emp.empName}</th>
                        <th>${emp.gender}</th>
                        <th>${emp.email}</th>
                        <th>${emp.department.deptName}</th>
                        <th>
                            <button class="btn btn-primary btn-sm">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                编辑
                            </button>
                            <button class="btn btn-danger btn-sm">
                                <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
                                删除
                            </button>
                        </th>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <%--分页信息--%>
    <div class="row">
        <%--分页文字信息--%>
        <div class="col-xs-6">
            当前第${pageInfo.pageNum}页, 总页数${pageInfo.pages}, 总记录${pageInfo.total}
        </div>
        <%--分页条信息--%>
        <div class="col-xs-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <c:if test="${pageInfo.isFirstPage}">
                        <li class="disabled"><a href="#">首页</a></li>
                    </c:if>
                    <c:if test="${!pageInfo.isFirstPage}">
                        <li><a href="${APP_PATH}/emps?pageNumber=1">首页</a></li>
                    </c:if>
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li>
                            <a href="${APP_PATH}/emps?pageNumber=${pageInfo.pageNum - 1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${!pageInfo.hasPreviousPage}">
                        <li class="disabled">
                            <a href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach items="${pageInfo.navigatepageNums}" var="pageNum">
                        <c:if test="${pageNum == pageInfo.pageNum}">
                            <li class="active"><a href="#">${pageNum}</a></li>
                        </c:if>
                        <c:if test="${pageNum != pageInfo.pageNum}">
                            <li><a href="${APP_PATH}/emps?pageNumber=${pageNum}">${pageNum}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageInfo.hasNextPage}">
                        <li>
                            <a href="${APP_PATH}/emps?pageNumber=${pageInfo.pageNum + 1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${!pageInfo.hasNextPage}">
                        <li class="disabled">
                            <a href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${pageInfo.isLastPage}">
                        <li class="disabled"><a href="#">末页</a></li>
                    </c:if>
                    <c:if test="${!pageInfo.isLastPage}">
                        <li><a href="${APP_PATH}/emps?pageNumber=${pageInfo.pages}">末页</a></li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </div>
</div>

</body>
</html>
