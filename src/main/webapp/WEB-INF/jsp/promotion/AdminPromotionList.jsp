<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="${ctx }/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="${ctx }/css/font_eolqem241z66flxr.css"
          media="all" />
    <link rel="stylesheet" href="${ctx }/css/list.css" media="all" />
    <link rel="stylesheet" href="${ctx }/css/main.css" media="all" />

    <script>
        var ctx = "${ctx}";
    </script>
    <style type="text/css">
        .layui-table-cell {
            font-size:14px;
            padding:0 5px;
            height: 100%;
            max-width: 100%;
            overflow:visible;
            text-overflow:inherit;
            white-space:normal;
            word-break: break-all;
        }
    </style>


</head>
<body class="childrenBody"><!--这个保证内容不会铺满父窗口但是必须要加入main.css-->
<!--blockquote就是引入一种样式-->
<blockquote class="layui-elem-quote list_search">
    <div class="layui-inline">
        <!--&#xe608就是 一个加号的图标-->
        <c:if test="${usertype=='1'}">
            <a class="layui-btn layui-btn-normal promotionAdd_btn"><i class="layui-icon">&#xe608;</i>添加医院公告 </a>
        </c:if>
    </div>
</blockquote>


<table class="layui-table layui-table-cell" id="promotionList" lay-filter="test"></table>  <!--加载管理员列表数据-->
<script type="text/javascript" src="${ctx }/layui/layui.js"></script>
<script type="text/javascript" src="${ctx }/js/promotion/AdminPromotion.js"></script>
<script type="text/javascript" src="${ctx }/js/pubilc.js"></script>


<script type="text/html" id="barEdit">
    <c:if test="${type=='1'}">
        <a class="layui-btn layui-btn-sm layui-btn-danger" lay-event="del" id="delete-promotion" data-key="${type}">
            <i class="layui-icon">&#xe640;</i>
        </a>
    </c:if>
    <c:if test="${type!='1'}">
        <a>
            暂无权限
        </a>
    </c:if>
</script>

</body>
</html>