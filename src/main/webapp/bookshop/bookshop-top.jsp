<%--
  Created by IntelliJ IDEA.
  User: ZelongChen
  Date: 2021/11/11
  Time: 15:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="UTF-8">
    <title>BOOKSHOP官方网站</title>
    <link rel="stylesheet" href="../font/iconfont.css">
    <link rel="stylesheet" href="../font/font/iconfont.css">
    <link rel="stylesheet" href="../css/base.css">
    <link rel="stylesheet" href="../css/reset.css">
    <!-- PC端 -->
    <link rel="stylesheet" href="../css/top.css">
    <!-- 平板端 -->
    <link rel="stylesheet" href="../css/index-pad.css"
          media="screen and (max-width:1199px)">
    <!--手机端 -->
    <link rel="stylesheet" href="../css/index-phone.css"
          media="screen and (max-width:600px)">
    <link rel="stylesheet" href="../css/productDeails-content.css">

    <style>
        .vp-head-site > .login > a {
            color: #000;
        }
    </style>
    <style>
        .personage {
            width: 100px;
            height: 100%;
            font-size: 12px;
            color: #ccc;
            text-align: right;
            position: relative;
        }

        .personal {
            position: absolute;
            top: 25px;
            right: -45px;
            width: 200px;
            height: auto;
            background: rgba(255, 255, 255, .97);
            padding: 10px 0 17px;
            box-shadow: 0 0 5px rgba(3, 3, 3, .15);
            display: none;
        }

        .personal li a {
            list-style-type: none;
            text-align: center;
            display: block;
            margin: 0 23px;
            font-size: 14px;
            color: #333;
            font-weight: 400;
            line-height: 50px;
            border-bottom: 1px solid #f2f2f2;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .personage span {
            display: inline-block;
            height: 30px;
        }

        .personage:hover .personal {
            display: block;
        }

        .personal li:hover, .personal li:hover a {
            background: #f2f2f2;
            color: #456fff;
        }


    </style>

</head>
<body>
<!-- 头部开始 -->
<header>
    <div class="vp-head">
        <div class="vp-head-topbar-pc">
            <div>
                <ul class="vp-head-topbar-navs clearfix">
                    <li><a href="#" class="vp-vivo-head-brand">品牌</a></li>
                    <li><a href="#" class="vp-vivo-head-funtouchos">实体店</a></li>
                    <li><a href="#" class="vp-vivo-head-store">社群交流</a></li>
                    <li><a href="#" class="vp-vivo-head-cooperation">公益服务</a></li>
                </ul>
                <div class="vp-head-top-user">
                    <%-- 根据跳转至购物车页面 --%>
                    <a href="shoppingCartServlet?action=getUserShoppingCar&uname=${user.uname}" class="vp-user-shopcart">购物车</a>
                    <c:if test="${ empty user}">
                        <div class="vp-user-login-box">
                            <a href="bookshop/login.jsp" class="vp-user-login">登录</a>
                            <i>|</i>
                            <a href="bookshop/register.jsp" class="vp-user-register">注册</a>
                        </div>
                    </c:if>
                    <c:if test="${!empty user}">
                        <div class="vp-user-login-box">
                            <div class="personage">
                                <span>个人中心</span>
                                <ul class="personal">
                                    <li>
                                        <a href="javascript:void(0);">尊敬的${user.uname}</a>
                                    </li>
                                    <li>
                                        <a href="shoppingCartServlet?action=getUserShoppingCar&uname=${user.uname}" >我的订单</a>
                                    </li>
                                    <li>
                                        <a href="#">我的商城</a>
                                    </li>
                                    <li>
                                        <a href="bookshop/personalCenter.jsp">帐号中心</a>
                                    </li>
                                    <li>
                                        <a href="userServlet?action=logout" id="registerClose">退出登录</a>
                                    </li>
                                </ul>
                            </div>

                        </div>
                    </c:if>

                </div>
            </div>
        </div>
        <div class="vp-head-mainbar-pc">
            <div class="vp-head-site">
                <p class="login">
                    <a href="goodsServlet?action=updateGood" style="color: white;font-size: 24px" > BOOKSHOP </a>
                </p>
                <ul class="header-middle clearfix nav1"> <!-- clearfix 清除浮动 -->
                    <li class="header-middle-li-p"><a href="goodsServlet?action=goodsList">商城</a></li>
                    <li class="header-middle-li-p"><a href="goodsServlet?action=updateGood">服务</a></li>
                    <!-- 背景遮罩层 -->
                    <div class="vp-head-products-mask" style=""></div>
                </ul>
                <!-- 媒体查询页面大于等于1199px -->
                <ul class="header-middle clearfix nav2"> <!-- clearfix 清除浮动 -->
                    <li class="header-middle-li-p"><a href="goodsServlet?action=goodsList">商城</a></li>
                    <li class="header-middle-li-p"><a href="goodsServlet?action=updateGood">服务</a></li>
                    <!-- 背景遮罩层 -->
                    <div class="vp-head-products-mask" style=""></div>
                </ul>
                <div class="header-search-wrap">
                    <div>
                        <div class="header-search-box">
                            <div>
                                <font color="white"> hhh </font>
                            </div>
                            <div class="header-search-btns">
                                <span class="iconfont icon-magnifier" style="right: 50px; opacity: 1;"></span>
                                <span class="iconfont icon-chacha" style="transform: scale(1) rotate(90deg);"></span>
                            </div>
                            <div>
                                <font color="white"> hhh </font>
                            </div>
                            <form action="" method="post">
                                <div class="header-search-input"><input type="text" placeholder=""></div>
                                <div class="header-search-content">
                                    <div class="header-search-recommend">
                                        <dl>
                                            <dt>全局搜索</dt>
                                            <dd><a href="#">文学小说</a></dd>
                                            <dd><a href="#"></a></dd>
                                            <dd><a href="#">教育考试</a></dd>
                                            <dd><a href="#">人文社科</a></dd>
                                            <dd><a href="#">经管励志</a></dd>
                                            <dd><a href="#">科技IT</a></dd>
                                        </dl>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="header-search">
                    <a href="javascript:;" class="iconfont icon-magnifier"></a>
                </div>
            </div>
        </div>
        <div class="header-phone">
            <a href="#" class="iconfont icon-caidan"></a>
            <h1><a href="" class="iconfont icon-vivo"></a></h1>
            <a href="#" class="iconfont icon-baobao"></a>
        </div>
    </div>
</header>
<!-- 头部结束 -->
</body>
</html>

