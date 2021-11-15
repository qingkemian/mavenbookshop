<%--
  Created by IntelliJ IDEA.
  User: ZelongChen
  Date: 2021/11/11
  Time: 22:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <base href="..">
    <meta charset="UTF-8">
    <title>个人中心</title>
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
    <link rel="stylesheet" href="../css/personal.css">

</head>
<body class="buy-process">
<%@include file="bookshop-top.jsp" %>

<!-- 内容开始 -->
<div class="content">
    <div class="wrapper">
        <div class="crumbs">
            <a href="#">商城首页</a>
            <b class="c1 iconfont icon-fanhuidingbu"></b>
            <a href="#">会员中心</a>
            <b class="c1 iconfont icon-fanhuidingbu"></b>
            我的订单
        </div>
    </div>
    <div class="wrapper">
        <aside class="menu-bar">
            <ul class="portrait-box">
                <li>
                    <a href="#" title="编辑资料">
                        <img width="160"
                             src="../images/111347us9sszkewzz5xso2.png">
                    </a>
                </li>
                <li class="mem-name member-menu-nickName">${sessionScope.vivo_user.v_user}</li>
                <li class="vcoin-info">我的积分：<a href="#"><span class="red member-vcoin-number">0</span></a></li>
            </ul>
            <dl id="j_MyCenterMenus" class="menu">
                <dt class="menu-title">交易管理</dt>
                <dd class="menu-item on"><a
                        href="personalServlet?action=queryPersonalOrder">我的订单</a>
                </dd>
                <dd class="menu-item"><a href="#">我的回收单</a></dd>
                <dd class="menu-item"><a href="#">退款/退货</a></dd>
                <dd class="menu-item"><a href="#">我的奖品</a></dd>
                <dd class="menu-item"><a href="#">我的积分</a></dd>
                <dt class="menu-title">评价管理</dt>
                <dd class="menu-item"><a href="#">评价晒单</a></dd>
                <dt class="menu-title">我的账户</dt>
                <dd class="menu-item"><a
                        href="#">个人资料</a></dd>
                <dd class="menu-item"><a href="personalServlet?action=initAddress">收货地址</a></dd>
                <dd class="menu-item"><a href="#">我的礼包广场</a></dd>
                <dd class="menu-item"><a href="#">我的换新鼓励金</a></dd>
                <dd class="menu-item"><a href="#">我的优惠券</a></dd>
                <dd class="menu-item"><a href="#">我的收藏</a></dd>
            </dl>
        </aside>

        <article class="v-content">
            <dl id="member-order-list">
                <dt class="module-title">我的订单</dt>
                <dd class="module-item">
                    <ul class="statistic-tags cl">
                        <li class="on">
                            <a href="personalServlet?action=queryPersonalOrder">我的订单</a>
                        </li>
                        <li>
                            <a href="personalServlet?action=obligations">待付款</a>
                        </li>
                        <li>
                            <a href="personalServlet?action=stayGoods">待收货</a>
                        </li>
                        <li>
                            <a href="personalServlet?action=Done&v_uid">已完成</a>
                        </li>
                        <li>
                            <a href="personalServlet?action=closed&v_uid">已关闭</a>
                        </li>
                    </ul>

                    <div class="list-caption">
                        <div class="col col0">商品</div>
                        <div class="col col1">数量</div>
                        <div class="col col2">价格</div>
                        <div class="col col3">状态</div>
                        <div class="col col4">操作</div>
                    </div>

                    <c:if test="${empty personalLists}">
                        <div class="no-record no-order" style="font-size: 17px;text-align: center;color: red;">
                            <div class="icon"></div>
                            <span>您还没有订单</span>
                        </div>
                    </c:if>

                    <c:if test="${!empty personalLists}">
                        <c:forEach items="${personalLists}" var="personalList" varStatus="stutas">

                            <c:forEach items="${personalList}" var="personal" varStatus="stutas">
                                <table class="order-table">
                                    <colgroup>
                                        <col width="155">
                                        <col>
                                        <col class="col1">
                                        <col class="col2">
                                        <col class="col3">
                                        <col class="col4">
                                    </colgroup>
                                        <%--每张订单的头--%>
                                    <tbody> <%-- 动态生成 --%>
                                    <tr>
                                        <th colspan="6" class="order-title">
                                            <ul>
                                                <li class="order-number">订单号：
                                                    <a href="#">${personal.orderNo}</a>
                                                </li>
                                                <li class="order-time">成交时间:
                                                        ${personal.time}
                                                </li>
                                                <li class="order-del btn-href" orderno="${personal.orderNo}">
                                                    <span class="text">删除订单</span>
                                                </li>
                                            </ul>
                                        </th>
                                    </tr>
                                    </tbody>
                                        <%--每张订单的内容--%>
                                    <tbody>

                                    <tr class="order-line">

                                        <td colspan="4">
                                            <table class="order-sub-table">
                                                <colgroup>
                                                    <col width="155">
                                                    <col>
                                                    <col class="col1">
                                                    <col class="col2">
                                                </colgroup>

                                                <tbody class="prod-item ">
                                                <tr class="prod-line">
                                                    <td class="prod-pic">
                                                        <a class="figure" href="#" target="_blank">
                                                            <img src="../${personal.imgSrc}"
                                                                 alt="">
                                                        </a>
                                                    </td>
                                                    <td colspan="3">
                                                        <table class="prods-info-table">
                                                            <colgroup>
                                                                <col width="80">
                                                                <col>
                                                                <col width="66">
                                                                <col width="108">
                                                            </colgroup>
                                                            <tbody>
                                                            <tr class="prod-info">
                                                                <td class="prod-name" colspan="2">
                                                                    <a href="goodsServlet?action=productDetails&goodNo=${my.v_goodid}"
                                                                       target="_blank"
                                                                       title="${personal.goodName}"> ${personal.goodName} </a>
                                                                    <br>作者：${personal.producer}
                                                                </td>
                                                                <td> ${personal.goodNum} </td>
                                                                <td>
                                                                        ${personal.price}
                                                                </td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                                </tbody>


                                            </table>
                                        </td>
                                        <td class="status">
                                                ${personal.state}
                                        </td>
                                        <td class="operation">
                                            <ul>
                                                <li><a href="#">查看订单</a></li>
                                            </ul>
                                        </td>
                                    </tr>

                                    <tr class="operation-line">
                                        <td colspan="6">
                                            <div class="amount">
                                                应付总额：
                                                <span class="money brand-red">
                            <dfn>¥</dfn>${personal.total}
                        </span>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>

                            </c:forEach>

                        </c:forEach>
                        <%-- 判断是否有订单数据 --%>
                    </c:if>


                </dd>
            </dl>
            <div>
                <form id="orderPayform" method="post"></form>
            </div>


            <div class="cl">
                <div class="pull-right">
                    <div class="span12 clearfix">

                    </div>
                </div>
            </div>
            <script type="text/html" id="cause-tpl">
                <div class="cause-pop">
                    <div class="tit">温馨提示：订单一旦取消，无法恢复。已使用优惠券，换新鼓励金，已支付金额会通过原支付路径进行返还</div>
                    <div class="cause-list">
                        <label class="item"><input type="radio" name="cause"
                                                   value="01"><span>订单不能按时送达</span></label>
                        <label class="item"><input type="radio" name="cause"
                                                   value="02"><span>操作有误（商品，地址等选错）</span></label>
                        <label class="item"><input type="radio" name="cause"
                                                   value="03"><span>重复下单／误下单</span></label>
                        <label class="item"><input type="radio" name="cause"
                                                   value="04"><span>其他渠道价格更低</span></label>
                        <label class="item"><input type="radio" name="cause"
                                                   value="05"><span>不想买了</span></label>
                        <label class="item"><input type="radio" name="cause"
                                                   value="06"><span>其他原因</span></label>
                    </div>
                </div>
            </script>
        </article>
    </div>
</div>
<!-- 内容结束 -->

<!-- 底部开始 -->
<%@include file="bookshop-foot.jsp" %>
<!-- 底部结束 -->

<script src="../js/hiddenScllTop.js" type="text/javascript"></script>
<script src="../js/scroll.js" type="text/javascript"></script>
<!--<script src="js/cartAddSuccess.js"></script>-->
<script src="../js/totalShoppingcart.js" type="text/javascript"></script>
<script>
    $(function () {
        $(".order-del").click(function () {
            var orderno = $(this).attr("orderno");
            console.log($(this).attr("orderno"));

            window.location.href = "..personalServlet?action=delOrder&v_uid=${sessionScope.vivo_user.v_uid}&v_myOrderNo=" + orderno;

            /*    $.ajax({
                   type:"post",
                   url:",
                   success:function (msg) {
                       console.log(msg);
                   } ,error:function (xhr) {

                    }
                });*/
        });
    });
</script>
</body>
</html>
