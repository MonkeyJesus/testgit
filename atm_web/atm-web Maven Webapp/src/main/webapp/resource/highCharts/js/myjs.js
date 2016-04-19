$(document).ready(

function() {
	var map = new Map();

	map.put("10", "11_12_13");
	map.put("20", "21_22");
	map.put("30", "-1");
	var arr = map.keys();
	for (var i = 0; i < arr.length; i++) {
		// alert(map.get(arr[i]));
		var appTypes = map.get(arr[i]).split("_");
		var title = "";
		for (var j = 0; j < appTypes.length; j++) {
			// switch得到图表的标题
			switch (appTypes[j]) {
			case "11":
				title = "取款";
				break;
			case "12":
				title = "存款";
				break;
			case "13":
				title = "透支";
				break;
			case "21":
				title = "还信";
				break;
			case "22":
				title = "贷款";
				break;
			case "-1":
				title = "还贷";
				break;
			}
			var hcdivid = "hcdiv" + appTypes[j];
			var tadivid = "tadivid" + appTypes[j];
			createHCarts(arr[i], appTypes[j], hcdivid, title, tadivid);
		}
	}
});

/*
 * MAP对象，实现MAP功能
 * 
 * 接口： size() 获取MAP元素个数 isEmpty() 判断MAP是否为空 clear() 删除MAP所有元素 put(key, value)
 * 向MAP中增加元素（key, value) remove(key) 删除指定KEY的元素，成功返回True，失败返回False get(key)
 * 获取指定KEY的元素值VALUE，失败返回NULL element(index)
 * 获取指定索引的元素（使用element.key，element.value获取KEY和VALUE），失败返回NULL containsKey(key)
 * 判断MAP中是否含有指定KEY的元素 containsValue(value) 判断MAP中是否含有指定VALUE的元素 values()
 * 获取MAP中所有VALUE的数组（ARRAY） keys() 获取MAP中所有KEY的数组（ARRAY）
 * 
 * 例子： var map = new Map();
 * 
 * map.put("key", "value"); var val = map.get("key") ……
 * 
 */
function Map() {
	this.elements = new Array();

	// 获取MAP元素个数
	this.size = function() {
		return this.elements.length;
	}

	// 判断MAP是否为空
	this.isEmpty = function() {
		return (this.elements.length < 1);
	}

	// 删除MAP所有元素
	this.clear = function() {
		this.elements = new Array();
	}

	// 向MAP中增加元素（key, value)
	this.put = function(_key, _value) {
		this.elements.push({
			key : _key,
			value : _value
		});
	}

	// 删除指定KEY的元素，成功返回True，失败返回False
	this.remove = function(_key) {
		var bln = false;
		try {
			for (i = 0; i < this.elements.length; i++) {
				if (this.elements[i].key == _key) {
					this.elements.splice(i, 1);
					return true;
				}
			}
		} catch (e) {
			bln = false;
		}
		return bln;
	}

	// 获取指定KEY的元素值VALUE，失败返回NULL
	this.get = function(_key) {
		try {
			for (i = 0; i < this.elements.length; i++) {
				if (this.elements[i].key == _key) {
					return this.elements[i].value;
				}
			}
		} catch (e) {
			return null;
		}
	}

	// 获取指定索引的元素（使用element.key，element.value获取KEY和VALUE），失败返回NULL
	this.element = function(_index) {
		if (_index < 0 || _index >= this.elements.length) {
			return null;
		}
		return this.elements[_index];
	}

	// 判断MAP中是否含有指定KEY的元素
	this.containsKey = function(_key) {
		varbln = false;
		try {
			for (i = 0; i < this.elements.length; i++) {
				if (this.elements[i].key == _key) {
					bln = true;
				}
			}
		} catch (e) {
			bln = false;
		}
		return bln;
	}

	// 判断MAP中是否含有指定VALUE的元素
	this.containsValue = function(_value) {
		var bln = false;
		try {
			for (i = 0; i < this.elements.length; i++) {
				if (this.elements[i].value == _value) {
					bln = true;
				}
			}
		} catch (e) {
			bln = false;
		}
		return bln;
	}

	// 获取MAP中所有VALUE的数组（ARRAY）
	this.values = function() {
		var arr = new Array();
		for (i = 0; i < this.elements.length; i++) {
			arr.push(this.elements[i].value);
		}
		return arr;
	}

	// 获取MAP中所有KEY的数组（ARRAY）
	this.keys = function() {
		var arr = new Array();
		for (i = 0; i < this.elements.length; i++) {
			arr.push(this.elements[i].key);
		}
		return arr;
	}
}

// var val = map.get("key1");
// var val = map.containsKey("key1");
// var val = map.element(2).value;

// alert(val);

