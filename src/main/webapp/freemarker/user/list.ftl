<#include "../pageTitleBread.ftl">
                <div id="page-content">
                	<div class="col-sm-2 eq-box-sm">
			            <div class="panel lion-fullHeight">
			                <div class="panel-body">
			                    <ul id="treeDemo" class="ztree"></ul>
			                </div>
			            </div>
			        </div>
			        <div class="col-sm-10 eq-box-sm">
			        	<div class="panel lion-fullHeight">
						    <div class="panel-body">
						        <a id="add" class="btn btn-info data-toolbar" onclick="getEditPage()" href="javascript:void(0);"><i class="demo-pli-add"></i> 添加</a>
								<a id="del" class="btn btn-danger data-toolbar" onclick="delSel()" href="javascript:void(0);"><i class="demo-pli-cross"></i> 批量删除</a>
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
	   },{
	       field: 'id',
	       title: 'id',
	       align: 'center'
	   }, {
        field: 'loginid',
        title: '登录账号',
        align: 'center'
       },{
	       field: 'userid',
	       title: '用户id',
	       align: 'center'
	   }, {
	       field: 'username',
	       title: '用户名称',
	       align: 'center'
	   }, {
	       field: 'sex',
	       title: '性别',
	       align: 'center',
	       formatter:function(value,row,index){
	           if(value=="1"){
	        	   return "男";
	           }else{
	        	   return "女";
	           }
	       } 
	   }, {
	       field: 'orgname',
	       title: '所属单位',
	       align: 'center'
	   }, {
	       field: 'mobile',
	       title: '电话',
	       align: 'center'
	   }, {
	       field: 'email',
	       title: '邮箱',
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
	           var a = '<a class="label label-table label-info" onclick="giveUserRole(\''+row.loginid+'\')" href="javascript:void(0);" >授权</a>&nbsp;';
					a = a + '<a class="label label-table label-success" onclick="doPjax(\''+ctx+'/admin/user/getEditPage.shtml?loginid='+row.loginid+'\')" href="javascript:void(0);" >编辑</a>&nbsp;';
					a = a + '<a class="label label-table label-danger" onclick="del(\''+row.id+'\')" href="javascript:void(0);" >删除</a>';
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
			   url: ctx+"/admin/user/listData.shtml",
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
			   pagination:true,
		       onLoadSuccess : function(data){  //加载成功时执行
					console.log(data);
			   }
			}; 
		
	//表格
	function initTable(){
		$('#pageTable').bootstrapTable(opt);
		$('#pageTable').bootstrapTable('hideColumn', 'id');
	}
	function refreshTable(){
		$("#pageTable").bootstrapTable('refresh', opt);
		$('#pageTable').bootstrapTable('hideColumn', 'id');
	}
	//树
	var setting = {
		async: {
			enable: true,
			url:ctx+"/admin/org/getOrgTree.shtml"
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
			onClick: clickNode
		}
	};
	function clickNode(event, treeId, treeNode, clickFlag){
		orgid = treeNode.id;
		//刷新表格
		refreshTable();
	}
	//删除
	function del(ids){
		pointLion.confimMsg("您是否要删除所选信息 ?<br/> 点击确认进行删除 , 点击取消取消该操作",null,function(){
			//执行删除
			var data = common_ajax.ajaxFunc("/admin/user/delete",{"ids":ids}, "json", null);
			//删除结果
			if(data.success){
				pointLion.alertMsg(data.message,"success",null,function(){
					doPjax(ctx+'/admin/user/getListPage');//跳转到列表页
				});
			}else{
				pointLion.alertMsg(data.message,"success",null,null);
			}
		});
	};
	//批量删除
	function delSel(){
		var data = [];
		$("#pageTable input[type='checkbox'][name!='btSelectAll']:checked").each(function(){
			data.push($(this).val());
		});
		if(data.length==0){
			pointLion.alertMsg("请选择要删除的数据!","danger",null,null);
			return;
		}
		del(data.join(","));//执行删除
	}
	//给用户赋值角色
	var giveUserRoleIframe;
	function giveUserRole(loginid){
			var index = layer.open({
							  type: 2,
							  title: false, //不显示标题栏
							  area: ['370px', '650px'],
							  shade: 0.8,
							  id: 'giveUserRole', //设定一个id，防止重复弹出
							  resize: false,
							  closeBtn: false,
							  isOutAnim : false , 
							  btn: ['确定', '取消'], 
							  btnAlign: 'c',
							  content: ctx+'/admin/user/getGiveUserRolePage.shtml?loginid='+loginid,
							  success: function(layero){
								  giveUserRoleIframe = window[layero.find('iframe')[0]['name']]; 
							  },
							  yes: function(){
								  	var nodes = giveUserRoleIframe.getCheckedNodes();
								  	var nodestr = [];
								  	$.each(nodes,function(i,o){
								  		nodestr.push(o.id);
								  	})
								  	var data = nodestr.join(",");//用户缩勾选的角色
								  	var result = common_ajax.ajaxFunc("/admin/user/giveUserRole.shtml",JSON.stringify({"data":data,"loginid":loginid}), "json", null,"application/json");//保存所有角色
								  	if(result.success){
								  		pointLion.alertMsg("保存成功","success",null,null);
								  	}else{
								  		pointLion.alertMsg("保存失败","danger",null,null);
								  	}
								  	layer.closeAll();
							  }
						});
	}
	var roleAuth;
	function setRoleAuth(data){
		roleAuth = data;
	}
	
	//打开编辑页面
	function getEditPage(){
		doPjax("${Request.ctx}/admin/user/getEditPage.shtml?orgid="+orgid)
	}
	$(document).ready(function(){
		initFullHeight();//初始化高度
		$.fn.zTree.init($("#treeDemo"), setting);//初始化树
		initTable();//初始化树
	});
</script>
