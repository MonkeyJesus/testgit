
$(function(){
	$("#tree ul").toggleClass($(this).data("class"), $(this).is(":checked"));	
	$("#formBut").click(function(){
		alert($("#roleId").val());
		if($("#roleId").val()==null || $("#roleId").val()==""){
			$("#addRoleForm").attr("action","role/createRole.do").submit();
		}else{
			$("#addRoleForm").attr("action","role/updateRole.do").submit();
		}
	});
	
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
	
	var treeData = [
	                {title: "item1 with key and tooltip", tooltip: "Look, a tool tip!" },
	                {title: "item2: selected on init", selected: true },
	                {title: "Folder", folder: true, key: "id3",
	                    children: [
	                        {title: "Sub-item 3.1",
	                            children: [
	                                {title: "Sub-item 3.1.1", key: "id3.1.1" },
	                                {title: "Sub-item 3.1.2", key: "id3.1.2" }
	                            ]
	                        },
	                        {title: "Sub-item 3.2",
	                            children: [
	                                {title: "Sub-item 3.2.1", key: "id3.2.1" },
	                                {title: "Sub-item 3.2.2", key: "id3.2.2" }
	                            ]
	                        }
	                    ]
	                },
	                {title: "Document with some children (expanded on init)", key: "id4", expanded: true,
	                    children: [
	                        {title: "Sub-item 4.1 (active on init)", active: true,
	                            children: [
	                                {title: "Sub-item 4.1.1", key: "id4.1.1" },
	                                {title: "Sub-item 4.1.2", key: "id4.1.2" }
	                            ]
	                        },
	                        {title: "Sub-item 4.2 (selected on init)", selected: true,
	                            children: [
	                                {title: "Sub-item 4.2.1", key: "id4.2.1" },
	                                {title: "Sub-item 4.2.2", key: "id4.2.2" }
	                            ]
	                        },
	                        {title: "Sub-item 4.3 (hideCheckbox)", hideCheckbox: true },
	                        {title: "Sub-item 4.4 (unselectable)", unselectable: true }
	                    ]
	                },
	                {title: "Lazy folder", folder: true, lazy: true }
	            ];
	
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
		source: {url: "resource/getResourceTree.do", debugDelay: 1000},
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
			data.result = {url: "resource/getResourceTree.do", debugDelay: 1000};
		},
		 select: function(event, data) {
             // Get a list of all selected nodes, and convert to a key array:
             var selKeys = $.map(data.tree.getSelectedNodes(), function(node){
                 return node.key;
             });
             var selVals = $.map(data.tree.getSelectedNodes(), function(node){
            	 return node.title;
             });
             $("#echoSelectionKey").val(selKeys.join(","));
             $("#echoSelectionTitle").text(selVals.join(","));
         },
		
	});
	

	
	
	
});
