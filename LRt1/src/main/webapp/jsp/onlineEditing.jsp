<%--<%@page import="pojo.Adm"%>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="base.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>在线编辑</title>
    <%--    !!!--%>
    <%--    <%--%>
    <%--        String name;--%>
    <%--        Adm a = (Adm) request.getSession().getAttribute("admin");--%>
    <%--        if (a == null) {--%>
    <%--            response.sendRedirect("login.jsp");--%>
    <%--            return;--%>
    <%--        }else{--%>
    <%--            name = a.getAdm_name();--%>
    <%--        }--%>
    <%--    %>--%>
    <style>
        ::-webkit-scrollbar {

            display: none; /* Chrome Safari */

        }
        .layui-body {
            border: none !important;
        }

        .mydiv {
            height: 100%;/*解决缩放问题*/
            width: 100%;
            position: relative;
            top: 0%;
            left: 0%;
        }

        .myframe {
            height: 100%;/*解决缩放问题*/
            background-color: rgb(250, 250, 250);
            position: relative;
            /*top: 50%;*//*解决缩放问题*/
            left: 50%;
            margin-left: -550px;
        }
    </style>

</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header" style="background: rgb(19,29,47); opacity: 1">
        <div class="layui-logo">You Are Right</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
<%--            <li class="layui-nav-item"><a href="../jsp/uploadShow2_div.jsp">文本纠错</a></li>--%>
            <li class="layui-nav-item"><a href="../jsp/new_fir_page.jsp">文本纠错</a></li>
            <li class="layui-nav-item"><a href="../jsp/new_sec_page.jsp">文档纠错</a></li>
            <li class="layui-nav-item layui-this"><a href="../jsp/onlineEditing.jsp">在线编辑</a></li>
            <li class="layui-nav-item"><a href="../jsp/login.jsp">退出登录</a></li>
            <%--				<li class="layui-nav-item"><a href="javascript:;">其它系统</a>--%>
            <%--					<dl class="layui-nav-child">--%>
            <%--						<dd>--%>
            <%--							<a href="">邮件管理</a>--%>
            <%--						</dd>--%>
            <%--						<dd>--%>
            <%--							<a href="">消息管理</a>--%>
            <%--						</dd>--%>
            <%--						<dd>--%>
            <%--							<a href="">授权管理</a>--%>
            <%--						</dd>--%>
            <%--					</dl></li>--%>
        </ul>

        <%--			<ul class="layui-nav layui-layout-right">--%>
        <%--				<li class="layui-nav-item"><a href="javascript:;"> <img--%>
        <%--						src="https://gss0.bdstatic.com/-4o3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike272%2C5%2C5%2C272%2C90/sign=19ee1139ffdeb48fef64a98c9176514c/810a19d8bc3eb135d7ee3ce3aa1ea8d3fd1f44b9.jpg"--%>
        <%--						class="layui-nav-img"> <span id="uname"><%=name %></span>--%>
        <%--				</a>--%>
        <%--					<dl class="layui-nav-child">--%>
        <%--						<!--${ctx}/user/index.jsp  -->--%>
        <%--						<dd>--%>
        <%--							<a href="#" target="myframe">基本资料</a>--%>
        <%--						</dd>--%>
        <%--						<dd>--%>
        <%--							<a href="">安全设置</a>--%>
        <%--						</dd>--%>
        <%--					</dl></li>--%>
        <%--				<li class="layui-nav-item"><a href="login.jsp">退了</a></li>--%>
        <%--			</ul>--%>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed"><a class=""
                                                               href="javascript:;">文章管理</a>
                    <dl class="layui-nav-child">
                        <dd>
<%--                            <a href="${ctx}/article/listArticle.jsp" target="myframe">博文列表</a>--%>
                            <a href="../article/listArticle.jsp" target="myframe">文章列表</a>
                        </dd>
                        <dd>
