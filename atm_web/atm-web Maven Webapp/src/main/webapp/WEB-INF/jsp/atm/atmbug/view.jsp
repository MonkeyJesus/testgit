<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script
	src="${pageContext.request.contextPath}/resource/static/js/jquery-1.11.0.min.js"></script>
<link
	href="${pageContext.request.contextPath}/resource/style/authority/basic_layout.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resource/style/authority/common_style.css"
	rel="stylesheet" type="text/css">
<script
	src="${pageContext.request.contextPath}/resource/highCharts/highcharts.js"></script>
<script
	src="${pageContext.request.contextPath}/resource/highCharts/exporting.js"></script>

<link
	href="${pageContext.request.contextPath}/resource/highCharts/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resource/highCharts/css/styles.css"
	rel="stylesheet">

<style type="text/css">
body{
	padding: 0px;
}
#sider {
	position: absolute;
	top: 0;
	right: 0px;
	bottom: 0px;
	width: 260px;
	border: 1px solid #DEDFDF;
}

#main {
	position: relative;
	top: 0;
	margin-left: auto;
	margin-right: auto;
	bottom: 0px;
	border: 1px solid #DEDFDF;
	overflow: auto;
}

#box_table {
	border: 1px solid #EDEDED;
	height: 50px;
	line-height: 50px;
	text-align: center;
}

#fang_type {
	list-style-type: none;
}

#fang_type li {
	width: 80px;
	height: 22px;
	line-height: 22px;
	color: #FFF;
	display: inline-block;
}

.fy_table_td {
	color: #fff;
}

.fang_th {
	background: #044599 no-repeat;
	text-align: center;
	border-left: 1px solid #02397F;
	border-right: 1px solid #02397F;
	border-bottom: 1px solid #02397F;
	border-top: 1px solid #02397F;
	letter-spacing: 2px;
	text-transform: uppercase;
	font-size: 14px;
	color: #fff;
	height: 37px;
}

.g{
	background-color: #23b628;
}
.r{
	background-color: #b51d1a;
}
</style>
</head>
<body>
	<div id="box_border">
		<div id="box_top">搜索</div>
		<div id="box_center">
			选择省 <select name="fangyuanEntity.fyXqCode" id="province"
				class="ui_select01">
				<option id="seclectProvince" value="" selected="selected">选择省</option>
			</select> 选择市 <select name="fangyuanEntity.fyDhCode" id="city"
				class="ui_select01">
				<option id="seclectCity" value="" selected="selected">选择市</option>
			</select> 选择区 <select name="fangyuanEntity.fyXqCode" id="area"
				class="ui_select01">
				<option id="seclectArea" value="" selected="selected">选择区</option>
			</select> 选择街道 <select name="fangyuanEntity.fyDhCode" id="street"
				class="ui_select01">
				<option id="seclectStreet" value="" selected="selected">选择街道</option>
			</select> 选择银行 <select name="fangyuanEntity.fyDhCode" id="bank"
				class="ui_select01">
				<option id="seclectBank" value="" selected="selected">选择银行</option>
			</select>
		</div>
	</div>
	<div id="box_table">
		<div id="box_top" style=" text-align: left;">信息</div>
		<div id="box_center">
			<div id="main">
				<ul id="fang_type">
					<li style="width: 160px;"><span class="ui_txt_bold05">上海总行</span></li>
					<li style="background-color: #23b628;">良好</li>
					<li style="background-color: #b51d1a;">故障</li>
				</ul>
			</div>
			<table class="unit-the-table table" cellspacing="0" cellpadding="0"
					width="100%" align="center" border="0">
						<tr>
							<th>ID</th>
							<th>银行名</th>
							<th>制造商</th>
							<th>规格</th>
							<th style="width: 10%">读卡器</th>
							<th style="width: 10%">打印其</th>
							<th style="width: 10%">扫描仪</th>
							<th style="width: 10%">存款系统</th>
							<th style="width: 10%">取款系统</th>
							<th>维修</th>
						</tr>
						<tr>
							<td>10001</td>
							<td>上海总行</td>
							<td>brand2</td>
							<td>model1</td>
							<td class="g"></td>
							<td class="g"></td>
							<td class="g"></td>
							<td class="r"></td>
							<td class="r"></td>
							<td>
								<button type="button" id="addATM" class="btn btn-default">维修</button>
							</td>
						</tr>							
						<tr>
							<td>10002</td>
							<td>上海总行</td>
							<td>brand2</td>
							<td>model1</td>
							<td class="g"></td>
							<td class="g"></td>
							<td class="g"></td>
							<td class="r"></td>
							<td class="r"></td>
							<td>
								<button type="button" id="addATM" class="btn btn-default">维修</button>
							</td>
						</tr>							
						<tr>
							<td>10003</td>
							<td>上海总行</td>
							<td>brand2</td>
							<td>model1</td>
							<td class="g"></td>
							<td class="g"></td>
							<td class="g"></td>
							<td class="r"></td>
							<td class="r"></td>
							<td>
								<button type="button" id="addATM" class="btn btn-default">维修</button>
							</td>
						</tr>							
						<tr>
							<td>10004</td>
							<td>上海总行</td>
							<td>brand2</td>
							<td>model1</td>
							<td class="r"></td>
							<td class="g"></td>
							<td class="g"></td>
							<td class="g"></td>
							<td class="r"></td>
							<td>
								<button type="button" id="addATM" class="btn btn-default">维修</button>
							</td>
						</tr>							
						<tr>
							<td>10005</td>
							<td>上海总行</td>
							<td>brand2</td>
							<td>model1</td>
							<td class="g"></td>
							<td class="g"></td>
							<td class="r"></td>
							<td class="g"></td>
							<td class="r"></td>
							<td>
								<button type="button" id="addATM" class="btn btn-default">维修</button>
							</td>
						</tr>							
						<tr>
							<td>10006</td>
							<td>上海总行</td>
							<td>brand2</td>
							<td>model1</td>
							<td class="g"></td>
							<td class="g"></td>
							<td class="g"></td>
							<td class="g"></td>
							<td class="g"></td>
							<td>
								<button type="button" id="addATM" class="btn btn-default">维修</button>
							</td>
						</tr>							
				</table>
		</div>
	</div>
	
