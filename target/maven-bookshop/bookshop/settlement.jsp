<%--
  Created by IntelliJ IDEA.
  User: ZelongChen
  Date: 2021/11/11
  Time: 23:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="utf-8">
    <title>核对订单信息</title>
    <script src="../js/jquery-1.10.1.min.js"></script>
    <link rel="stylesheet" href="../css/take.css">
    <link rel="stylesheet" type="text/css" href="../css/settlement.css"/>
    <link rel="stylesheet" href="../css/pick-pcc.min.1.0.1.css">
    <script type="text/javascript"
            src="../js/pick-pcc.min.1.0.1.js"></script>
</head>
<body>
<%@include file="bookshop-top.jsp" %>
<div id="content" class="cl">
    <div class="wrapper">
        <div class="main-title-module">
            <h1 class="main-title-txt">核对订单信息</h1>
        </div>
        <dl class="confirm-module">
            <dd class="address-info" id="J_adressList">
                <ul class="adress-list">
                    <li class="address-item J_address-item new " id="use-new-address" name="address">
                        <label class="inner">添加新地址</label>
                    </li>

                    <%--所有收货地址--%>
                    <c:forEach items="${allTake}" var="a" varStatus="status">
                        <li class="address-item J_address-item v_tids" name="address" value="${a.addressId}">
                            <label class="inner" id="J_addressDefaulted">
                                <div class="item-top">
                                    <span class="v_consignee">${a.name}</span>
                                    <span value="${a.phone}" class="mobilePhone">
                                        <c:out value="${fn:substring(a.phone,0,3)}****"></c:out>
                                    <c:out value="${fn:substring(a.phone, 7,11)}"></c:out>
                                    </span>
                                </div>
                                <div class="cl">
                                    <p>
                                        <span value="${a.province}">${a.province}</span>
                                        <span value="${a.city}">${a.city}</span>
                                        <span value="${a.district}">${a.district}</span>
                                        <span value="${a.detailed}">${a.detailed}</span>
                                    </p>
                                </div>
                            </label>
                            <ul class="operations">
                                <li value="" class="operations-address-set-default ">默认地址</li>
                                <li value="" class="operations-address-edit"><a href="javascript:;" class="editor">编辑</a></li>
                                <li value="" class="operations-address-del"><a href="javascript:;" class="del">删除</a>
                                </li>
                            </ul>
                        </li>
                    </c:forEach>


                </ul>

            </dd>
        </dl>
        <div class="panelWrap">
            <div class="mask"></div>
            <div class="panel dialog-container"><a class="icon-close cancelSaveAddress" href="javascript:;"><i
                    class="code-close"><i></i><i></i></i></a>
                <div class="dialog-title">新建收货地址</div>

                <%-- 添加收货地址 --%>
                <form id="shipping-address-new-edit" method="post"
                      action="settlementServlet?action=addAddress">
                    <%--&character-set-server=utf8&useUnicode=true&characterEncoding=UTF-8--%>
                    <table class="address-info-new">
                        <tbody>
                        <c:forEach items="${userShoppingCar}" var="carGoods" varStatus="status">
                            <input type="hidden" name="cartId" id="" value="${carGoods.carId}">
                        </c:forEach>

                        <tr>
                            <th><strong>*</strong>收货人：</th>
                            <td><input type="text" name="name" id="receiverName"></td>
                        </tr>
                        <tr>
                            <th><strong>*</strong>手机号码：</th>
                            <td class="phone"><input type="tel" name="phone" id="mobilePhone"></td>
                        </tr>
                        <tr class="reginContriner-row">
                            <th><strong>*</strong>收货地区：</th>
                            <td id="j_ReginContriner">
                                <div class="err-box">
                                    <a href="javascript:void(0)" class="pick-area pick-area6" name="ah"></a>
                                    <input type="hidden" name="address" id="getAddress">
                                    <input type="hidden" name="province" id="getProvince">
                                    <input type="hidden" name="city" id="getCity">
                                    <input type="hidden" name="district" id="getDistrict">
                                </div>
                            </td>

                        </tr>
                        <tr class="address-row">
                            <th><strong>*</strong>详细地址：</th>
                            <td><input type="text" name="detailed" id="detailAddress"></td>
                        </tr>

                        <tr class="defaultAddr-row">
                            <th></th>
                            <%--<td>
                                <label class="da-label"><input name="isDefault" type="checkbox" class="i-da-chkbox"><span
                                        class="icon-checkbox "></span>设为默认地址</label>
                            </td>--%>
                        </tr>
                        </tbody>
                    </table>
                    <div class="area-pane-btns">
                        <button type="submit" class="btn--md btn--pop" id="saveAddress"><i class="btn-inner">保存</i>
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <div class="panelWrap panelWrapTwo">
            <div class="mask"></div>
            <div class="panel dialog-container"><a class="icon-close cancelSaveAddress" href="javascript:;"><i
                    class="code-close"><i></i><i></i></i></a>
                <div class="dialog-title">编辑收货地址</div>

                <%-- 编辑收货地址 --%>
                <form id="shipping-address-new-edit-panelWrapTwo" method="post"
                      action="settlementServlet?action=editorTakeInformationTwo">
                    <table class="address-info-new">
                        <tbody>
                        <tr style="display:none;">
                            <th><strong>*</strong>id：</th>
                            <td><input type="text" name="v_tid"></td>
                        </tr>
                        <tr>
                            <th><strong>*</strong>收货人：</th>
                            <td><input type="text" name="v_consignee"></td>
                        </tr>
                        <tr>
                            <th><strong>*</strong>手机号码：</th>
                            <td class="phone"><input type="tel" name="v_phone"></td>
                        </tr>
                        <tr class="reginContriner-row">
                            <th><strong>*</strong>收货地区：</th>
                            <td class="j_ReginContriner">
                                <div class="err-box">
                                    <a href="javascript:void(0)" class="pick-area pick-area6" name=""></a>
                                    <input type="hidden" name="v_address">
                                </div>
                            </td>

                        </tr>
                        <tr class="address-row">
                            <th><strong>*</strong>详细地址：</th>
                            <td><input type="text" name="v_receivingArea" class="detailAddress" autocomplete="off"></td>
                        </tr>

                        <tr class="defaultAddr-row">
                            <th></th>
                            <%--<td>
                                <label class="da-label"><input name="isDefault" type="checkbox" class="i-da-chkbox"><span
                                        class="icon-checkbox "></span>设为默认地址</label>
                            </td>--%>
                        </tr>
                        </tbody>
                    </table>
                    <div class="area-pane-btns">
                        <button type="button" class="btn--md btn--pop" id="saveAddress-two"><i class="btn-inner">保存</i>
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <dl class="confirm-module">
            <dt class="module-title">支付方式
                <small id="j_payTypeText">已选择：
                    在线支付
                </small>
            </dt>
            <dd class="delivery-info paymethod-info cl">
                <input type="hidden" id="curPaymethod" name="" value="online_pay">
                <div class="pay-method  on" value="online_pay" paymethodindex="0">
                    在线支付
                    <i></i>
                </div>
                <div class="pay-method" value="ali_pay_hbfq" paymethodindex="1" ishbfq="true">
                    花呗分期
                    <i></i>
                </div>
                <div class="pay-method" value="cod_pay" paymethodindex="2" style="display:none">
                    货到付款
                    <i></i>
                </div>

                <div class="pay-method-more" id="J_payMethodMore">
                    更多支付方式 <b>&gt;</b>
                </div>
            </dd>
            <dd class="pay-method-help hidden" style="display: block;">
                <p>支持支付宝和微信支付</p>
            </dd>

        </dl>


        <div class="confirm-module confirm-cart-module">
            <table class="main-title-module">
                <tbody>
                <tr>
                    <td class="main-title-txt">确认商品</td>
                </tr>
                </tbody>
            </table>
            <div class="cart-head">
                <table class="order-table">
                    <tbody>
                    <tr>
                        <th class="goods-col">商品名称</th>
                        <th class="price-col">价格（元）</th>
                        <th class="quantity-col">数量</th>
                        <th class="sum-col">小计（元）</th>
                    </tr>

                    </tbody>
                </table>
            </div>

            <div class="prod-bundle">
                <input type="hidden" class="order-commodity-main">
                <div class="prod-list-wrap">
                    <form action="checkoutServlet?action=checkout"
                          method="post" id="form_vivoOrder">

                        <table class="order-table J_viewTBody">
                            <tbody id="tbody">

                            <c:forEach items="${userShoppingCar}" var="carGoods" varStatus="status">
                                <tr class="prod-line" value="${carGoods.carId}">
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
                                                <input type="number" name="v_quanity"
                                                       class="count-number prod-num J_viewNum J_operate"
                                                       value="${carGoods.goodNum}"
                                                       title="数量" readonly="readonly" id="totalCount">
                                                <input type="hidden" id="theCartId" value="${carGoods.carId}">
                                                <input type="hidden" id = "mynum111" value="${carGoods.price * carGoods.discount}">
                                                <input type="hidden" id ="mynum222" value="${carGoods.price * (1 - carGoods.discount)}">
                                            </span>
                                    </td>
                                    <td class="column">
                                        <span class = "oneTotalPrice">${carGoods.price * carGoods.discount * carGoods.goodNum}</span>
                                    </td>
                            </c:forEach>

                            </tbody>
                        </table>
                    </form>
                </div>

            </div>


        </div>


        <style>
            [v-cloak] {
                display: none;
            }
        </style>
        <div id="order-settle">

            <div class="confirm-module confirm-total-amount cl ">
                <div class="other-info right-box ">
                    <table>
                        <tbody>
                        <tr class="order-sum">
                            <td><label>已选<em class="total-Count">1</em>件商品，合计（不含运费）：</label></td>
                            <td><dfn>¥</dfn><span class="Totalprice">1398.00</span></td>
                        </tr>
                        <tr class="order-sum">
                            <td><label>运费：</label></td>
                            <td><span><dfn>¥</dfn><span>0.00</span></span></td>
                        </tr>
                        <tr class="order-sum">
                            <td><label>优惠：</label></td>
                            <td><span class="red">-<dfn>¥</dfn><span class="J_totalDiscount">300.00</span></span></td>
                        </tr> <!----> <!---->

                        </tbody>
                    </table>
                </div>
                <div class="real-price-box"><label>应付总额：</label><span
                        class="real-price red"><dfn>¥</dfn><span class="priceTotal">1098.00</span></span></div> <!---->
                <ul class="delivery-address">
                    <li class="item receiver-name"><label>收件人：</label><span id="receivePerson">请选择收货信息</span>
                    </li>
                    <li class="item"><label>配送地址：</label><span id="receiveAddress">请选择收货信息</span></li>
                </ul>
                <div class="confirm-btn-box">
                    <div class="confirm-item"><!---->
                        <button type="button" id="btn-submit-order" title="提交订单" class="btn--lg confirm-btn--submit"><i
                                class="btn-inner">提交订单</i></button>
                    </div> <!----></div>
            </div>
        </div>


    </div>


