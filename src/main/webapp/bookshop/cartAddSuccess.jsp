<%--
  Created by IntelliJ IDEA.
  User: ZelongChen
  Date: 2021/11/11
  Time: 23:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 获取全局路径 --%>
<!DOCTYPE html>
<head>
    <base href="">
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="../js/jquery-1.10.1.min.js"></script>
    <script src="../js/ceiling.js"></script>
    <script src="../js/pc-menu-nav.js"></script>
    <script src="../js/tools.js"></script>
    <script src="../js/animation2.js"></script>
    <link rel="stylesheet" href="../css/base.css">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/top.css">
    <link rel="stylesheet" href="../font/font/iconfont.css">
    <link rel="stylesheet" href="../font/iconfont.css">
    <link rel="stylesheet" href="../css/product-footer.css">
    <link rel="stylesheet" type="text/css" href="../css/font_918068_xgekrb9yo88/iconfont.css">
    <link rel="stylesheet" href="../css/productDeails-content.css">
    <link rel="stylesheet" href="../css/footer.css">
    <link rel="stylesheet" href="../css/carAddSuccess.css">

</head>
<body>
<!-- 头部开始 -->
<%@include file="bookshop-top.jsp"%>
<!-- 头部结束 -->


<div class="content">
    <div class="wrapper">
        <div class="add-success-container">
            <div class="add-success-title">
                <img src="../images/gou_93eee52.png" alt="">
                <span>商品已经成功添加到购物车！</span>
            </div>
            <div class="add-success-content clearfix">
                <div class="product-info">
                    <div class="product-img">
                        <img src="../${usc.imgSrc}" alt="">
                    </div>
                    <div class="product-des">
                        <div class="product-name">${usc.goodName}</div>
                        <div class="product-tag">作者：${usc.producer}</div>
                        <div class="product-tag">数量：${usc.goodNum}</div>
                    </div>
                </div>
                <div class="product-action">
                    <a target="_blank" href="" id="view-detail">
                        <button type="button" class="btn--lg btn-next first">
                            <a href="goodsServlet?action=productDetails&goodNo=${usc.goodNo}" target="_self">
                                <i class="btn-inner" >查看商品详情</i></a>
                        </button>
                    </a>
                    <a target="_blank" href="" id="to-cart">
                        <button class="btn--lg btn-confirm now-buy" type="button" title="去购物车结算">
                            <a href="shoppingServlet?action=shoppingCart"><i class="btn-inner">去购物车结算</i></a>
                        </button>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- 底部开始 -->
<%@include file="bookshop-foot.jsp"%>
<style>
    .footer{
        background: #fff;
    }
</style>
<!-- 底部结束 -->

<!-- 返回顶部开始 -->

<!-- 返回顶部结束 -->
<script src="../js/hiddenScllTop.js" type="text/javascript"></script>
<script src="../js/scroll.js" type="text/javascript"></script>
<script src="../js/cartAddSuccess.js"></script>
</body>
</html>
