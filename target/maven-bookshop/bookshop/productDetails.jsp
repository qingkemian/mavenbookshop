<%--
  Created by IntelliJ IDEA.
  User: ZelongChen
  Date: 2021/11/11
  Time: 22:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    /* 获取当前的页面地址 登录完毕后跳回浏览前的页面 */
    String url = request.getContextPath() + request.getServletPath().substring(0, request.getServletPath().indexOf("/"));
    if (request.getQueryString() != null) {
        url += "?" + request.getQueryString();
    }
    System.out.println("/ShoppingServlet" + url);
    HttpSession session1 = request.getSession();
    session1.setAttribute("url", "/ShoppingServlet" + url);
%>
<%-- 获取全局路径 --%>
<% String path = request.getContextPath();
    pageContext.setAttribute("cxt", path);%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="UTF-8">
    <title>${byIdGoods.goodName}详情页</title>
    <script src="../js/jquery-1.10.1.min.js"></script>
    <script src="../js/ceiling.js"></script>
    <script src="../js/pc-menu-nav.js"></script>
    <script src="../js/tools.js"></script>
    <script src="../js/animation2.js"></script>
    <link rel="stylesheet" href="../css/base.css">
    <link rel="stylesheet" href="../css/top.css">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../font/font/iconfont.css">
    <link rel="stylesheet" href="../font/iconfont.css">
    <link rel="stylesheet" href="../css/product-footer.css">
    <link rel="stylesheet" type="text/css"
          href="../css/font_918068_xgekrb9yo88/iconfont.css">
    <link rel="stylesheet" href="../css/productDeails-content.css">
    <link rel="stylesheet" href="../css/footer.css">


</head>
<body>
<!-- 头部开始 -->
<%@include file="bookshop-top.jsp" %>
<!-- 头部结束 -->

