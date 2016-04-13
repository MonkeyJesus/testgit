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

<title>My JSP 'addResource.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/static/js/jquery-2.0.0.min.js"></script>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<input type="text" id="actionType" value="${type }">
	<form method="post" id="addForm">
		<input type="hidden" name="id" value="${resource.id}"><br>
		<input type="hidden" name="parentIds" value="${resource.parentIds }${resource.id}/"><br>
			<c:if test="${type == 'add' }">
				资源名
				<input type="text" name="resourcename"><br>
				类型
				<select id="type" name="type">
					<option value="menu">菜单</option>
					<option value="button">按钮</option>
				</select><br>
				url<input type="text" id="menu_url" name="url"><br>
				权限字符<input type="text" name="permissionStr"><br>
			</c:if>
			<c:if test="${type != 'add' }">
				资源名
				<input type="text" name="resourcename" value="${resource.name }"><br>
				类型
				<select id="type" name="type">
					<option value="menu">菜单</option>
					<option value="button">按钮</option>
				</select><br>
				url
				<input type="text" id="menu_url" name="url" value="${resource.url }"><br>
				权限字符
				<input type="text" name="permissionStr" value="${resource.permission }"><br>
			</c:if>
		<input type="button" id="but" value="提交">
	</form>
</body>
<script>
	$(function(){
		if('${resource.type}' == "menu"){
			$("#type").find("option[value='menu']").attr("selected",true);
		}else{
			$("#type").find("option[value='button']").attr("selected",true);
		}
		
		$("#but").click(function(){
			if($("#actionType").val() == "add"){
				$("#addForm").attr("action", "addResource.do").submit();
			}else{
				$("#addForm").attr("action", "updateResource.do").submit();
			}
		});
		
		judgeText();
		$("#type").change(function(){
			judgeText();
		});
	});
	function judgeText(){
		if($("#type").val()=="button"){
			$("#menu_url").attr("disabled",true);
		}else{
			$("#menu_url").attr("disabled",false);
		}
	}
</script>
</html>
