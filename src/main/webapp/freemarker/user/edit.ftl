<#include "../pageTitleBread.ftl">
	<div id="page-content">
			<div class="col-lg-12">
		        <div class="panel">
		            <div class="panel-heading">
		                <h3 class="panel-title">添加新用户</h3>
		            </div>
		            <form id="editForm" class="panel-body form-horizontal form-padding">
		            	<div class="form-group">
		                    <label class="col-md-3 control-label" for="demo-text-input">所属单位</label>
		                    <div class="col-md-5">
		                    	<div class="input-group mar-btm">
			                        <input type="text" id="orgname" name="orgname" class="form-control" disabled value="${(o.name)!''}">
			                        <input type="hidden" id="orgid" name="orgid" class="form-control" value="${(u.orgid)!''}">
			                        <input type="hidden"  name="id" class="form-control" value="${(u.id)!''}">
			                        <span class="input-group-btn">
			                            <button class="btn btn-mint" type="button" onclick="selectOneOrg()">选择</button>
			                        </span>
		                    	</div>
		                        <small class="help-block">请选择所属单位</small>
		                    </div>
		                </div>
		                <div class="form-group">
		                    <label class="col-md-3 control-label" for="demo-text-input">登录账号</label>
		                    <div class="col-md-9">
		                        <input type="text"  name="loginid" class="form-control"  value="${(u.loginid)!''}">
		                        <small class="help-block">请输入用户名(用来登录系统)</small>
		                    </div>
		                </div>
		                <div class="form-group">
		                    <label class="col-md-3 control-label" for="demo-text-input">密码</label>
		                    <div class="col-md-9">
		                        <input type="password"  name="password" class="form-control"  value="" <#if o??> placeholder="如果您不想修改密码,请将此项留空!" </#if> >
		                        <small class="help-block">请输入密码</small>
		                    </div>
		                </div>
		                <div class="form-group">
		                    <label class="col-md-3 control-label" for="demo-text-input">密码确认</label>
		                    <div class="col-md-9">
		                        <input type="password"  name="password2" class="form-control"  value="" <#if u??> placeholder="如果您不想修改密码,请将此项留空!" </#if>>
		                        <small class="help-block">请再次输入密码</small>
		                    </div>
		                </div>
		                <div class="form-group">
		                    <label class="col-md-3 control-label" for="demo-text-input">用户姓名</label>
		                    <div class="col-md-9">
		                        <input type="text"  name="username" class="form-control"  value="${(u.username)!''}">
		                        <small class="help-block">请输入用户姓名</small>
		                    </div>
		                </div>
		                <div class="form-group">
	                    	<label class="col-md-3 control-label" for="demo-text-input">性别</label>
                            <div class="col-md-9">
		                           <input id="sysUserSexMan" class="magic-radio" type="radio" name="sex" value="1" <#if (u.sex)?? && u.sex=='1'> checked </#if>>
		                           <label for="sysUserSexMan">男</label>
		                           <input id="sysUserSexWoman" class="magic-radio" type="radio" name="sex" value="0" <#if (u.sex)?? && u.sex=='0'> checked </#if>>
		                           <label for="sysUserSexWoman">女</label>
		                    </div>
                        </div>
                        <div class="form-group">
	                    	<label class="col-md-3 control-label" for="demo-text-input">移动电话</label>
                            <div class="col-md-9">
		                           <input type="text"  name="mobile" class="form-control"  value="${(u.mobile)!''}">
		                        <small class="help-block">请输入移动电话</small>
		                    </div>
                        </div>
                        <div class="form-group">
	                    	<label class="col-md-3 control-label" for="demo-text-input">邮箱地址</label>
                            <div class="col-md-9">
		                           <input type="text"  name="email" class="form-control"  value="${(u.email)!''}">
		                        <small class="help-block">请输入邮箱地址</small>
		                    </div>
                        </div>
                        <div class="form-group">
	                    	<label class="col-md-3 control-label" for="demo-text-input">身份证号</label>
                            <div class="col-md-9">
		                           <input type="text"  name="idcard" class="form-control"  value="${(u.idcard)!''}">
		                        <small class="help-block">请输入身份证号</small>
		                    </div>
                        </div>
                        <div class="form-group">
	                    	<label class="col-md-3 control-label" for="demo-text-input">是否是管理员</label>
                            <div class="col-md-9">
		                           <input id="sysUserIsAdmin" class="magic-radio" type="radio" value="0" name="is_admin" checked>
		                           <label for="sysUserIsAdmin">否</label>
		                           <input id="sysUserIsNotAdmin" class="magic-radio" type="radio" value="1" name="is_admin">
		                           <label for="sysUserIsNotAdmin">是</label>
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
		var ifEdit = "${(u.id)!'-1'}";//是否是修改页面
		var validPassword = {};//密码1
		var validPassword2 = {};//密码2
		var validUsername = {};//用户名 唯一性校验
		if(ifEdit != '-1'){//如果是修改 , 密码可以为空
			validPassword = {
                stringLength: {
                    max: 15,
                    message: '*密码长度必须小于15'
                }
            };
			validPassword2 = {
                stringLength: {
                    max: 15,
                    message: '*确认密码长度必须小于15'
                },
                identical: {
                	field: 'sysUser.password',
                	message: '*两次输入密码不一致'
                }
            };
			validUsername = {
                notEmpty: {
                    message: '*用户名不能为空'
                },
                stringLength: {
                    max: 15,
                    message: '*用户名长度必须小于15'
                }
            }
		}else{//新增的
				validPassword = {
	                notEmpty: {
	                    message: '*密码不能为空'
	                },
	                stringLength: {
	                    max: 15,
	                    message: '*密码长度必须小于15'
	                }
	            }
				
				validPassword2 = {
	                notEmpty: {
	                    message: '密码不能为空'
	                },
	                stringLength: {
	                    max: 15,
	                    message: '*确认密码长度必须小于15'
	                },
	                identical: {
	                	field: 'sysUser.password',
	                	message: '*两次输入密码不一致'
	                }
	            }
				validUsername = {
	                notEmpty: {
	                    message: '*用户名不能为空'
	                },
	                stringLength: {
	                    max: 15,
	                    message: '*用户名长度必须小于15'
	                },
	                remote: {
	                    message: '*用户名已被注册',
	                    url:ctx+'/admin/user/validUsername.shtml',
	                    delay:1000
	                }
		        }
		}
		function selectOneOrg(){
			//调用选择一个单位组件
			pointLion.selectOneOrg(function(orgNode){
				var thisId = $("#orgId").val();//主键
				$("#orgname").val(orgNode.name);//所选单位名称
				$("#orgid").val(orgNode.id);//所选单位id
				
			});
		}
		function save(){
            var parm = JSON.stringify($('#editForm').serializeJson());
			var data = common_ajax.ajaxFunc("/admin/user/save.shtml", parm, "json", null,"application/json");
			if(data.success){
				pointLion.alertMsg("保存成功!" , "success" , "small" , function(){
					doPjax(ctx+'/admin/user/getListPage.shtml');//跳转到列表页
				});
			}
		}
		$(document).ready(function() {
		    $('#editForm').bootstrapValidator({
		    		excluded:[":hidden"],//关键配置，表示只对于隐藏域不进行验证，其他的表单元素都要验证
		            fields: {
		            	"orgName":{
		            		validators: {
				                notEmpty: {
				                    message: '*所属单位不能为空'
				                }
				            }
		            	},
		            	"username": {
						    validators: validUsername
		                },
		                "password": {
						    validators: validPassword
		                },
		                "password2": {
						    validators: validPassword2
		                },
		                "name": {
						    validators: {
				                notEmpty: {
				                    message: '*用户姓名不能为空'
				                },
				                stringLength: {
				                    max: 15,
				                    message: '*确认密码长度必须小于15'
				                }
				            }
		                },
		                "mobile": {
						    validators: {
						    	regexp: {
									regexp: /^1(3|4|5|7|8)\d{9}$/,
									message: '*移动电话格式不对'
								}
				            }
		                },
		                "email": {
						    validators: {
						    	regexp: {
									regexp: /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/ ,
									message: '*邮箱格式不对'
								},
								stringLength: {
				                    max: 100,
				                    message: '*您的邮箱地址也太长了吧'
				                }
				            }
		                },
		                "idcard": {
						    validators: {
						    	regexp: {
									regexp: /^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/ ,
									message: '*身份证号格式不对'
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