</div>
<%@include file="bookshop-foot.jsp" %>
<script>
    $(function () {
        // 计算全选总价格

        function totalChecked() {
            var prices = 0;
            var numCount = 0;
            var di = 0;
            $("#tbody").find("tr").each(function (i, ele) {

                // 获取数量
                var num = parseInt($(ele).find(".column-number").text());
                // 获取商品价格
                var $price = parseInt($(ele).find(".price-col").text());
                console.log($price);
                // 优惠计算
                var discounts = num * 100;
                // 进行计算小计
                var priceTotal = ($price * num) - discounts;
                // 计算总金额
                // 保存上一次的金额进行累加
                prices += priceTotal;
                // 保存上一次数量
                numCount += num;
                di += discounts;
                // 设置优惠
                $(ele).find(".J_viewDiscount").text(discounts);
                // 优惠
                $(".J_totalDiscount").text(di);
                // 进行设置小计
                $(ele).find(".J_viewVcoin").text(priceTotal);
                // 设置总金额
                $(".Totalprice").text(prices);
                $(".priceTotal").text(prices);
                // 设置商品数量 J_totalSkuNum
                $(".total-Count").text(numCount);

            });

        }


        totalChecked();
    });
</script>
<script>
    $(function () {
        $("#use-new-address").click(function () {
            $(".panelWrap").fadeIn(500);
            $(".panelWrap.panelWrapTwo").fadeOut();
        });
        $(".cancelSaveAddress").click(function () {
            $(this).parents(".panelWrap").fadeOut(500);
        });
        $(".da-label").click(function () {
            $(this).find("span").toggleClass("checked");
            return false;
        });
        /*     $(".operations").click(function () {
                 $(this).find(".operations-address-set-default").text("【默认地址】");
             });*/
        $(".btn-inner").click(function () {

            /* 使用ajax进行获取收货地址信息 */
            /*$.ajax({
                 type: "post",
                 url: "/settlementServlet?action=addTakeInformation",
                 data:"v_uid=",
                 success: function (msg) {
                     var obj = eval(msg);
                     console.log(obj);



                 }, error: function (xhr) {
                     console.log(xhr.status);
                 }
             });*/
            // 非空判断
            var receiverName = $("#receiverName").val();

            $(".cancelSaveAddress").parents(".panelWrap").fadeOut(500);

        });
        var v_tid;
        $(".adress-list li").on("click", function () {
//  获取地址的id
            v_tid = $(this).attr("value");
            console.log(v_tid);
// 获取收货人
            var v_consignee = $(this).find("#J_addressDefaulted>.item-top>span").text();
// 获取电话号码
            var phone = $(this).find("#J_addressDefaulted>.item-top>.mobilePhone").val();
// 获取收货地址
            var address = $(this).find("#J_addressDefaulted>.cl span").text();

// 设置收货人和电话号码
            $("#receivePerson").text(v_consignee);
// 设置收货地址
            $("#receiveAddress").text(address);
        });


        $("#btn-submit-order").click(function () {
            /*  var priceTotal = $(".priceTotal").text();
            var prodline = $(".prod-line").attr("value");
            var totalCount = $(".column-number").val();
            var J_viewVcoin = $(".J_viewVcoin").text();
            var v_editionNo_ = $(".v_editionNo_v_colorNo[v_editionNo]").attr("v_editionNo");
            var v_colorNo_ = $(".v_editionNo_v_colorNo[v_colorNo]").attr("v_colorNo");
            window.location.href = "&v_totlePrice="+priceTotal+"&v_tid="+v_tid+"&v_gid"+prodline+"&v_count="+totalCount+"&v_price="+J_viewVcoin+"&v_editionNo="+v_editionNo_+"&v_colorNo="+v_colorNo_;
            */


            $("#v_totlePrice").val($(".priceTotal").text());
            console.log($(".v_tid"));
            $(".v_tid").val(v_tid);


            $("#form_vivoOrder").submit();
        });
    });
