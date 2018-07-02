<#include "../../../include.ftl">
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
    <div class="modal-content" style="height: 100%;">
        <div class="modal-header lay-header">
            <button type="button" class="close" data-dismiss="modal" onclick="{parent.layer.closeAll();}"><i class="pci-cross pci-circle"></i></button>
            <h4 class="modal-title">选择单位</h4>
        </div>

        <div class="modal-body lay-body">
            <ul id="treeDemo" class="ztree"></ul>
        </div>
    </div>
</div>

<script>
	//树
	var setting = {
		async : {
			enable : true,
			url : ctx + "/admin/org/getOrgTree.shtml"
		},
		callback : {
			onClick : clickNode
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
        }
	};
	/***
	* 选择树
	**/
	function clickNode(event, treeId, treeNode, clickFlag) {
		parent.pointLion.setOneOrgNode(treeNode);	
	}
	$(document).ready(function() {
		$.fn.zTree.init($("#treeDemo"), setting);//初始化树
		var clientH = document.body.clientHeight-54;
		$(".lay-body").css("height",clientH+"px");
	});
</script>
