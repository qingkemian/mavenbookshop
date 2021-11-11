<%--
  Created by IntelliJ IDEA.
  User: ZelongChen
  Date: 2021/11/11
  Time: 18:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="UTF-8">
    <title>BOOKSHOP官方网站</title>
    <link rel="stylesheet" href="../font/iconfont.css">
    <link rel="stylesheet" href="../font/font/iconfont.css">
    <link rel="stylesheet" href="../font/iconfont.css">
    <link rel="stylesheet" type="text/css" href="../css/font_918068_xgekrb9yo88/iconfont.css">
    <link rel="stylesheet" href="../css/base.css">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/index-footer.css">
    <link rel="stylesheet" href="../css/index-footer.css">
    <!-- 平板端 -->
    <link rel="stylesheet" href="../css/index-pad.css" media="screen and (max-width:1199px)">
    <!--手机端 -->
    <link rel="stylesheet" href="../css/index-phone.css" media="screen and (max-width:600px)">
    <link rel="stylesheet" href="../css/footer.css">

</head>
<body>
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
                <img src="../images/gssw-icon-x2_fe90277.png" alt="">
                <span>|</span>
                <span class="iconfont icon-diqiu"><span>中国</span></span>
            </p>

        </div>
    </div>
</div>
<!-- 底部结束 -->
<!-- 返回顶部开始 -->
<style type="text/css">
    #msg {
        position: fixed;
        top: 239px;
        right: 55px;
        z-index: 10000;
        width: 1px;
        height: 52px;
        line-height: 52px;
        font-size: 20px;
        text-align: center;
        color: red;
        background: #ffffff;
        display: none;
        box-shadow: 5px 5px 20px rgba(0, 0, 0, 0.2);
    }
</style>
<ul class="fixed-vivo">
    <li class="vivo-fixed-wrap a" id="vivo-fixed">
        <i class="iconfont icon-g">
            <span id="Number-che">0</span>
        </i>
        <div class="prompt">
            <span class="triangle"></span>
            购物车
        </div>
        <div id="msg">已成功加入购物车！</div>
    </li>
    <li class="vivo-fixed-wrap">
        <i class="iconfont icon-kefu"></i>
        <div class="prompt2">
            <span class="triangle"></span>
            小V客服
        </div>
    </li>
    <li class="vivo-fixed-wrap">
        <i class="iconfont icon-bangzhuzhongxin"></i>
        <div class="prompt3">
            <span class="triangle"></span>
            帮助中心
        </div>
    </li>
    <li class="vivo-fixed-wrap hidden-wrap" onclick="gotoTop()">
        <i class="iconfont icon-fanhuidingbu"></i>
        <div class="prompt4">
            <span class="triangle"></span>
            返回顶部
        </div>
    </li>
</ul>
<!-- 返回顶部结束 -->
<!-- 底部结束 -->
<script src="../js/hiddenScllTop.js" type="text/javascript"></script>

<script src="../js/scroll.js"  ></script>
</body>
</html>