</script>
<%--province/city/county  -------> 效果是“请选择省/请选择市/请选择县”--%>
<script>
    $(function () {
        $(".pick-area6").pickArea({
            "format": "上海市/市辖区/普陀区", //格式
            "width": "340",
            "borderColor": "#ff8c00",//文本边框的色值
            "arrowColor": "#ff8c00",//下拉箭头颜色
            "listBdColor": "#ff8c00",//下拉框父元素ul的border色值
            "color": "#ff8c00",//字体颜色
            "hoverColor": "#ff8c00",
            //"preSet":"山东省/临沂市/兰陵县",
            "getVal": function () {
                console.log($(".pick-area-hidden").val());
                console.log($(".pick-area-dom").val());
                $("#getAddress").val($(".pick-area-hidden").val());
                var thisdom = $("." + $(".pick-area-dom").val());
                thisdom.next().val($(".pick-area-hidden").val());
                var splitStr = $(".pick-area-hidden").val();
                strs=splitStr.split(" "); //字符分割
                for (i=0;i<strs.length ;i++ )
                {
                    if (i==0){
                        $("#getProvince").val(strs[i]);
                    }  else if(i==1){
                        $("#getCity").val(strs[i]);
                    } else if(i==2){
                        $("#getDistrict").val(strs[i]);
                    }
                    console.log(strs[i]+"<br/>"); //分割后的字符输出
                }
            }
        });
        $(".address-item").click(function () {
            $(this).addClass("on");
            $(this).siblings().removeClass("on");
        });
    })
