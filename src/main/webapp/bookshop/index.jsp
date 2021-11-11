<%--
  Created by IntelliJ IDEA.
  User: ZelongChen
  Date: 2021/11/11
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <meta  charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>BOOKSHOP官方网站</title>
    <link rel="stylesheet" href="../font/iconfont.css">
    <link rel="stylesheet" href="../font/font/iconfont.css">
    <link rel="stylesheet" href="../css/base.css">
    <link rel="stylesheet" href="../css/reset.css">

    <!--
     企业开发编写响应式网站步骤
     1.编写电脑版本的网页
     2.编写平板版本的网页, 通过相同的选择器覆盖掉不同的样式
     3.编写手机版本的网页, 通过相同的选择器覆盖掉不同的样式
     -->
    <!-- pc端 -->
    <link rel="stylesheet" href="../css/index.css" >
    <link rel="stylesheet" href="../css/top.css">
    <link rel="stylesheet" href="../css/index-footer.css">
    <!-- 平板端 -->
    <link rel="stylesheet" href="../css/index-pad.css" media="screen and (max-width:1199px)">
    <!--手机端 -->
    <link rel="stylesheet" href="../css/index-phone.css" media="screen and (min-width:0px) and (max-width:400px)">

</head>
<body>

<!-- 头部开始 -->
<%@include file="bookshop-top.jsp" %>
<style>
    .vp-head-site > .login > a {
        color: #fff;
    }
    .vp-head .vp-head-mainbar-pc{
        background: none;
    }
    .vp-head .vp-head-site .header-middle > li a {
        color: #fff;
    }

</style>
<!-- 头部结束 -->

<%--手机菜单开始--%>
<div class="header-phone-menu" style="display: none;">
    <div class="header-phone-menu-top">
        <span class="iconfont icon-chacha"></span>
        <div class="vp-head-search-center">
            <div class="vp-head-search-input">
                <input type="text" placeholder="X23幻彩版">
                <div class="iconfont icon-magnifier"></div>
            </div>
        </div>
        <span class="iconfont icon-baobao"></span>
    </div>
    <div class="header-phone-menu-bottom">
        <ul class="nav">
            <li>商城<span></span></li>
            <li>服务 <span></span></li>
            <li>
                <i></i>
            </li>
        </ul>
        <style>
            .nav-bottom {
                padding: 0 40px;
                display: flex;
                flex-wrap: wrap;
            }

            .nav-bottom > li {
                width: 200px;
                line-height: 50px;
                position: relative;
            }

            .nav-bottom > li > div {
                display: inline-block;
                color: #656565;
            }

            .nav-bottom > li:nth-child(even) > div {
                padding-left: 20px;
            }

            .nav-bottom > li > span {
                width: 16px;
                height: 16px;
                display: inline-block;
            }

            .nav-bottom > li > span::after {
                content: '';
                display: inline-block;
                background: url(../images/arrow_right.png) no-repeat center center;
                width: 16px;
                height: 16px;
                position: absolute;
                right: 20px;
                vertical-align: baseline;

            }

            .nav-bottom > li:last-child {
                line-height: 20px;
                width: 100%;
            }

            .nav-bottom > li:last-child i {
                width: 100%;
                height: 1px;
                padding: 0 9.25926vw;
                border-bottom: 1px solid #ccc;
                box-sizing: border-box;
            }
        </style>
        <ul class="nav-bottom">
            <li>
                <div>品牌</div>
                <span></span></li>
            <li>
                <div>Funtouch OS</div>
                <span></span></li>
            <li>
                <div>体验店</div>
                <span></span></li>
            <li>
                <div>政企业务</div>
                <span></span></li>
            <li>
                <div>社区</div>
                <span></span></li>
            <li>
                <i></i>
            </li>
            <li>
                <i></i>
            </li>
        </ul>
        <style>
            .nav-login {
                padding: 40px;

            }

            .nav-login li {
                text-align: center;
            }

            .nav-login > li > a {
                display: inline-block;
                font-size: 20px;
                margin-left: 5px;
                color: #415fff;
            }
        </style>
        <ul class="nav-login">
            <li>
                <a href="#">登录</a>
                或
                <a href="#">注册</a>
            </li>
        </ul>

    </div>
</div>
<!-- 手机菜单结束 -->

