<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>商品管理</title>
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
                    <form class="form-inline" action="/SuperMarket_war_exploded/PageGoodsServlet" method="post">
                        <input type="text" name="name6"  class="form-control" placeholder="请输入商品名称">
                        <button type="submit" class="btn btn-success ml-2">
                            <i class="bi-search"></i>查询
                        </button>
                    </form>
                </div>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addGoods"><i
                        class="bi-plus"></i>添加商品</button>
            </div>
            <div class="row mt-3">
                <div class="col-12">
                    <table class="table table-hover table-bordered table-striped text-center">
                        <thead class="thead-dark">
                        <tr>
                            <th scope="col">序号</th>
                            <th scope="col">商品名称</th>
                            <th scope="col">规格</th>
                            <th scope="col">条形码</th>
                            <th scope="col">售价</th>
                            <th scope="col">库存</th>
                            <th scope="col">操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach items="${pb.list}" var="goods" varStatus="status">
                            <tr>
                                <td>${status.count}</td>
                                <td>${goods.name}</td>
                                <td>${goods.specs}</td>
                                <td>${goods.sn}</td>
                                <td>${goods.price}</td>
                                <td>${goods.stock}</td>
                                <td>
                                    <div class="btn-group">
                                        <a class="btn btn-sm btn-primary text-white" data-toggle="modal" data-target="#addRestock">
                                            <i class="bi-gear"></i>进货</a>
                                        <a class="btn btn-sm btn-warning text-white" data-toggle="modal"
                                           data-target="#editGoods" onclick="showUpdate(this)">
                                            <i class="bi-gear"></i>编辑</a>
                                        <a class="btn btn-sm btn-danger" href="/SuperMarket_war_exploded/DeleteGoodsServlet?id=${goods.id}">
                                            <i class="bi-trash"></i>删除</a>
                                    </div>
                                </td>
                                <td style="display:none">${goods.id}</td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                    <nav>
                        <ul class="pagination justify-content-between">
                            <c:if test="${pb.currentPage > 1}">
                                <li class="page-item">
                                    <a class="page-link rounded-pill" href="/SuperMarket_war_exploded/PageGoodsServlet?currentPage=${pb.currentPage - 1}&rows=5"
                                       tabindex="-1">上一页</a>
                                </li>
                            </c:if>
                            <li class="page-item"><a class="page-link rounded-pill">总共${pb.totalPage}页，当前第${pb.currentPage}页</a>
                            </li>
                            <c:if test="${pb.currentPage < pb.totalPage}">
                                <li class="page-item">
                                    <a class="page-link rounded-pill" href="/SuperMarket_war_exploded/PageGoodsServlet?currentPage=${pb.currentPage + 1}&rows=5">下一页</a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 添加商品Modal -->
