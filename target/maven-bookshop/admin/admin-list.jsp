<%--
  Created by IntelliJ IDEA.
  User: ZelongChen
  Date: 2021/11/3
  Time: 15:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="Bookmark" href="/favicon.ico" >
    <link rel="Shortcut Icon" href="/favicon.ico" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="lib/html5shiv.js"></script>
    <script type="text/javascript" src="lib/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
    <!--[if IE 6]>
    <script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <title>管理员列表</title>
</head>
<body>
<nav class="breadcrumb">
    <i class="Hui-iconfont">&#xe67f;</i> 首页
    <span class="c-gray en">&gt;</span> 管理员管理
    <span class="c-gray en">&gt;</span> 管理员列表
    <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" id="btn-refresh" href="javascript:;" onclick="admin_refresh()" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
</nav>
<div class="page-container">
    <div class="text-c">
        <input type="hidden" name="totalPage" id="totalPage" value="${totalPage}">
        <form action="adminServlet" method="post" id="queryAdmin">
            <input type="hidden" name="action" value="adminList"> <!-- 注意！！！ -->
            <input type="hidden" name="currPage" id="currPage" value="${currPage}">
            <input type="text" class="input-text" style="width:250px" placeholder="输入账号" id="" value="${query_name}" name="query_name">
            <button type="submit" class="btn btn-success"><i class="Hui-iconfont">&#xe665;</i> 查询</button>
        </form>
    </div>
    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
            <a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
            <a href="javascript:;" onclick="admin_add('添加管理员','admin/admin-add.jsp','800','500')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加管理员</a>
        </span>
        <span class="r">共有数据：<strong>${total}</strong> 条</span>
    </div>
    <table class="table table-border table-bordered table-bg">
        <thead>
        <tr>
            <th scope="col" colspan="9">员工列表</th>
        </tr>
        <tr class="text-c">
            <th width="25"><input type="checkbox" name="" value=""></th>
            <th width="40">序号</th>
            <th width="300">账号</th>
            <th width="300">密码</th>
            <th width="50">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${adminlist}" var = "admin" varStatus="vs">
        <tr class="text-c">
            <td><input type="checkbox" value="${admin.id}" name="check"></td>
            <td>${vs.count + pageSize * (currPage - 1)}</td>
            <td>${admin.name}</td>
            <td>${admin.password}</td>
            <td class="td-manage">
                <a title="编辑" href="adminServlet?action=editAdminInit&id=${admin.id}" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
                <a title="删除" href="javascript:;" onclick="admin_del(${admin.id})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
                <input type="hidden" name="delMsg" id="delMsg" value="${delMsg}">
            </td>
        </tr>
        </c:forEach>

        <tr>
            <td colspan="9" style="text-align: center;">
                <span>当前页是${currPage}</span>&nbsp;<a href="javascript:;" onclick="prePage()">上一页</a>    <a href="javascript:;" onclick="nextPage()">下一页</a>
            </td>
        </tr>

        </tbody>
    </table>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="lib/datatables/1.10.15/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
    /*下一页*/
    function nextPage() {
        var totalPage = $("#totalPage").val();
        var old = $("#currPage").val();
        console.log("old:"+old);
        console.log("totalPage"+totalPage);
        if (old < totalPage) {
            $("#currPage").val(parseInt(old)+1);
            $("#queryAdmin").submit();
        } else {
            layer.msg('当前页已经是最后一页!',{icon:1,time:1000});
        }
    }

    /*上一页*/
    function prePage() {
        var old = $("#currPage").val();
        if (old > 1) {
            $("#currPage").val(parseInt(old)-1);
            $("#queryAdmin").submit();
        } else {
            layer.msg('当前页已经是第一页!',{icon:1,time:1000});
        }

    }

    /*
        参数解释：
        title	标题
        url		请求的url
        id		需要操作的数据id
        w		弹出层宽度（缺省调默认值）
        h		弹出层高度（缺省调默认值）
    */
    /*管理员-增加*/
    function admin_add(title,url,w,h){
        layer_show(title,url,w,h);
    }

    /*管理员-删除*/
    function admin_del(id){
        layer.confirm('确认要删除吗？',function(index){
            $.ajax({
                type: 'POST',
                url: 'adminServlet?action=delAdmin',
                data:{
                  'id': id
                },
                success: function(data){
                    layer.msg("已删除",{icon:1,time:1000},function () {
                        // window.location.href只传链接 属性会置null 传入参数可解决
                        window.location.href = "adminServlet?action=adminList&currPage="+$("#currPage").val();
                    });
                },
                error:function(data) {
                    console.log(data.msg);
                },
            });
        });
    }

    /*批量删除*/
    function datadel() {
        layer.confirm('确认要删除吗？',function () {
           var checkId = [];
           if($("input[name=check]:checked").length > 0){
               $("input[name=check]:checked").each(function (i) {
                   checkId[i] = $(this).val();
               });

               console.log(checkId);
               $.ajax({
                   type: 'POST',
                   url: 'adminServlet?action=delBatch',
                   data:{
                       checkId: checkId
                   },
                   traditional:true, //阻止jquery对数组序列化
                   dataType:"text",
                   success: function(data){
                       layer.msg("已删除",{icon:1,time:1000},function () {
                           // window.location.href只传链接 属性会置null 传入参数可解决
                           window.location.href = "adminServlet?action=adminList&currPage="+$("#currPage").val();
                       });
                   },
                   error:function(data) {
                       console.log(data.msg);
                   },
               });
           }
        });
    }

    /*管理员-编辑*/
    function admin_edit(title,url,id,w,h){
        layer_show(title,url,w,h);
    }

    /*页面刷新*/
    function admin_refresh() {
        console.log("refresh");
        window.location.href = "adminServlet?action=adminList&currPage="+$("#currPage").val();
    }
</script>
</body>
</html>