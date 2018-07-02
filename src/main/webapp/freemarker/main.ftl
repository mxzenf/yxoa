<style>
	.padding-lr10{
		padding-left:10px;
		padding-right:10px;
	}
</style>
                <!--Page Title-->
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <div id="page-title">
                    <h1 class="page-header text-overflow">工作台</h1>
                </div>
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <!--End page title-->

                <!--Page content-->
                <!--===================================================-->
                <div id="page-content">
                    
					<div class="row">
					    <div class="col-lg-8">
					        <!--List Todo-->
					        <div class="panel lion-fullHeight">
									<div class="panel-heading">
					                    <h3 class="panel-title">待办列表</h3>
					                </div>
					                <div class="panel-body">
				                		<div class="media" style="margin-bottom: 15px;">
				                            <div class="media-left">
				                                <i class="demo-pli-laptop text-main icon-3x"></i>
				                            </div>
				                            <div class="media-body">
				                                <p class="text-main text-lg mar-no">发文管理</p>
				                                <small>您收到<span class="padding-lr10 text-pink">#(BumphList?BumphList.size():"0")</span>条内部发文审批任务，请及时办理</small>
				                            </div>
				                        </div>
				                        #if(BumphList&&BumphList.size()>0)
					                        #for(t:BumphList)
					                        	<p>
					                        		<span class="text-success padding-lr10">#(t.doc_num)&nbsp;</span>
					                        		<span class="text-success padding-lr10">#(t.title)</span>
					                        		<small class="text-mint padding-lr10">#(t.sender_name)</small>
					                        		<small>#(t.create_time)</small>
					                        	</p>
					                        #end
					                        <p><a class="text-primary" href="javascript:void(0)" onclick="doPjax('${Request.ctx}/admin/bumph/getToDoPage')">查看全部</a></p>
					                    #else
					                    	<p>暂无任务......</p>
				                        #end
				                        <div class="media" style="margin-bottom: 15px;">
				                            <div class="media-left">
				                                <i class="demo-pli-laptop text-main icon-3x"></i>
				                            </div>
				                            <div class="media-body">
				                                <p class="text-main text-lg mar-no">来文转发</p>
				                                <small>您收到<span class="padding-lr10 text-pink">0</span>条通知来文转发审批任务，请及时办理</small>
				                            </div>
				                        </div>
				                        <p>暂无任务......</p>
					                    
					                    <div class="media" style="margin-bottom: 15px;">
				                            <div class="media-left">
				                                <i class="ti-brush-alt text-main icon-3x"></i>
				                            </div>
				                            <div class="media-body">
				                                <p class="text-main text-lg mar-no">用章申请</p>
				                                <small>您收到<span class="padding-lr10 text-pink">10</span>条用章申请任务，请及时办理</small>
				                            </div>
				                        </div>
					                    <p>暂无任务......</p>
					                </div>
					        </div>
					    </div>
					    <div class="col-lg-4">
					        <div class="panel lion-fullHeight">
					        		<div class="panel-heading">
					                    <h3 class="panel-title">通知公告</h3>
					                </div>
					                <div class="panel-body">
					                	<#--#for(notice:NoticeList)-->
						                    <#--<div>-->
						                    	<#--<a href="javascript:void(0);" onclick="viewNotice('#(notice.id)')"><span class="#if(notice.if_sign=='0') text-primary #end  padding-lr10">#(notice.title)</span></a>-->
						                    <#--</div>-->
						                    <#--<div style="text-align: right;">-->
						                    	<#--<small class="text-muted">#(notice.publish_time)</small>-->
						                    <#--</div>-->
					                	<#--#end-->
									    <#if NoticeList??>
											<#list NoticeList as notice>
												<div>
													<a href="javascript:void(0);" onclick="viewNotice('${notice.id}')"><#if notice.if_sign=="0"><span class=" text-primary padding-lr10">  ${notice.title}</span> <#else> <span class="padding-lr10">  ${notice.title}</span></#if></a>
												</div>
												<div style="text-align: right;">
													<small class="text-muted">${notice.publish_time}</small>
												</div>
											</#list>
										</#if>
					                </div>
					        </div>
					    </div>
					</div>
                </div>
                <script type="text/javascript">
						$(document).ready(function(){
							initFullHeight(200);//初始化高度
						});
						//查看通知公告
						function viewNotice(id){
							var thisLay;//弹出层
							layer.open({
								  type: 2,
								  title: false, //不显示标题栏
								  area: ['900px', '620px'],
								  shade: 0.8,
								  id: 'selectOneMenu', //设定一个id，防止重复弹出
								  resize: false,
								  closeBtn: false,
								  isOutAnim : false , 
								  btn: ['签收', '取消'], 
								  btnAlign: 'c',
								  content: ctx+'/admin/notice/viewNotice.shtml?id='+id,
								  success: function(layero){
									  thisLay = window[layero.find('iframe')[0]['name']]; 
								  },
								  yes: function(){
									  thisLay.pointLion.confimMsg("您将要签收该公告！<br/><span style='color:green;'>签收之后公告发布人员可知晓您签收状态和时间！</span> <br/>点击确认进行签收 , 点击取消取消该操作",null,function(){
										  	var data = common_ajax.ajaxFunc("/admin/notice/sign.shtml",JSON.stringify({"id":id}), "json", null,"application/json");
											if(data.success){
												layer.closeAll();
												pointLion.alertMsg("签收成功","success",null,null);
											}else{
												pointLion.alertMsg("签收失败","success",null,null);
											}
										});
								  }
								});
						}
				</script>

