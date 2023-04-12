<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>商品分类管理</title>
    <link href="./lib/css/bootstrap.css" rel="stylesheet" />
    <link href="./lib/font/bootstrap-icons.css" rel="stylesheet">
</head>

<body>
<nav class="navbar navbar-expand-md bg-dark navbar-dark">
    <a class="navbar-brand" href="/" class="text-muted">
        <i class="bi-cart"></i>
        超市管理系统
    </a>
    <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse"
            data-target="#collapsibleNavId"></button>
    <div class="collapse navbar-collapse flex-row-reverse" id="collapsibleNavId">
        <ul class="navbar-nav  mt-2 mt-lg-0">
            <li class="nav-item active">
                <a class="nav-link" href="#">欢迎 ${user.loginname}</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/SuperMarket_war_exploded/LogoutServlet">
                    <i class="bi-door-open-fill"></i>
                    退出
                </a>
            </li>

        </ul>
    </div>
</nav>

<div class="container-fluid">
    <div class="row p-3 mt-3">
        <div class="col-3 col-lg-3">
            <iframe style="height:100%;" src="incs/menu.jsp" frameborder="0"></iframe>
        </div>
        <div class="col-9 col-lg-9">
            <div class="d-flex">
                <div class="input-group mr-auto w-50">
                    <form class="form-inline" action="/SuperMarket_war_exploded/PageCategoryServlet" method="post">
                        <input type="text" name="name6"  class="form-control" placeholder="请输入分类名">
                        <button type="submit" class="btn btn-success ml-2">
                            <i class="bi-search"></i>查询
                        </button>
                    </form>
                </div>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addCategory"><i
                        class="bi-plus"></i>添加分类</button>
            </div>
            <div class="row mt-3">
                <div class="col-12">
                    <table class="table table-hover table-bordered table-striped text-center">
                        <thead class="thead-dark">
                        <tr>
                            <th scope="col">序号</th>
                            <th scope="col">分类名</th>
                            <th scope="col">简介</th>
                            <th scope="col">操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach items="${pb.list}" var="category" varStatus="status">
                            <tr>
                                <td>${status.count}</td>
                                <td>${category.name}</td>
                                <td class="text-truncate" style="max-width: 150px;">${category.description}</td>
                                <td>
                                    <div class="btn-group">
                                        <a class="btn btn-sm btn-warning text-white" data-toggle="modal"
                                           data-target="#editCategory" onclick="showUpdate(this)">
                                            <i class="bi-gear"></i>编辑</a>
                                        <a class="btn btn-sm btn-danger" href="/SuperMarket_war_exploded/DeleteCategoryServlet?id=${category.id}">
                                            <i class="bi-trash"></i>删除</a>
                                    </div>
                                </td>
                                <td style="display:none">${category.id}</td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                    <nav>
                        <ul class="pagination justify-content-between">
                            <c:if test="${pb.currentPage > 1}">
                                <li class="page-item">
                                    <a class="page-link rounded-pill" href="/SuperMarket_war_exploded/PageCategoryServlet?currentPage=${pb.currentPage - 1}&rows=5"
                                         tabindex="-1">上一页</a>
                                 </li>
                             </c:if>
                            <li class="page-item"><a class="page-link rounded-pill">总共${pb.totalPage}页，当前第${pb.currentPage}页</a>
                            </li>
                            <c:if test="${pb.currentPage < pb.totalPage}">
                            <li class="page-item">
                                <a class="page-link rounded-pill" href="/SuperMarket_war_exploded/PageCategoryServlet?currentPage=${pb.currentPage + 1}&rows=5">下一页</a>
                            </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 添加分类Modal -->
<div class="modal fade" id="addCategory" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">添加分类</h5>
                <button type="button" class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="addCategoryForm" onsubmit="return false">
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">分类名</label>
                        <div class="col-sm-10">
                            <input type="text" name="name" id="name" class="form-control" placeholder="分类名">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">简介</label>
                        <div class="col-sm-10">
                            <textarea name="description" id="description" class="form-control" rows="4"></textarea>
                        </div>
                    </div>
                    <div class="text-danger d-none alert">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                <button id="addButton" type="button" class="btn btn-primary">提交</button>
            </div>
        </div>
    </div>
