<#include "../pageTitleBread.ftl">
	<div id="page-content">
			<div class="col-lg-12">
		        <div class="panel">
		            <div class="panel-heading">
		                <h3 class="panel-title">添加新机构</h3>
		            </div>
		            <form id="editForm" class="panel-body form-horizontal form-padding">
		            	<div class="form-group">
		                    <label class="col-md-3 control-label" for="demo-text-input">父级机构</label>
		                    <div class="col-md-5">
		                        <div class="input-group mar-btm">
			                        <input type="text" id="pName" value="<#if pName??>${pName}</#if>" readonly class="form-control">
									<input type="hidden" id ="pId" name="parent_id"  value=""${(o.parent_id)!''}"">
									<input type="hidden" id = "orgId" name="id" value="${(o.id)!''}">
			                        
			                        <span class="input-group-btn">
			                            <button class="btn btn-mint" type="button" onclick="selectOneOrg()">选择</button>
			                        </span>
			                    </div>
		                        <small class="help-block">请选择</small>
		                    </div>
		                </div>
		                <div class="form-group">
		                    <label class="col-md-3 control-label" for="demo-text-input">机构名称</label>
		                    <div class="col-md-9">
		                        <input type="text"  name="name" class="form-control"  value="${(o.name)!''}">
		                        <small class="help-block">请输入机构名称</small>
		                    </div>
		                </div>
		                <div class="form-group">
		                    <label class="col-md-3 control-label" for="demo-textarea-input">描述信息</label>
		                    <div class="col-md-9">
		                        <textarea name="description" rows="9" class="form-control">${(o.description)!''}</textarea>
		                        <small class="help-block">请输入机构的描述信息</small>
		                    </div>
		                </div>
		                <div class="form-group">
		                    <label class="col-md-3 control-label" for="demo-text-input">显示顺序</label>
		                    <div class="col-md-4">
		                        <input type="text" name="sort" class="form-control" value="${(o.sort)!''}">
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
			var data = common_ajax.ajaxFunc("/admin/org/save.shtml", parm, "json", null,"application/json");
			if(data.success){
				pointLion.alertMsg("保存成功!" , "success" , "small" , function(){
					doPjax(ctx+'/admin/org/getListPage.shtml');//跳转到列表页
				});
			}
		}
		function selectOneOrg(){
			//调用选择一个单位组件
			pointLion.selectOneOrg(function(orgNode){
				var thisId = $("#orgId").val();//主键
				if(thisId==orgNode.id){
					 layer.closeAll();
					 pointLion.alertMsg("您不能选择自己为父级节点!" , "warning" , "small" , null);
					 return;
				}
				$("#pName").val(orgNode.name);//所选单位名称
				$("#pId").val(orgNode.id);//所选单位id
			});
		}
		$(document).ready(function() {
		    	$('#editForm').bootstrapValidator({
		            fields: {
		            	"sysOrg.name": {
		                    validators: {
		                        notEmpty: {
		                            message: '*机构名称不能为空'
		                        },
		                        stringLength: {/*长度提示*/
		                            max: 25,
		                            message: '*机构名称长度必须小于25'
		                        }
		                    }
		                },
		                "sysOrg.sort": {
		                    validators: {
		                    	lessThan: {
		        					inclusive:true,
		        					value: 20,
		        					message: '*请输入小于20的数字'
		        				}
		                    }
		                },
		                "sysOrg.description": {
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