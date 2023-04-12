<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>供应商管理</title>
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
            <iframe style="height:100%;" src="./incs/menu.jsp" frameborder="0"></iframe>
        </div>
        <div class="col-9 col-lg-9">
            <div class="d-flex">
                <div class="input-group mr-auto w-50">
                    <form class="form-inline" action="/SuperMarket_war_exploded/PageSupplierServlet" method="post">
                        <input type="text" name="name6"  class="form-control" placeholder="请输入供应商名称">
                        <button type="submit" class="btn btn-success ml-2">
                            <i class="bi-search"></i>查询
                        </button>
                    </form>
                </div>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addSupplier"><i
                        class="bi-plus"></i>添加供应商</button>
            </div>
            <div class="row mt-3">
                <div class="col-12">
                    <table class="table table-hover table-bordered table-striped text-center">
                        <thead class="thead-dark">
                        <tr>
                            <th scope="col">序号</th>
                            <th scope="col">供应商名称</th>
                            <th scope="col">联系人</th>
                            <th scope="col">联系电话</th>
                            <th scope="col">简介</th>
                            <th scope="col">操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach items="${pb.list}" var="supplier" varStatus="status">
                            <tr>
                                <td>${status.count}</td>
                                <td>${supplier.name}</td>
                                <td>${supplier.contacts}</td>
                                <td>${supplier.tel}</td>
                                <td class="text-truncate" style="max-width: 150px;">${supplier.info}</td>
                                <td>
                                    <div class="btn-group">
                                        <a class="btn btn-sm btn-warning text-white" data-toggle="modal"
                                           data-target="#editSupplier" onclick="showUpdate(this)">
                                            <i class="bi-gear"></i>编辑</a>
                                        <a class="btn btn-sm btn-danger" href="/SuperMarket_war_exploded/DeleteSupplierServlet?id=${supplier.id}">
                                            <i class="bi-trash"></i>删除</a>
                                    </div>
                                </td>
                                <td style="display:none">${supplier.id}</td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                    <nav>
                        <ul class="pagination justify-content-between">
                            <c:if test="${pb.currentPage > 1}">
                                <li class="page-item">
                                    <a class="page-link rounded-pill" href="/SuperMarket_war_exploded/PageSupplierServlet?currentPage=${pb.currentPage - 1}&rows=5"
                                       tabindex="-1">上一页</a>
                                </li>
                            </c:if>
                            <li class="page-item"><a class="page-link rounded-pill">总共${pb.totalPage}页，当前第${pb.currentPage}页</a>
                            </li>
                            <c:if test="${pb.currentPage < pb.totalPage}">
                                <li class="page-item">
                                    <a class="page-link rounded-pill" href="/SuperMarket_war_exploded/PageSupplierServlet?currentPage=${pb.currentPage + 1}&rows=5">下一页</a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 添加供应商Modal -->