<div class="modal fade" id="addGoods" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">添加商品</h5>
                <button type="button" class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="addGoodsForm" onsubmit="return false">
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">商品</label>
                        <div class="col-sm-10">
                            <input type="text" name="name" id="name" class="form-control" placeholder="商品名">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">规格</label>
                        <div class="col-sm-10">
                            <input type="text" name="specs" id="specs" class="form-control" placeholder="规格">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">条形码</label>
                        <div class="col-sm-10">
                            <input type="text" name="sn" id="sn" class="form-control" placeholder="条形码">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">售价</label>
                        <div class="col-sm-10">
                            <input type="text" name="price" id="price" class="form-control" placeholder="售价">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">分类</label>
                        <div class="col-sm-10">
                            <input type="text" name="stock" id="stock" class="form-control" placeholder="分类">
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
<!-- 编辑商品Modal -->
<div class="modal fade" id="editGoods" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">编辑商品</h5>
                <button type="button" class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="editGoodsForm" onsubmit="return false">
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">商品</label>
                        <div class="col-sm-10">
                            <input type="hidden" name="id2"  id="id2">

                            <input type="text" name="name2" id="name2" class="form-control" placeholder="商品名">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">规格</label>
                        <div class="col-sm-10">
                            <input type="text" name="specs2" id="specs2" class="form-control" placeholder="规格">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">条形码</label>
                        <div class="col-sm-10">
                            <input type="text" name="sn2" id="sn2" class="form-control" placeholder="条形码">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">售价</label>
                        <div class="col-sm-10">
                            <input type="text" name="price2" id="price2" class="form-control" placeholder="售价">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">分类</label>
                        <div class="col-sm-10">
                            <input type="text" name="stock2" id="stock2" class="form-control" placeholder="分类">
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
<%--进货modul--%>
<div class="modal fade" id="addRestock" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">进货</h5>
                <button type="button" class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="addRestockForm" onsubmit="return false">
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">商品</label>
                        <div class="col-sm-10">
                            <input type="hidden" name="id3"  id="id3">

                            <input type="text" name="name3" id="name3" class="form-control" placeholder="商品名">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">单价</label>
                        <div class="col-sm-10">
                            <input type="text" name="price3" id="price3" class="form-control" placeholder="进货价">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">数量</label>
                        <div class="col-sm-10">
                            <input type="text" name="stock3" id="stock3" class="form-control" placeholder="进货数量">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">进货日期</label>
                        <div class="col-sm-10">
                            <input type="text" name="tradedate" id="tradedate" class="form-control" placeholder="进货日期">
                        </div>
                    </div>
                    <div class="text-danger d-none alert">
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                <button id="addRestockButton" type="button" class="btn btn-primary">提交</button>
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
        var specs = $td.eq(2).text();
        var sn = $td.eq(3).text();
        var price = $td.eq(4).text();
        var stock = $td.eq(5).text();
        var id = $td.eq(7).text();

        $("#name2").val(name);
        $("#specs2").val(specs);
        $("#sn2").val(sn);
        $("#price2").val(price);
        $("#stock2").val(stock);
        $("#id2").val(id);
    }

    $(document).ready(function () {
        $("#addButton").click(function () {
            let error = "";
            let addForm = $("#addGoodsForm");
            if (addForm.find("input[name=name]").val() == "") {
                error += "请输入商品名<br>";
            }
            if (addForm.find("input[name=specs]").val() == "") {
                error += "请输入商品规格<br>";
            }
            if (addForm.find("input[name=sn]").val() == "") {
                error += "请输入商品条形码<br>";
            }
            if (addForm.find("input[name=price]").val() == "") {
                error += "请输入商品价格<br>";
            }
            if (addForm.find("input[name=stock]").val() == "") {
                error += "请选择分类<br>";
            }
            if (error != "") {
                addForm.find("div[class~=alert]").html(error);
                addForm.find("div[class~=alert]").removeClass("d-none");
            } else {
                addForm.find("div[class~=alert]").addClass("d-none");
                addForm.submit();
                // 将表单数据转为json
                var addGoodsForm = {
                    name:"",
                    specs:"",
                    sn:"",
                    price:"",
                    stock:"",
                };
                // 获取表单数据
                let name = document.getElementById("name").value;
                // 设置数据
                addGoodsForm.name = name;

                // 获取表单数据
                let specs = document.getElementById("specs").value;
                // 设置数据
                addGoodsForm.specs = specs;

                // 获取表单数据
                let sn = document.getElementById("sn").value;
                // 设置数据
                addGoodsForm.sn = sn;

                // 获取表单数据
                let price = document.getElementById("price").value;
                // 设置数据
                addGoodsForm.price = price;

                // 获取表单数据
                let stock = document.getElementById("stock").value;
                // 设置数据
                addGoodsForm.stock = stock;

                //2. 发送ajax请求
                axios({
                    method:"post",
                    url:"http://localhost:8080/SuperMarket_war_exploded/AddGoodsServlet",
                    data:addGoodsForm
                }).then(function (resp) {
                    // 判断响应数据是否为 success
                    if(resp.data == "success"){
                        location.href = "http://localhost:8080/SuperMarket_war_exploded/PageGoodsServlet";
                    }
                })
            }
        });
        $("a[goods-id]").click(function () {
            $.getJSON("/goods", {id: $(this).attr("goods-id")}, function (result) {
                $("#editGoodsForm").find("input[name=name]").val(result.data.name);
                $("#editGoodsForm").find("input[name=specs]").val(result.data.contacts);
                $("#editGoodsForm").find("input[name=sn]").val(result.data.tel);
                $("#editGoodsForm").find("input[name=price]").val(result.data.id);
                $("#editGoodsForm").find("textarea[name=stock]").val(result.data.info);
            });
        });
        $("#editButton").click(function () {
            let error = "";
            let editForm = $("#editGoodsForm");
            if (editForm.find("input[name=name2]").val() == "") {
                error += "请输入商品名<br>";
            }
            if (editForm.find("input[name=specs2]").val() == "") {
                error += "请输入商品规格<br>";
            }
            if (editForm.find("input[name=sn2]").val() == "") {
                error += "请输入商品条形码<br>";
            }
            if (editForm.find("input[name=price2]").val() == "") {
                error += "请输入商品价格<br>";
            }
            if (editForm.find("input[name=stock2]").val() == "") {
                error += "请选择分类<br>";
            }
            if (error != "") {
                editForm.find("div[class~=alert]").html(error);
                editForm.find("div[class~=alert]").removeClass("d-none");
            } else {
                editForm.find("div[class~=alert]").addClass("d-none");
                editForm.submit();
                var editGoodsForm = {
                    id:"",
                    name:"",
                    specs:"",
                    sn:"",
                    price:"",
                    stock:"",
                };
                // 获取隐藏域数据
                let id = document.getElementById("id2").value;
                // 设置数据
                editGoodsForm.id = id;

                // 获取表单数据
                let name = document.getElementById("name2").value;
                // 设置数据
                editGoodsForm.name = name;

                // 获取表单数据
                let specs = document.getElementById("specs2").value;
                // 设置数据
                editGoodsForm.specs = specs;

                // 获取表单数据
                let sn = document.getElementById("sn2").value;
                // 设置数据
                editGoodsForm.sn = sn;

                // 获取表单数据
                let price = document.getElementById("price2").value;
                // 设置数据
                editGoodsForm.price = price;

                // 获取表单数据
                let stock = document.getElementById("stock2").value;
                // 设置数据
                editGoodsForm.stock = stock;

                //2. 发送ajax请求
                axios({
                    method:"post",
                    url:"http://localhost:8080/SuperMarket_war_exploded/UpdateGoodsServlet",
                    data:editGoodsForm
                }).then(function (resp) {
                    // 判断响应数据是否为 success
                    if(resp.data == "success"){
                        location.href = "http://localhost:8080/SuperMarket_war_exploded/PageGoodsServlet";
                    }
                })
            }
        })

        $("#addRestockButton").click(function () {
            let error = "";
            let addRForm = $("#addRestockForm");
            if (addRForm.find("input[name=name3]").val() == "") {
                error += "请输入商品名<br>";
            }
            if (addRForm.find("input[name=price3]").val() == "") {
                error += "请输入商品价格<br>";
            }
            if (addRForm.find("input[name=stock3]").val() == "") {
                error += "请输入数量<br>";
            }
            if (addRForm.find("input[name=tradetime]").val() == "") {
                error += "请输入进货日期<br>";
            }
            if (error != "") {
                addRForm.find("div[class~=alert]").html(error);
                addRForm.find("div[class~=alert]").removeClass("d-none");
            } else {
                addRForm.find("div[class~=alert]").addClass("d-none");
                addRForm.submit();
                // 将表单数据转为json
                var addRestockForm = {
                    goodsname:"",
                    price:"",
                    stock:"",
                    tradetime:"",
                };
                // 获取表单数据
                let goodsname = document.getElementById("name3").value;
                // 设置数据
                addRestockForm.goodsname = goodsname;

                // 获取表单数据
                let price = document.getElementById("price3").value;
                // 设置数据
                addRestockForm.price = price;

                // 获取表单数据
                let stock = document.getElementById("stock3").value;
                // 设置数据
                addRestockForm.stock = stock;

                // 获取表单数据
                let tradedate = document.getElementById("tradedate").value;
                // 设置数据
                addRestockForm.tradedate = tradedate;

                //2. 发送ajax请求
                axios({
                    method:"post",
                    url:"http://localhost:8080/SuperMarket_war_exploded/AddRestockServlet",
                    data:addRestockForm
                }).then(function (resp) {
                    // 判断响应数据是否为 success
                    if(resp.data == "success"){
                        location.href = "http://localhost:8080/SuperMarket_war_exploded/PageGoodsServlet";
                    }
                })
            }
        });


    });
</script>
</body>
</html>

