<#include "../include.ftl">
<style>
	.lay-body{
		margin-top: 52px;
		overflow-y: auto;
		overflow-x: unset;
	}
	.lay-header{
		position: absolute;
		top: 0px;
		width: 100%;
	}
</style>
<div class="modal-dialog" style="width:100%">
    <div class="modal-content" style="min-height: 100%;">
        <div class="modal-header lay-header">
            <button type="button" class="close" data-dismiss="modal" onclick="{parent.layer.closeAll();}"><i class="pci-cross pci-circle"></i></button>
            <h4 class="modal-title">给角色授权</h4>
        </div>

        <div class="modal-body lay-body">
            <ul id="treeDemo" class="ztree"></ul>
        </div>
    </div>
</div>

<script>
	var roleid = "${roleid}";
	//树
	var setting = {
		check: {
			enable: true
		},
		async : {
			enable : true,
			url : ctx + "/admin/menu/getAllMenuTree.shtml?ifshow=0",
            dataType : "json"
		},
        data:
        {
            simpleData:
            {
                enable: true,
                idKey: "id",
                pIdKey: "pId",
                rootPId: "0"
            }
        },
		callback: {
			onAsyncSuccess: function(){//默认勾选已有的权限
				var zTree = $.fn.zTree.getZTreeObj("treeDemo");
				var data = common_ajax.ajaxFunc("/admin/role/getRoleAuthByRoleid.shtml", {"roleid":roleid}, "json", null);
                //var data = common_ajax.ajaxFunc("/admin/role/listData.shtml", {"roleid":roleid}, "json", null);
				if(data&&data.length>0){
					$.each(data,function(i,d){
						var node = zTree.getNodeByParam("id", d.id, null);//根据menuid获取节点
						if(node){
							zTree.checkNode(node, true, false, true);//将节点选中
						}
					})
				}
			}
		}
	};
	
	//获取选择的节点
	function getCheckedNodes(){
		var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
		var nodes = treeObj.getCheckedNodes(true);
		return nodes;
	}
	$(document).ready(function() {
		$.fn.zTree.init($("#treeDemo"), setting);//初始化树
		var clientH = document.body.clientHeight-54;
		$(".lay-body").css("height",clientH+"px");
	});
</script>