</div>
<!-- 编辑分类Modal -->
<div class="modal fade" id="editCategory" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">编辑分类</h5>
                <button type="button" class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="editCategoryForm" onsubmit="return false">
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">分类</label>
                        <div class="col-sm-10">
                            <input type="hidden" name="id2"  id="id2">

                            <input type="text" name="name" id="name2" class="form-control" placeholder="分类名">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">简介</label>
                        <div class="col-sm-10">
                            <textarea name="description" id="description2" class="form-control" rows="4"></textarea>
                        </div>
                    </div>
                    <div class="text-danger d-none alert">
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                <button id="editButton" type="button" class="btn btn-primary">提交</button>
            </div>
        </div>
    </div>
</div>

<script src="./lib/js/jquery.js"></script>
<script src="./lib/js/bootstrap.js"></script>
<script src="./lib/js/axios-0.18.0.js"></script>
<script>
    function showUpdate(obj){
        var $td= $(obj).parents('tr').children('td');
        var name = $td.eq(1).text();
        var description = $td.eq(2).text();
        var id = $td.eq(4).text();

        $("#name2").val(name);
        $("#description2").val(description);
        $("#id2").val(id);
    }

    $(document).ready(function () {
        $("#addButton").click(function () {
            let error = "";
            let addForm = $("#addCategoryForm");
            if (addForm.find("input[name=name]").val() == "") {
                error += "请输入分类名<br>";
            }
            if (addForm.find("textarea[name=description]").val() == "") {
                error += "请输入简介<br>";
            }
            if (error != "") {
                addForm.find("div[class~=alert]").html(error);
                addForm.find("div[class~=alert]").removeClass("d-none");
            } else {
                addForm.find("div[class~=alert]").addClass("d-none");
                addForm.submit();
                // 将表单数据转为json
                var addCategoryForm = {
                    name:"",
                    info:"",
                };
                // 获取表单数据
                let name = document.getElementById("name").value;
                // 设置数据
                addCategoryForm.name = name;

                // 获取表单数据
                let description = document.getElementById("description").value;
                // 设置数据
                addCategoryForm.description = description;

                //2. 发送ajax请求
                axios({
                    method:"post",
                    url:"http://localhost:8080/SuperMarket_war_exploded/AddCategoryServlet",
                    data:addCategoryForm
                }).then(function (resp) {
                    // 判断响应数据是否为 success
                    if(resp.data == "success"){
                        location.href = "http://localhost:8080/SuperMarket_war_exploded/PageCategoryServlet";
                    }
                })
            }
        });
        $("a[category-id]").click(function () {
            $.getJSON("/category", {id: $(this).attr("category-id")}, function (result) {
                $("#editCategoryForm").find("input[name=name]").val(result.data.name);
                $("#editCategoryForm").find("input[name=description]").val(result.data.description);
            });
        });
        $("#editButton").click(function () {
            let error = "";
            let editForm = $("#editCategoryForm");
            if (editForm.find("input[name=name]").val() == "") {
                error += "请输入分类名<br>";
            }
            if (editForm.find("textarea[name=description]").val() == "") {
                error += "请输入简介<br>";
            }
            if (error != "") {
                editForm.find("div[class~=alert]").html(error);
                editForm.find("div[class~=alert]").removeClass("d-none");
            } else {
                editForm.find("div[class~=alert]").addClass("d-none");
                editForm.submit();
                var editCategoryForm = {
                    id:"",
                    name:"",
                    info:"",
                };
                // 获取隐藏域数据
                let id = document.getElementById("id2").value;
                // 设置数据
                editCategoryForm.id = id;

                // 获取表单数据
                let name = document.getElementById("name2").value;
                // 设置数据
                editCategoryForm.name = name;

                // 获取表单数据
                let description = document.getElementById("description2").value;
                // 设置数据
                editCategoryForm.description = description;

                //2. 发送ajax请求
                axios({
                    method:"post",
                    url:"http://localhost:8080/SuperMarket_war_exploded/UpdateCategoryServlet",
                    data:editCategoryForm
                }).then(function (resp) {
                    // 判断响应数据是否为 success
                    if(resp.data == "success"){
                        location.href = "http://localhost:8080/SuperMarket_war_exploded/PageCategoryServlet";
                    }
                })
            }
        })


    });
</script>
</body>
</html>