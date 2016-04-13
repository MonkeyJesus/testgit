<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'view.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


<script src="${pageContext.request.contextPath}/resource/static/js/jquery-1.11.0.min.js"></script>
<link href="${pageContext.request.contextPath}/resource/style/authority/basic_layout.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resource/style/authority/common_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/scripts/authority/commonAll.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/scripts/fancybox/jquery.fancybox.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/style/authority/jquery.fancybox-1.3.4.css" media="screen"></link>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/scripts/artDialog/artDialog.js?skin=default"></script>
<script src="${pageContext.request.contextPath}/resource/static/jquery-treetable/javascripts/src/jquery.treetable.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/static/jquery-treetable/stylesheets/jquery.treetable.css">

</head>

<body>
	角色列表 <shiro:hasPermission name="role:create"><a href="${pageContext.request.contextPath}/role/addRole">增加</a></shiro:hasPermission>
	<br>
	<div class="ui_content">
		<div class="ui_tb">
			<table class="table" id="table" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
		        <tr>
					<th>角色</th>
					<th>描述</th>
					<th>操作</th>
				</tr>
		    	<c:forEach items="${roles }" var="role">
					<tr>
						<td>${role.role }</td>
						<td>${role.description }</td>
						<td>
							<shiro:hasPermission name="role:update"><a href="${pageContext.request.contextPath}/role/addRole?roleId=${role.id }">修改</a></shiro:hasPermission>
							<shiro:hasPermission name="role:delete"><a href="${pageContext.request.contextPath}/role/${role.id }/delete">删除</a></shiro:hasPermission>
						</td>
					</tr>
				</c:forEach>
				
			</table>
		</div>
		<div class="ui_tb_h30">
			<div class="ui_flt" style="height: 30px; line-height: 30px;">
				共有
				<span class="ui_txt_bold04">90</span>
				条记录，当前第
				<span class="ui_txt_bold04">1
				/
				9</span>
				页
			</div>
			<div class="ui_frt">
				<!--    如果是第一页，则只显示下一页、尾页 -->
				
					<input type="button" value="首页" class="ui_input_btn01" />
					<input type="button" value="上一页" class="ui_input_btn01" />
					<input type="button" value="下一页" class="ui_input_btn01"
						onclick="jumpNormalPage(2);" />
					<input type="button" value="尾页" class="ui_input_btn01"
						onclick="jumpNormalPage(9);" />
				
				
				
				<!--     如果是最后一页，则只显示首页、上一页 -->
				
				转到第<input type="text" id="jumpNumTxt" class="ui_input_txt01" />页
					 <input type="button" class="ui_input_btn01" value="跳转" onclick="jumpInputPage(9);" />
			</div>
		</div>
	</div>
</body>
</html>
