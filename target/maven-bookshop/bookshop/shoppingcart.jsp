<%--
  Created by IntelliJ IDEA.
  User: ZelongChen
  Date: 2021/11/11
  Time: 19:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="UTF-8">
    <title>我的购物车</title>
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
    <link rel="stylesheet" href="../css/shoppingcart.css">


</head>
<body class="buy-process">
<!-- 头部开始 -->
<%@include file="bookshop-top.jsp" %>
<!-- 头部结束 -->

<!-- 内容开始 -->
<div class="content">
    <div class="wrapper">
        <table class="main-title-module">
            <tbody>
            <tr>
                <td></td>
                <th class="main-title-txt">我的购物车</th>
                <td><a class="continue-shopping"
                       href="shoppingServlet?action=shoppingCart">继续购物
                    <b>&gt; </b></a></td>
            </tr>
            </tbody>
        </table>
    </div>

    <%--购物车不为空--%>
    <c:if test="${!empty userShoppingCar}">
        <div class="wrapper" >
            <div class="cart-head">
                <table class="order-table">
                    <tbody>
                    <tr>
                        <th class="check-col">
                            <label class="J_viewCheckAll">
                                <input type="checkbox" name="" id="AllorNot" />全选/全不选<br>
                            </label>
                        </th>
                        <th class="goods-col">商品名称</th>
                        <th class="price-col">价格（元）</th>
                        <th class="quantity-col">数量</th>
                        <th class="sum-col">小计（元）</th>
                        <th class="benefit-col">已优惠</th>
                        <th class="action-col">操作</th>
                    </tr>
                    </tbody>
                </table>
            </div>

            <form action="" method="post">
                <div class="shop-cart-wrap">
                    <div class="prod-list-wrap">
                        <table class="order-table">
                            <tbody id="tbody">

                            <c:forEach items="${userShoppingCar}" var="carGoods" varStatus="status">
                                <tr class="prod-line" value="${carGoods.carId}">
                                    <td>
                                        <input type="checkbox" name="items" value="${carGoods.carId}" />
                                    </td>
                                    <td class="prod-pic column">
                                        <a href="javascript:;" target="_blank">
                                            <div class="figure">
                                                <img src="../${carGoods.imgSrc}">
                                            </div>
                                        </a>
                                    </td>
                                    <td class="goods-col column">
                                        <a class="goods-link" href="javascript:;" target="_blank">
                                                ${carGoods.goodName}
                                        </a>
                                        <br>
                                        作者：${carGoods.producer}
                                    </td>
                                    <td class="price-col column">${carGoods.price * carGoods.discount}</td>
                                    <td class="column">
                                            <span class="number-box">
                                                <a class="reduce-num J_reduceNum J_operate" href="javascript:;">-</a>
                                                <input type="number" name="v_quanity"
                                                       class="count-number prod-num J_viewNum J_operate"
                                                       value="${carGoods.goodNum}"
                                                       title="请输入购买量" readonly="" id="totalCount">
                                                <input type="hidden" id="theCartId" value="${carGoods.carId}">
                                                <a class="add-num J_addNum J_operate" href="javascript:;">+</a>
                                            </span>
                                    </td>
                                    <td class="column">
                                        <span>${carGoods.price * carGoods.discount * carGoods.goodNum}</span>
                                    </td>
                                    <td class="column">
                                        <span>${carGoods.price * (1 - carGoods.discount) * carGoods.goodNum}</span>
                                    </td>

                                    <%--<td class="column"><span class="J_viewDiscount">${carGoods.price * (1 - carGoods.discount)}</span></td>--%>
                                    <%--<td class="J_viewVcoin column">${carGoods.price * carGoods.goodNum}</td>--%>
                                    <td class="column">
                                        <a href="javascript:;" class="favorite J_favorite">加入到收藏夹</a>
                                        <br>
                                        <a href="shoppingServlet?action=delShoppingCar&carId=${carGoods.carId}" class="J_delSingle">删除</a>
                                    </td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="cart-toolbar-wrap">
                    <div class="wrapper">
                        <div class="cart-toolbar-inner cl">
                            <div class="cart-toolbar-right">
                                <table class="cart-toolbar-table">
                                    <tbody>
                                    <tr>
                                        <td class="sum-area">
                                            <p>
                                                已选商品
                                                <span class="getNum">0</span>
                                                件，合计（不含运费）：
                                                <dfn>¥</dfn>
                                                <span class="getTotalPrice">0</span>
                                                </b>
                                            </p>
                                            <p>
                                                ( 商品总价：
                                                <dfn>¥</dfn>
                                                <span class="getTotalPrice">0</span>
                                                优惠：
                                                <dfn>¥</dfn>
                                                <span class="dPrice">0</span>
                                                )
                                            </p>
                                        </td>
                                        <td class="btn-area">
                                            <a href="settlementServlet?action=MyOrderTakeInformation&v_uid=${sessionScope.vivo_user.v_uid}">
                                                <button class="btn--lg cart-btn-submit" type="button" title="去结算">
                                                    <i class="btn-inner">去结算</i>
                                                </button>
                                            </a>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </c:if>

    <%--购物车为空--%>
    <c:if test="${empty userShoppingCar}">
        <div class="wrapper">
            <div class="no-result">
                <div>
                    <img src="../images/no-result.50507a32.png" alt="">
                </div>
                <div class="no-result-des">哎呀，购物车为空！</div>
            </div>

        </div>
        <style>
            .no-result {
                height: 452px;
                background-color: #fff;
                text-align: center;
            }

            .no-result > div > img {
                width: 189px;
                height: 144px;
                margin-top: 76px;
            }

            .no-result-des {
                margin-top: 20px;
                font-size: 15px;
                color: #666;
                text-align: center;
                line-height: 22.5px;
            }
        </style>
    </c:if>

    <input type="hidden" class="hiddenprice" name="price" value="0"/>
    <input type="hidden" name="uid" value="${sessionScope.user.uid}"/>