<!-- 详情页面开始 -->
<div class="page_container">
    <form id="from_Deta" action="" method="post">
        <div class="crumbs">
            <a href="javascript:;">商城首页</a>
            <span class="crumbs-s1 iconfont icon-fanhuidingbu"></span>
            <a href="javascript:;">智能手机</a>
            <span class="crumbs-s1 iconfont icon-fanhuidingbu"></span>
            <a href="javascript:;">${byIdGoods.goodName}</a>
        </div>
        <div class="base-info">
            <div class="base-info_container">
                <div class="base-info_left">
                    <div class="left-info">
                        <div class="atlas">
                            <ul class="img-list--big">
                                <img src="../images/1808245374667161_250x250.png" class="corner">
                                <li class="big-item" style="opacity: 1;"><img
                                        src="../${byIdGoods.imgSrc}" alt="${byIdGoods.goodName}"></li>
                                <li class="big-item"><img
                                        src="../${byIdGoods.imgSrc}" alt=""></li>
                                <li class="big-item"><img
                                        src="../${byIdGoods.imgSrc}" alt=""></li>
                                <li class="big-item"><img
                                        src="../${byIdGoods.imgSrc}" alt=""></li>
                                <li class="big-item"><img
                                        src="../${byIdGoods.imgSrc}" alt=""></li>
                            </ul>
                            <div class="img--small">
                            <span class="operation operation--previous">
                            <i class="v-icon iconfont icon-fanhuidingbu v1"></i>
                        </span>
                                <span class="operation operation--next">
                                <i class="v-icon iconfont icon-fanhuidingbu v2"></i>
                            </span>
                                <div class="list_wrapper">
                                    <ul class="img-list--small">
                                        <li class="small-item"><img
                                                src="../${byIdGoods.imgSrc}"
                                                alt="">
                                        </li>
                                        <li class="small-item"><img
                                                src="../${byIdGoods.imgSrc}"
                                                alt="">
                                        </li>
                                        <li class="small-item"><img
                                                src="../${byIdGoods.imgSrc}"
                                                alt="">
                                        </li>
                                        <li class="small-item"><img
                                                src="../${byIdGoods.imgSrc}"
                                                alt="">
                                        </li>
                                        <li class="small-item"><img
                                                src="../${byIdGoods.imgSrc}"
                                                alt="">
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="collection">
                        <span class="favorite">
                            <svg class="icon" viewBox="0 0 1024 1024" id="icon-star-sharp"><path
                                    d="M512.060235 0L372.073412 393.276235 0 398.155294l296.598588 222.268235L195.584 1024l316.476235-267.324235L828.476235 1024l-101.014588-403.456 296.658824-222.328471-389.601883-6.625882z"
                                    p-id="1749"></path></svg>
                            <span class="text">收藏商品（12375人收藏）</span>
                        </span>
                            <span class="share">
                            <svg class="icon" viewBox="0 0 1024 1024" id="icon-share"><path
                                    d="M826.789647 722.823529c-45.056 0-84.630588 22.588235-109.568 56.982589L333.221647 470.558118c0.240941-3.072 0.903529-6.023529 0.903529-9.09553 0-12.830118-2.228706-24.997647-5.421176-36.803764l326.836706-202.571295a135.529412 135.529412 0 0 0 111.013647 58.729412C842.209882 280.816941 903.529412 217.931294 903.529412 140.348235S842.209882 0 766.554353 0C690.898824 0 629.639529 62.885647 629.639529 140.348235c0 8.854588 0.963765 17.287529 2.469647 25.6L301.176471 371.049412a134.806588 134.806588 0 0 0-103.966118-49.995294C121.554824 321.054118 60.235294 383.939765 60.235294 461.402353c0 77.583059 61.44 140.468706 136.975059 140.468706 50.176 0 93.665882-28.009412 117.458823-69.270588l377.856 304.429176a139.023059 139.023059 0 0 0-2.590117 26.202353c0 77.522824 61.259294 140.348235 136.914823 140.348235 75.655529 0 136.914824-62.825412 136.914824-140.348235C963.764706 785.709176 902.445176 722.823529 826.789647 722.823529"
                                    p-id="2176"></path></svg>
                            <span class="text">分享</span></span>
                        </div>
                    </div>
                </div>
                <div class="sku-info">
                    <div class="primary">
                        <h1 class="name">${byIdGoods.goodName}</h1>
                        <p class="intro">
                            <span class="promotion">【限时下单立减100，享3期免息】</span>
                            <%--${byIdGoods.v_gparticulars}--%>
                        </p>
                        <div class="summary">
                            <div class="summary_price">
                                <div class="common">
                                    <p class="sale-price">
                                        <span>￥</span><span class="v_price">${byIdGoods.price*byIdGoods.discount}</span>
                                    </p>
                                    <p class="market-price">
                                        <span>￥</span>${byIdGoods.price}
                                    </p>
                                </div>
                            </div>
                            <div class="summary_activity">
                                <ul data-v-19bf72ce="" class="list">
                                    <li class="list_item"><span class="label">满减</span>
                                        <div class="content">
                                            满300元减100元
                                        </div>
                                    </li>
                                    <li class="list_item"><span class="label">积分</span>
                                        <div class="content">
                                            购买即送300积分
                                        </div>
                                    </li>
                                    <li class="list_item"><span class="label">定制书签</span>
                                        <div class="content">
                                            购书即送定制书签
                                        </div>
                                    </li>
                                    <li class="list_item"><span class="label">社群交流</span>
                                        <div class="content">
                                            购书订单完成后可加入社群
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="support">
                            <span class="label">商品支持:</span>
                            <ul class="support_list">
                                <li class="support_item">
                                    <span class="support_tag">
                                    <svg viewBox="0 0 14 14" class="v-icon check-circle" id="icon-check-circle">
                            <title>check-circle</title>
                            <desc>check-circle</desc>
                            <g id="icon-check-circle_-" stroke="none" stroke-width="1">
                                <g id="icon-check-circle_02-抢购中" transform="translate(-1232.000000, -490.000000)">
                                    <g id="icon-check-circle_编组-45" transform="translate(1048.000000, 161.000000)">
                                        <g id="icon-check-circle_Group-18" transform="translate(6.000000, 326.000000)">
                                            <path d="M184.998,2.99988005 C188.863,2.99988005 191.997,6.1335639 191.997,9.99994003 C191.997,13.8663161 188.863,17 184.998,17 C181.133,17 178,13.8663161 178,9.99994003 C178,6.1335639 181.133,2.99988005 184.998,2.99988005 Z M184.998,3.99988005 C181.685263,3.99988005 179,6.68587038 179,9.99994003 C179,13.3140097 181.685263,16 184.998,16 C188.310972,16 190.997,13.3137747 190.997,9.99994003 C190.997,6.68610532 188.310972,3.99988005 184.998,3.99988005 Z M189.249,7.099 C189.684,7.535 189.738,7.468 189.622,7.776 L184.67,12.999 C184.514,13.163 184.253,13.17 184.088,13.014 L181,10.081 L181,9.825 L181.411,9.413 L181.574,9.413 L184.05,11.764 C184.215,11.92 184.476,11.913 184.632,11.748 L189.134,7 C189.171,7.029 189.208,7.058 189.249,7.099 Z"
                                                  id="icon-check-circle_形状结合"></path>
                                        </g>
                                    </g>
                                </g>
                            </g>
                        </svg>
                                    花呗分期
                                </span>
                                </li>
                                <li class="support_item">
                                    <span class="support_tag">
                                    <svg viewBox="0 0 14 14" class="v-icon check-circle" id="icon-check-circle">
                            <title>check-circle</title>
                            <desc>check-circle</desc>
                            <g id="icon-check-circle_-" stroke="none" stroke-width="1">
                                <g id="icon-check-circle_02-抢购中" transform="translate(-1232.000000, -490.000000)">
                                    <g id="icon-check-circle_编组-45" transform="translate(1048.000000, 161.000000)">
                                        <g id="icon-check-circle_Group-18" transform="translate(6.000000, 326.000000)">
                                            <path d="M184.998,2.99988005 C188.863,2.99988005 191.997,6.1335639 191.997,9.99994003 C191.997,13.8663161 188.863,17 184.998,17 C181.133,17 178,13.8663161 178,9.99994003 C178,6.1335639 181.133,2.99988005 184.998,2.99988005 Z M184.998,3.99988005 C181.685263,3.99988005 179,6.68587038 179,9.99994003 C179,13.3140097 181.685263,16 184.998,16 C188.310972,16 190.997,13.3137747 190.997,9.99994003 C190.997,6.68610532 188.310972,3.99988005 184.998,3.99988005 Z M189.249,7.099 C189.684,7.535 189.738,7.468 189.622,7.776 L184.67,12.999 C184.514,13.163 184.253,13.17 184.088,13.014 L181,10.081 L181,9.825 L181.411,9.413 L181.574,9.413 L184.05,11.764 C184.215,11.92 184.476,11.913 184.632,11.748 L189.134,7 C189.171,7.029 189.208,7.058 189.249,7.099 Z"
                                                  id="icon-check-circle_形状结合"></path>
                                        </g>
                                    </g>
                                </g>
                            </g>
                        </svg>
                                    货到付款
                            </span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <dl class="sku-module suites">
                        <dt class="sku-module_title">选择套餐（暂时只有普通版）</dt>
                        <dd class="sku-module_content">
                            <ul class="item_list">
                                <li class="sku-module_item suite_item sku-module_item--checked">
                                    <h2 class="suite_title">普通版</h2>
                                </li>
                                <li class="sku-module_item suite_item">
                                    <h2 class="suite_title">典藏版</h2>
                                    <p class="suite_price">
                                        <span class="suite_price--sale"><dfn>￥</dfn>${byIdGoods.price*2}</span>
                                        <%--<span class="suite_price--save">省<dfn>￥</dfn>80</span>--%>
                                    </p>
                                </li>
                                <li class="sku-module_item suite_item">
                                    <h2 class="suite_title">英文版</h2>
                                    <p class="suite_price">
                                        <span class="suite_price--sale"><dfn>￥</dfn>${byIdGoods.price*3}</span>
                                        <%--<span class="suite_price--save">省<dfn>￥</dfn>15</span>--%>
                                    </p>
                                </li>
                                <li class="sku-module_item suite_item">
                                    <h2 class="suite_title">英文典藏</h2>
                                    <p class="suite_price">
                                        <span class="suite_price--sale"><dfn>￥</dfn>${byIdGoods.price*4}</span>
                                        <%--<span class="suite_price--save">省<dfn>￥</dfn>50</span>--%>
                                    </p>
                                </li>
                            </ul>
                        </dd>
                    </dl>
                    <dl class="sku-module services">
                        <p class="agreement">
                            <i class="agreement_checkbox "></i>
                            <span class="agreement_text  ">
                            我已阅读并同意
                         <span class="detail_link">《BOOKSHOP服务条款》</span></span>
                        </p>
                    </dl>
                    <dl class="sku-module number">
                        <dt class="sku-module_title">
                            <div class="sku-module_item number_item">
                                <label class="minus disabled">
                                    <font style="vertical-align: inherit;">
                                        <font style="vertical-align: inherit;">- </font>
                                    </font>
                                </label>
                                <%--数量！！！--%>
                                <input type="number" class="count" name="v_quanity" readonly="readonly" value="1">
                                <label class="plus">
                                    <font style="vertical-align: inherit;">
                                        <font style="vertical-align: inherit;">+</font>
                                    </font>
                                </label>
                            </div>
                            <span class="number_tips">
                            <font style="vertical-align: inherit;">
                                <font style="vertical-align: inherit;">
                                    （仅限购5件）
                                </font>
                            </font>
                        </span>
                        </dt>
                        <dd class="sku-module_content"></dd>
                    </dl>
                    <div class="settle">
                        <div class="settle_total">
                            <p class="price"><dfn>￥</dfn><span>${byIdGoods.price*byIdGoods.discount}</span></p>
                            <p class="info">
                                已选： ${byIdGoods.goodName} 普通版 <span class="numOfGood">1</span>件
                            </p>
                        </div>
                        <div class="settle_operation">
                            <div class="action">
                                <button class="v-btn v-btn--dark" id="btn-add" readonly="readonly">
                                    <a href="javascript:;" id="addCart">加入购物车</a>
                                </button>
                                <button class="v-btn v-btn--brand">
                                    <a href="">立即购买</a>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="recommend"></div>
        <div class="detail-info"></div>
        <%--注意命名！！！--%>
        <input type="hidden" name="goodNo" value="${byIdGoods.goodNo}"/>
        <input type="hidden" name="imgSrc" value="${byIdGoods.imgSrc}"/>
        <input type="hidden" name="uid" value="${sessionScope.user.uid}"/>
    </form>