</script>
<script>
    $(".del").click(function () {
        var $this = $(this);
        var v_tid = $(".v_tids").attr("value");
        console.log(v_tid);
        if (confirm("确定删除该收货地址?")) {
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/settlementServlet?action=delTakeInformation&v_uid=${sessionScope.vivo_user.v_uid}&v_tid=" + v_tid,
                success: function (msg) {
                    console.log(msg);
                    $this.parents(".v_tids").remove();
                }
            })
        }
    });
</script>
<script>
    $(function () {
        $(".editor").click(function () {
            var $this = $(this);
            var v_tid = $this.parents(".address-item.J_address-item").attr("value");
            console.log(v_tid + "aa");
            $(".panelWrap.panelWrapTwo").fadeIn(500);
            $(".panelWrap.panelWrapTwo").find(".dialog-title").text("编辑收货地址");
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/settlementServlet?action=getV_tidINfo&v_uid=${sessionScope.vivo_user.v_uid}&v_tid=" + v_tid,
                success: function (msg) {
                    var obj = eval("(" + msg + ")");
                    console.log(obj);
                    $("input[name=v_consignee]").val(obj.v_consignee);
                    $("input[name=v_phone]").val(obj.v_phone);
                    $("input[name=v_address]").val(obj.v_address);
                    $("input[name=v_receivingArea]").val(obj.v_receivingArea);
                    $("input[name=v_tid]").val(obj.v_tid);

                    $("#saveAddress-two").click(function () {
                        $("#shipping-address-new-edit-panelWrapTwo").submit();
                    });

                }

            })

        });


    });
</script>

<script language="javascript">
    str="2,2,3,5,6,6"; //这是一字符串
    var strs= new Array(); //定义一数组

    strs=str.split(","); //字符分割
    for (i=0;i<strs.length ;i++ )
    {
        document.write(strs[i]+"<br/>"); //分割后的字符输出
    }
</script>
</body>
</html>
