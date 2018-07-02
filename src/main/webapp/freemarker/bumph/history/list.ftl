				#include("/common/include/pageTitleBread.html")
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
	var col = [{
	       field: 'id',
	       title: 'id',
	       align: 'center'
	   },{
	       field: 'defid',
	       title: 'defid',
	       align: 'center'
	   },{
	       field: 'proc_ins_id',
	       title: 'proc_ins_id',
	       align: 'center'
	   }, {
	       field: 'doc_num',
	       title: '公文编号',
	       align: 'center'
	   }, {
	       field: 'title',
	       title: '公文标题',
	       align: 'center'
	   }, {
	       field: 'doc_type',
	       title: '公文类型',
	       align: 'center',
	       formatter:function(value,row,index){
	    	   if(value=="0"){
	    		   return "呈批文";
	    	   }else{
	    		   return "普通公文";
	    	   }
	       } 
	   }, {
	       field: 'sender_name',
	       title: '起草人',
	       align: 'center'
	   }, {
	       field: 'sender_orgname',
	       title: '起草单位',
	       align: 'center'
	   }, {
	       field: 'if_submit',
	       title: '是否提交',
	       align: 'center',
	       formatter:function(value,row,index){
	    	   if(value=='0'){//未提交
	    		   return "未提交";
	    	   }else{
	    		   return "已提交";
	    	   }
	       }
	   }, {
	       field: 'if_complete',
	       title: '是否完成',
	       align: 'center',
	       formatter:function(value,row,index){
	    	   if(value=='0'){//未提交
	    		   return "未完成";
	    	   }else{
	    		   return "已完成";
	    	   }
	       }
	   }, {
	       field: 'create_time',
	       title: '起草时间',
	       align: 'center'
	   }, {
	       field: 'if_submit',
	       title: '操作',
	       width:'300',
	       formatter:function(value,row,index){
	    	   var a = '';
	    	   if(value=='0'){//未提交
		           	a = a + '<a class="label label-table label-success" onclick="doPjax(\''+ctx+'/admin/bumph/getDraftEditPage?id='+row.id+'&view=detail\')" href="javascript:void(0);" >查看</a>&nbsp;';
	    	   }else{
	    		   a = a + '<a class="label label-table label-info" target="_blank" href="#(ctx)/processEditor/diagram-viewer/index.html?processDefinitionId='+row.defid+'&processInstanceId='+row.proc_ins_id+'" >跟踪</a>&nbsp;';
	    		   a = a + '<a class="label label-table label-success" onclick="doPjax(\''+ctx+'/admin/bumph/getDraftEditPage?id='+row.id+'&view=detail\')" href="javascript:void(0);" >查看</a>&nbsp;';
	    	   }
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
			   url: ctx+"/admin/bumph/partListData",
			   //默认值为 'limit',传给服务端的参数为：limit, offset, search, sort, order Else
			   //queryParamsType:'',   
			   ////查询参数,每次调用是会带上这个参数，可自定义                         
			   queryParams : function(params) {
			       return {
			             pageNumber: params.offset+1,
			             pageSize: params.limit
			           };
			   },
			   //分页方式：client客户端分页，server服务端分页（*）
			   sidePagination: "server",
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
		$('#pageTable').bootstrapTable('hideColumn', 'id');
		$('#pageTable').bootstrapTable('hideColumn', 'proc_ins_id');
		$('#pageTable').bootstrapTable('hideColumn', 'defid');

	}
	function refreshTable(){
		$("#pageTable").bootstrapTable('refresh', opt);
		$('#pageTable').bootstrapTable('hideColumn', 'id');
		$('#pageTable').bootstrapTable('hideColumn', 'proc_ins_id');
		$('#pageTable').bootstrapTable('hideColumn', 'defid');
	}
	//删除
	function del(ids){
		pointLion.confimMsg("您是否要删除所选信息 ?<br/> 点击确认进行删除 , 点击取消取消该操作",null,function(){
			//执行删除
			var data = common_ajax.ajaxFunc("/admin/bumph/delete",{"ids":ids}, "json", null);
			//删除结果
			if(data.success){
				pointLion.alertMsg(data.message,"success",null,function(){
					doPjax(ctx+'/admin/bumph/getDraftListPage');//跳转到列表页
				});
			}else{
				pointLion.alertMsg(data.message,"success",null,null);
			}
		});
	};
	//提交，启动流程
	function startProcess(id){
			pointLion.confimMsg("您将要提交该单据！并且启动流程<br/><span style='color:green;'>您将无法进行修改和删除！！！</span> <br/>点击确认进行提交 , 点击取消取消该操作",null,function(){
				var data = common_ajax.ajaxFunc("/admin/bumph/startProcess",{"id":id}, "json", null);
				if(data.success){
					pointLion.alertMsg(data.message,"success",null,function(){
						doPjax(ctx+'/admin/bumph/getDraftListPage');//跳转到列表页
					});
				}
			});
	}
	//撤回
	function callBack(id){
		pointLion.confimMsg("您将要撤回该单据流程！<br/><span style='color:red;'>该操作将取回单据，您将可以对单据进行修改，并可将单据重新送交审批。</span> <br/>点击确认进行撤回单据 , 点击取消取消该操作",null,function(){
			//执行删除
			var data = common_ajax.ajaxFunc("/admin/bumph/callBack",{"id":id}, "json", null);
			//删除结果
			if(data.success){
				pointLion.alertMsg(data.message,"success",null,function(){
					doPjax(ctx+'/admin/bumph/getDraftListPage');//跳转到列表页
				});
			}else{
				pointLion.alertMsg(data.message,"danger",null,null);
			}
		});
	}
	$(document).ready(function(){
		initFullHeight();//初始化高度
		initTable();//初始化表格
	});
</script>
