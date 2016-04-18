<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/resource/static/js/jquery-1.11.0.min.js"></script>
<link href="${pageContext.request.contextPath}/resource/style/authority/basic_layout.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resource/style/authority/common_style.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/resource/highCharts/highcharts.js"></script>
<script src="${pageContext.request.contextPath}/resource/highCharts/exporting.js"></script>
<style type="text/css">
	${demo.css}
</style>
</head>
<body>
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
				选择银行
				<select name="fangyuanEntity.fyDhCode" id="bank" class="ui_select01">
	               	<option id="seclectBank" value="" selected="selected">选择银行</option>
	               </select>
			</div>
		</div>
	</div>
	<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
</body>
<script type="text/javascript">
$(function () {
	
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
		$.ajax({
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
		if(banks.length == 0){
			alert($("#bank").html());
			$("#bank").attr("disabled", false);
		}else{
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
		$.ajax({
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
		$.ajax({
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
	
	
	
    $('#container').highcharts({
        title: {
            text: 'Monthly Average Temperature',
            x: -20 //center
        },
        subtitle: {
            text: 'Source: WorldClimate.com',
            x: -20
        },
        xAxis: {
            categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
        },
        yAxis: {
            title: {
                text: 'Temperature (°C)'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            valueSuffix: '°C'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{
            name: 'Tokyo',
            data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
        }, {
            name: 'New York',
            data: [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
        }, {
            name: 'Berlin',
            data: [-0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
        }, {
            name: 'London',
            data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
        }]
    });
});
</script>
</html>