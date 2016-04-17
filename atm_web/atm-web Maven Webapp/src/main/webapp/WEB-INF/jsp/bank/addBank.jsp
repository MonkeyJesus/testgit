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
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/static/js/jquery-1.11.0.min.js"></script>
<link href="${pageContext.request.contextPath}/resource/style/authority/basic_layout.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resource/style/authority/common_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/scripts/authority/commonAll.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/scripts/fancybox/jquery.fancybox.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/style/authority/jquery.fancybox-1.3.4.css" media="screen"></link>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/scripts/artDialog/artDialog.js?skin=default"></script>
<script src="${pageContext.request.contextPath}/resource/static/jquery-treetable/javascripts/src/jquery.treetable.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/static/jquery-treetable/stylesheets/jquery.treetable.css">

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/editable/bootstrap-editable.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/editable/bootstrap-editable.css">

<style>
.table th, .table td { 
	text-align: center; 
	height:38px;
	
}
</style>

</head>

<body>
	<div id="box_level">
		<div id="box_top">級別</div>
		<div id="box_center">
			选择银行级别
			<select name="fangyuanEntity.fyXqCode" id="level" class="ui_select01">
            	<option value="" selected="selected">选择银行级别</option>
            	<option value="2">分行</option>
            	<option value="3">支行</option>
            	<option value="4">自助银亭</option>
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
			选择区
			<select name="fangyuanEntity.fyXqCode" id="area" class="ui_select01">
               	<option id="seclectArea" value="" selected="selected">选择区</option>
               </select>

			选择街道
			<select name="fangyuanEntity.fyDhCode" id="street" class="ui_select01">
               	<option id="seclectStreet" value="" selected="selected">选择街道</option>
               </select>
		</div>
	</div>
	<div id="box_parent" style=" display: none">
		<div id="box_top">上级银行</div>
		<div id="box_center">
			选择上级银行
			<select name="fangyuanEntity.fyDhCode" id="parentBank" class="ui_select01">
               	<option id="seclectBank" value="" selected="selected">选择上级银行</option>
               </select>
		</div>
	</div>
	<div id="box_name">
		<div id="box_top">银行名</div>
		<div id="box_center">
			输入银行名
			<input type="text" style=" height: 30px; vertical-align:middle; line-height: normal;" id="bankName" name="name" />
		</div>
	</div>
	<div id="box_ATM">
		<div id="box_top">配置ATM机
		
	  	<div class="btn-group btn-group-xs">
			  <button type="button" id="addATM" class="btn btn-default">添加</button>
		</div>
		
		</div>
		<div>
			<div class="container">
				<table class="table" id="atmTable">
				    <thead>
					    <tr>
					        <th>编号</th>
					        <th>品牌</th>
					        <th>机型</th>
					        <th>初始金额</th>
					        <th>操作</th>
					    </tr>
				    </thead>
				    <tbody id="tb">
				    </tbody>
				</table>
		   </div>
		</div>
	</div>
	<div id="box_ATM">
		<div id="box_top">
		  <button type="button" id="addBank" class="btn btn-default">新建</button>
	   </div>
	</div>