function createHCarts(appCategory, appType, hcdivid, title, tadivid) {
	/* 建模板 */
	var options = {
		chart : {
			renderTo : hcdivid,
			type : 'column',
			margin : 75,
			options3d : {
				enabled : true,
				alpha : 15,
				beta : 15,
				depth : 50,
				viewDistance : 25
			}
		},
		// 报表名称
		title : {
			text : title
		},
		// 补充说明
		subtitle : {
			text : 'top 5'

		},
		// x轴显示内容
		xAxis : {
			// 要显示的分类名(可根据需求修改)
			categories : [ 'count' ]
		},
		// y轴显示内容
		yAxis : {
			// min: 0,
			title : {
				text : '日访问量'
			}
		},
		events : {
			click : function() {
				// alert("dsd");
			}
		},
		tooltip : {
			enabled : true,
			animation : true,
			backgroundColor : '#FCFFC5'
		},
		exporting : {
			filename : 'demo',
		},
		// 数据来源(多个对比的)
		series : [ {
			name : 'Jane1',
			data : [ 1, 0, 4 ]
		} ],
		zoomType : "xy",
	/*
	 * events:{ click:function(){
	 *  } }
	 */
	};
	/* 填充数据 */
	// json url 地址这里我使用的controller
	$.ajax({
		url : "operater/topUrl.json",
		data : {
			appCategory : appCategory,
			appType : appType
		},
		success : function(data1) {
			var data =JSON.parse(data1);
			var len = data.length;
			var dataTmp = "";
			for (var i = 0; i < len; i++) {
				// 赋值 series(可根据需求修改)
				dataTmp += "{name:'" + data[i].id + "',data: [" + data[i].count
						+ "]}" + ",";
			}
			// 去除最后一个字符
			dataTmp = dataTmp.substring(0, dataTmp.length - 1);
			/* 修改模板 */
			options.series = eval("[" + dataTmp + "]");
			// options.chart.type= ss;
			// options.yAxis.title.text=data[len-1].id;
			/* 渲染 */

			var chart = new Highcharts.Chart(options);

			var tableid = "#" + tadivid;
			var hcartid = "#" + hcdivid;
			$(hcartid).click(
					function() {
						var title = "sasa";
						
						switch (appType) {
						case "11":
							title = "教师客户端";
							break;
						case "12":
							title = "教师安卓";
							break;
						case "13":
							title = "教师iOS";
							break;
						case "21":
							title = "学生安卓";
							break;
						case "22":
							title = "学生iOS";
							break;
						default:
							title = "家长端";
						}
						var url = "operater/index_detail.do?appCategory="
							+ appCategory + "&appType=" + appType;
						alert(url);
						window.location.href = url;
					});
		}
	});
	/*$.getJSON(url, {
		appCategory : appCategory,
		appType : appType
	}, function(data) {
		var len = data.length;
		var dataTmp = "";
		for (var i = 0; i < len; i++) {
			// 赋值 series(可根据需求修改)
			dataTmp += "{name:'" + data[i].id + "',data: [" + data[i].count
					+ "]}" + ",";
		}
		// 去除最后一个字符
		dataTmp = dataTmp.substring(0, dataTmp.length - 1);
		 修改模板 
		options.series = eval("[" + dataTmp + "]");
		// options.chart.type= ss;
		// options.yAxis.title.text=data[len-1].id;
		 渲染 
		var chart = new Highcharts.Chart(options);

		var tableid = "#" + tadivid;
		var hcartid = "#" + hcdivid;
		$(hcartid).click(
				function() {
					var url = "operater/index_detail.json?appCategory="
							+ appCategory + "&appType=" + appType;
					var title = "sasa";
					alert(url);
					switch (appType) {
					case "11":
						title = "教师客户端";
						break;
					case "12":
						title = "教师安卓";
						break;
					case "13":
						title = "教师iOS";
						break;
					case "21":
						title = "学生安卓";
						break;
					case "22":
						title = "学生iOS";
						break;
					default:
						title = "家长端";
					}

					window.location.href = url;
				});
	});*/
}

// 打开top5对话框
function openDialog(title, content) {
	$("#dlg").dialog({
		title : title,
		width : 1200,
		height : 400,
		closed : false,
		cache : false,
		modal : true,
		minimizable : true,
		maximizable : true,
		resizable : true,
		content : content
	});
	$('#dlg').window('center');
}

// 新增tab
function openTab(text, url, s) {
	var tab = $("#tabs");
	if (tab.tabs("exists", text)) { // 判断指定面板是否存在
		tab.tabs("close", text); // 如果存在则选中
	}
	// else {//如果不存在则添加面板
	// 页面布局
	var content = "<iframe frameborder='0' scrolling='auto' style='width: 100%;height: 100%' src ="
			+ url + " ></iframe>";
	tab.tabs("add", {
		title : text,// 设置选项卡标题
		selected : true, // 选中新增的tab
		closable : true, // 显示关闭按钮
		iconCls : s, // 设置选项卡图标
		content : content
	// 设置选项卡内容
	});
	// }
}
