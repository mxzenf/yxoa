<#include "../pageTitleBread.ftl">
                <div id="page-content">
			        <div class="col-sm-12 eq-box-sm">
			        	<div class="panel lion-fullHeight">
						    <div class="panel-body">
						        <table id="pageTable" class="demo-add-niftycheck" data-toolbar="#del,#add"
						               data-search="true"
						               data-show-refresh="true"
						               data-show-toggle="true"
						               data-show-columns="true"
						               data-sort-name="id"
						               data-page-list="[5, 10, 20]"
						               data-page-size="5"
						               data-pagination="true" data-show-pagination-switch="true" data-toggle="table"></table>
						    </div>
						</div>
			        </div>
                </div>
<script>
	var orgid = '';
	var col = [{
	       field: 'checked',
	       checkbox : true,
	       align: 'center'
	   }, {
	       field: 'SUSPENSION_STATE_',
	       title: '是否挂起',
	       align: 'center'
	   },{
	       field: 'id_',
	       title: '主键',
	       align: 'center'
	   },{
           field: 'deployment_id_',
	       title: '部署ID',
	       align: 'center'
	   }, {
	       field: 'key_',
	       title: '流程标识',
	       align: 'center'
	   }, {
	       field: 'name_',
	       title: '流程名称',
	       align: 'center'
	   }, {
	       field: 'version_',
	       title: '流程版本',
	       align: 'center'
	   }, {
           field: 'resource_name_',
	       title: '流程XML',
	       align: 'center',
		   formatter:function(value,row,index){
	       		return "<a target='_blank' href='${Request.ctx}/admin/workflow/resourceRead?procDefId="+row.id_+"&resType=xml' style='color:#2EB6FF;'>"+value+"</a>";
	       } 
	   }, {
           field: 'dgrm_resource_name_',
	       title: '流程图片',
	       align: 'center',
	       formatter:function(value,row,index){
	    	   return "<a target='_blank' href='${Request.ctx}/admin/workflow/resourceRead?procDefId="+row.id_+"&resType=image' style='color:#2EB6FF;'>"+value+"</a>";
	       } 
	   }, {
      	   field: 'deploy_time_',
	       title: '部署时间',
	       align: 'center'
	   }, {
	       field: 'control',
	       title: '操作',
	       align: 'center',
	       width:'440',
	       formatter:function(value,row,index){
	           var  a = '<a class="label label-table label-info" href="${Request.ctx}/processEditor/diagram-viewer/index.html?processDefinitionId='+row.id_+'" target="_blank">预览</a>&nbsp;';
					a = a + '<a class="label label-table label-success" onclick="convertToModel(\''+row.id_+'\')" href="javascript:void(0);">转化为模型</a>&nbsp;';
	           if(row.SUSPENSION_STATE_=="1"){//正在运行
	        	    a = a + '<a class="label label-table label-danger" onclick="updateState(\'suspend\',\''+row.id_+'\')" href="javascript:void(0);" >挂起</a>&nbsp;';
	           }else{
	        	    a = a + '<a class="label label-table label-success" onclick="updateState(\'active\',\''+row.id_+'\')" href="javascript:void(0);" >激活</a>&nbsp;';
	           }
					a = a + '<a class="label label-table label-danger" onclick="deleteDeployment(\''+row.deployment_id_+'\')" href="javascript:void(0);" >删除</a>';
	           return a;
	       } 
	   }];
	var opt = {
		    //请求方法
			   method: 'get',
			    //是否显示行间隔色
			   striped: true,
			   //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）     
			   cache: false,  
			   //data-toolbar: "#demo-delete-row",
			   //是否显示分页（*）  
			   pagination: true,   
			    //是否启用排序  
			   sortable: false,    
			    //排序方式 
			   sortOrder: "asc",    
			   //初始化加载第一页，默认第一页
			   //我设置了这一项，但是貌似没起作用，而且我这默认是0,- -
			   //pageNumber:1,   
			   //每页的记录行数（*）   
			   pageSize: 10,  
			   //可供选择的每页的行数（*）    
			   pageList: [10, 25, 50, 100],
			   //这个接口需要处理bootstrap table传递的固定参数,并返回特定格式的json数据  
			   url: ctx+"/admin/workflow/listData.shtml",
			   //默认值为 'limit',传给服务端的参数为：limit, offset, search, sort, order Else
			   //queryParamsType:'',   
			   ////查询参数,每次调用是会带上这个参数，可自定义                         
			   queryParams : function(params) {
			       return {
			             pageNumber: params.offset+1,
			             pageSize: params.limit,
			             orgid:orgid
			           };
			   },
			   //分页方式：client客户端分页，server服务端分页（*）
			   sidePagination: "client",
			   //是否显示搜索
			   search: false,  
			   //Enable the strict search.    
			   strictSearch: true,
			   //Indicate which field is an identity field.
			   idField : "id",
			   columns: col,
			   pagination:true
			}; 
		
	//表格
	function initTable(){
		$('#pageTable').bootstrapTable(opt);
		$('#pageTable').bootstrapTable('hideColumn', 'ID_');
		$('#pageTable').bootstrapTable('hideColumn', 'SUSPENSION_STATE_');
		$('#pageTable').bootstrapTable('hideColumn', 'DEPLOYMENT_ID_');
	}
	function refreshTable(){
		$("#pageTable").bootstrapTable('refresh', opt);
		$('#pageTable').bootstrapTable('hideColumn', 'ID_');
		$('#pageTable').bootstrapTable('hideColumn', 'SUSPENSION_STATE_');
		$('#pageTable').bootstrapTable('hideColumn', 'DEPLOYMENT_ID_');
	}
	//转化为模型
	function convertToModel(defid){
		var data = common_ajax.ajaxFunc("/admin/workflow/convertToModel",{"defid":defid}, "json", null);
		if(data.success){
			pointLion.alertMsg(data.message,"success",null,null);
		}
	}
	//删除
	function deleteDeployment(deployid){
		pointLion.confimMsg("您是否要删除所选信息 ?<br/>删除流程定义,<span style='color:red;'>将清空所有用户发起的流程实例！！！</span>请慎重您的选择！！！ <br/>点击确认进行删除 , 点击取消取消该操作",null,function(){
			//执行删除
			var data = common_ajax.ajaxFunc("/admin/workflow/deleteDeployment",{"deployid":deployid}, "json", null);
			//删除结果
			if(data.success){
				pointLion.alertMsg(data.message,"success",null,function(){
					doPjax(ctx+'/admin/workflow/getListPage');//跳转到列表页
				});
			}else{
				pointLion.alertMsg("操作失败","danger",null,null);
			}
		});
	};
	//挂起激活
	function updateState(state,defid){
		var message = "" 
		if(state=="suspend"){
			message = "您是否要将该流程挂起 ?<br/>挂起流程,<span style='color:red;'>该流程对应的业务将暂时使用！！！</span>请慎重您的选择！！！ <br/>点击确认进行挂起 , 点击取消取消该操作";
		}else{
			message = "您将要激活该流程！<br/>激活流程,<span style='color:green;'>该流程对应的业务将开启使用！！！</span> <br/>点击确认进行激活 , 点击取消取消该操作";
		}
		pointLion.confimMsg(message,null,function(){
			var data = common_ajax.ajaxFunc("/admin/workflow/updateState",{"state":state,"defid":defid}, "json", null);
			if(data.success){
				pointLion.alertMsg(data.message,"success",null,function(){
					doPjax(ctx+'/admin/workflow/getListPage');//跳转到列表页
				});
			}
		});
	}
	$(document).ready(function(){
		initFullHeight();//初始化高度
		initTable();//初始化表格
	});
</script>
