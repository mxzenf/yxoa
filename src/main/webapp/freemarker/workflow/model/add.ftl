<#include "../../pageTitleBread.ftl">
	<div id="page-content">
			<div class="col-lg-12">
		        <div class="panel">
		            <div class="panel-heading">
		                <h3 class="panel-title">添加新模型</h3>
		            </div>
		            <form id="editForm" class="panel-body form-horizontal form-padding">
		                <div class="form-group">
		                    <label class="col-md-3 control-label" for="demo-text-input">模型名称</label>
		                    <div class="col-md-9">
		                        <input type="text"  name="name" class="form-control">
		                        <small class="help-block">请输入模型名称</small>
		                    </div>
		                </div>
		                <div class="form-group">
		                    <label class="col-md-3 control-label" for="demo-text-input">模型唯一标识</label>
		                    <div class="col-md-9">
		                        <input type="text"  name="key" class="form-control">
		                        <small class="help-block">请输入模型唯一标识</small>
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
		//执行保存
		function save(){
            var parm = JSON.stringify($('#editForm').serializeJson());
			var data = common_ajax.ajaxFunc("/admin/model/save.shtml", parm, "json", null,"application/json");
			if(data.success){
				pointLion.alertMsg("保存成功!" , "success" , "small" , function(){
					doPjax(ctx+'/admin/model/getListPage.shtml');//跳转到列表页
				});
			}else{
				pointLion.alertMsg("保存失败!" , "danger" , "small" , function(){
					doPjax(ctx+'/admin/model/getListPage.shtml');//跳转到列表页
				});
			}
		}
		$(document).ready(function() {
		    $('#editForm').bootstrapValidator({
		            fields: {
		            	"name":{
		            		validators: {
				                notEmpty: {
				                    message: '*模型名称不能为空'
				                },
				                stringLength: {
				                    max: 100,
				                    message: '*模型名称长度必须小于100'
				                }
				            }
		            	},
		            	"key": {
		            		validators: {
		            			notEmpty: {
				                    message: '*模型唯一标识不能为空'
				                },
				                stringLength: {
				                    max: 100,
				                    message: '*模型唯一标识长度必须小于100'
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