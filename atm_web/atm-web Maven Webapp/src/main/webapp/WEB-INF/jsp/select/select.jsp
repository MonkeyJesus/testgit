<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Fancytree - Example: Glyph Extension / Bootstrap Theme</title>

	<meta http-equiv="content-type" content="text/html; charset=utf-8">
<!--
	<meta name="viewport" content="width=device-width, initial-scale=1">
-->

	<script src="https://code.jquery.com/jquery-1.12.1.min.js" type="text/javascript"></script>
	<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js" type="text/javascript"></script>
<!--
	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css">
	<link href="../src/skin-awesome/ui.fancytree.css" rel="stylesheet" type="text/css" class="skinswitcher">
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css">
-->
	<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" type="text/javascript"></script>

	<link href="${pageContext.request.contextPath}/resource/static/fancytree/ui.fancytree.css" rel="stylesheet" type="text/css"
		class="skinswitcher">

	<script src="${pageContext.request.contextPath}/resource/static/fancytree/jquery.fancytree.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resource/static/fancytree/jquery.fancytree.dnd.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resource/static/fancytree/jquery.fancytree.edit.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resource/static/fancytree/jquery.fancytree.glyph.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resource/static/fancytree/jquery.fancytree.table.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resource/static/fancytree/jquery.fancytree.wide.js" type="text/javascript"></script>

<!-- Start_Exclude: This block is not part of the sample code -->
	<link href="${pageContext.request.contextPath}/resource/static/fancytree/prettify.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/resource/static/fancytree/prettify.js" type="text/javascript"></script>
	<link href="${pageContext.request.contextPath}/resource/static/fancytree/sample.css" rel="stylesheet" type="text/css">
	<script src="${pageContext.request.contextPath}/resource/static/fancytree/sample.js" type="text/javascript"></script>

	<style type="text/css">
		body {
			padding: 15px;
		}
		ul.fancytree-container {
			border: none;
		}
		/* Reduce bootstrap's default 'panel' padding: */
		div#tree {
			padding: 3px 5px;
		}
	</style>
<!-- End_Exclude -->

<style type="text/css">
	/* Define custom width and alignment of table columns */
	#treetable {
		table-layout: fixed;
	}
	#treetable tr td:nth-of-type(1) {
		text-align: right;
	}
	#treetable tr td:nth-of-type(2) {
		text-align: center;
	}
	#treetable tr td:nth-of-type(3) {
		min-width: 100px;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
</style>


<!-- Add code to initialize the tree when the document is loaded: -->
<script type="text/javascript">
	glyph_opts = {
		map: {
			doc: "glyphicon glyphicon-file",
			docOpen: "glyphicon glyphicon-file",
			checkbox: "glyphicon glyphicon-unchecked",
			checkboxSelected: "glyphicon glyphicon-check",
			checkboxUnknown: "glyphicon glyphicon-share",
			dragHelper: "glyphicon glyphicon-play",
			dropMarker: "glyphicon glyphicon-arrow-right",
			error: "glyphicon glyphicon-warning-sign",
			expanderClosed: "glyphicon glyphicon-menu-right",
			expanderLazy: "glyphicon glyphicon-menu-right",  // glyphicon-plus-sign
			expanderOpen: "glyphicon glyphicon-menu-down",  // glyphicon-collapse-down
			folder: "glyphicon glyphicon-folder-close",
			folderOpen: "glyphicon glyphicon-folder-open",
			loading: "glyphicon glyphicon-refresh glyphicon-spin"
		}
	};
	$(function(){
		// Initialize Fancytree
		$("#tree").fancytree({
			extensions: ["dnd", "edit", "glyph", "wide"],
			checkbox: true,
			dnd: {
				focusOnClick: true,
				dragStart: function(node, data) { return true; },
				dragEnter: function(node, data) { return false; },
				dragDrop: function(node, data) { data.otherNode.copyTo(node, data.hitMode); }
			},
			glyph: glyph_opts,
			selectMode: 2,
			/* source: {url: "ajax-tree-taxonomy.json", debugDelay: 1000}, */
			source: {url: "${pageContext.request.contextPath}/resource/getResourceTree.do", debugDelay: 1000},
			/* source: treeData, */ 
			toggleEffect: { effect: "drop", options: {direction: "left"}, duration: 400 },
			wide: {
				iconWidth: "1em",     // Adjust this if @fancy-icon-width != "16px"
				iconSpacing: "0.5em", // Adjust this if @fancy-icon-spacing != "3px"
				levelOfs: "1.5em"     // Adjust this if ul padding != "16px"
			},
			icon: function(event, data){
				// if( data.node.isFolder() ) {
				// 	return "glyphicon glyphicon-book";
				// }
			},
			lazyLoad: function(event, data) {
				data.result = {url: "ajax-sub2.json", debugDelay: 1000};
			}
		});
		$("#treetable").fancytree({
			extensions: ["dnd", "edit", "glyph", "table"],
			checkbox: true,
			dnd: {
				focusOnClick: true,
				dragStart: function(node, data) { return true; },
				dragEnter: function(node, data) { return true; },
				dragDrop: function(node, data) { data.otherNode.copyTo(node, data.hitMode); }
			},
			glyph: glyph_opts,
			source: {url: "${pageContext.request.contextPath}/resource/getResourceTree.do", debugDelay: 1000},
			table: {
				checkboxColumnIdx: 1,
				nodeColumnIdx: 2
			},
			activate: function(event, data) {
			},
			lazyLoad: function(event, data) {
				data.result = {url: "ajax-sub2.json", debugDelay: 1000};
			},
			renderColumns: function(event, data) {
				var node = data.node,
					$tdList = $(node.tr).find(">td");
				$tdList.eq(0).text(node.getIndexHier());
				$tdList.eq(3).text(!!node.folder);
			}
		});
	});
