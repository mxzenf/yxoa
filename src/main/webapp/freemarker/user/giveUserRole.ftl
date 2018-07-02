<#include "../include.ftl">
<div class="modal-dialog" style="width:100%">
    <div class="modal-content" style="height: 100%;">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" onclick="{parent.layer.closeAll();}"><i class="pci-cross pci-circle"></i></button>
            <h4 class="modal-title">给角色授权</h4>
        </div>

        <div class="modal-body">
            <ul id="treeDemo" class="ztree"></ul>
        </div>
    </div>
</div>

<script>
	var loginid = "${loginid}";
	//树
	var setting = {
		check: {
			enable: true
		},
		async : {
			enable : true,
			url : ctx + "/admin/role/getAllRoleTreeNode.shtml"
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
			onAsyncSuccess: function(){//默认选中已有的角色
				var zTree = $.fn.zTree.getZTreeObj("treeDemo");
				var data = common_ajax.ajaxFunc("/admin/role/getAllRoleByUserid.shtml", {"loginid":loginid}, "json", null);
				if(data&&data.length>0){
					$.each(data,function(i,d){
						var node = zTree.getNodeByParam("id", d.id, null);//根据id获取节点
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
	});
</script>
