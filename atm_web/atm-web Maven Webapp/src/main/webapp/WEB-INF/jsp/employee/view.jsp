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

<title>员工</title>

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

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"> -->
<script src="${pageContext.request.contextPath}/resource/jqueryTable/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/jqueryTable/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/jqueryTable/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/jqueryTable/bootstrap-table-expandable.css">
<script src="${pageContext.request.contextPath}/resource/jqueryTable/bootstrap-table-expandable.js"></script>

<%-- <script src="${pageContext.request.contextPath}/resource/jqueryTable/bootstrap-table-expandable.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/jqueryTable/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/jqueryTable/bootstrap-table-expandable.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/jqueryTable/default.css"> --%>
</head>

<body>
	<span id="bankid" style=" display: none">${currentUser.bankid}</span>
	<span id="bankname"></span>
	<form id="submitForm" name="submitForm" action="" method="post">
		<input type="hidden" name="allIDCheck" value="" id="allIDCheck"/>
		<input type="hidden" name="fangyuanEntity.fyXqName" value="" id="fyXqName"/>
		<div id="container">
			<div class="ui_content">
				<div class="ui_text_indent">
					<div id="box_border">
						<div id="box_top">搜索</div>
						<div id="box_center">
							选择省
							<select name="fangyuanEntity.fyXqCode" id="province" class="ui_select01">
				               	<option id="seclectProvince" value="" selected="selected">选择省</option>
				               </select>
				
							选择市
							<select name="fangyuanEntity.fyDhCode" id="city" class="ui_select01">
				               	<option id="seclectCity" value="" selected="selected">选择市</option>
				               </select>
							选择区
							<select name="fangyuanEntity.fyXqCode" id="area" class="ui_select01">
				               	<option id="seclectArea" value="" selected="selected">选择区</option>
				               </select>
				
							选择街道
							<select name="fangyuanEntity.fyDhCode" id="street" class="ui_select01">
				               	<option id="seclectStreet" value="" selected="selected">选择街道</option>
				               </select>
						</div>
						<div id="box_bottom">
							<input type="button" value="查询" class="ui_input_btn01" onclick="search();" /> 
							<input type="button" value="新增" class="ui_input_btn01" id="addBtn" onclick="window.location.href='${pageContext.request.contextPath}/bank/addBank.do'"/> 
							<input type="button" value="导入" class="ui_input_btn01" id="importBtn" />
							<input type="button" value="导出" class="ui_input_btn01" onclick="exportExcel();" />
						</div>
					</div>
				</div>
			</div>
			<div class="ui_content">
				<div class="ui_tb">
					
					<div class="htmleaf-container">
						<div class="container">
							<table class="table">
				                <thead>
				                    <tr>
							            <th>ID</th>
							            <th>银行名字</th>
							            <th>上级银行</th>
							            <th>坐标位置</th>
							            <th>银行级别</th>
							            <th>员工人数</th>
							            <th>客户人数</th>
							            <th>操作</th>
							        </tr>
				                </thead>
								<tbody id="tb">
								</tbody>
				            </table>
						</div>
					</div>
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
	<br>
