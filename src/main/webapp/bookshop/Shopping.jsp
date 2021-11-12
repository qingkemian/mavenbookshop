<%--
  Created by IntelliJ IDEA.
  User: ZelongChen
  Date: 2021/11/11
  Time: 18:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="UTF-8">
    <title>BOOKSHOP官方网站</title>
    <meta name="keywords" content='BOOKSHOP官方网站'/>
    <meta name="description" content='BOOKSHOP官方网站'/>
    <link rel="icon" href="images/favicon_7c51b3b.ico">
    <link rel="stylesheet" href="../css/shangcheng.css" type="text/css">
    <link rel="stylesheet" href="../css/iconfont.css" type="text/css">
    <link rel="stylesheet" href="../css/list-content.css" type="text/css">
    <link rel="stylesheet" href="../css/banner-img.css" type="text/css">
    <link rel="stylesheet" href="../css/core-content.css" type="text/css">
    <link rel="stylesheet" href="../font/font/iconfont.css">
    <link rel="stylesheet" type="text/css"
          href="../css/font_909460_q5vpdq6r77q/iconfont.css">
    <link rel="stylesheet" type="text/css"
          href="../css/font_909460_qqf8ef5pfyf/iconfont.css">
    <link rel="stylesheet" type="text/css"
          href="../css/font_918068_xgekrb9yo88/iconfont.css">
    <link rel="stylesheet" href="../css/vivo-footer.css">
    <link rel="stylesheet" href="../css/index-footer.css">
    <!--设置列表项的样式-->
    <style type="text/css">
        .box-a {
            width: 394px;
            height: 288px;
        }

        .box-b {
            width: 293px;
            height: 215px;
        }

        .img-item, .img-item2, .img-item3, .img-item4, .img-item5, .img-item6, .img-item7, .img-item8 {
            position: absolute !important;
            left: 20%;
            top: 0;
            transform: scale(1);
            transition: all .5s ease-in-out;
        }

        .selected {
            opacity: 1 !important;
            transition: all .5s ease-in-out;
        }
    </style>
    <style>
        .deldel {
            display: inline-block;
            margin-left: 6px;
            opacity: 0;
            transition: all .5s ease-in-out;
            cursor: pointer;
        }

        .Select-hidden {
            opacity: 1;
            visibility: inherit;
            transition: all .5s ease-in-out;
        }

        .v_h_search .search-top {
            position: relative;
            width: 100%;
            height: 100%;
        }

        .v_h_search {
            position: absolute;
            width: 69%;
            height: 44px;
            top: 0;
            left: 237px;
            z-index: 999;
            /* display: none; */
        }

        .search-top input {
            font-family: 'Microsoft YaHei', 'PingFang SC';
            width: 750px;
            height: 30px;
            margin-top: 7px;
            background: 0 0;
            padding-left: 43px;
            color: #fff;
            font-size: 14px;
        }

        input {
            outline: 0;
            border: 0;
        }

        .v_h_search .search-content {
            position: absolute;
            width: 90%;
            height: auto;
            min-height: 280px;
            background: #fff;
            top: 44px;
        }

        .search-content {
            font-family: 'Microsoft YaHei', 'PingFang SC';
        }

        .search-content dl {
            position: relative;
            width: 100%;
            height: auto;
            margin-bottom: 24px;
        }

        .search-content dl dt {
            width: auto;
            height: auto;
            padding-left: 43px;
            font-size: 12px;
            color: #888;
            padding-top: 28px;
            margin-bottom: 11px;
        }

        #vivo-head-wrap a, #vivo-contain a, #vivo-foot-path a, #vivo-foot-wrap a {
            text-decoration: none;
            cursor: pointer;
            outline: 0 none;
            -webkit-tap-highlight-color: transparent;
        }

        .search-content dl dd a {
            display: block;
            width: auto;
            height: 100%;
            line-height: 40px;
            padding-left: 67px;
            color: #333;
            -webkit-transition: all .4s ease;
            -moz-transition: all .4s ease;
            -o-transition: all .4s ease;
            transition: all .4s ease;
        }

        .search-content dl dd a:hover {
            color: #0000d8;
            background-color: #e5e5e5;
        }

        .icon-cha2:before {
            margin-left: 20px;
            color: white;
        }
        @media screen and (max-width:1088px) {
            #banner {
                width: 1200px;
            }
        }
    </style>
    <link rel="stylesheet" href="../font/iconfont.css">
    <%-- 正品 --%>
    <link rel="stylesheet" href="../css/product-footer.css">

