<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>vivo智能手机官方网站-AI非凡摄影X27</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/VivoProject/font/iconfont.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/VivoProject/font/font/iconfont.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/VivoProject/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/VivoProject/css/reset.css">
    <!-- PC端 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/VivoProject/css/top.css">
    <!-- 平板端 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/VivoProject/css/index-pad.css"
          media="screen and (max-width:1199px)">
    <!--手机端 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/VivoProject/css/index-phone.css"
          media="screen and (max-width:600px)">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/VivoProject/css/productDeails-content.css">

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
                    <li><a href="#" class="vp-vivo-head-funtouchos">Funtouch OS</a></li>
                    <li><a href="#" class="vp-vivo-head-store">体验店</a></li>
                    <li><a href="#" class="vp-vivo-head-cooperation">政企业务</a></li>
                    <li><a href="#" class="vp-vivo-head-bbs">社区</a></li>
                </ul>
                <div class="vp-head-top-user">
                    <%-- 根据跳转至购物车页面 --%>
                    <a href="${pageContext.request.contextPath}/shoppingCartServlet?action=getUserShoppingCar&v_uid=${vivo_user.v_uid}" class="vp-user-shopcart">购物车</a>
                    <c:if test="${ empty vivo_user}">
                        <div class="vp-user-login-box">
                            <a href="${pageContext.request.contextPath}/VivoProject/log-n.jsp" class="vp-user-login">登录</a>
                            <i>|</i>
                            <a href="${pageContext.request.contextPath}/VivoProject/register.jsp" class="vp-user-register">注册</a>
                        </div>
                    </c:if>
                    <c:if test="${!empty vivo_user}" var="user">
                        <div class="vp-user-login-box">
                            <div class="personage">
                                <span>个人中心</span>
                                <ul class="personal">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/personalServlet?action=myOrder&v_uid=${vivo_user.v_uid}">我的订单</a>
                                    </li>
                                    <li>
                                        <a href="#">我的商城</a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/VivoProject/personalCenter.jsp">帐号中心</a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/registerServlet?action=registerClose" id="registerClose">退出登录</a>
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
                <h1 class="login">
                    <a href="GoodSeriesServlet?action=GoodSeriesAll" class="iconfont icon-vivo"></a>
                </h1>
                <ul class="header-middle clearfix nav1"> <!-- clearfix 清除浮动 -->
                    <li class="header-middle-li-p"><a href="ShoppingServlet?action=getHostGoods">商城</a></li>
                    <li class="header-middle-li-p"><a href="#">服务</a></li>
                    <!-- 背景遮罩层 -->
                    <div class="vp-head-products-mask" style=""></div>
                </ul>
                <!-- 媒体查询页面大于等于1199px -->
                <ul class="header-middle clearfix nav2"> <!-- clearfix 清除浮动 -->
                    <li class="header-middle-li-p"><a href="ShoppingServlet?action=getHostGoods">商城</a></li>
                    <li class="header-middle-li-p"><a href="#">服务</a></li>
                    <!-- 背景遮罩层 -->
                    <div class="vp-head-products-mask" style=""></div>
                </ul>
                <div class="header-search-wrap">
                    <div>
                        <div class="header-search-box">
                            <div class="header-search-btns">
                                <span class="iconfont icon-magnifier" style="right: 50px; opacity: 1;"></span>
                                <span class="iconfont icon-chacha" style="transform: scale(1) rotate(90deg);"></span>
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