</body>
<script type="text/javascript">
	$(function() {

		//加载地区下拉框
		//加载省市区
		getProvinces();
		$("#province").change(function() {
			getCitys($("#province").val(), "city");
			$("#area option:not(:first)").remove();
			$("#street").attr("disabled", false);
			$("#street option:not(:first)").remove();
			var searchData = {
				"provinceId" : $("#province").val()
			};
			searchAndShowBanks(searchData);
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

		//获取显示银行
		function searchAndShowBanks(searchData) {
			$
					.ajax({
						url : "${pageContext.request.contextPath}/bank/selectAllBanks.json",
						type : "POST",
						data : searchData,
						dataType : "json",
						success : function(data) {
							if (data != null) {
								showBanks(data);
							}
						}
					});
		}
		//显示银行列表
		function showBanks(banks) {
			if (banks.length == 0) {
				alert($("#bank").html());
				$("#bank").attr("disabled", false);
			} else {
				$("#parentBank option:gt(0)").remove();
				var banksHtml = "";
				for (var i = 0; i < banks.length; i++) {
					banksHtml += ' <option value="' + banks[i].id + '">'
							+ banks[i].bankname + '</option>';
				}
				$("#parentBank").append(banksHtml);
			}
		}

		function getProvinces() {
			$
					.ajax({
						url : "${pageContext.request.contextPath}/bank/getCityInProvince.json",
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
			$
					.ajax({
						url : "${pageContext.request.contextPath}/bank/getCityInProvince.json",
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

		var aa = "取款";

		$('#container').highcharts(
				{
					title : {
						text : aa,
						x : -20
					//center
					},
					subtitle : {
						text : 'ATM',
						x : -20
					},
					xAxis : {
						categories : [ '1', '2', '3', '4', '5', '6', '7', '8',
								'9', '10', '11', '12' ]
					},
					yAxis : {
						title : {
							text : 'Temperature (°C)'
						},
						plotLines : [ {
							value : 0,
							width : 1,
							color : '#808080'
						} ]
					},
					tooltip : {
						valueSuffix : '￥'
					},
					legend : {
						layout : 'vertical',
						align : 'right',
						verticalAlign : 'middle',
						borderWidth : 0
					},
					series : [
							{
								name : '10001',
								data : [ 231, 756, 897, 345, 123, 12, 789,
										3454, 4756, 345, 234, 3453 ]
							},
							{
								name : '10002',
								data : [ 2321, 346, 897, 3453, 1235, 1452,
										7893, 3453, 476, 325, 23, 345 ]
							},
							{
								name : '10003',
								data : [ 2621, 3223, 97, 453, 235, 152, 293,
										324, 3476, 3325, 323, 3245 ]
							},
							{
								name : '10004',
								data : [ 321, 3346, 839, 453, 1235, 452, 893,
										345, 4376, 4325, 123, 3245 ]
							} ]
				});
	});
</script>
</html>