<div class="modal fade" id="addSupplier" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">添加供应商</h5>
                <button type="button" class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="addSupplierForm" onsubmit="return false">
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">供应商</label>
                        <div class="col-sm-10">
                            <input type="text" name="name" id="name" class="form-control" placeholder="供应商名">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">联系人</label>
                        <div class="col-sm-10">
                            <input type="text" name="contacts" id="contacts" class="form-control" placeholder="联系人">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">电话</label>
                        <div class="col-sm-10">
                            <input type="text" name="tel" id="tel" class="form-control" placeholder="电话">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">简介</label>
                        <div class="col-sm-10">
                            <textarea name="info" id="info" class="form-control" rows="4"></textarea>
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
<!-- 编辑供应商Modal -->
<div class="modal fade" id="editSupplier" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">编辑供应商</h5>
                <button type="button" class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="editSupplierForm" onsubmit="return false">
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">供应商</label>
                        <div class="col-sm-10">
                            <input type="hidden" name="id2"  id="id2">

                            <input type="text" name="name" id="name2" class="form-control" placeholder="供应商名">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">联系人</label>
                        <div class="col-sm-10">
                            <input type="text" name="contacts" id="contacts2" class="form-control" placeholder="联系人">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">联系电话</label>
                        <div class="col-sm-10">
                            <input type="text" name="tel" id="tel2" class="form-control" placeholder="联系电话">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">简介</label>
                        <div class="col-sm-10">
                            <textarea name="info" id="info2" class="form-control" rows="4"></textarea>
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
        var contacts = $td.eq(2).text();
        var tel = $td.eq(3).text();
        var info = $td.eq(4).text();
        var id = $td.eq(6).text();

        $("#name2").val(name);
        $("#contacts2").val(contacts);
        $("#tel2").val(tel);
        $("#info2").val(info);
        $("#id2").val(id);
    }

    $(document).ready(function () {
        $("#addButton").click(function () {
            let error = "";
            let addForm = $("#addSupplierForm");
            if (addForm.find("input[name=name]").val() == "") {
                error += "请输入供应商名<br>";
            }
            if (addForm.find("input[name=contacts]").val() == "") {
                error += "请输入联系人<br>";
            }
            if (addForm.find("input[name=tel]").val() == "") {
                error += "请输入联系电话<br>";
            }
            if (error != "") {
                addForm.find("div[class~=alert]").html(error);
                addForm.find("div[class~=alert]").removeClass("d-none");
            } else {
                addForm.find("div[class~=alert]").addClass("d-none");
                addForm.submit();
                // 将表单数据转为json
                var addSupplierForm = {
                    name:"",
                    contacts:"",
                    tel:"",
                    info:"",
                };
                // 获取表单数据
                let name = document.getElementById("name").value;
                // 设置数据
                addSupplierForm.name = name;

                // 获取表单数据
                let contacts = document.getElementById("contacts").value;
                // 设置数据
                addSupplierForm.contacts = contacts;

                // 获取表单数据
                let tel = document.getElementById("tel").value;
                // 设置数据
                addSupplierForm.tel = tel;

                // 获取表单数据
                let info = document.getElementById("info").value;
                // 设置数据
                addSupplierForm.info = info;

                //2. 发送ajax请求
                axios({
                    method:"post",
                    url:"http://localhost:8080/SuperMarket_war_exploded/AddSupplierServlet",
                    data:addSupplierForm
                }).then(function (resp) {
                    // 判断响应数据是否为 success
                    if(resp.data == "success"){
                        location.href = "http://localhost:8080/SuperMarket_war_exploded/PageSupplierServlet";
                    }
                })
            }
        });
        $("a[supplier-id]").click(function () {
            $.getJSON("/supplier", {id: $(this).attr("supplier-id")}, function (result) {
                $("#editSupplierForm").find("input[name=name]").val(result.data.name);
                $("#editSupplierForm").find("input[name=contacts]").val(result.data.contacts);
                $("#editSupplierForm").find("input[name=tel]").val(result.data.tel);
                $("#editSupplierForm").find("input[name=id]").val(result.data.id);
                $("#editSupplierForm").find("textarea[name=info]").val(result.data.info);
            });
        });
        $("#editButton").click(function () {
            let error = "";
            let editForm = $("#editSupplierForm");
            if (editForm.find("input[name=name]").val() == "") {
                error += "请输入供应商名<br>";
            }
            if (editForm.find("input[name=contacts]").val() == "") {
                error += "请输入联系人<br>";
            }
            if (editForm.find("input[name=tel]").val() == "") {
                error += "请输入联系电话<br>";
            }
            if (error != "") {
                editForm.find("div[class~=alert]").html(error);
                editForm.find("div[class~=alert]").removeClass("d-none");
            } else {
                editForm.find("div[class~=alert]").addClass("d-none");
                editForm.submit();
                var editSupplierForm = {
                    id:"",
                    name:"",
                    contacts:"",
                    tel:"",
                    info:"",
                };
                // 获取隐藏域数据
                let id = document.getElementById("id2").value;
                // 设置数据
                editSupplierForm.id = id;

                // 获取表单数据
                let name = document.getElementById("name2").value;
                // 设置数据
                editSupplierForm.name = name;

                // 获取表单数据
                let contacts = document.getElementById("contacts2").value;
                // 设置数据
                editSupplierForm.contacts = contacts;

                // 获取表单数据
                let tel = document.getElementById("tel2").value;
                // 设置数据
                editSupplierForm.tel = tel;

                // 获取表单数据
                let info = document.getElementById("info2").value;
                // 设置数据
                editSupplierForm.info = info;

                //2. 发送ajax请求
                axios({
                    method:"post",
                    url:"http://localhost:8080/SuperMarket_war_exploded/UpdateSupplierServlet",
                    data:editSupplierForm
                }).then(function (resp) {
                    // 判断响应数据是否为 success
                    if(resp.data == "success"){
                        location.href = "http://localhost:8080/SuperMarket_war_exploded/PageSupplierServlet";
                    }
                })
            }
        })


    });
</script>
</body>
</html>