</body>
<script>
	$(function(){
		initTable(1,10);
		//显示银行
		function initTable(page,row){
			$.ajax({
				url:"bank/showBankEmployees.json",
				data:{
					"":$("#bankid").html(),
					"page":page,
					"row":row
				},
				type:"POST",
				dataType:"json",
				success:function(data){
					console.info(data);
					var banks = data.list;
					if(data.list!=null){
						console.info(banks);
						for(var i = 0;i<banks.length;i++){
							var trs = "<tr id='bankId"+banks[i].bank.id+"'><td>"+banks[i].bank.id+"</td><td>"+banks[i].bank.bankname+"</td><td>"+banks[i].bank.parentid+"</td><td>"+banks[i].bank.provinceId+"_"+banks[i].bank.cityId+"_"+banks[i].bank.areaId+"_"+banks[i].bank.streetId+"</td>"+
				                
				                "<td>"+banks[i].bank.level+"</td><td>"+banks[i].employeeNum+"</td><td>"+banks[i].accountNum+"</td>"+
				                "<td>"+
			                        "<a href='${pageContext.request.contextPath}/employee/"+banks[i].bank.id+"/addEmployee'>添加</a>"+
				                "</td>"+
				                
				                "</tr><tr id='employee"+banks[i].bank.id+"' style=' display:none'>"+
				                "<td colspan='8'>"+
				                "<div style=' background-color:black; width:100% '>"+
					               "<table class='table'>"+
						                "<thead>"+
							                "<tr>"+
							                	"<th>员工编号</th>"+
							                	"<th>姓名</th>"+
							                	"<th>身份证</th>"+
							                	"<th>手机号</th>"+
							                	"<th>角色</th>"+
							                	"<th>入职时间</th>"+
							                	"<th>操作</th>"+
							                "</tr>"+
						                "</thead>"+
					               		"<tbody id='tb_emp'"+banks[i].bank.id+"></tbody>"+
					                "</table>"+
					                "</div>"+
				                "</td></tr>";
				                
				            $("#tb").append($(trs));
				            (function(x){
				            	$("#bankId"+banks[x].bank.id).click(function(){
				            		$("#employee"+banks[x].bank.id).toggle();
				            		if(!$("#employee"+banks[x].bank.id).is(":hidden")){
				            			getEmployeesBybankId(banks[x].bank.id);
				            		}
				            		/* if($("#employee"+banks[x].bank.id).css("display") == "none"){
					            		$("#employee"+banks[x].bank.id).css("display", "block");
					            		showEmployees(banks[x].bank.id);
				            		}else{
					            		$("#employee"+banks[x].bank.id).css("display", "none");
				            		} */
				            	});
				            })(i);
						}
					}
				}
			});
		}
		
		function getEmployeesBybankId(bankId){
			$.ajax({
				url:"employee/getEmployeesBybankId.json",
				data:{
					"bankId":bankId
				},
				type:"POST",
				dataType:"json",
				success:function(employees){
					if(employees!=null){
						$("#tb_emp").html("");
						for(var i = 0;i<employees.length;i++){
							var trs = "<tr id='employeeId"+employees[i].employeeid+"'>"+
											"<td>"+employees[i].employeeid+"</td>"+
											"<td>"+employees[i].employeename+"</td>"+
											"<td>"+employees[i].personid+"</td>"+
											"<td>"+employees[i].mobile+"</td>"+
				                 			"<td>"+employees[i].roleId+"</td>"+
				                 			"<td>"+employees[i].addbanktime+"</td>"+
				                			"<td>"+
			                        			"<a href='${pageContext.request.contextPath}/employee/"+employees[i].employeeid+"/update'>添加</a>"+
			                        			"<a href='${pageContext.request.contextPath}/employee/"+employees[i].employeeid+"/delete'>删除</a>"+
				                			"</td>"+
				                		"</tr>";
				            $("#tb_emp").append($(trs));
						}
					}
				}
			});
		}
		
		//加载地区下拉框
		//加载省市区
		getProvinces();
		$("#province").change(function() {
			getCitys($("#province").val(), "city");
			$("#area option:not(:first)").remove();
			$("#street").attr("disabled", false);
			$("#street option:not(:first)").remove();
			if ($("#level").val() == 3) {
				var searchData = {
					"level" : $("#level").val() - 1,
					"provinceId" : $("#province").val()
				};
				searchAndShowBanks(searchData);
			} else if ($("#level").val() == 4) {
				var searchData = {
					"areaId" : $("#areaId").val()
				};
				searchAndShowBanks(searchData);
			}
			$("#bankName").val("");
		});
		$("#city").change(function() {
			getCitys($("#city").val(), "area");
			$("#street").attr("disabled", false);
			$("#street option:not(:first)").remove();
			$("#bankName").val("");
		});
		$("#area").change(function() {
			getCitys($("#area").val(), "street");
			$("#bankName").val("");
		});

		function getProvinces() {
			$.ajax({
				url : "bank/getCityInProvince.json",
				data : {
					//code : -1,//-1，则查询所有的省份
					code : 0,
				},
				dataType : "json",
				type : "POST",
				async : true,
				success : function(json) {
					if (json != null) {
						showProvinces(json);
					}
				}
			});
		}

		function showProvinces(provinces) {
			var provincesHtml = "";
			for (var i = 0; i < provinces.length; i++) {
				provincesHtml += ' <option value="' + provinces[i].id + '">'
						+ provinces[i].areaname + '</option>';
			}
			$("#province").append(provincesHtml);
		}
		function showCitys(json, doc) {
			$("#" + doc + " option:gt(0)").remove();
			var citys = json;
			var citysHtml = "";
			for (var i = 0; i < citys.length; i++) {
				citysHtml += ' <option value="' + citys[i].id + '">'
						+ citys[i].areaname + '</option>';
			}
			$("#" + doc).append(citysHtml);
		}

		function getCitys(provincecode, doc) {
			if (provincecode == "") {//未选中任何省
				$("#c" + doc + " option:gt(0)").remove();//删除第一个option之后的所有option
				return;
			}

			//选中省
			$.ajax({
				url : "bank/getCityInProvince.json",
				data : {
					code : provincecode,
				},
				type : "POST",
				dataType : "json",
				async : true,
				success : function(json) {
					if (json.length == 1) {
						getCitys(json[0].id, doc);
					} else if (json.length > 1) {
						showCitys(json, doc);
					} else {
						$("#" + doc).attr("disabled", true);
					}
				}
			});
		}
		
		if($("#bankid").html()!=""){
			$.ajax({
				url:"bank/getBankById.json",
				data:{
					"id":$("#bankid").html()
				},
				type:"POST",
				dataType:"json",
				async : true,
				success:function(data){
					console.info($("#bankname").text());
					$("#bankname").html(data.bankname);
				}
			});
		}
	});
</script>
</html>
