<%--
  Created by IntelliJ IDEA.
  User: ZelongChen
  Date: 2021/11/11
  Time: 23:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>



<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <title>BOOKSHOP收银台</title>
    <link rel="stylesheet" href="../css/VIVOCheckout.css">
</head>
<body>
<%@include file="bookshop-top.jsp" %>
<div id="app">
    <div data-v-4267f8ed="" class="home-wrap middle-content">
        <div data-v-4267f8ed="" class="content-wrap"><h2 data-v-4267f8ed="" class="title">BOOKSHOP收银台</h2>
            <div data-v-3d141c7c="" data-v-4267f8ed="" class="info-wrap">
                <div data-v-3d141c7c="" class="content"><p data-v-3d141c7c="" class="fee"><span data-v-3d141c7c="">订单提交成功，请尽快完成付款！订单金额：</span>
                    <span data-v-3d141c7c="" class="fee-num">￥${totalPrice}</span></p> <!----> <p data-v-3d141c7c=""
                                                                                                                        class="count-down"><span
                >请您在提交订单后</span> <span data-v-3d141c7c="" class="count-time">29分钟</span> <span
                        data-v-3d141c7c="">内完成支付，否则订单会自动取消</span></p>
                    <div data-v-3d141c7c="" class="hr"></div>
                    <div data-v-3d141c7c="" class="detail-title " ><span data-v-3d141c7c="">订单详情</span> <i
                            data-v-3d141c7c=""></i></div>
                    <ul data-v-3d141c7c="" >
                        <li data-v-3d141c7c=""><span data-v-3d141c7c="" class="fl">收货信息：</span>
                            <p data-v-3d141c7c="" class="fr"><i data-v-3d141c7c="">${attAddress.name}</i> <i
                                    data-v-3d141c7c="">
                                    <span value="${attAddress.phone}">
                                        <c:out value="${fn:substring(attAddress.phone,0,3)}****"></c:out>
                                    <c:out value="${fn:substring(attAddress.phone, 7,11)}"></c:out>
                                    </span>
                            </i> <i data-v-3d141c7c="">${attAddress.province} ${attAddress.city} ${attAddress.district} ${attAddress.detailed} </i></p></li>
                    </ul>
                </div>

            </div>
        </div>
    </div>
</div>
<%@include file="bookshop-foot.jsp"%>
</body>
</html>
<script src="../js/jquery-1.9.1.min.js"></script>
<script>
    $(function () {
        $(".spread-wrap").stop().slideUp(0);
        $(".detail-title").click(function () {
            $(".spread-wrap").stop().slideToggle(500);
            $(this).toggleClass("active");
        });
    });
</script>
