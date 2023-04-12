<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>进货记录查询</title>
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
                <div class="input-group mr-auto w-75">
                    <form class="form-inline" action="/SuperMarket_war_exploded/PageRestockServlet" method="post">
                        <input type="text" name="name6"  class="form-control" placeholder="请输入商品">
                        <input type="text" name="name7"  class="form-control" placeholder="请输入供应商">

                        <button type="submit" class="btn btn-success ml-2">
                            <i class="bi-search"></i>查询
                        </button>
                    </form>
                </div>

            </div>
            <div class="row mt-3">
                <div class="col-12">
                    <table class="table table-hover table-bordered table-striped text-center">
                        <thead class="thead-dark">
                        <tr>
                            <th scope="col">序号</th>
                            <th scope="col">商品名</th>
                            <th scope="col">供应商</th>
                            <th scope="col">进货日期</th>
                            <th scope="col">进价</th>
                            <th scope="col">数量</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach items="${pb.list}" var="restock" varStatus="status">
                            <tr>
                                <td>${status.count}</td>
                                <td>${restock.goodsname}</td>
                                <td>${restock.supplierid}</td>
                                <td>${restock.tradedate}</td>
                                <td>${restock.price}</td>
                                <td class="text-truncate" style="max-width: 150px;">${restock.stock}</td>

                                <td style="display:none">${restock.id}</td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                    <nav>
                        <ul class="pagination justify-content-between">
                            <c:if test="${pb.currentPage > 1}">
                                <li class="page-item">
                                    <a class="page-link rounded-pill" href="/SuperMarket_war_exploded/PageRestockServlet?currentPage=${pb.currentPage - 1}&rows=5"
                                       tabindex="-1">上一页</a>
                                </li>
                            </c:if>
                            <li class="page-item"><a class="page-link rounded-pill">总共${pb.totalPage}页，当前第${pb.currentPage}页</a>
                            </li>
                            <c:if test="${pb.currentPage < pb.totalPage}">
                                <li class="page-item">
                                    <a class="page-link rounded-pill" href="/SuperMarket_war_exploded/PageRestockServlet?currentPage=${pb.currentPage + 1}&rows=5">下一页</a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="./lib/js/jquery.js"></script>
<script src="./lib/js/bootstrap.js"></script>
</body>
</html>