</div>
<!-- 详情页面结束 -->

<!-- 底部开始 -->
<%@include file="bookshop-foot.jsp" %>
<!-- 底部结束 -->


<script src="../js/hiddenScllTop.js" type="text/javascript"></script>
<script src="../js/scroll.js" type="text/javascript"></script>
<script src="../js/productDetalis-conteiner.js"></script>
<script src="../js/cartAddSuccess.js"></script>
<script>
    $(function () {
        $(".item_list").find(".sku-module_item").click(function () {
            $(this).addClass("sku-module_item--checked");
            $(this).siblings().removeClass("sku-module_item--checked");
        })
    });
</script>
<style>
    .header-middle-pc {
        color: #000 !important;
    }

</style>
<script>
    $(function () {

        $(".spec_item ").click(function () {
            var count = $(".count").val();
            var info = $(".sku-module_item--checked").text();
            $(".settle>.settle_total>.info").text("已选：" + info + "  " + count + "个件");
        });
        var price = $(".v_price").text();
        $(".minus ").click(function () {
            var count = $(".count").val();
            var total = 0;
            console.log(total = count * (price));
            $(".price>span").text(total);
            $(".numOfGood").text(count);

        });
        $(".plus ").click(function () {
            var count = $(".count").val();
            var total = 0;
            console.log(total = count * (price));
            $(".price>span").text(total);
            $(".numOfGood").text(count);
        });

        /* $(".specs").click(function () {
             console.log($(this).find(".sku-module_content").find(".item_list").find(".sku-module_item--checked").text());
         });
         $(".spec_title").click(function () {
             console.log($(this).find(".sku-module_content").find(".item_list").find(".sku-module_item--checked").text());
         });*/
    });