<%--                            <a href="${ctx}/article/addArticle.jsp" target="myframe">添加博文</a>--%>
                            <a href="../article/addArticle.jsp" target="myframe">添加文章</a>
                        </dd>
                    </dl></li>
                <%--					<li class="layui-nav-item"><a href="javascript:;">评论管理</a>--%>
                <%--						<dl class="layui-nav-child">--%>
                <%--							<dd>--%>
                <%--								<a href="${ctx}/comment/listComment.jsp" target="myframe">评论列表</a>--%>
                <%--							</dd>--%>
                <%--							&lt;%&ndash;  <dd><a href="${ctx}/comment/addComment.jsp" target ="myframe">添加评论</a></dd>  &ndash;%&gt;--%>
                <%--						</dl></li>--%>
                <li class="layui-nav-item"><a href="javascript:;">分类管理</a>
                    <dl class="layui-nav-child">
                        <dd>
<%--                            <a href="${ctx}/category/listCategory.jsp" target="myframe">分类列表</a>--%>
                            <a href="../category/listCategory.jsp" target="myframe">分类列表</a>
                        </dd>
                        <dd>
<%--                            <a href="${ctx}/category/addCategory.jsp" target="myframe">添加分类</a>--%>
                            <a href="../category/addCategory.jsp" target="myframe">添加分类</a>
                        </dd>
                    </dl></li>
                <li class="layui-nav-item"><a href="javascript:;">标签管理</a>
                    <dl class="layui-nav-child">
                        <dd>
<%--                            <a href="${ctx}/tag/listTag.jsp" target="myframe">标签列表</a>--%>
                            <a href="../tag/listTag.jsp" target="myframe">标签列表</a>
                        </dd>
                        <dd>
<%--                            <a href="${ctx}/tag/addTag.jsp" target="myframe">添加标签</a>--%>
                            <a href="../tag/addTag.jsp" target="myframe">添加标签</a>
                        </dd>
                    </dl></li>
                <%--         <li class="layui-nav-item">
      <a href="javascript:;">作品管理</a>
      <dl class="layui-nav-child">
        <dd><a href="${ctx}/work/listWork.jsp" target ="myframe" >作品列表</a></dd>
        <dd><a href="${ctx}/work/addWork.jsp" target ="myframe">添加作品</a></dd>
      </dl>
    </li> --%>
                <%--					<li class="layui-nav-item"><a href="javascript:;">友链管理</a>--%>
                <%--						<dl class="layui-nav-child">--%>
                <%--							<dd>--%>
                <%--								<a href="${ctx}/friend/listFriend.jsp" target="myframe">友链列表</a>--%>
                <%--							</dd>--%>
                <%--							<dd>--%>
                <%--								<a href="${ctx}/friend/addFriend.jsp" target="myframe">添加友链</a>--%>
                <%--							</dd>--%>
                <%--						</dl></li>--%>
                <%--					<li class="layui-nav-item"><a href="javascript:;">管理员管理</a>--%>
                <%--						<dl class="layui-nav-child">--%>
                <%--							<dd>--%>
                <%--								<a href="${ctx}/adm/listAdm.jsp" target="myframe">管理员列表</a>--%>
                <%--							</dd>--%>
                <%--							&lt;%&ndash; <dd><a href="${ctx}/adm/addAdm.jsp" target ="myframe">添加管理员</a></dd>  &ndash;%&gt;--%>
                <%--						</dl></li>--%>

            </ul>
        </div>
    </div>

    <div class="layui-body" style="background-color: rgb(250, 250, 250);">
        <!-- 内容主体区域 -->
        <div class="mydiv">
            <iframe name="myframe" width="1100" height="728" frameborder="0"
                    class="myframe" src="../article/listArticle.jsp"></iframe>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © You Are Right—汉语文本校对系统
    </div>
</div>
<script>
    //JavaScript代码区域
    layui.use('element', function() {
        var element = layui.element;
    });
</script>
</body>
</html>