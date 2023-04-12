<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>销售管理</title>
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
                    <form class="form-inline" action="/SuperMarket_war_exploded/PageSaleServlet" method="post">
                        <input type="text" name="name6"  class="form-control" placeholder="请输入销售日期">
                        <button type="submit" class="btn btn-success ml-2">
                            <i class="bi-search"></i>查询
                        </button>
                    </form>
                </div>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addSale"><i
                        class="bi-plus"></i>添加销售记录</button>
            </div>
            <div class="row mt-3">
                <div class="col-12">
                    <table class="table table-hover table-bordered table-striped text-center">
                        <thead class="thead-dark">
                        <tr>
                            <th scope="col">序号</th>
                            <th scope="col">销售日期</th>
                            <th scope="col">明细</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach items="${pb.list}" var="sale" varStatus="status">
                            <tr>
                                <td>${status.count}</td>
                                <td>${sale.tradetime}</td>
                                <td>
                                    <div class="btn-group">
                                        <a class="btn btn-sm btn-primary text-white" data-toggle="modal"
                                           data-target="#editSale" onclick="showUpdate(this)">
                                            <i></i>点击查看明细</a>
                                    </div>
                                </td>
                                <td style="display:none">${sale.id}</td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                    <nav>
                        <ul class="pagination justify-content-between">
                            <c:if test="${pb.currentPage > 1}">
                                <li class="page-item">
                                    <a class="page-link rounded-pill" href="/SuperMarket_war_exploded/PageSaleServlet?currentPage=${pb.currentPage - 1}&rows=5"
                                       tabindex="-1">上一页</a>
                                </li>
                            </c:if>
                            <li class="page-item"><a class="page-link rounded-pill">总共${pb.totalPage}页，当前第${pb.currentPage}页</a>
                            </li>
                            <c:if test="${pb.currentPage < pb.totalPage}">
                                <li class="page-item">
                                    <a class="page-link rounded-pill" href="/SuperMarket_war_exploded/PageSaleServlet?currentPage=${pb.currentPage + 1}&rows=5">下一页</a>
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
<div class="modal fade" id="addSale" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">添加销售记录</h5>
                <button type="button" class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="addSaleForm" onsubmit="return false">
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">商品编码</label>
                        <div class="col-sm-10">
                            <input type="text" name="id" id="id" class="form-control" placeholder="商品编码">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">销售日期</label>
                        <div class="col-sm-10">
                            <input type="text" name="tradetime" id="tradetime" class="form-control" placeholder="销售日期">
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

<script src="./lib/js/jquery.js"></script>
<script src="./lib/js/bootstrap.js"></script>
<script src="./lib/js/axios-0.18.0.js"></script>
<script>
    $(document).ready(function () {
        $("#addButton").click(function () {
            let error = "";
            let addForm = $("#addSaleForm");
            if (addForm.find("input[name=id]").val() == "") {
                error += "商品编码<br>";
            }
            if (addForm.find("input[name=tradetime]").val() == "") {
                error += "销售日期<br>";
            }
            if (error != "") {
                addForm.find("div[class~=alert]").html(error);
                addForm.find("div[class~=alert]").removeClass("d-none");
            } else {
                addForm.find("div[class~=alert]").addClass("d-none");
                addForm.submit();
                // 将表单数据转为json
                var addSaleForm = {
                    id:"",
                    tradetime:"",
                };
                // 获取表单数据
                let id = document.getElementById("id").value;
                // 设置数据
                addSaleForm.id = id;

                // 获取表单数据
                let tradetime = document.getElementById("tradetime").value;
                // 设置数据
                addSaleForm.tradetime = tradetime;

                //2. 发送ajax请求
                axios({
                    method:"post",
                    url:"http://localhost:8080/SuperMarket_war_exploded/AddSaleServlet",
                    data:addSaleForm
                }).then(function (resp) {
                    // 判断响应数据是否为 success
                    if(resp.data == "success"){
                        location.href = "http://localhost:8080/SuperMarket_war_exploded/PageSaleServlet";
                    }
                })
            }
        });
    });
</script>
</body>
</html>

