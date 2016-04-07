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
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resource/scripts/fancybox/jquery.fancybox-1.3.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/scripts/fancybox/jquery.fancybox-1.3.4.pack.js"></script> --%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/style/authority/jquery.fancybox-1.3.4.css" media="screen"></link>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/scripts/artDialog/artDialog.js?skin=default"></script>
<script src="${pageContext.request.contextPath}/resource/static/jquery-treetable/javascripts/src/jquery.treetable.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/static/jquery-treetable/stylesheets/jquery.treetable.css">
<script>
    $(function() {
        $("#table").treetable({ expandable: true }).treetable("expandNode", 1);
        $(".deleteBtn").click(function() {
            if(confirm("确认删除吗?")) {
                location.href = "${pageContext.request.contextPath}/resource/"+$(this).data("id")+"/delete";
            }
        });
    });
</script>
</head>

<body>
	<form id="submitForm" name="submitForm" action="" method="post">
		<input type="hidden" name="allIDCheck" value="" id="allIDCheck"/>
		<input type="hidden" name="fangyuanEntity.fyXqName" value="" id="fyXqName"/>
		<div id="container">
			<div class="ui_content">
				<div class="ui_text_indent">
					<div id="box_border">
						<div id="box_top">搜索</div>
						<div id="box_center">
							小区
							<select name="fangyuanEntity.fyXqCode" id="fyXq" class="ui_select01" onchange="getFyDhListByFyXqCode();">
                                <option value=""
                                >--请选择--</option>
                                <option value="6">瑞景河畔</option>
                                <option value="77">蔚蓝小区</option>
                                <option value="83">和盛园小区</option>
                            </select>

							栋号
							<select name="fangyuanEntity.fyDhCode" id="fyDh" class="ui_select01">
                                <option value="">--请选择--</option>
                            </select>
							户型
							<select name="fangyuanEntity.fyHxCode" id="fyHx" class="ui_select01">
                                <option value="">--请选择--</option>
                                <option value="76">一室一厅一卫</option>
                                <option value="10">两室一厅一卫</option>
                                <option value="14">三室一厅一卫</option>
                                <option value="71">三室两厅一卫</option>
                            </select>
							状态
							<select name="fangyuanEntity.fyStatus" id="fyStatus" class="ui_select01">
                                <option value="">--请选择--</option>
                                <option value="26">在建</option>
                                <option value="25">建成待租</option>
                                <option value="13">已配租</option>
                                <option value="12">已租赁</option>
                                <option value="24">腾退待租</option>
                                <option value="23">欠费</option>
                                <option value="27">其他</option>
                            </select>

							座落&nbsp;&nbsp;<input type="text" id="fyZldz" name="fangyuanEntity.fyZldz" class="ui_input_txt02" />
						</div>
						<div id="box_bottom">
							<input type="button" value="查询" class="ui_input_btn01" onclick="search();" /> 
							<input type="button" value="新增" class="ui_input_btn01" id="addBtn" /> 
							<input type="button" value="删除" class="ui_input_btn01" onclick="batchDel();" /> 
							<input type="button" value="导入" class="ui_input_btn01" id="importBtn" />
							<input type="button" value="导出" class="ui_input_btn01" onclick="exportExcel();" />
						</div>
					</div>
				</div>
			</div>
			<div class="ui_content">
				<div class="ui_tb">
					<table class="table" id="table" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
					<thead>
				        <tr>
				            <th>名称</th>
				            <th>类型</th>
				            <th>URL路径</th>
				            <th>权限字符串</th>
				            <th>操作</th>
				        </tr>
				    </thead>
				    <tbody>
					 <c:forEach items="${resources}" var="resource">
						
				            <tr data-tt-id='${resource.id}' <c:if test="${resource.parentId != '0'}">data-tt-parent-id='${resource.parentId}'</c:if><c:if test="${resource.id == '1'}">style=' display:none'</c:if>>
				                <td >${resource.name}</td>
				                <td>${resource.type}</td>
				                <td>${resource.url}</td>
				                <td>${resource.permission}</td>
				                <td>
			                        <%-- <a href="${pageContext.request.contextPath}/resource/${resource.id}/update">修改</a>
			                        <a href="${pageContext.request.contextPath}/resource/${resource.id}/delete">删除</a>
			                       	<a href="${pageContext.request.contextPath}/resource/${resource.id}/addPermission">添加子节点</a> --%>
				                    <shiro:hasPermission name="resource:*">
				                        <c:if test="${resource.type ne 'button'}">
				                        	<a href="${pageContext.request.contextPath}/resource/${resource.id}/addPermission">添加子节点</a>
				                        </c:if>
				                    </shiro:hasPermission>
				
				                    <shiro:hasPermission name="resource:*">
				                        <a href="${pageContext.request.contextPath}/resource/${resource.id}/update">修改</a>
				                        <a class="deleteBtn" data-id="${resource.id}" href="${pageContext.request.contextPath}/resource/${resource.id}/delete">删除</a>
				                    </shiro:hasPermission>
				                </td>
				            </tr>
			            
			        </c:forEach>
			        </tbody>
						<!-- <tr>
							<th width="30"><input type="checkbox" id="all" onclick="selectOrClearAllCheckbox(this);" />
							</th>
							<th>位置</th>
							<th>房源</th>
							<th>房源面积</th>
							<th>计租面积</th>
							<th>户型</th>
							<th>建筑结构</th>
							<th>租赁性质</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
							<tr>
								<td><input type="checkbox" name="IDCheck" value="14458579642011" class="acb" /></td>
								<td>城中区</td>
								<td>瑞景河畔16号楼1-111</td>
								<td>65.97㎡</td>
								<td>65.97㎡</td>
								<td>一室一厅一卫</td>
								<td>混凝土</td>
								<td>公租房</td>
								<td>建成待租</td>
								<td>
									<a href="house_edit.html?fyID=14458579642011" class="edit">编辑</a> 
									<a href="javascript:del('14458579642011');">删除</a>
								</td>
							</tr> -->
						
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
		</div>
	</form>



	<%-- <table id="table" style=" width: 100%;">
	    <thead>
	        <tr>
	            <td>名称</td>
	            <td>类型</td>
	            <td>URL路径</td>
	            <td>权限字符串</td>
	            <td>操作</td>
	        </tr>
	    </thead>
	    <tbody>
	        <c:forEach items="${resources}" var="resource">
	            <tr data-tt-id='${resource.id}' style=" border-bottom: 1px solid;" <c:if test="${resource.parentId != '0'}">data-tt-parent-id='${resource.parentId}'</c:if>>
	                <td>${resource.name}</td>
	                <td>${resource.type}</td>
	                <td>${resource.url}</td>
	                <td>${resource.permission}</td>
	                <td>
                        <a href="${pageContext.request.contextPath}/resource/${resource.id}/update">修改</a>
                        <a href="${pageContext.request.contextPath}/resource/${resource.id}/delete">删除</a>
                       	<a href="${pageContext.request.contextPath}/resource/${resource.id}/addPermission">添加子节点</a>
	                    <shiro:hasPermission name="resource:*">
	                        <c:if test="${resource.type ne 'button'}">
	                        	<a href="${pageContext.request.contextPath}/resource/${resource.id}/addPermission">添加子节点</a>
	                        </c:if>
	                    </shiro:hasPermission>
	
	                    <shiro:hasPermission name="resource:*">
	                        <a href="${pageContext.request.contextPath}/resource/${resource.id}/update">修改</a>
	                        <a href="${pageContext.request.contextPath}/resource/${resource.id}/delete">删除</a>
	                    </shiro:hasPermission>
	                </td>
	            </tr>
	        </c:forEach>
	    </tbody>
	</table> --%>
	<br>
</body>
</html>
