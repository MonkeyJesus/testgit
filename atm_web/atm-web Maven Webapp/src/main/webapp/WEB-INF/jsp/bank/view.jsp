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
							选择省
							<select name="fangyuanEntity.fyXqCode" id="province" class="ui_select01">
                                <option id="seclectProvince" value="" selected="selected">选择省</option>
                            </select>

							选择市
							<select name="fangyuanEntity.fyDhCode" id="city" class="ui_select01">
                                <option id="seclectCity" value="" selected="selected">选择市</option>
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
							<input type="button" value="新增" class="ui_input_btn01" id="addBtn" onclick="window.location.href='${pageContext.request.contextPath}/bank/addBank.do'"/> 
							<input type="button" value="导入" class="ui_input_btn01" id="importBtn" />
							<input type="button" value="导出" class="ui_input_btn01" onclick="exportExcel();" />
						</div>
					</div>
				</div>
			</div>
			<div class="ui_content">
				<div class="ui_tb">
					<table class="table" id="table" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
				        <tr>
				            <th>ID</th>
				            <th>银行名字</th>
				            <th>坐标位置</th>
				            <th>上级银行</th>
				            <th>银行级别</th>
				            <th>操作</th>
				        </tr>
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
	<br>
</body>
<script>
$(function(){
	initTable(1,10);
	//显示银行
	function initTable(page,row){
		$.ajax({
			url:"bank/showBanks.json",
			data:{
				"page":page,
				"row":row
			},
			type:"POST",
			dataType:"json",
			success:function(data){
				console.info(data);
				var banks = data.list;
				if(data.list!=null){
					for(var i = 0;i<banks.length;i++){
						var trs = "<tr><td>"+banks[i].id+"</td><td>"+banks[i].bankname+"</td><td>"+banks[i].provinceId+"_"+banks[i].cityId+"_"+banks[i].areaId+"_"+banks[i].streetId+"</td>"+
			                
			                "<td>"+banks[i].parentid+"</td><td>"+banks[i].level+"</td>"+
			                
			                "<td>"+
		                        "<a href='${pageContext.request.contextPath}/resource/"+banks[i].id+"/update'>修改</a>"+
		                        "<a class='deleteBtn' href='${pageContext.request.contextPath}/bank/"+banks[i].id+"/delete'>删除</a>"+
			                "</td></tr>";
			            $("#table").append($(trs));
					}
				}
			}
		});
	}
	
	
	getProvinces();
	$("#province").change(function(){
		getCitys($("#province").val());
	});
	
	function getProvinces() {
		$.ajax({
			url : "bank/getCityInProvince.json",
			data : {
				//code : -1,//-1，则查询所有的省份
				code : 0,
			},
			dataType:"json",
			type:"POST",
			async : true,
			success : function(json) {
				if(json!=null){
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

	function getCitys(provincecode) {
		
		if (provincecode == "") {//未选中任何省
			$("#city option:gt(0)").remove();//删除第一个option之后的所有option
			return;
		}

		//选中省
		$.ajax({
			url : "bank/getCityInProvince.json",
			data : {
				code : provincecode,
			},
			type:"POST",
			dataType:"json",
			async : true,
			success : function(json) {
				if (json.length==1){
					getCitys(json[0].id);
				}else if(json.length>1){
					showCitys(json);
				}else{
					alert("城市解析错误！");
				}
			}
		});
	}

	function showCitys(json) {
		var obj = document.getElementById('city');
		$("#city option:gt(0)").remove();
		var citys = json;
		var citysHtml = "";
		for (var i = 0; i < citys.length; i++) {
			citysHtml += ' <option value="' + citys[i].id + '">'
					+ citys[i].areaname + '</option>';
		}
		$("#city").append(citysHtml);
	}
});
</script>
</html>
