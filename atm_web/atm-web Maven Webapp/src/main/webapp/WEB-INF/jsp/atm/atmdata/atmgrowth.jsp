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

<link href="${pageContext.request.contextPath}/resource/highCharts/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resource/highCharts/css/styles.css" rel="stylesheet">

<style type="text/css">
.sel {
    width: 105px;
    text-align: center;
    padding: 1px 0;
    border: 1px solid #3580A9;
    -moz-text-shadow: 0px -1px 0px #2C6AA3;
    -webkit-text-shadow: 0px -1px 0px #2C6AA3;
    -o-text-shadow: 0px -1px 0px #2C6AA3;
    text-shadow: 0px -1px 0px #2C6AA3;
    color: #D4E6EF;
    border-radius: 3px 3px 3px 3px;
    margin: 2px;
    /* color: #6D6D6D; */
    /* border: 1px solid #D0D2D4; */
     background-color: #3580A9;
}
.but{
 	width: 105px;
 	height:40px;
    text-align: center;
    padding: 1px 0;
    border: 1px solid #3580A9;
    -moz-text-shadow: 0px -1px 0px #2C6AA3;
    -webkit-text-shadow: 0px -1px 0px #2C6AA3;
    -o-text-shadow: 0px -1px 0px #2C6AA3;
    text-shadow: 0px -1px 0px #2C6AA3;
    color: #D4E6EF;
    border-radius: 3px 3px 3px 3px;
    margin: 2px;
    /* color: #6D6D6D; */
    /* border: 1px solid #D0D2D4; */
     background-color: #3580A9;
}

#left{
	height: 100%;
}
.highC{
	height: 400px;
}
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
		<div id="box_time">
			<div id="box_top">时间</div>
			<div id="box_center">
					<div id="content">
						时间区间：
					  	<input type="date"  class="sel" style="width:150px;"> --  <input type="date"  class="sel" style="width:150px;" /> 
					  	<diV style="margin-left: 30%;margin-top: -3%;">
					  	<input type="button" value="查询" class="but">
						<input type="button" value="按年" class="but"> 
						<input type="button" value="按月" class="but">
					  	</diV>
						
					</div>
			</div>
		</div>
	</div>
	<div id="container" style="min-width: 310px; height:60%; margin: 0 auto"></div>
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
	
	var aa = "区域ATM机数量增长趋势";
	
    $('#container').highcharts({
        title: {
            text: aa,
            x: -20 //center
        },
        subtitle: {
            text: 'ATM',
            x: -20
        },
        xAxis: {
            categories: ['2004', '2005', '2006', '2007', '2008', '2009',
                '2010', '2011', '2012', '2013', '2014', '2015']
        },
        yAxis: {
            title: {
                text: '个数（个）'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            valueSuffix: '个'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{
            name: 'ATM',
            data: [231, 300, 450, 478, 600, 800, 1089, 1600, 2300, 3342,4090,4200]
        }]
    });
});
</script>
</html>