<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户操作</title>
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

#leftdiv{
	float: left;
	width: 15%;
}
#topdiv{
	float: right;
	width: 85%;
}
#bottomdiv{
	float: right;
	width: 85%;
}
</style>

</head>
<body>
	<div id="box_border">
		<div id="box_top">搜索</div>
		<div id="box_center" style=" height: 100%">
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
				  	<input type="date"  class="sel" style="width:150px;">
				  	<diV style="margin-left: 30%;margin-top: -3%;">
					  	<input type="button" value="查询" class="but">
				  	</diV>
				</div>
		</div>
	</div>
	<div id="box_top">操作记录</div>
	<div id="leftdiv">
		<a href="#" class="list-group-item active">
		用户列表
		</a>
		<a href="#" class="list-group-item">张三</a>
		<a href="#" class="list-group-item">李四</a>
		<a href="#" class="list-group-item">王五</a>
		<a href="#" class="list-group-item">陈六</a>
		<a href="#" class="list-group-item">张三</a>
		<a href="#" class="list-group-item">李四</a>
		<a href="#" class="list-group-item">王五</a>
		<a href="#" class="list-group-item">陈六</a>
		<a href="#" class="list-group-item">王五</a>
		<a href="#" class="list-group-item">陈六</a>
	</div>
	<div id="topdiv" style="height: 200px">
		<div  id="userChart" style=" height: 100%">
		</div>
	</div>
	<div id="bottomdiv">
		<div>
		<table class="table" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
			<tr>
				<th>操作时间</th>
				<th>操作类型</th>
				<th>操作金额</th>
			</tr>
			<tr>
				<td>2016.4.19 16:45:32</td>
				<td>存款</td>
				<td>500￥</td>
			</tr>
			<tr>
				<td>2016.4.19 16:45:32</td>
				<td>存款</td>
				<td>500￥</td>
			</tr>
			<tr>
				<td>2016.4.19 16:45:32</td>
				<td>存款</td>
				<td>500￥</td>
			</tr>
			<tr>
				<td>2016.4.19 16:45:32</td>
				<td>存款</td>
				<td>500￥</td>
			</tr>
			<tr>
				<td>2016.4.19 16:45:32</td>
				<td>存款</td>
				<td>500￥</td>
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
</body>
<script>
$(function () {
    $('#userChart').highcharts({
        chart: {
            type: 'spline'
        },
        title: {
            text: '用户日操作轨迹'
        },
        subtitle: {
            text: ''
        },
        xAxis: {
            categories: ['01:00', '02:00', '03:00', '04:00', '05:00',
	                         '06:00', '07:00', '08:00', '09:00', '10:00', '11:00','12:00',
		                         '13:00','14:00','15:00','16:00','17:00','18:00','19:00','20:00','21:00','22:00','23:00','24:00']
        },
        yAxis: {
            title: {
                text: '次数'
            },
            labels: {
                formatter: function () {
                    return this.value;
                }
            }
        },
        tooltip: {
            crosshairs: true,
            shared: true
        },
        plotOptions: {
            spline: {
                marker: {
                    radius: 4,
                    lineColor: '#666666',
                    lineWidth: 1
                }
            }
        },
        series: [{
            name: '张三',
            marker: {
                symbol: ''
            },
            data: [1,0,2,0,0,0,1,0,0,0,0,0,0,0,0,0,1,2,2,0,0,0,0,1]

        }]
    });
});
</script>
</html>