</body>
<script>
	$(function(){
		$("#addBank").click(function(){
			if($("#level").val()==""){
				alert("请选择银行级别");
				return;
			}else if($("#street option").size()>1&&$("#street option").val()==""){
				alert("请选择银行位置");
				return;
			}else if($("#bankName").val()==""){
				alert("请输入银行名字");
				return;
			}
			var bankName = $("#bankName").val();
			var provinceId = $("#province").val();
			var cityId = $("#city").val();
			var areaId = $("#area").val();
			var streetId = $("#street").val();
			var parentId = $("#parentBank").val();
			var level = $("#level").val();
			var atm = fore();
			$.ajax({
				type:"POST",
				url:"bank/createBank.do",
				data:{
					"bankName":bankName,
					"provinceId":provinceId,
					"cityId":cityId,
					"areaId":areaId,
					"streetId":streetId,
					"parentId":parentId,
					"level":level,
					"atm":atm
				},
				success:function(data){
					window.location.href="${pageContext.request.contextPath}/bank/view.do";
				}
			}); 
			
			
			
		});
		
		 
	function fore() {
			var temp = "";
			var jsonT = "[";
			console.info($("#atmTable tr td").size());
			 for (var i = 1; i < $("#atmTable tr").size(); i++) {
				//temp +=tabLen.rows[i].cells[j].innerHTML;
				jsonT += "{id:\"" +
						$("#atmTable tr:eq("+i+") td:eq(0) ").html()+
						 "\",brand:\""+
						 $("#atmTable tr:eq("+i+") td:eq(1) ").find("a").html() + 
						 "\",model:\""+
						 $("#atmTable tr:eq("+i+") td:eq(2) ").find("a").html() + 
						 "\",first_money:\""+
						 $("#atmTable tr:eq("+i+") td:eq(3) ").find("a").html() ;
						 if(i == $("#atmTable tr").size()-1){
							 jsonT+="\"}";
						}else{
							jsonT+="\"},"
						}

			}
			jsonT += "]";
			console.info(jsonT );
			return jsonT;
		}

		$("#bankName").focus(
				function() {
					if ($("#level").val() == "") {
						alert("请选择银行级别");
						$("#bankName").blur();
					} else {
						if ($("#area").val() == ""
								|| ($("#area").val() != ""
										&& $("#street option").size() > 1 && $(
										"#street").val() == "")) {
							alert("请选择银行位置");
							return;
						}
						if ($("#parentBank").val() == "") {
							alert("请选择上级银行");
							return;
						}
					}
				});

		$("#level").change(function() {
			var searchData;
			if ($("#level").val() > 1) {
				$("#box_parent").css("display", "block");
				var areaId = 0;
				if ($("#level").val() == 2) {
					if ($("#province").val() != "") {
						searchData = {
							"level" : 1
						};
					}
				} else if ($("#level").val() == 3) {
					if ($("#city").val() != "") {
						searchData = {
							"level" : 2
						};
					}
				}
				searchAndShowBanks(searchData);
				$("#bankName").val("");
			} else {
				$("#box_parent").css("display", "none");
			}

		});

		//获取显示银行
		function searchAndShowBanks(searchData) {
			$.ajax({
				url : "bank/selectAllBanks.json",
				type : "POST",
				data : searchData,
				dataType : "json",
				success : function(data) {
					if (data != null) {
						console.info(data);
						showBanks(data);
					}
				}
			});
		}
		//显示银行列表
		function showBanks(banks) {
			$("#parentBank option:gt(0)").remove();
			var banksHtml = "";
			for (var i = 0; i < banks.length; i++) {
				banksHtml += ' <option value="' + banks[i].id + '">'
						+ banks[i].bankname + '</option>';
			}
			$("#parentBank").append(banksHtml);
		}
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

		$("#addATM")
				.click(
						function() {
							var str = "<tr><td>"
									+ ($(".brand").length + 1)
									+ "</td><td><a href='#' id='brand' class='brand'>选择制造商</a></td><td><a href='#' id='model' class='model'>选择机型</a></td><td><a href='#' id='first_money' class='first_money'>设置初始金额</a></td><td><span class='glyphicon glyphicon-remove' style='cursor: pointer; color: rgb(4,69,153);'></span></td></tr>"
							$("#tb").append($(str));

							$(".brand").each(function() {
								$(this).editable({
									type : 'select',
									title : '选择制造商',
									placement : 'right',
									value : 2,
									source : [ {
										value : 1,
										text : '制造商 1'
									}, {
										value : 2,
										text : '制造商 2'
									}, {
										value : 3,
										text : '制造商 3'
									} ]
								});
							});
							$(".model").each(function() {
								$(this).editable({
									type : 'select',
									title : '选择制造商',
									placement : 'right',
									value : 2,
									source : [ {
										value : 1,
										text : 'model 1'
									}, {
										value : 2,
										text : 'model 2'
									}, {
										value : 3,
										text : 'model 3'
									} ]
								});
							});
							$(".first_money").each(function() {
								$(this).editable();
							});

							/* $("#tb").find("#brand").editable({
							    type: 'select',
							    title: 'Select status',
							    placement: 'right',
							    value: 2,
							    source: [
							        {value: 1, text: 'status 1'},
							        {value: 2, text: 'status 2'},
							        {value: 3, text: 'status 3'}
							    ]
							}); */
							$("#tb").find("span").click(function() {
								$(this).parent().parent().remove();
							});
						});

		//make username editable
		$('#username').editable();

		//make status editable
		$('#brand').editable({
			type : 'select',
			title : 'Select status',
			placement : 'right',
			value : 2,
			source : [ {
				value : 1,
				text : 'status 1'
			}, {
				value : 2,
				text : 'status 2'
			}, {
				value : 3,
				text : 'status 3'
			} ]
		/*
		//uncomment these lines to send data on server
		,pk: 1
		,url: '/post'
		 */
		});
		$('#model').editable({
			type : 'select',
			title : 'Select status',
			placement : 'right',
			value : 2,
			source : [ {
				value : 1,
				text : 'status 1'
			}, {
				value : 2,
				text : 'status 2'
			}, {
				value : 3,
				text : 'status 3'
			} ]
		/*
		//uncomment these lines to send data on server
		,pk: 1
		,url: '/post'
		 */
		});
		$('#first_money').editable({
			type : 'select',
			title : 'Select status',
			placement : 'right',
			value : 2,
			source : [ {
				value : 1,
				text : 'status 1'
			}, {
				value : 2,
				text : 'status 2'
			}, {
				value : 3,
				text : 'status 3'
			} ]
		/*
		//uncomment these lines to send data on server
		,pk: 1
		,url: '/post'
		 */
		});

		if ('${resource.type}' == "menu") {
			$("#type").find("option[value='menu']").attr("selected", true);
		} else {
			$("#type").find("option[value='button']").attr("selected", true);
		}

		$("#but").click(function() {
			if ($("#actionType").val() == "add") {
				$("#addForm").attr("action", "addResource.do").submit();
			} else {
				$("#addForm").attr("action", "updateResource.do").submit();
			}
		});

		judgeText();
		$("#type").change(function() {
			judgeText();
		});
	});
	function judgeText() {
		if ($("#type").val() == "button") {
			$("#menu_url").attr("disabled", true);
		} else {
			$("#menu_url").attr("disabled", false);
		}
	}
</script>
</html>
