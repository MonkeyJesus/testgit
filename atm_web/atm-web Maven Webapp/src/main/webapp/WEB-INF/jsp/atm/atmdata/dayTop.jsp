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

<style>
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
						<input type="button" value="ATM" class="but"> 
						<input type="button" value="Bank" class="but">
					  	</diV>
						
					</div>
			</div>
		</div>
		<div id="box_data">
			<div id="box_top">数据</div>
				<div id="box_center">
					<div class="row">
						<div class="col-xs-12 col-md-6 col-lg-6">
							<div id="highC1" class="panel panel-blue panel-widget highC">
							</div>
						</div>
						<div class="col-xs-12 col-md-6 col-lg-6">
							<div id="highC2" class="panel panel-yellow panel-widget highC">
							</div>
						</div>
						<div class="col-xs-12 col-md-6 col-lg-6">
							<div id="highC3" class="panel panel-success panel-widget highC">
							</div>
						</div>
						<div class="col-xs-12 col-md-6 col-lg-6">
							<div id="highC4" class="panel panel-orange panel-widget highC">
							</div>
						</div>
						<div class="col-xs-12 col-md-6 col-lg-6">
							<div id="highC5" class="panel panel-teal panel-widget highC">
							</div>
						</div>
						<div class="col-xs-12 col-md-6 col-lg-6">
							<div id="highC6" class="panel panel-red panel-widget highC">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
<script>
$(function () {
	
	for(var i=0;i<6;i++){
		(function(x){
			$('#highC'+(i+1)).click(function(){
				window.location.href = "atm/atmdata/detail.do";
			});
		})(i);
		var til = "";
		switch(i){
		case 0:til = "存款";
		break;
		case 1:til = "取款";
		break;
		case 2:til = "透支";
		break;
		case 3:til = "还信";
		break;
		case 4:til = "贷款";
		break;
		case 5:til = "还贷";
		break;
		}
		 // Create the chart
	    $('#highC'+(i+1)).highcharts({
	        chart: {
	            type: 'column'
	        },
	        title: {
	            text: til
	        },
	        subtitle: {
	            text: ''
	        },
	        xAxis: {
	            type: 'ATM ID'
	        },
	        yAxis: {
	            title: {
	                text: '次数/次'
	            }

	        },
	     // x轴显示内容
			xAxis : {
				// 要显示的分类名(可根据需求修改)
				categories : [ 'ATM1', 'ATM2','ATM3','ATM4','ATM5','ATM6',]
			},
	        legend: {
	            enabled: false
	        },
	        plotOptions: {
	            series: {
	                borderWidth: 0,
	                dataLabels: {
	                    enabled: true,
	                    format: '{point.y}'
	                }
	            }
	        },

	        tooltip: {
	            headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
	            pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y}</b> 次<br/>'
	        },

	        series: [{
	            name: 'ID',
	            colorByPoint: true,
	            data: [{
	                name: 'ATM1',
	                y: 12,
	                drilldown: 'Microsoft Internet Explorer'
	            }, {
	                name: 'ATM2',
	                y: 56,
	                drilldown: 'Chrome'
	            }, {
	                name: 'ATM3',
	                y: 34,
	                drilldown: 'Firefox'
	            }, {
	                name: 'ATM4',
	                y:45,
	                drilldown: 'Safari'
	            }, {
	                name: 'ATM5',
	                y:56,
	                drilldown: 'Opera'
	            }, {
	                name: 'ATM6',
	                y: 67,
	                drilldown: null
	            }]
	        }],
	        credits:{
	            text:"",
	            href:""
	        },
	        drilldown: {
	            series: [{
	                name: 'Microsoft Internet Explorer',
	                id: 'Microsoft Internet Explorer',
	                data: [
	                    [
	                        'v11.0',
	                        24.13
	                    ],
	                    [
	                        'v8.0',
	                        17.2
	                    ],
	                    [
	                        'v9.0',
	                        8.11
	                    ],
	                    [
	                        'v10.0',
	                        5.33
	                    ],
	                    [
	                        'v6.0',
	                        1.06
	                    ],
	                    [
	                        'v7.0',
	                        0.5
	                    ]
	                ]
	            }, {
	                name: 'Chrome',
	                id: 'Chrome',
	                data: [
	                    [
	                        'v40.0',
	                        5
	                    ],
	                    [
	                        'v41.0',
	                        4.32
	                    ],
	                    [
	                        'v42.0',
	                        3.68
	                    ],
	                    [
	                        'v39.0',
	                        2.96
	                    ],
	                    [
	                        'v36.0',
	                        2.53
	                    ],
	                    [
	                        'v43.0',
	                        1.45
	                    ],
	                    [
	                        'v31.0',
	                        1.24
	                    ],
	                    [
	                        'v35.0',
	                        0.85
	                    ],
	                    [
	                        'v38.0',
	                        0.6
	                    ],
	                    [
	                        'v32.0',
	                        0.55
	                    ],
	                    [
	                        'v37.0',
	                        0.38
	                    ],
	                    [
	                        'v33.0',
	                        0.19
	                    ],
	                    [
	                        'v34.0',
	                        0.14
	                    ],
	                    [
	                        'v30.0',
	                        0.14
	                    ]
	                ]
	            }, {
	                name: 'Firefox',
	                id: 'Firefox',
	                data: [
	                    [
	                        'v35',
	                        2.76
	                    ],
	                    [
	                        'v36',
	                        2.32
	                    ],
	                    [
	                        'v37',
	                        2.31
	                    ],
	                    [
	                        'v34',
	                        1.27
	                    ],
	                    [
	                        'v38',
	                        1.02
	                    ],
	                    [
	                        'v31',
	                        0.33
	                    ],
	                    [
	                        'v33',
	                        0.22
	                    ],
	                    [
	                        'v32',
	                        0.15
	                    ]
	                ]
	            }, {
	                name: '10002',
	                id: '10002',
	                data: [
	                    [
	                        'v8.0',
	                        2.56
	                    ],
	                    [
	                        'v7.1',
	                        0.77
	                    ],
	                    [
	                        'v5.1',
	                        0.42
	                    ],
	                    [
	                        'v5.0',
	                        0.3
	                    ],
	                    [
	                        'v6.1',
	                        0.29
	                    ],
	                    [
	                        'v7.0',
	                        0.26
	                    ],
	                    [
	                        'v6.2',
	                        0.17
	                    ]
	                ]
	            }, {
	                name: 'Opera',
	                id: 'Opera',
	                data: [
	                    [
	                        'v12.x',
	                        0.34
	                    ],
	                    [
	                        'v28',
	                        0.24
	                    ],
	                    [
	                        'v27',
	                        0.17
	                    ],
	                    [
	                        'v29',
	                        0.16
	                    ]
	                ]
	            }]
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
});
</script>
</html>