</head>
<body>
<!-- 头部开始 -->
<%@include file="bookshop-top.jsp" %>
<!-- 头部结束 -->

<!--列表商品开始-->
<div id="vivo-contain" class="J_replace_content cl">
    <!--轮播图-->
    <div id="banner">
        <div class="img-wrap" id="img-wrap">
            <a href="javascript:;"
               style="background-image: url(../images/21.jpg); "
               class="item"></a>
            <a href="javascript:;"
               style="background-image: url(../images/22.jpg);"
               class="item"></a>
            <a href="javascript:;"
               style="background-image: url(../images/23.jpg);"
               class="item"></a>
            <a href="javascript:;"
               style="background-image: url(../images/24.jpg);"
               class="item"></a>
            <a href="javascript:;"
               style="background-image: url(../images/21.jpg);"
               class="item"></a>
        </div>
        <div class="btn-list" id='btn-list'>
            <div class="btn active"></div>
            <div class="btn"></div>
            <div class="btn"></div>
            <div class="btn"></div>
            <div class="btn"></div>
        </div>
    </div>
    <!--二级导航栏-->
    <div class="wrapper">
        <ul class="category">
            <li class="list-wrap">
                <a class="category-name" href="javascript:;">小说<span class="arrow"></span></a>
                <div class="category-box">
                    <div class="category-detail">
                        <a href="javascript:;" class="category-all">
                            全部小说
                            <span class="arrow"></span>
                        </a>
                        <p>推荐</p>
                        <ul class="category-sub has-border">
                            <li><a href="javascript:;"
                                   style="display: block; background-image: url(../images/123456.jpg); color: white">面纱</a>
                            </li>
                            <li><a href="javascript:;"
                                   style="display: block; background-image: url(../images/123456.jpg); color: white">杀死一只知更鸟</a>
                            </li>
                            <li><a href="javascript:;"
                                   style="display: block; background-image: url(../images/123456.jpg); color: white">老人与海</a>
                            </li>
                            <li><a href="javascript:;"
                                   style="display: block; background-image: url(../images/123456.jpg); color: white">复活</a>
                            </li>
                        </ul>
                        <ul class="category-product">
                            <a href="javascript:;">
                                <img src="../images/m1.jpg">
                                <span>面纱</span>
                            </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m2.jpg">
                                    <span>杀死一只知更鸟</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m3.jpg"/>
                                    <span>老人与海</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m4.jpg"/>
                                    <span>复活</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m5.jpg"/>
                                    <span>月亮与六便士</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m6.jpg"/>
                                    <span>高老头</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m7.jpg"/>
                                    <span>我是猫</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m8.jpg"/>
                                    <span>傲慢与偏见</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m9.jpg"/>
                                    <span>大卫科菲波特</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m10.jpg"/>
                                    <span>了不起的盖茨比</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m11.jpg"/>
                                    <span>战争与和平</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m12.jpg"/>
                                    <span>巴黎圣母院子</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </li>
            <li class="list-wrap">
                <a class="category-name" href="javascript:;">小说<span class="arrow"></span></a>
                <div class="category-box">
                    <div class="category-detail">
                        <a href="javascript:;" class="category-all">
                            全部小说
                            <span class="arrow"></span>
                        </a>
                        <p>推荐</p>
                        <ul class="category-sub has-border">
                            <li><a href="javascript:;"
                                   style="display: block; background-image: url(../images/123456.jpg); color: white">面纱</a>
                            </li>
                            <li><a href="javascript:;"
                                   style="display: block; background-image: url(../images/123456.jpg); color: white">杀死一只知更鸟</a>
                            </li>
                            <li><a href="javascript:;"
                                   style="display: block; background-image: url(../images/123456.jpg); color: white">老人与海</a>
                            </li>
                            <li><a href="javascript:;"
                                   style="display: block; background-image: url(../images/123456.jpg); color: white">复活</a>
                            </li>
                        </ul>
                        <ul class="category-product">
                            <a href="javascript:;">
                                <img src="../images/m1.jpg">
                                <span>面纱</span>
                            </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m2.jpg">
                                    <span>杀死一只知更鸟</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m3.jpg"/>
                                    <span>老人与海</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m4.jpg"/>
                                    <span>复活</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m5.jpg"/>
                                    <span>月亮与六便士</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m6.jpg"/>
                                    <span>高老头</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m7.jpg"/>
                                    <span>我是猫</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m8.jpg"/>
                                    <span>傲慢与偏见</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m9.jpg"/>
                                    <span>大卫科菲波特</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m10.jpg"/>
                                    <span>了不起的盖茨比</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m11.jpg"/>
                                    <span>战争与和平</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m12.jpg"/>
                                    <span>巴黎圣母院子</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </li>
            <li class="list-wrap">
                <a class="category-name" href="javascript:;">小说<span class="arrow"></span></a>
                <div class="category-box">
                    <div class="category-detail">
                        <a href="javascript:;" class="category-all">
                            全部小说
                            <span class="arrow"></span>
                        </a>
                        <p>推荐</p>
                        <ul class="category-sub has-border">
                            <li><a href="javascript:;"
                                   style="display: block; background-image: url(../images/123456.jpg); color: white">面纱</a>
                            </li>
                            <li><a href="javascript:;"
                                   style="display: block; background-image: url(../images/123456.jpg); color: white">杀死一只知更鸟</a>
                            </li>
                            <li><a href="javascript:;"
                                   style="display: block; background-image: url(../images/123456.jpg); color: white">老人与海</a>
                            </li>
                            <li><a href="javascript:;"
                                   style="display: block; background-image: url(../images/123456.jpg); color: white">复活</a>
                            </li>
                        </ul>
                        <ul class="category-product">
                            <a href="javascript:;">
                                <img src="../images/m1.jpg">
                                <span>面纱</span>
                            </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m2.jpg">
                                    <span>杀死一只知更鸟</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m3.jpg"/>
                                    <span>老人与海</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m4.jpg"/>
                                    <span>复活</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m5.jpg"/>
                                    <span>月亮与六便士</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m6.jpg"/>
                                    <span>高老头</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m7.jpg"/>
                                    <span>我是猫</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m8.jpg"/>
                                    <span>傲慢与偏见</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m9.jpg"/>
                                    <span>大卫科菲波特</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m10.jpg"/>
                                    <span>了不起的盖茨比</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m11.jpg"/>
                                    <span>战争与和平</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m12.jpg"/>
                                    <span>巴黎圣母院子</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </li>
            <li class="list-wrap">
                <a class="category-name" href="javascript:;">小说<span class="arrow"></span></a>
                <div class="category-box">
                    <div class="category-detail">
                        <a href="javascript:;" class="category-all">
                            全部小说
                            <span class="arrow"></span>
                        </a>
                        <p>推荐</p>
                        <ul class="category-sub has-border">
                            <li><a href="javascript:;"
                                   style="display: block; background-image: url(../images/123456.jpg); color: white">面纱</a>
                            </li>
                            <li><a href="javascript:;"
                                   style="display: block; background-image: url(../images/123456.jpg); color: white">杀死一只知更鸟</a>
                            </li>
                            <li><a href="javascript:;"
                                   style="display: block; background-image: url(../images/123456.jpg); color: white">老人与海</a>
                            </li>
                            <li><a href="javascript:;"
                                   style="display: block; background-image: url(../images/123456.jpg); color: white">复活</a>
                            </li>
                        </ul>
                        <ul class="category-product">
                            <a href="javascript:;">
                                <img src="../images/m1.jpg">
                                <span>面纱</span>
                            </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m2.jpg">
                                    <span>杀死一只知更鸟</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m3.jpg"/>
                                    <span>老人与海</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m4.jpg"/>
                                    <span>复活</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m5.jpg"/>
                                    <span>月亮与六便士</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m6.jpg"/>
                                    <span>高老头</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m7.jpg"/>
                                    <span>我是猫</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m8.jpg"/>
                                    <span>傲慢与偏见</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m9.jpg"/>
                                    <span>大卫科菲波特</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m10.jpg"/>
                                    <span>了不起的盖茨比</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m11.jpg"/>
                                    <span>战争与和平</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m12.jpg"/>
                                    <span>巴黎圣母院子</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </li>
            <li class="list-wrap">
                <a class="category-name" href="javascript:;">小说<span class="arrow"></span></a>
                <div class="category-box">
                    <div class="category-detail">
                        <a href="javascript:;" class="category-all">
                            全部小说
                            <span class="arrow"></span>
                        </a>
                        <p>推荐</p>
                        <ul class="category-sub has-border">
                            <li><a href="javascript:;"
                                   style="display: block; background-image: url(../images/123456.jpg); color: white">面纱</a>
                            </li>
                            <li><a href="javascript:;"
                                   style="display: block; background-image: url(../images/123456.jpg); color: white">杀死一只知更鸟</a>
                            </li>
                            <li><a href="javascript:;"
                                   style="display: block; background-image: url(../images/123456.jpg); color: white">老人与海</a>
                            </li>
                            <li><a href="javascript:;"
                                   style="display: block; background-image: url(../images/123456.jpg); color: white">复活</a>
                            </li>
                        </ul>
                        <ul class="category-product">
                            <a href="javascript:;">
                                <img src="../images/m1.jpg">
                                <span>面纱</span>
                            </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m2.jpg">
                                    <span>杀死一只知更鸟</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m3.jpg"/>
                                    <span>老人与海</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m4.jpg"/>
                                    <span>复活</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m5.jpg"/>
                                    <span>月亮与六便士</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m6.jpg"/>
                                    <span>高老头</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m7.jpg"/>
                                    <span>我是猫</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m8.jpg"/>
                                    <span>傲慢与偏见</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m9.jpg"/>
                                    <span>大卫科菲波特</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m10.jpg"/>
                                    <span>了不起的盖茨比</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m11.jpg"/>
                                    <span>战争与和平</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m12.jpg"/>
                                    <span>巴黎圣母院子</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </li>
            <li class="list-wrap">
                <a class="category-name" href="javascript:;">小说<span class="arrow"></span></a>
                <div class="category-box">
                    <div class="category-detail">
                        <a href="javascript:;" class="category-all">
                            全部小说
                            <span class="arrow"></span>
                        </a>
                        <p>推荐</p>
                        <ul class="category-sub has-border">
                            <li><a href="javascript:;"
                                   style="display: block; background-image: url(../images/123456.jpg); color: white">面纱</a>
                            </li>
                            <li><a href="javascript:;"
                                   style="display: block; background-image: url(../images/123456.jpg); color: white">杀死一只知更鸟</a>
                            </li>
                            <li><a href="javascript:;"
                                   style="display: block; background-image: url(../images/123456.jpg); color: white">老人与海</a>
                            </li>
                            <li><a href="javascript:;"
                                   style="display: block; background-image: url(../images/123456.jpg); color: white">复活</a>
                            </li>
                        </ul>
                        <ul class="category-product">
                            <a href="javascript:;">
                                <img src="../images/m1.jpg">
                                <span>面纱</span>
                            </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m2.jpg">
                                    <span>杀死一只知更鸟</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m3.jpg"/>
                                    <span>老人与海</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m4.jpg"/>
                                    <span>复活</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m5.jpg"/>
                                    <span>月亮与六便士</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m6.jpg"/>
                                    <span>高老头</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m7.jpg"/>
                                    <span>我是猫</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m8.jpg"/>
                                    <span>傲慢与偏见</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m9.jpg"/>
                                    <span>大卫科菲波特</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m10.jpg"/>
                                    <span>了不起的盖茨比</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m11.jpg"/>
                                    <span>战争与和平</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m12.jpg"/>
                                    <span>巴黎圣母院子</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </li>
            <li class="list-wrap">
                <a class="category-name" href="javascript:;">小说<span class="arrow"></span></a>
                <div class="category-box">
                    <div class="category-detail">
                        <a href="javascript:;" class="category-all">
                            全部小说
                            <span class="arrow"></span>
                        </a>
                        <p>推荐</p>
                        <ul class="category-sub has-border">
                            <li><a href="javascript:;"
                                   style="display: block; background-image: url(../images/123456.jpg); color: white">面纱</a>
                            </li>
                            <li><a href="javascript:;"
                                   style="display: block; background-image: url(../images/123456.jpg); color: white">杀死一只知更鸟</a>
                            </li>
                            <li><a href="javascript:;"
                                   style="display: block; background-image: url(../images/123456.jpg); color: white">老人与海</a>
                            </li>
                            <li><a href="javascript:;"
                                   style="display: block; background-image: url(../images/123456.jpg); color: white">复活</a>
                            </li>
                        </ul>
                        <ul class="category-product">
                            <a href="javascript:;">
                                <img src="../images/m1.jpg">
                                <span>面纱</span>
                            </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m2.jpg">
                                    <span>杀死一只知更鸟</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m3.jpg"/>
                                    <span>老人与海</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m4.jpg"/>
                                    <span>复活</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m5.jpg"/>
                                    <span>月亮与六便士</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m6.jpg"/>
                                    <span>高老头</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m7.jpg"/>
                                    <span>我是猫</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m8.jpg"/>
                                    <span>傲慢与偏见</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m9.jpg"/>
                                    <span>大卫科菲波特</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m10.jpg"/>
                                    <span>了不起的盖茨比</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m11.jpg"/>
                                    <span>战争与和平</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../images/m12.jpg"/>
                                    <span>巴黎圣母院子</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </li>
        </ul>
    </div>
    <!--商品核心-->
    <div class="wrapper">
        <ul class="floor-list">
            <li class="floor fp fp4">
                <%-- 待定 --%>
                <ul class="box-list">
                    <li class="box">
                        <a target="_blank" href="javascript:;">
                            <img src="../images/b1.jpg"
                                 style="display: inline;">
                        </a>
                    </li>
                    <li class="box">
                        <a target="_blank" href="javascript:;">
                            <img src="../images/b1.jpg"
                                 style="display: inline;">
                        </a>
                    </li>
                    <li class="box">
                        <a target="_blank" href="javascript:;">
                            <img src="../images/b1.jpg"
                                 style="display: inline;">
                        </a>
                    </li>
                    <li class="box">
                        <a target="_blank" href="javascript:;">
                            <img src="../images/b1.jpg"
                                 style="display: inline;">
                        </a>
                    </li>
                </ul>
            </li>
            <li class="floor pc_6">
                <div class="info">
                    <p class="subject">精品书籍</p>
                    <%-- 精品书籍 --%>
                    <ul class="more-wrapper">
                        <li>
                            <a target="_blank" href="javascript:;" class="more">
                                更多<span class="arrow"></span>
                            </a>
                        </li>
                    </ul>

                </div>

                <ul class="box-list">
                    <c:forEach items="${getBoutiquePhone4}" var="good" varStatus="">
                        <%-- 如果状态为5  则为上架   4为下架 --%>
                        <c:if test="${good.v_status eq 5}">
                            <li class="box">
                                <a target="_blank" href="ShoppingServlet?action=productDetails&gid=${good.v_gid}">
                                    <img src="../${good.v_image}"
                                         style="display: inline;">
                                </a>
                            </li>
                        </c:if>
                    </c:forEach>
                    <c:forEach items="${getBoutiquePhone}" var="good" varStatus="">
                        <li class="box">
                            <a target="_blank" class="box-b"
                               href="ShoppingServlet?action=productDetails&gid=${good.v_gid}">
                                <img class="img-item8 selected"
                                     src="../${good.v_image}"
                                     style="opacity: 0;">
                            </a>
                            <div class="prodinfo">
                                <p class="name">${good.v_user}</p>
                                <p class="feature">${good.v_gparticulars}</p>
                                <p class="price rmb-symbol">${good.v_price}</p>
                            </div>
                        </li>
                    </c:forEach>
                </ul>

            </li>
        </ul>
    </div>
