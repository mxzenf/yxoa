	<#include "../pageTitleBread.ftl">
				
				<#--#define makeMenu(m,p)-->
					<#--<tr data-tt-id="F_#(m.id)" #if(p) data-tt-parent-id="F_#(p.id)" #end>-->
						  <#--<td><span #if(m.children) class="folder" #else class="file" #end>#(m.name)</span></td>-->
						  <#--<td style="text-align: center;">-->
						  		<#--<a onclick="changeIcon('#(m.id)')" href="javascript:void(0);">-->
							  		<#--#if(m.icon) -->
							  			<#--<i class="#(m.icon)"></i>-->
							  		<#--#else-->
							  			<#--无-->
							  		<#--#end-->
						  		<#--</a>-->
						  <#--</td>-->
						  <#--<td>#(m.url)</td>-->
						  <#--<td>#(m.sort)</td>-->
						  <#--<td>#if(m.if_show=='1') 显示  #else 不显示  #end</td>-->
						  <#--<td>#(m.permission)</td>-->
						  <#--<td>-->
						  		<#--<a class="label label-table label-info" onclick="doPjax('#(ctx)/admin/menu/getEditPage?parentid=#(m.id)')" href="javascript:void(0);" >添加下级菜单</a>&nbsp;-->
								<#--<a class="label label-table label-success" onclick="doPjax('#(ctx)/admin/menu/getEditPage?id=#(m.id)')" href="javascript:void(0);">编辑</a>&nbsp;-->
								<#--#if(!m.children)<a class="label label-table label-danger" onclick="del('#(m.id)')" href="javascript:void(0);" >删除</a>#end-->
						  <#--</td>-->
					<#--</tr>-->
				<#--#end-->
				<#macro makeMenu m p>
                    <tr data-tt-id="F_#(${m.node.id})" <#if (p.node.id)??> data-tt-parent-id="F_#(${p.node.id})" </#if>>
						<td><span <#if m.children??> class="folder" <#else> class="file" </#if>>${m.node.name}</span></td>
						<td style="text-align: center;">
							<a onclick="changeIcon('${m.node.id}')" href="javascript:void(0);">
								<#if m.node.icon??>
									<i class="${m.node.icon}"></i>
								<#else>
									无
								</#if>

							</a>
						</td>
						<td>${m.node.url!""}</td>
						<td>${m.node.sort!""}</td>
						<td><#if m.node.if_show?? && m.node.if_show=='1'> 显示  <#else> 不显示  #</#if></td>
						<td>${m.node.permission!"*"}</td>
						<td>
							<a class="label label-table label-info" onclick="doPjax('${Request.ctx}/admin/menu/getEditPage.shtml?parentid=${m.node.id}')" href="javascript:void(0);" >添加下级菜单</a>&nbsp;
							<a class="label label-table label-success" onclick="doPjax('${Request.ctx}/admin/menu/getEditPage.shtml?id=${m.node.id}')" href="javascript:void(0);">编辑</a>&nbsp;
							<#if !m.children?? && m.node.parent_id != "0"><a class="label label-table label-danger" onclick="del('${m.node.id}')" href="javascript:void(0);" >删除</a></#if>
						</td>
				    </tr>
				</#macro>
                <div id="page-content">
                	<div class="col-sm-12 eq-box-sm">
			        	<div class="panel lion-fullHeight">
						    		<div class="panel-body">
											<div class="bootstrap-table">
												<div class="fixed-table-toolbar">
													<div class="bars pull-left">
														<a id="add" class="btn btn-info data-toolbar" onclick="doPjax('${Request.ctx}/admin/menu/getEditPage.shtml')" href="javascript:void(0);"><i class="demo-pli-add"></i> 添加</a>
													</div>
												</div>
												<div class="fixed-table-container" style="padding-bottom: 0px;">
													<div class="fixed-table-body">
																<table id="treetable" class="demo-add-niftycheck table table-hover table-striped">
																	        <thead>
																	         	<tr>
																		        	<th style="width: 250px;"><div class="th-inner">机构名称</div></th>
																					<th style="width: 50px;"><div class="th-inner">显示图标</div></th>
																					<th style="width: 350px;"><div class="th-inner">地址</div></th>
																					<th style="width: 100px;"><div class="th-inner">排序</div></th>
																					<th style="width: 100px;"><div class="th-inner">是否显示</div></th>
																					<th style="width: 200px;"><div class="th-inner">权限标识</div></th>
																					<th style="width: 330px;"><div class="th-inner">操作</div></th>
																		        </tr>
																	        </thead>
																	        <tbody>
																			    <#list menus as m1>
																					<@makeMenu m=m1 p=Request/>
																				    <#if m1.children??>
																						<#list m1.children as m2>
																							<@makeMenu m=m2 p=m1/>
																							<#if m2.children??>
																								<#list m2.children as m3>
																									<@makeMenu m=m3 p=m2/>
																								</#list>
																							</#if>
																						</#list>
																				    </#if>
																			    </#list>
																	        	<#--#for(m:menu)-->
																	        		<#--#@makeMenu(m,"")-->
																	        		<#--#if(m.children)-->
																	        			<#--#for(a:m.children)-->
																	        				<#--#@makeMenu(a,m)-->
																	        				<#--#if(a.children)-->
																	        					<#--#for(b:a.children)-->
																	        						<#--#@makeMenu(b,a)-->
																	        						<#--#if(b.children)-->
																			        					<#--#for(c:b.children)-->
																			        						<#--#@makeMenu(c,b)-->
																			        					<#--#end-->
																			        				<#--#end -->
																	        					<#--#end-->
																	        				<#--#end -->
																	        				<#---->
																	        			<#--#end-->
																	        		<#--#end-->
																	        	<#--#end -->
																	        </tbody>
																</table>
													</div>
												</div>
											</div>
										</div>
							</div>
						</div>
                </div>
