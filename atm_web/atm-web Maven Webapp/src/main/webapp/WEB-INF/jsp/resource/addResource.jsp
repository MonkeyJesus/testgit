<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	<input type="hidden" id="actionType" value="${type }">
	<form method="post" id="addForm">
		<input type="hidden" name="parentId" value="${parent.id}"><br>
		<input type="hidden" name="parentIds" value="${parent.parentIds }${parent.id}/"><br>
			<if test="${type == 'add' }">
				资源名
				<input type="text" name="resourcename"><br>
				类型
				<input type="text" name="resourcename"><br>
			</if>
			<if test="${type != 'add' }">
				资源名
				<input type="text" name="resourcename" value="${self.name }"><br>
				类型
				<input type="text" name="resourcename"><br>
			</if>
		<select id="type" name="type">
			<option value="menu">菜单</option>
			<option value="button">按钮</option>
		</select><br>
		url<input type="text" id="menu_url" name="url"><br>
		权限字符<input type="text" name="permissionStr"><br>
		<input type="button" id="but" value="提交">
	</form>
</body>
<script>
	$(function(){
		
		$("#but").click(function(){
			if($("#actionType").val == "add"){
				$("#addForm").attr("action", "addResource").submit();
			}else{
				$("#addForm").attr("action", "updateResource").submit();
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