</script>

<!-- Start_Exclude: This block is not part of the sample code -->
<script>
$(function(){
	$("#btnExpandAll").click(function(){
		$("#tree").fancytree("getTree").visit(function(node){
			node.setExpanded(true);
		});
	});
	$("#btnCollapseAll").click(function(){
		$("#tree").fancytree("getTree").visit(function(node){
			node.setExpanded(false);
		});
	});
	$( "#fontSize" ).change(function(){
		$("#tree .fancytree-container").css("font-size", $(this).prop("value") + "pt");
	});//.prop("value", 12);
	$("#plainTreeStyles").on("change", "input", function(e){
		$("#tree ul").toggleClass($(this).data("class"), $(this).is(":checked"));
	});
	$("#bootstrapTableStyles").on("change", "input", function(e){
		$("#treetable").toggleClass($(this).data("class"), $(this).is(":checked"));
	});
});
</script>
<!-- End_Exclude -->

</head>

<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h1>Example: Bootstrap theme</h1>
		</div>
		<div class="panel-body">
			<p>
				The 'glyph' extension adds <code>icon-...</code> classes to the
				node's <code>span</code> tags, so scalable vector icons as provided by
				<a href="http://fortawesome.github.io/Font-Awesome/" class="external" target="_blank">Font Awesome</a> or <a href="http://getbootstrap.com/components/" class="external" target="_blank">Bootstrap Glyphicons</a> can be used.
			</p>
			<p>
				The theme defines some colors from bootstrap. To change it, run
				<a href="https://github.com/mar10/fancytree/wiki/HowtoContribute">grunt dev</a> and edit the
				<a href="https://github.com/mar10/fancytree/blob/master/src/skin-bootstrap/ui.fancytree.less" class="external" target="_blank">LESS definition</a>.
			</p>
			<p>
				<b>Status</b>: alpha
			</p>
		</div>
	</div>

	<p>
		Font size: <span id="curSize"></span>
		<input id="fontSize" type="number" min="4" max="48" value="10"> pt
	</p>

	<h3> Plain tree </h3>

	<p id="plainTreeStyles">
		<b>Add container class:</b><br>
<!--
		<label><input type="checkbox" data-class="fancytree-colorize-hover"> fancytree-colorize-hover</label>
-->
		<label><input type="checkbox" data-class="fancytree-colorize-selected"> fancytree-colorize-selected</label>
	</p>

	<div class="panel panel-default">
		<div class="panel-heading">
			<b>Taxonomy</b>
		</div>
		<div id="tree" class="panel-body fancytree-colorize-hover fancytree-fade-expander">
		</div>
		<div class="panel-footer">
			<button id="btnExpandAll" class="btn btn-xs btn-primary">Expand all</button>
			<button id="btnCollapseAll" class="btn btn-xs btn-warning">Collapse all</button>
		</div>
	</div>

	<h3> Table tree </h3>

	<p id="bootstrapTableStyles">
		<b>Add table class:</b><br>
		<label><input type="checkbox" data-class="table-bordered"> table-bordered</label>
		<label><input type="checkbox" data-class="table-condensed" checked="checked"> table-condensed</label>
		<label><input type="checkbox" data-class="table-striped" checked="checked"> table-striped</label>
		<label><input type="checkbox" data-class="table-hover" checked="checked"> table-hover</label>
		<label><input type="checkbox" data-class="table-responsive"> table-responsive</label>
		<label><input type="checkbox" data-class="fancytree-colorize-selected"> fancytree-colorize-selected</label>
	</p>

	<table id="treetable" class="table table-condensed table-hover table-striped fancytree-fade-expander">
		<colgroup>
			<col width="80px"></col>
			<col width="30px"></col>
			<col width="*"></col>
			<col width="100px"></col>
			<col width="100px"></col>
			<col width="100px"></col>
		</colgroup>
		<thead>
			<tr> <th></th> <th></th> <th>Classification</th> <th>Folder</th> <th></th> <th></th> </tr>
		</thead>
		<tbody>
			<tr> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr>
		</tbody>
	</table>


	<!-- Start_Exclude: This block is not part of the sample code -->
	<hr>
	<pre id="sourceCode" class="prettyprint" style="display:none"></pre>
	<!-- End_Exclude -->
</body>
</html>