<script>
	$("#treetable").treetable({ expandable: true });//树表格
	$('#treetable').treetable('expandAll');//展开所有
	//删除
	function del(ids){
		pointLion.confimMsg("您是否要删除所选信息 ?<br/> 点击确认进行删除 , 点击取消取消该操作",null,function(){
			//执行删除
			var data = common_ajax.ajaxFunc("/admin/menu/delete",{"ids":ids}, "json", null);
			//删除结果
			if(data.success){
				pointLion.alertMsg(data.message,"success",null,function(){
					doPjax(ctx+'/admin/menu/getListPage');//跳转到列表页
				});
			}else{
				pointLion.alertMsg(data.message,"success",null,null);
			}
		});
	};
	
	//选择展示图标
	function changeIcon(mid){
		var index = layer.open({
			  type: 2,
			  title: false, //不显示标题栏
			  area: ['80%', '80%'],
			  shade: 0.8,
			  id: 'changeIcon', //设定一个id，防止重复弹出
			  resize: false,
			  closeBtn: false,
			  isOutAnim : false , 
			  btnAlign: 'c',
			  content: ctx+'/admin/menu/getChangeIconPage.shtml?mid='+mid
		});
	}
</script>





																				<!-- #for(m:menu)
																	        		<tr data-tt-id="F_#(m.id)">
																					  <td><span class="folder">#(m.name)</span></td>
																					  <td>#(m.url)</td>
																					  <td>#(m.sort)</td>
																					  <td>#if(m.if_show=='1') 显示  #else 不显示  #end</td>
																					  <td>#(m.permission)</td>
																					  <td>
																					  		<a class="label label-table label-info" onclick="doPjax('#(ctx)/admin/menu/getEditPage?parentid=#(m.id)')" href="javascript:void(0);" >添加下级菜单</a>&nbsp;
																							<a class="label label-table label-success" onclick="doPjax('#(ctx)/admin/menu/getEditPage?id=#(m.id)')" href="javascript:void(0);">编辑</a>&nbsp;
																							#if(!m.children)<a class="label label-table label-danger" onclick="del('#(m.id)')" href="javascript:void(0);" >删除</a>#end
																					  </td>
																					</tr>
																					#if(m.children)
																						#for(c:m.children)
																							<tr data-tt-id="F_#(c.id)" data-tt-parent-id="F_#(m.id)">
																							  <td><span class="file">#(c.name)</span></td>
																							  <td>#(c.url)</td>
																							  <td>#(c.sort)</td>
																							  <td>#if(c.if_show=='1') 显示  #else 不显示  #end</td>
																							  <td>#(c.permission)</td>
																							  <td>
																							  		<a class="label label-table label-info" onclick="doPjax('#(ctx)/admin/menu/getEditPage?parentid=#(c.id)')" href="javascript:void(0);" >添加下级菜单</a>&nbsp;
																									<a class="label label-table label-success" onclick="doPjax('#(ctx)/admin/menu/getEditPage?id=#(c.id)')" href="javascript:void(0);">编辑</a>&nbsp;
																									<a class="label label-table label-danger" onclick="del('#(c.id)')" href="javascript:void(0);" >删除</a>
																							  </td>
																							</tr>																							
																						#end
																					#end
																	        	#end -->