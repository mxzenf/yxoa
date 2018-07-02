<#include "../pageTitleBread.ftl">
	<div id="page-content">
			<div class="col-lg-12">
		        <div class="panel">
		            <div class="panel-heading">
		                <h3 class="panel-title">通知公告</h3>
		            </div>
		            <form id="editForm" class="panel-body form-horizontal form-padding">
		            	<input type="hidden" name="id" value="${(o.id)!''}">
		            	<div class="form-group">
		                    <label class="col-md-2 control-label" for="demo-text-input">标题</label>
		                    <div class="col-md-8">
				                <input type="text"  name="title" class="form-control"  value="${(o.title)!''}" <#if view??&&view=="detail">readonly</#if> />
				                <small class="help-block">请输入公告标题</small>
		                    </div>
		                </div>
		                <div class="form-group">
		                    <label class="col-md-2 control-label" for="demo-text-input">主题（副标题）</label>
		                    <div class="col-md-8">
		                        <input type="text"  name="sub_title" class="form-control"  value="${(o.sub_title)!''}" <#if view??&&view=="detail">readonly</#if> />
		                        <small class="help-block">请输入公告主题（副标题）</small>
		                    </div>
		                </div>
		                <div class="form-group">
		                    <label class="col-md-2 control-label" for="demo-text-input">通知到单位</label>
		                    <div class="col-md-8">
		                        <div class="input-group mar-btm">
			                        <input type="hidden" id="toOrgid" name="to_org_id" value="${(o.to_org_id)!''}"  />
									<input type="text" id ="toOrgName" name="to_org_name" value="${(o.to_org_name)!''}" readonly class="form-control" />
			                        <span class="input-group-btn">
			                            <button class="btn btn-mint" type="button" onclick="selectManyOrg()">选择</button>
			                        </span>
			                    </div>
		                        <small class="help-block">请选择</small>
		                    </div>
		                </div>
		                <div class="form-group">
		                    <label class="col-md-2 control-label" for="demo-text-input">起草人</label>
		                    <div class="col-md-4">
		                    	<input type="hidden" name="sender_id" value="${(u.sender_id)!''}">
		                        <input type="text" name="sender_name" value="${(u.sender_name)!''}" readonly class="form-control">
		                    </div>
		                    <div class="col-md-4">
		                    	<input type="hidden" name="sender_orgid" value="${(u.sender_orgid)!''}">
		                        <input type="text" name="sender_orgname" value="${(u.sender_orgname)!''}" readonly class="form-control">
		                    </div>
		                </div>
		                
		                <div class="form-group">
		                    <label class="col-md-2 control-label" for="demo-text-input">公告正文</label>
		                </div>
		                <div class="form-group">
		                	<input type="hidden" name="content" id = "content">
		                    <div id="demo-summernote">${(o.content)!''}</div>
		                </div>


                       <#if !view??>
			                <div class="panel-footer">
			                    <div class="row">
			                        <div class="col-sm-9 col-sm-offset-3">
			                            <button class="btn btn-warning" type="reset">重置</button>
			                            <button class="btn btn-mint" type="button" onclick="doSave()" >保存</button>
			                        </div>
			                    </div>
			                </div>
			            </#if>
		            </form>
		        </div>
		    </div>
	</div>
	<script>
		function save(){
            var parm = JSON.stringify($('#editForm').serializeJson());
			var data = common_ajax.ajaxFunc("/admin/notice/save.shtml", parm, "json",null,"application/json");
			if(data.success){
				pointLion.alertMsg("保存成功!" , "success" , "small" , function(){
					doPjax(ctx+'/admin/notice/getListPage.shtml');//跳转到列表页
				});
			}
		}
		//表单校验
		function formValidate(){
			$('#editForm').bootstrapValidator({
	    		excluded:[":disabled"],
	            fields: {
	            	"title": {
	                    validators: {
	                        notEmpty: {
	                            message: '*公文标题不能为空'
	                        },
	                        stringLength: {
	                            max: 50,
	                            message: '*公文标题长度必须小于50'
	                        }
	                    }
	                },
	                "to_org_id":{
	                	validators: {
	                        notEmpty: {
	                            message: '*公文标题不能为空'
	                        }
	                    }
	                }
	            }
	        }).bootstrapValidator('validate');
		}
		//进行保存
		function doSave(){
			var content = $("#demo-summernote").summernote('code');
			$("#content").val(content);
			var validator = formValidate();//表单校验
			var va = $("#editForm").data('bootstrapValidator').isValid();
			if(va){
				save();
			}
		}
		//选择通知到单位
		function selectManyOrg(){
			pointLion.selectManyOrg(function(orgNode){
				var orgidArr = [];
				var orgnameArr = [];
				$.each(orgNode,function(i,d){
					orgidArr.push(d.id);
					orgnameArr.push(d.name);
				});
				$("#toOrgid").val(orgidArr.join(","));
				$("#toOrgName").val(orgnameArr.join(","));
				//重新校验
				if($("#editForm").data('bootstrapValidator')){
					$("#editForm").data('bootstrapValidator').destroy();
			        $('#editForm').data('bootstrapValidator', null);
				}
		        formValidate();
			});
		}
		//页面初始化
		$(document).ready(function() {
			$('#demo-summernote').summernote({
				toolbar: [    
							['style', ['style','bold', 'italic', 'underline', 'clear']],
						    ['font', ['strikethrough', 'superscript', 'subscript']],
						    ['fontname', ['fontname']],
						    ['fontsize', ['fontsize']],
						    ['color', ['color']],
						    ['para', ['ul', 'ol', 'paragraph']],
						    ['height', ['height']],
						    ['table', ['table']],
						    ['insert', ['link', 'picture', 'video']],
						    ['view', ['codeview','fullscreen']]
				      ],
				lang : 'zh-CN',
				dialogsFade : true,
				dialogsInBody : true,
				disableDragAndDrop : false,
				minHeight : '500px'
		    });
		});
	</script>