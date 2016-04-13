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
	<form method="post" id="addForm">
		<div id="box_level">
			<div id="box_top">級別</div>
			<div id="box_center">
				选择银行级别
				<select name="fangyuanEntity.fyXqCode" id="level" class="ui_select01">
	            	<option value="0" selected="selected">选择银行级别</option>
	            	<option value="1">总行</option>
	            	<option value="2">分行</option>
	            	<option value="3">支行</option>
	            </select>
			</div>
		</div>
		<div id="box_area">
			<div id="box_top">地区</div>
			<div id="box_center">
				选择省
				<select name="fangyuanEntity.fyXqCode" id="province" class="ui_select01">
                	<option id="seclectProvince" value="" selected="selected">选择省</option>
                </select>

				选择市
				<select name="fangyuanEntity.fyDhCode" id="city" class="ui_select01">
                	<option id="seclectCity" value="" selected="selected">选择市</option>
                </select>
			</div>
		</div>
		<div id="box_name">
			<div id="box_top">银行名</div>
			<div id="box_center">
				输入银行名
				<input type="text" id="bankName" name="name" class="ui_input_txt02" />
			</div>
		</div>
		<div id="box_ATM">
			<div id="box_top">配置ATM机</div>
			<div id="box_center">
				输入银行名
				<input type="text" id="bankName" name="name" class="ui_input_txt02" />
			</div>
		</div>
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
