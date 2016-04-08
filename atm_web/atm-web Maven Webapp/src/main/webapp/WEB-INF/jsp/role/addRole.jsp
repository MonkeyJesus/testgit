<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'addRole.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-2.0.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/addRole.js"></script>

<style>
	li{
		list-style: none;
	}
</style>
</head>

<body>
	<form id="addRoleForm" action="createRole.htm" method="post">
		角色<input type="text" name="rolename"><br>
		描述<input type="text" name="description"><br>
		资源
		<select title="Basic example" multiple="multiple" name="resource_select" size="5" id="resource_select">
			<option value="1">加载中。。。</option>
		</select>
		<input type="text" id="resourceids" name="resourceids" style="display: none;">
		<button id="add">添加</button>
	</form>
</body>
</html>
