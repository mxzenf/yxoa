<#include "../../pageTitleBread.ftl">
                <div id="page-content">
			        <div class="col-sm-12 eq-box-sm">
			        	<div class="panel lion-fullHeight">
						    <div class="panel-body">
						        <a id="add" class="btn btn-info data-toolbar" onclick="doPjax('${Request.ctx}/admin/model/getAddPage.shtml')" href="javascript:void(0);"><i class="demo-pli-add"></i> 添加</a>
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
	var mid = '';
	var col = [{
	       field: 'checked',
	       checkbox : true,
	       align: 'center'
	   },{
	       field: 'id_',
	       title: 'id_',
	       align: 'center'
	   }, {
	       field: 'key_',
	       title: '模型标识',
	       align: 'center'
	   }, {
	       field: 'name_',
	       title: '模型名称',
	       align: 'center'
	   }, {
	       field: 'version_',
	       title: '模型版本',
	       align: 'center'
	   }, {
	       field: 'create_time_',
	       title: '创建时间',
	       align: 'center'
	   }, {
	       field: 'last_update_time_',
	       title: '最后更新时间',
	       align: 'center'
	   }, {
	       field: 'control',
	       title: '操作',
	       align: 'center',
	       width:'440',
	       formatter:function(value,row,index){
	           //通过formatter可以自定义列显示的内容
	           //value：当前field的值，即id
	           //row：当前行的数据
				var a = '<a class="label label-table label-success" href="${Request.ctx}/processEditor/modeler.html?modelId='+row.id_+'" target="_blank">编辑</a>&nbsp;';
					a = a + '<a class="label label-table label-success" onclick="deploy(\''+row.id_+'\')" href="javascript:void(0);" >部署</a>&nbsp;';
					a = a + '<a class="label label-table label-danger" onclick="del(\''+row.id_+'\')" href="javascript:void(0);" >删除</a>';
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
			   url: ctx+"/admin/model/listData.shtml",
			   //默认值为 'limit',传给服务端的参数为：limit, offset, search, sort, order Else
			   //queryParamsType:'',   
			   ////查询参数,每次调用是会带上这个参数，可自定义                         
			   queryParams : function(params) {
			       return {
			             pageNumber: params.offset+1,
			             pageSize: params.limit,
					     mid:mid
			           };
			   },
			   //分页方式：client客户端分页，server服务端分页（*）
			   sidePagination: "client",
			   //是否显示搜索
			   search: false,  
			   //Enable the strict search.    
			   strictSearch: true,
			   //Indicate which field is an identity field.
			   idField : "ID_",
			   columns: col,
			   pagination:true,
				onLoadSuccess : function(data){  //加载成功时执行
					console.log(data);
				}
			}; 
		
	//表格
	function initTable(){
		$('#pageTable').bootstrapTable(opt);
		$('#pageTable').bootstrapTable('hideColumn', 'ID_');
	}
	function refreshTable(){
		$("#pageTable").bootstrapTable('refresh', opt);
		$('#pageTable').bootstrapTable('hideColumn', 'ID_');
	}
	//删除
	function del(ids){
		pointLion.confimMsg("您是否要删除所选信息 ?<br/> 点击确认进行删除 , 点击取消取消该操作",null,function(){
			//执行删除
			var data = common_ajax.ajaxFunc("/admin/model/delete.shtml",{"id":ids}, "json", null);
			//删除结果
			if(data.success){
				pointLion.alertMsg(data.message,"success",null,function(){
					doPjax(ctx+'/admin/model/getListPage.shtml');//跳转到列表页
				});
			}else{
				pointLion.alertMsg("操作失败","danger",null,null);
			}
		});
	};

	//部署
	function deploy(id){
		var data = common_ajax.ajaxFunc("/admin/model/deploy.shtml",{"id":id}, "json", null);
		pointLion.alertMsg(data.message,"success",null,null);
	}
	$(document).ready(function(){
		initFullHeight();//初始化高度
		initTable();//初始化表格
	});
</script>