</script>
<c:if test="${!empty user}">
    <script>
        $(function () {

            $("#btn-add").click(function () {

                // console.log($(".sku-module_item--checked").val());
                var edition = $(".edition>.sku-module_item--checked").val();
                var goodColor = $(".goodColor>.sku-module_item--checked").val();
                console.log(edition, goodColor);
                $("#from_Deta").attr("action", "${pageContext.request.contextPath}/shoppingCartServlet?action=addUserShoppingCar&goodNo=${byIdGoods.goodNo}" + "&price=" + $(".price>span").text());
                $("#from_Deta").submit();

            });

            $(".v-btn--brand").click(function () {
                var edition = $(".edition>.sku-module_item--checked").val();
                var goodColor = $(".goodColor>.sku-module_item--checked").val();
                console.log(edition, goodColor);
                $("#from_Deta").attr("action", "${pageContext.request.contextPath}/shoppingCartServlet?action=addUserShoppingCar&goodNo=${byIdGoods.goodNo}" + "&price=" + $(".price>span").text());
            });
        });
    </script>
</c:if>
<c:if test="${empty user}">
    <script>
        $(function () {

            $("#btn-add").click(function () {
                alert("您还没有进行登录，请先进行登录,在尝试");
                window.location.href = "bookshop/login.jsp";
            });

        });
    </script>
</c:if>

</body>
</html>