<!-- 中部开始 -->
<div class="main">
    <!-- 中间内容开始 -->
    <div class="main-top hide-pc">
        <a href="#">
            <div class="banner-large-bg bg1" style="background-color: #333333;">
                <img src="../images/123456.jpg" alt="">
                <%--<img src="${cxt}/VivoProject/images/d1659f87637ebfde98cef07447118663.jpg_w2560-h680.jpg" alt="">--%>
            </div>
            <div class="banner-large-bg bg2">
                <img src="${cxt}/VivoProject/images/240e5f7bc6d1b6fba37711dc058e5635.jpg_w1080-h1655.jpg" alt="">
            </div>
        </a>
        <div class="banner-large-content">
            <div class="banner-large-product">
                <svg version="1.1" id="图层_1" xmlns="" xmlns:xlink="" x="0px" y="0px"
                     viewBox="0 0 225.45 84.85" style="enable-background:new 0 0 225.45 84.85;" xml:space="preserve">
<style type="text/css">
    .st0{fill:#FFFFFF;}
    .st1{clip-path:url(#SVGID_2_);}
    .st2{clip-path:url(#SVGID_4_);}
    .st3{filter:url(#Adobe_OpacityMaskFilter);}
    .st4{clip-path:url(#SVGID_6_);}
</style>
                    <g>
                        <path class="st0" d="M98.08,71.85c0.57,0,1.2-0.05,1.82-0.17l-0.65-2.35C98.83,70.33,98.43,71.13,98.08,71.85z"/>
                        <path class="st0" d="M223.02,55.75H85.39L68.7,84.85h141.65l14.77-25.45C226.05,57.78,224.89,55.75,223.02,55.75z M177.4,60.88
		l-0.45,1.72h7.02c0.6,0,0.82,0.55,0.75,1.07l-1.2,4.55h-3.02l0.97-3.37h-5.2c-0.42,1.27-0.92,2.52-1.42,3.72h-3.25
		c1.15-2.55,2.15-5.35,2.72-7.69H177.4z M91.89,78.67l-1.47-3.77c-0.55,1.6-1.4,3.12-2.62,4.85h-2.92c3-4.22,4.2-6.54,4.2-9.87
		v-4.72h2.1v4.87c0,1.27-0.12,2.42-0.38,3.5h1.52l2.4,5.15H91.89z M94.74,73.82c-0.18-0.32-0.18-0.72,0.02-1.1
		c1.1-2.22,2.12-4.35,2.92-6.47h2.8c-0.35,0.92-0.65,1.7-0.95,2.4h2.05l1.82,6.05h-2.65l-0.22-0.77c-1.62,0.27-3.05,0.4-4.92,0.4
		C95.19,74.32,94.89,74.12,94.74,73.82z M106.63,77.22c0,1.57-0.77,2.52-2.42,2.55c-1.85,0.03-4.1-0.5-6.02-1.27v-2.47
		c2.07,0.75,3.6,1.15,4.92,1.25c0.27,0.02,0.6-0.22,0.6-0.52V65.21h-5.82c-0.3,0.57-0.57,1.12-0.87,1.65h-2.67v6.22h-2.42v-9.17
		h-3.62v9.39h-2.45V61.71h7.62c0.52,0,0.87,0.35,0.87,0.87V66c1.02-1.85,1.75-3.45,2.37-5.12h3.07c-0.22,0.6-0.47,1.25-0.75,1.87
		h6.72c0.52,0,0.87,0.35,0.87,0.87V77.22z M117.69,79.82h-2.8v-7.24c-1.27,0.37-2.55,0.72-3.85,1.07v-2.6
		c1.32-0.35,2.6-0.72,3.85-1.1v-3.8h-0.97c-0.1,0.95-0.22,1.87-0.37,2.8h-2.35c0.38-2.42,0.62-4.82,0.77-7.27h2.35l-0.15,2.02h0.72
		v-2.82h2.8v2.82h1.57v2.45h-1.57V69l1.77-0.65v2.62l-1.77,0.65V79.82z M132.48,76.62c0,1.15-0.18,1.87-0.72,2.37
		c-0.55,0.5-1.32,0.7-2.47,0.52c-0.92-0.12-1.97-0.42-2.67-0.77V76c0.6,0.37,1.5,0.7,2.02,0.8c0.57,0.1,0.9-0.05,0.9-0.67V65.73
		h-0.82c-0.18,5.12-1.95,10.19-4.7,13.99l-2.97-0.72c2.97-3.7,4.82-8.14,5.2-13.26h-0.8c-0.65,4.22-2.3,8.17-4.85,11.34l-2.65-0.87
		c2.7-3.42,4.47-6.89,5.05-10.47h-0.37c-0.3,0.85-0.62,1.67-0.97,2.47h-3c1.15-2.42,1.87-4.87,2.45-7.29h2.97
		c-0.18,0.75-0.37,1.5-0.57,2.22h8.12c0.52,0,0.87,0.35,0.87,0.87V76.62z M144.15,76.75c0,1-0.2,1.75-0.67,2.22
		c-0.45,0.45-1.15,0.67-2.17,0.62c-1.32-0.08-2.55-0.75-3.67-1.42v-2.7c0.97,0.65,1.9,1.25,3.05,1.5c0.35,0.08,0.52-0.1,0.52-0.52
		V71.9c-1.25,0.97-2.57,1.77-4.05,2.52v-2.85c1.45-0.75,2.75-1.6,4-2.57c-0.05-0.57-0.1-1.15-0.2-1.67c-1.17,0.8-2.42,1.5-3.8,2.2
		V66.7c1.05-0.57,2.05-1.2,2.97-1.82c-0.52-1.07-1.32-2.07-2.52-3.15l3.07-0.62c0.7,0.72,1.25,1.4,1.7,2.1
		c0.92-0.72,1.82-1.52,2.72-2.45v3.25c-0.55,0.52-1.1,1.02-1.65,1.47c0.57,1.72,0.7,3.6,0.7,5.87V76.75z M159.24,78.97H145.1v-2.65
		h5.55v-5.77h-4.25V67.9h4.25v-3.5h-5.07v-2.65h13.34v2.65h-5.02v3.5h4.17v2.65h-4.17v5.77h5.35V78.97z M166.08,78.97l-3.45-0.52
		c2.05-2.45,3.5-4.6,4.5-6.87c-1.25-2.02-2.52-3.92-3.77-5.7h3.32l1.6,2.35c0.25-1.02,0.45-2.12,0.6-3.32h-5.5v-2.62h7.64
		c0.8,0,1.05,0.47,0.95,1.2c-0.42,3.07-0.95,5.52-1.75,7.74c0.72,1.12,1.45,2.32,2.27,3.65l-1.92,2.67c-0.57-1.05-1.15-2.1-1.72-3.1
		C168.11,75.92,167.18,77.4,166.08,78.97z M182.05,79.84c-1.8-1.9-3.05-3.9-3.9-5.97c-0.92,2.02-2.37,3.97-4.45,5.95l-3.32-1.07
		c4.3-3.57,6-7.12,6-10.99v-1.67h3.05v1.67c0,0.45-0.02,0.9-0.05,1.35c0.4,2.9,2.52,6.42,6.15,9.52L182.05,79.84z M209.58,75.45
		c0,0.95-0.2,1.57-0.65,1.95c-0.45,0.4-1.1,0.55-2.02,0.55c-1.92,0-3.67-0.42-5.42-1.22v-2.67c1.3,0.6,2.95,1.3,4.4,1.3
		c0.37,0,0.57-0.17,0.57-0.52V70h-6.77v9.82h-3.12V70h-6.77v-2.65h18.91c0.52,0,0.87,0.35,0.87,0.87V75.45z M210.85,65.13h-5.32
		v1.57h-3v-1.57h-4.85v1.57h-3v-1.57h-5.32v-2.57h5.32v-1.67h3v1.67h4.85v-1.67h3v1.67h5.32V65.13z"/>
                    </g>
                    <path class="st0" d="M89.69,48.55h16.16l4.91-8.5c0.93-1.62-0.23-3.64-2.1-3.64H96.7L89.69,48.55z"/>
                    <path class="st0" d="M156.43,0h-20.88l-4.34,7.51l7.48,0L115,48.55h17.65l25.88-44.9C159.47,2.02,158.3,0,156.43,0z"/>
                    <path class="st0" d="M192.2,0h-20.88l-4.34,7.51l7.48,0l-23.7,41.03h17.65l25.88-44.9C195.24,2.02,194.07,0,192.2,0z"/>
                    <g>
                        <g>
                            <defs>
                                <path id="SVGID_1_" d="M104.41,0H83.5l-4.39,7.51l7.52,0l-31.2,54.04c-0.93,1.62-3.27,1.62-4.2,0L20.02,7.51h17.6L41.96,0H2.24
				c-1.87,0-3.04,2.02-2.1,3.64l43.72,75.73c4.2,7.28,14.72,7.28,18.92,0l43.73-75.73C107.45,2.02,106.28,0,104.41,0z"/>
                            </defs>
                            <clipPath id="SVGID_2_">
                                <use xlink:href="#SVGID_1_"  style="overflow:visible;"/>
                            </clipPath>
                            <g class="st1">
                                <g>
                                    <defs>
                                        <rect id="SVGID_3_" x="-5.18" y="-5" width="117.01" height="94.84"/>
                                    </defs>
                                    <clipPath id="SVGID_4_">
                                        <use xlink:href="#SVGID_3_"  style="overflow:visible;"/>
                                    </clipPath>
                                    <g class="st2">
                                        <defs>
                                            <rect id="SVGID_5_" x="-5.18" y="-5" width="117.01" height="94.84"/>
                                        </defs>
                                        <clipPath id="SVGID_6_">
                                            <use xlink:href="#SVGID_5_"  style="overflow:visible;"/>
                                        </clipPath>
                                        <defs>
                                            <filter id="Adobe_OpacityMaskFilter" filterUnits="userSpaceOnUse" x="-5.28" y="-5.28" width="117.12" height="95.52">
                                                <feColorMatrix  type="matrix" values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 1 0"/>
                                            </filter>
                                        </defs>
                                        <mask maskUnits="userSpaceOnUse" x="-5.28" y="-5.28" width="117.12" height="95.52" id="SVGID_7_">
                                            <g class="st3">
                                                <g>
                                                    <defs>
                                                        <rect id="SVGID_8_" x="-5.18" y="-5" width="117.01" height="94.84"/>
                                                    </defs>
                                                    <clipPath id="SVGID_9_" class="st4">
                                                        <use xlink:href="#SVGID_8_"  style="overflow:visible;"/>
                                                    </clipPath>
                                                    <g style="clip-path:url(#SVGID_9_);">

                                                        <image style="overflow:visible;" width="244" height="199" xlink:href="data:image/jpeg;base64,/9j/4AAQSkZJRgABAgEAlgCWAAD/7AARRHVja3kAAQAEAAAAHgAA/+4AIUFkb2JlAGTAAAAAAQMA
EAMCAwYAAAKAAAADKwAABAP/2wCEABALCwsMCxAMDBAXDw0PFxsUEBAUGx8XFxcXFx8eFxoaGhoX
Hh4jJSclIx4vLzMzLy9AQEBAQEBAQEBAQEBAQEABEQ8PERMRFRISFRQRFBEUGhQWFhQaJhoaHBoa
JjAjHh4eHiMwKy4nJycuKzU1MDA1NUBAP0BAQEBAQEBAQEBAQP/CABEIAMoA9gMBIgACEQEDEQH/
xACTAAEAAgMBAQAAAAAAAAAAAAAAAQUCAwQGBwEBAAAAAAAAAAAAAAAAAAAAABAAAQQCAgICAwEA
AAAAAAAAAAECAwQRBUAGECFwEiCQMRYRAAEDAQQHAw0BAAAAAAAAAAEAAgMRQCExBCBBYXESIpKR
MiMQkFGBocHRQlKiE5MUBRIBAAAAAAAAAAAAAAAAAAAAcP/aAAwDAQACEQMRAAAA+gARIx1btRyc
HVTmPDoqy0xocT0Pp/m9gfVwAAAAAAAAAAREwVtNd1RR1d3VFXjt1D1Xm/rB0gAAAAAAAAAAjDZi
cXBa8pR1XqO4+a4fWx5v0gAAAAAAAAAAAIkatXTgck74N2WvYAAAAAAAAAAAAARGUGMZwRlEkgAA
AAAAAAAAAAAgBIiQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA//aAAgBAgABBQD5
Q//aAAgBAwABBQD5Q//aAAgBAQABBQD8FVUHyPQmuzsJ9zeYTdl2jCXuG6YL3beH+33o3vG9R3Xe
0Q7jjKhI31ZQtFlCwg7zoJJIt3xnJlLaFpCyhYQf/fHRtQs9vjOX1ZTJZZksxlhhI32pTqS3bWuo
w66lxnkzck8ZPBkt05yWlbzFqdpO7qvWn6pOO5CRpJEProprnKxvLc0ewWNBrVarXfZvKVBWisPq
R+uYqGDBgTm48J+gT//aAAgBAgIGPwBQ/9oACAEDAgY/AFD/2gAIAQEBBj8A0blcR2I8Jb0rlczp
Vzo+gLvx9AXfj/WECTE4A1ILLjsuIX88zBDnWipaDySAYllb/V7TaCiijoZF0ZIcZ2NNPpeeB32k
2gooo6Dv9OUeDlqthr80pF/SD209FoKKKKPkiykIrJM4NbsrrO7FRZOAckTaV1udi5x3m+0lFVbG
5w1ENJR8CTod8FSHKTPvpURuoN5pQJ2bzgBzkg4WsB4hGw0JFcOI7LXgvwHAXs94t4IuIQNvpqPm
Q//Z" transform="matrix(0.48 0 0 0.48 -5.28 -5.28)">
                                                        </image>
                                                    </g>
                                                </g>
                                            </g>
                                        </mask>
                                        <g style="clip-path:url(#SVGID_6_);mask:url(#SVGID_7_);">

                                            <image style="overflow:visible;" width="244" height="199" xlink:href="data:image/jpeg;base64,/9j/4AAQSkZJRgABAgEAlgCWAAD/7AARRHVja3kAAQAEAAAAHgAA/+4AIUFkb2JlAGTAAAAAAQMA
EAMCAwYAAAIEAAACEAAAAjL/2wCEABALCwsMCxAMDBAXDw0PFxsUEBAUGx8XFxcXFx8eFxoaGhoX
Hh4jJSclIx4vLzMzLy9AQEBAQEBAQEBAQEBAQEABEQ8PERMRFRISFRQRFBEUGhQWFhQaJhoaHBoa
JjAjHh4eHiMwKy4nJycuKzU1MDA1NUBAP0BAQEBAQEBAQEBAQP/CABEIAMoA9gMBIgACEQEDEQH/
xABeAAEBAAAAAAAAAAAAAAAAAAAABwEBAAAAAAAAAAAAAAAAAAAAABABAQAAAAAAAAAAAAAAAAAA
cJARAQAAAAAAAAAAAAAAAAAAAJASAQAAAAAAAAAAAAAAAAAAAHD/2gAMAwEAAhEDEQAAAKAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/2gAIAQIAAQUAUP/aAAgBAwAB
BQBQ/9oACAEBAAEFAKTf/9oACAECAgY/AFD/2gAIAQMCBj8AUP/aAAgBAQEGPwBJv//Z" transform="matrix(0.48 0 0 0.48 -5.28 -5.28)">
                                            </image>
                                        </g>
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <path class="st0" d="M68.61,0.02H47.75l-4.38,7.49l7.5,0L38.41,29.1l8.8,15.25l23.5-40.7C71.64,2.04,70.47,0.02,68.61,0.02z"/>
</svg>
            </div>
            <h2 class="banner-large-title">11.11开门红钜惠</h2>
            <p class="banner-large-subtitle">领券至高省700</p>
            <div class="banner-large-links"><a href="#">立即前往</a></div>
        </div>
    </div>
    <div class="main-bottom">
        <div class="main-left">
            <img src="../images/2.jpg">
        </div>
        <div class="main-right">
            <img src="../images/1.jpg" alt="">
        </div>
    </div>
    <div class="main-bottom">
        <div class="main-left">
            <img src="../images/3.jpg">
        </div>
        <div class="main-right">
            <img src="../images/4.jpg" alt="">
        </div>
    </div>
    <div class="main-bottom">
        <div class="main-left">
            <img src="../images/5.jpg">
        </div>
        <div class="main-right">
            <img src="../images/6.jpg" alt="">
        </div>
    </div>
    <!-- 中间内容结束 -->
</div>


<!-- 底部开始 -->
<div class="footer">
    <div class="footer-in">
        <div class="footer-top clearfix">
            <div class="footer-top-left fl">
                <dl>
                    <dt>
                        热门链接
                    <dd>中华书局</dd>
                    <dd>三联书店</dd>
                    <dd>中信出版社</dd>
                    <dd>商务印书馆</dd>
                    <dd>人民教育出版社</dd>
                    <dd>机械工业出版社</dd>
                    </dt>

                </dl>
                <dl>
                    <dt>在线购买</dt>
                    <dd>线下书店</dd>
                    <dd>选购书籍</dd>
                    <dd>选购其他</dd>
                    <dd>在线阅读</dd>
                    <dd>旧书回收</dd>
                    <dd>服务保障</dd>
                </dl>
                <dl>
                    <dt>服务支持</dt>
                    <dd>服务首页</dd>
                    <dd>服务网点</dd>
                    <dd>真伪查询</dd>
                    <dd>服务政策</dd>
                    <dd>预约到店</dd>
                    <dd>价格问题</dd>
                </dl>
                <dl>
                    <dt>BOOKSHOP社区</dt>
                    <dd>社区首页</dd>
                    <dd>编辑专区</dd>
                    <dd>微博</dd>
                    <dd>公众号</dd>
                    <dd>哔哩哔哩</dd>
                </dl>
                <dl>
                    <dt>关于BOOKSHOP</dt>
                    <dd>BOOKSHOP简介</dd>
                    <dd>工作机会</dd>
                    <dd>新闻资讯</dd>
                    <dd>采购平台</dd>
                    <dd>开放平台</dd>
                </dl>
            </div>
            <div class="footer-top-right fr">
                <p><a href="#" class="iconfont icon-liaotian">在线客服</a></p>
                <p>400-000-0000</p>
                <p>24小时全国服务热线</p>
                <p>
                    <span>关注BOOKSHOP</span>
                    <span class="iconfont icon-weibo"></span>
                    <span class="iconfont icon-wechat-fill"></span>
                    <span class="iconfont icon-changyonglogo30"></span>
                </p>
            </div>
        </div>
        <div class="footer-bottom clearfix">
            <p>
                <span>Copyright © 李荣佳 陈泽龙 朱羽洋</span>
                <img src="${pageContext.request.contextPath}/VivoProject/images/gssw-icon-x2_fe90277.png" alt="">
                <span>|</span>
                <span class="iconfont icon-diqiu"><span>中国</span></span>
            </p>

        </div>
    </div>
</div>
<!-- 底部结束 -->

<!-- 返回顶部开始 -->
<div class="getTop" style="display: none;"><span></span></div>
<!-- 返回顶部结束 -->
</body>
<!-- 返回顶部js -->
<!-- JavaScript代码片段开始 -->
<script src="../js/jquery-1.10.1.min.js"></script>
<script src="../js/animation2.js"></script>
<script src="../js/tools.js"></script>
<script src="../js/pc-menu-nav.js"></script>
<script src="../js/phone-menu-nav.js"></script>
<script src="../js/slideshow.js"></script>
<script>
    let addClass = document.querySelectorAll(".nav  span");
    /* 遍历所有的span添加类名 */
    for (let i = 0; i < addClass.length; i++) {
        addClass[i].className = "iconfont icon-chacha";
    }
</script>
<script>
    window.onresize = debounce(function () {
        let {width, height} = getScreen();
        console.log(width);
        if (width <= 600) {
            // 1.监听鼠标移动
            $(".footer-top-left dl").click(function () {
                $(this).find("dd").slideToggle(300);
                $(this).siblings().find("dd").slideUp(300);
            });
        } else {
            $(".footer-top-left dl").find("dd").show();
        }

        if (width >= 546) {
            $(".header-phone-menu").css({
                display: "none",
                opacity: 0,
                overflow: "auto"
            });
            $("body").css(
                {
                    overflowY: "auto"
                }
            );
        }

    }, 1000);
</script>
<!-- PC吸顶盒 -->
<script src="${cxt}/VivoProject/js/ceiling.js"></script>
<script>
    $(function () {
        $(".header-middle-li a ").mouseenter(function () {
            // 获取当前的系列
            var $this = $(this);
            var s = $(this).html();

            $.ajax({
                type: "post",
                url: "${cxt}/vivoGoodSeriesServlet?action=getGoodsName",
                data: "v_name=" + s,
                success: function (msg) {
                    var obj = eval(msg);
                    // var obj = JSON.parse(msg);
                    $.each(obj,function (index,value) {
                        console.log(value);
                        console.log($this.find(".vp-head-menu-series").find(".vp-head-series-wrapper"));
                    });
                }, error: function (xhr) {
                    console.log(xhr.status);
                }
            });

        });
    });
</script>
<!-- JavaScript代码片段结束 -->

</body>
</html>
