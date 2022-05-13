<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/2/5
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme()
            + "://"
            + request.getServerName()
            + ":"
            + request.getServerPort()
            + request.getContextPath()
            + "/";

//    pageContext.setAttribute("basePath",basePath);
%>

<!--写base标签，永远固定相对路径跳转的结果-->
<base href="<%=basePath%>">
<%--<link type="text/css" rel="stylesheet" href="static/css/style.css" >--%>
<!-- 导入基础样式 -->
<link type="text/css" rel="stylesheet" href="css/base.css">
<!-- 导入登录页面的样式 -->
<link type="text/css" rel="stylesheet" href="css/login.css">
<!-- 导入轮播图的js -->
<script type="text/javascript" src="js/focus.js"></script>
<!-- 导入animate.js -->
<script type="text/javascript" src="js/animate.js"></script>
<!-- 导入时间的js -->
<script type="text/javascript" src="js/time.js"></script>
<!-- 导入登录的js -->
<script type="text/javascript" src="js/login.js"></script>
<%--<script type="text/javascript" src="static/script/jquery-1.7.2.js"></script>--%>