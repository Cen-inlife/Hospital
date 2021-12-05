<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="${ctx}/layui/css/layui.css">
    <script>
        var ctx = "${ctx}";
    </script>
</head>
<body>
<form class="layui-form" style="width: 80%;">

    <input type="hidden" name="doctor_id" value="${hospital_user.doctor_id}" id="doctor_id"/>


    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-block">
            <input type="text" id="username" class="layui-input"
                   name="username" value="${hospital_user.username}">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">真实姓名</label>
        <div class="layui-input-block">
            <input type="text" id="realname" class="layui-input userName"
                   lay-verify="required" placeholder="请输入真实姓名" name="realname"
                   value="${hospital_user.realname}">
        </div>
    </div>




    <div class="layui-form-item">
    <div class="layui-input-inline">
        <select name="depart_id" id="depart_id">
            <option value="-1">请选择所属科室</option>
            <c:forEach items="${departs}" var="c">
            <option value="${c.depart_id}" <c:if test="${c.depart_id==doctor.depart_id}">selected</c:if>>${c.depart_name}</option>
            </c:forEach>
        </select>
    </div>
    </div>
    <div class="layui-form-item">
    <div class="layui-input-inline" >
        <select name="rank" class="" id="rank">
            <option value="-1">请选择医生级别</option>
            <option value="0"  <c:if test="${doctor.rank==0}">selected</c:if>>行政主任</option>
            <option value="1" <c:if test="${doctor.rank==1}">selected</c:if>>主任医师</option>
            <option value="2" <c:if test="${doctor.rank==2}">selected</c:if>>副主任医师</option>
            <option value="3" <c:if test="${doctor.rank==3}">selected</c:if>>主治医师</option>
            <option value="4" <c:if test="${doctor.rank==4}">selected</c:if>>副主治医师</option>
            <option value="5" <c:if test="${doctor.rank==5}">selected</c:if>>实习</option>
        </select>
    </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="updateDoctor">立即保存</button>
        </div>
    </div>
</form>
<script type="text/javascript" src="${ctx }/layui/layui.js"></script>
<script type="text/javascript" src="${ctx }/js/admin/editDoctor.js"></script>
<script type="text/javascript" src="${ctx }/js/pubilc.js"></script>
</body>
</html>















