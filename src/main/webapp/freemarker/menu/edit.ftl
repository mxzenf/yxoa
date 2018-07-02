	<#include "../pageTitleBread.ftl">
	<div id="page-content">
			<div class="col-lg-12">
		        <div class="panel">
		            <div class="panel-heading">
		                <h3 class="panel-title">添加新菜单</h3>
		            </div>
		            <form id="editForm" class="panel-body form-horizontal form-padding">
		            	<div class="form-group">
		                    <label class="col-md-3 control-label" for="demo-text-input">父级菜单</label>
		                    <div class="col-md-5">
		                        <div class="input-group mar-btm">
                                    <input type="text" id="pName" value="<#if p??>${p.name}</#if>" readonly class="form-control">
									<input type="hidden" id ="pId" name="parent_id"  value="${(menu.parent_id)!''}">
									<input type="hidden" id = "menuId" name="id" value="${(menu.id)!''}">
			                        
			                        <span class="input-group-btn">
			                            <button class="btn btn-mint" type="button" onclick="selectOneMenu()">选择</button>
			                        </span>
			                    </div>
		                        <small class="help-block">请选择</small>
		                    </div>
		                </div>
		                <div class="form-group">
		                    <label class="col-md-3 control-label" for="demo-text-input">名称</label>
		                    <div class="col-md-9">
		                        <input type="text"  name="name" class="form-control"  value="${(menu.name)!''}">
		                        <small class="help-block">请输入机构名称</small>
		                    </div>
		                </div>
		                <div class="form-group">
		                    <label class="col-md-3 control-label" for="demo-text-input">权限标识</label>
		                    <div class="col-md-9">
		                        <input type="text"  name="permission" class="form-control"  value="${(menu.permission)!''}">
		                        <small class="help-block">请输入权限标识</small>
		                    </div>
		                </div>
		                <div class="form-group">
		                    <label class="col-md-3 control-label" for="demo-text-input">访问地址</label>
		                    <div class="col-md-9">
		                        <input type="text"  name="url" class="form-control"  value="${(menu.url)!''}">
		                        <small class="help-block">访问地址</small>
		                    </div>
		                </div>
		                <div class="form-group">
		                    <label class="col-md-3 control-label" for="demo-textarea-input">描述信息</label>
		                    <div class="col-md-9">
		                        <textarea name="description" rows="9" class="form-control">${(menu.description)!''}</textarea>
		                        <small class="help-block">请输入机构的描述信息</small>
		                    </div>
		                </div>
		                <div class="form-group">
		                    <label class="col-md-3 control-label" for="demo-text-input">是否显示</label>
		                    <div class="col-md-4" style="line-height: 30px;">
					                <input  type="checkbox" id="menuIfShow" name="if_show"  value="1" <#if (menu.if_show)?? && menu.if_show=='1'> checked </#if> >
		                    </div>
		                </div>
		                <div class="form-group">
		                    <label class="col-md-3 control-label" for="demo-text-input">显示顺序</label>
		                    <div class="col-md-4">
		                        <input type="text" name="sort" class="form-control" value="${(menu.sort)!''}">
		                        <small class="help-block">请输入机构显示顺序</small>
		                    </div>
		                </div>
		                <div class="panel-footer">
		                    <div class="row">
		                        <div class="col-sm-9 col-sm-offset-3">
		                            <button class="btn btn-warning" type="reset">重置</button>
		                            <button class="btn btn-mint" type="submit" >保存</button>
		                        </div>
		                    </div>
		                </div>
		            </form>
		        </div>
		    </div>
	</div>
	<script>
		function save(){
			var parm = JSON.stringify($('#editForm').serializeJson());
			var data = common_ajax.ajaxFunc("/admin/menu/save.shtml", parm, "json", null,"application/json");
			if(data.success){
				pointLion.alertMsg("保存成功!" , "success" , "small" , function(){
					doPjax(ctx+'/admin/menu/getListPage.shtml');//跳转到列表页
				});
			} else {
                pointLion.alertMsg("添加失败!" , "error" , "small" , function(){
                });
			}
		}
		//选择一个父级菜单
		var selectedNode={};
		function selectOneMenu(){
			layer.open({
				  type: 2,
				  title: false, //不显示标题栏
				  area: ['370px', '550px'],
				  shade: 0.8,
				  id: 'selectOneMenu', //设定一个id，防止重复弹出
				  resize: false,
				  closeBtn: false,
				  isOutAnim : false , 
				  btn: ['确定', '取消'], 
				  btnAlign: 'c',
				  content: ctx+'/admin/menu/getSelectOneMenuPage.shtml',
				  success: function(layero){
					  
				  },
				  yes: function(){
					  	var thisId = $("#menuId").val();//主键
						if(thisId==selectedNode.id){
							 layer.closeAll();
							 pointLion.alertMsg("您不能选择自己为父级节点!" , "warning" , "small" , null);
							 return;
						}
						$("#pName").val(selectedNode.name);//所选父级菜单名称
						$("#pId").val(selectedNode.id);//所选父级
					  	layer.closeAll();
				  }
				});
		}
		function setOneMenuNode(node){
			selectedNode = node;
		}
		
		
		$(document).ready(function() {
			new Switchery(document.getElementById('menuIfShow'));//制做开关按钮
		    $('#editForm').bootstrapValidator({
		            fields: {
		            	"name": {
		                    validators: {
		                        notEmpty: {
		                            message: '*菜单名称不能为空'
		                        },
		                        stringLength: {/*长度提示*/
		                            max: 25,
		                            message: '*菜单名称长度必须小于25'
		                        }
		                    }
		                },
		                "sort": {
		                    validators: {
		                    	lessThan: {
		        					inclusive:true,
		        					value: 99,
		        					message: '*请输入小于99的数字'
		        				}
		                    }
		                },
		                "url": {
		                    validators: {
		                    	stringLength: {
		                            max: 100,
		                            message: '*访问地址长度小于100'
		                        }
		                    }
		                },
		                "url": {
		                    validators: {
		                    	stringLength: {
		                            max: 100,
		                            message: '*访问地址长度小于100'
		                        }
		                    }
		                },
		                "permission": {
		                    validators: {
		                    	stringLength: {
		                            max: 20,
		                            message: '*权限标识长度须小于20'
		                        }
		                    }
		                }
		            }
		        }).on("success.form.bv", function (e) {
		            save();
		            return false;//阻止表单跳转
		        });
		});
	</script>