<#include "../pageTitleBread.ftl">
	<div id="page-content">
			<div class="col-lg-12">
		        <div class="panel">
		            <div class="panel-heading">
		                <h3 class="panel-title"><#if r??>编辑角色<#else>新增角色</#if></h3>
		            </div>
		            <form id="editForm" class="panel-body form-horizontal form-padding">
		                <div class="form-group">
		                    <label class="col-md-3 control-label" for="demo-text-input">角色名称</label>
		                    <div class="col-md-9">
		                        <input type="text"  name="name" class="form-control"  value="${(r.name)!''}">
		                         <input type="hidden"  name="id" class="form-control" value="${(r.id)!''}">
		                        <small class="help-block">请输入角色名称</small>
		                    </div>
		                </div>
		                <div class="form-group">
		                    <label class="col-md-3 control-label" for="demo-text-input">角色标识</label>
		                    <div class="col-md-9">
		                        <input type="text"  name="role" class="form-control"  value="${(r.role)!''}" >
		                        <small class="help-block">请输入角色标识</small>
		                    </div>
		                </div>
		                <div class="form-group">
		                    <label class="col-md-3 control-label" for="demo-textarea-input">描述信息</label>
		                    <div class="col-md-9">
		                        <textarea name="description" rows="9" class="form-control">${(r.description)!''}</textarea>
		                        <small class="help-block">请输入描述信息</small>
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
			//console.log("参数:"+parm);
			var data = common_ajax.ajaxFunc("/admin/role/save.shtml", parm, "json", null,"application/json");
			console.log("返回数据:"+data);
			if(data.success){
				pointLion.alertMsg("保存成功!" , "success" , "small" , function(){
					doPjax(ctx+'/admin/role/getListPage.shtml');//跳转到列表页
				});
			}
		}
		$(document).ready(function() {
			$('#editForm').bootstrapValidator({
	            fields: {
	            	"name": {
	                    validators: {
	                        notEmpty: {
	                            message: '*角色名称不能为空'
	                        },
	                        stringLength: {/*长度提示*/
	                            max: 25,
	                            message: '*机构名称长度必须小于25'
	                        }
	                    }
	                },
	                "key": {
	                    validators: {
	                    	notEmpty: {
	                            message: '*角色标识不能为空'
	                        },
	                        stringLength: {/*长度提示*/
	                            max: 30,
	                            message: '*机构名称长度必须小于30'
	                        }
	                    }
	                },
	                "sysRole.description": {
	                    validators: {
	                    	stringLength: {
	                            max: 2000,
	                            message: '*机构描述信息长度必须小于2000'
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