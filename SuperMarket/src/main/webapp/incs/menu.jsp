<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>

<link href="../lib/css/bootstrap.css" rel="stylesheet"/>
<link href="../lib/font/bootstrap-icons.css" rel="stylesheet">

<div class="card">
    <div class="card-header bg-primary text-white">
        功能菜单
    </div>

    <div class="list-group list-group-flush">
        <a href="/SuperMarket_war_exploded/PageSupplierServlet" target="_parent" class="list-group-item list-group-item-action">供应商管理</a>
        <a href="/SuperMarket_war_exploded/PageCategoryServlet" target="_parent" class="list-group-item list-group-item-action">分类管理</a>
        <a href="/SuperMarket_war_exploded/PageGoodsServlet" target="_parent" class="list-group-item list-group-item-action">商品管理</a>
        <a href="/SuperMarket_war_exploded/PageRestockServlet" target="_parent" class="list-group-item list-group-item-action">进货查询</a>
        <a href="/SuperMarket_war_exploded/PageSaleServlet" target="_parent" class="list-group-item list-group-item-action">销售管理</a>
    </div>
</div>