</div>
<!-- 内容结束 -->

<!-- 底部开始 -->
<%@include file="bookshop-foot.jsp" %>
<!-- 底部结束 -->

<script src="../js/hiddenScllTop.js" type="text/javascript"></script>
<script src="../js/scroll.js" type="text/javascript"></script>
<!--<script src="js/cartAddSuccess.js"></script>-->
<script src="../js/totalShoppingcart.js" type="text/javascript"></script>

<%-- Ajax计算商品数量 --%>
<script src="../js/CartAjax.js"></script>
<script>
    $(function () {
        $(".add-num").click(function () {
            var totalCount = $(this).parents(".prod-line").find("#totalCount").val(); // 数量
            // var J_viewVcoin = $(this).parents(".prod-line").find(".J_viewVcoin").text();// 小计
            var cartId = $(this).parents(".prod-line").attr("value"); // 当前商品
            console.log(totalCount);
            console.log(cartId);
            // console.log(J_viewVcoin);

            var checkId = [];
            if($("input[name='items']:checked").length > 0) {
                $("input[name='items']:checked").each(function (i) {
                    checkId[i] = $(this).val();
                });

                console.log(checkId);
            }

            $.ajax({
                type: "post",
                url: "shoppingServlet?action=editorGoodCount&goodNum=" + totalCount + "&cartId=" + cartId,
                data:{
                    checkId: checkId
                },
                traditional:true, //阻止jquery对数组序列化
                success: function (data) {
                    console.log(data);
                    mydata = $.parseJSON(data);
                    console.log(mydata)
                    console.log(mydata.getNum);
                    console.log(mydata.totalPrice);
                    console.log(mydata.discountPrice);
                    ${carGoods.goodNum} = mydata.getNum;
                    $(".getNum").text(mydata.getNum);
                    $(".getTotalPrice").text(mydata.totalPrice);
                    $(".dPrice").text(mydata.discountPrice);
                    $(".hiddenprice").text(mydata.totalPrice);
                }, error: function (xhr) {
                    console.log(xhr.status);
                }
            });
        });
        $(".reduce-num").click(function () {
            var totalCount = $(this).parents(".prod-line").find("#totalCount").val(); // 数量
            // var J_viewVcoin = $(this).parents(".prod-line").find(".J_viewVcoin").text();// 小计
            var cartId = $(this).parents(".prod-line").attr("value"); // 当前商品
            console.log(totalCount);
            console.log(cartId);
            // console.log(J_viewVcoin);

            var checkId = [];
            if($("input[name='items']:checked").length > 0) {
                $("input[name='items']:checked").each(function (i) {
                    checkId[i] = $(this).val();
                });

                console.log(checkId);
            }

            $.ajax({
                type: "post",
                url: "shoppingServlet?action=editorGoodCount&goodNum=" + totalCount + "&cartId=" + cartId,
                data:{
                    checkId: checkId
                },
                traditional:true, //阻止jquery对数组序列化
                success: function (data) {
                    console.log(data);
                    mydata = $.parseJSON(data);
                    console.log(mydata)
                    console.log(mydata.getNum);
                    console.log(mydata.totalPrice);
                    console.log(mydata.discountPrice);
                    $(".getNum").text(mydata.getNum);
                    $(".getTotalPrice").text(mydata.totalPrice);
                    $(".dPrice").text(mydata.discountPrice);
                    $(".hiddenprice").text(mydata.totalPrice);
                }, error: function (xhr) {
                    console.log(xhr.status);
                }
            });
        });
    });

    $(function() {
        // 原来jQuery自从1.6之后就有了它，attr()太混乱，为了区分，就出现了prop()，
        // 对于checked，若是prop()获取的则是浏览器对于当前变化着的值，即随着点击变化而变化，
        // 而attr()则是浏览器记录checked的初始值，即它的默认值，不会随着改变而改变
        $("#AllorNot").click(function(){
            $("input[name='items']").prop('checked',this.checked);

            var checkId = [];
            if($("input[name='items']:checked").length > 0){
                $("input[name='items']:checked").each(function (i) {
                    checkId[i] = $(this).val();
                });

                console.log(checkId);

                $.ajax({
                    type: 'POST',
                    url: 'shoppingServlet?action=totalPrice',
                    data:{
                        checkId: checkId
                    },
                    traditional:true, //阻止jquery对数组序列化
                    success: function(data){
                        console.log(data);
                        mydata = $.parseJSON(data);
                        console.log(mydata)
                        console.log(mydata.getNum);
                        console.log(mydata.totalPrice);
                        console.log(mydata.discountPrice);
                        $(".getNum").text(mydata.getNum);
                        $(".getTotalPrice").text(mydata.totalPrice);
                        $(".dPrice").text(mydata.discountPrice);
                        $(".hiddenprice").text(mydata.totalPrice);
                    },
                    error:function(data) {
                        console.log(data.msg);
                    },
                });
            } else {
                $(".getNum").text(0);
                $(".getTotalPrice").text(0);
                $(".dPrice").text(0);
                $(".hiddenprice").text(mydata.totalPrice);
            }

        });


        $("input[name='items']").click(function() {
            var flag = true;
            $("input[name='items']").each(function() {
                if (!this.checked) {
                    flag = false;
                }
            });
            $('#AllorNot').prop('checked', flag);

            var checkId = [];
            if($("input[name='items']:checked").length > 0){
                $("input[name='items']:checked").each(function (i) {
                    checkId[i] = $(this).val();
                });

                console.log(checkId);

                $.ajax({
                    type: 'POST',
                    url: 'shoppingServlet?action=calculate',
                    data:{
                        checkId: checkId
                    },
                    traditional:true, //阻止jquery对数组序列化
                    success: function(data){
                        console.log(data);
                        mydata = $.parseJSON(data);
                        console.log(mydata)
                        console.log(mydata.getNum);
                        console.log(mydata.totalPrice);
                        console.log(mydata.discountPrice);
                        $(".getNum").text(mydata.getNum);
                        $(".getTotalPrice").text(mydata.totalPrice);
                        $(".dPrice").text(mydata.discountPrice);
                        $(".hiddenprice").text(mydata.totalPrice);
                    },
                    error:function(data) {
                        console.log(data.msg);
                    },
                });
            } else {
                $(".getNum").text(0);
                $(".getTotalPrice").text(0);
                $(".dPrice").text(0);
                $(".hiddenprice").text(mydata.totalPrice);
            }
        });
    });
</script>
</body>
</html>
