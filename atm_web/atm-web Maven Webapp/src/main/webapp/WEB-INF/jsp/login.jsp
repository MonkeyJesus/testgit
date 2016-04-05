<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'login.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="resource/style/authority/login_css.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="resource/scripts/jquery/jquery-1.7.1.js"></script>
<script type="text/javascript">
	/* $(document).ready(function() {
		$("#login_sub").click(function() {
			alert("wewe");
			$("#submitForm").attr("login", "index.jsp").submit();
		});
	}); */

	/*回车事件*/
	function EnterPress(e) { //传入 event 
		var e = e || window.event;
		if (e.keyCode == 13) {
			$("#submitForm").attr("login", "index.jsp").submit();
		}
	}
</script>

</head>

<body>
	<div id="login_center">
		<div id="login_area">
			<div id="login_box">
				<div id="login_form">
					<div id="login_tip">
						<span id="login_err" class="sty_txt2"></span>
						<h1>${message }</h1><br>
						<c:if test="${!empty retryTime && retryTime > 0}">
							<h3>还能试${5-retryTime }次</h3>
   						</c:if>
					</div>
					<form id="submitForm" action="login" method="post">
						<input type="hidden" name="code" value="1">
						<div>
							管理员：<input type="text" name="username"
								class="username" id="name">
						</div>
						<div>
							密&nbsp;&nbsp;&nbsp;&nbsp;码：<input type="password"
								name="password" class="pwd" id="pwd"
								onkeypress="EnterPress(event)" onkeydown="EnterPress()">
						</div>
						<div id="btn_area">
							<input type="submit" class="login_btn" id="login_sub"
								value="登  录"> <input type="reset" class="login_btn"
								id="login_ret" value="重 置">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