</div>
<!--列表商品结束-->

<!--底部列表项-->
<div class="shop-foot-area home-foot-area">
    <div class="wrapper cl">
        <ul class="vvs-agree">
            <li class="vvs-agree-item">
                <a href="javascript:;">
                    <b class="iconfont size" style="margin-right: -4px;position:  relative;top: 2px;">&#xe62c;</b>
                    官方正品
                </a>
            </li>
            <li class="vvs-agree-item">
                <a href="javascript:;">
                    <b class="iconfont size">&#xe64a;</b>满68包邮
                </a>
            </li>
            <li class="vvs-agree-item">
                <a href="javascript:;">
                    <b class="iconfont size">&#xe60f;</b>30天退换货
                </a>
            </li>
            <li class="vvs-agree-item">
                <a href="">
                    <b class="iconfont size">&#xe672;</b>全国网点售后
                </a>
            </li>
        </ul>
    </div>
</div>
<%-- 载入底部 --%>
<%@include file="bookshop-foot.jsp" %>
<style>
    #vivo-contain {
        margin-top: 60px;
    }

    .footer {
        background: #fff;
    }
</style>
</body>
<script src="../js/TweenLite.min.js"></script>
<script src="../js/EasePack.min.js"></script>
<script src="../js/html5.js"></script>
<script src="../js/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="../js/Mobile.phone.list.js" type="text/javascript"></script>
<script src="../js/scroll.js" type="text/javascript"></script>
<script src="../js/demo.js" type="text/javascript"></script>
<script src="../js/hiddenScllTop.js" type="text/javascript"></script>
<script src="../js/pc-menu-nav.js"></script>
</html>
