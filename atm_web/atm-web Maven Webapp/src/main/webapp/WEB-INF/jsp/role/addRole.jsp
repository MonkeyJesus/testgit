<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<script src="${pageContext.request.contextPath}/resource/static/js/jquery-2.0.0.min.js" type="text/javascript"></script>
	
<%-- <script src="${pageContext.request.contextPath}/resource/static/fancytree/jquery-ui-1.10.4.min.js" type="text/javascript"></script> --%>
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js" type="text/javascript"></script>


<link href="${pageContext.request.contextPath}/resource/static/fancytree/ui.fancytree.css" rel="stylesheet" type="text/css"
	class="skinswitcher">

<script src="${pageContext.request.contextPath}/resource/static/fancytree/jquery.fancytree.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resource/static/fancytree/jquery.fancytree.dnd.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resource/static/fancytree/jquery.fancytree.edit.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resource/static/fancytree/jquery.fancytree.glyph.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resource/static/fancytree/jquery.fancytree.table.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resource/static/fancytree/jquery.fancytree.wide.js" type="text/javascript"></script>

<!-- Start_Exclude: This block is not part of the sample code -->
<link href="${pageContext.request.contextPath}/resource/static/fancytree/prettify.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resource/static/fancytree/prettify.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/resource/static/fancytree/sample.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/resource/static/fancytree/sample.js" type="text/javascript"></script>
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resource/static/js/addRole.js" type="text/javascript"></script>

</head>

<body>
	<form id="addRoleForm" method="post">
		<input id="roleId" name="roleId" type="text" value="<c:if test="${not empty role }">${role.id }</c:if>">
		角色<input type="text" name="rolename" value="<c:if test="${not empty role }">${role.role }</c:if>"><br>
		描述<input type="text" name="description" value="<c:if test="${not empty role }">${role.description }</c:if>"><br>
		<div class="panel panel-default">
			<div class="panel-heading">
				<b>资源</b>
			</div>
			<div class="panel-heading">
				已选资源：<b id="echoSelectionTitle">-</b>
			</div>
			<div id="tree" class="panel-body fancytree-colorize-hover fancytree-fade-expander">
			</div>
		</div>
		
		<div>Selected keys: <input id="echoSelectionKey" name="resourceids" value="<c:if test="${not empty role }">${role.resourceIds }</c:if>"></div>
		<button id="formBut">提交</button>
	</form>
</body>
</html>
