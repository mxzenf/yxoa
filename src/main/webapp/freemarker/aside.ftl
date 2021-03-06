<aside id="aside-container">
                <div id="aside">
                    <div class="nano">
                        <div class="nano-content">
                            <!--Nav tabs-->
                            <!--================================-->
                            <ul class="nav nav-tabs nav-justified">
                                <li class="active">
                                    <a href="#demo-asd-tab-1" data-toggle="tab">
                                        <i class="demo-pli-speech-bubble-7"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="#demo-asd-tab-2" data-toggle="tab">
                                        <i class="demo-pli-information icon-fw"></i> 新闻
                                    </a>
                                </li>
                                <li>
                                    <a href="#demo-asd-tab-3" data-toggle="tab">
                                        <i class="demo-pli-wrench icon-fw"></i> 设置
                                    </a>
                                </li>
                            </ul>
                            <!--================================-->
                            <!--End nav tabs-->



                            <!-- Tabs Content -->
                            <!--================================-->
                            <div class="tab-content">

                                <!--First tab (Contact list)-->
                                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                                <div class="tab-pane fade in active" id="demo-asd-tab-1">
                                    <p class="pad-hor mar-top text-semibold text-main">我的好友</p>

                                    <!--Family-->
                                    <div class="list-group bg-trans">
                                    	<#--#for(f:friends)
                                    		<a href="javascript:void(0);" class="list-group-item" onclick="openChat('#(f.id)')">
								                <div class="media-left pos-rel">
								                    <img class="img-circle img-xs" src="${Request.ctx}/common/img/profile-photos/2.png" alt="Profile Picture">
													<i class="badge badge-success badge-stat badge-icon pull-left"></i>
								                </div>
								                <div class="media-body">
								                    <p class="mar-no"><span class="pull-right badge badge-warning">3</span>#(f.name)</p>
								                    <small class="text-muted">有事联系我</small>
								                </div>
								            </a>
                                    	#end-->
                                        <#list users as u>
                                            <a href="javascript:void(0);" class="list-group-item" onclick="openChat('${u.loginid}')">
                                                <div class="media-left pos-rel">
                                                    <img class="img-circle img-xs" src="${Request.ctx}/common/img/profile-photos/2.png" alt="Profile Picture">
                                                    <i class="badge badge-success badge-stat badge-icon pull-left"></i>
                                                </div>
                                                <div class="media-body">
                                                    <p class="mar-no"><span class="pull-right badge badge-warning">0</span>${u.username}</p>
                                                    <small class="text-muted">有事联系我</small>
                                                </div>
                                            </a>
                                        <#else>
                                            <div class="media-body">
                                                <p class="mar-no"><span class="pull-right badge badge-warning">0</span>没有用户在线</p>
                                            </div>
                                        </#list>
							            <!-- <a href="javascript:void(0);" class="list-group-item" onclick="openChat()">
							                <div class="media-left pos-rel">
							                    <img class="img-circle img-xs" src="${Request.ctx}/common/img/profile-photos/2.png" alt="Profile Picture">
												<i class="badge badge-success badge-stat badge-icon pull-left"></i>
							                </div>
							                <div class="media-body">
							                    <p class="mar-no">周杰伦</p>
							                    <small class="text-muted">哎哟,不错哟</small>
							                </div>
							            </a>
							            <a href="#" class="list-group-item">
							                <div class="media-left pos-rel">
							                    <img class="img-circle img-xs" src="${Request.ctx}/common/img/profile-photos/7.png" alt="Profile Picture">
							                </div>
							                <div class="media-body">
							                    <p class="mar-no">玛丽莲梦露</p>
							                    <small class="text-muted">我爱你中国</small>
							                </div>
							            </a>
							            <a href="#" class="list-group-item">
							                <div class="media-left pos-rel">
							                    <img class="img-circle img-xs" src="${Request.ctx}/common/img/profile-photos/1.png" alt="Profile Picture">
												<i class="badge badge-info badge-stat badge-icon pull-left"></i>
							                </div>
							                <div class="media-body">
							                    <p class="mar-no">佟丽娅</p>
							                    <small class="text-muted">敲完代码,记得给我电话</small>
							                </div>
							            </a>
							            <a href="#" class="list-group-item">
							                <div class="media-left pos-rel">
							                    <img class="img-circle img-xs" src="${Request.ctx}/common/img/profile-photos/4.png" alt="Profile Picture">
							                </div>
							                <div class="media-body">
							                    <p class="mar-no">这个人是我编的</p>
							                    <small class="text-muted">这个状态我编不下去了.</small>
							                </div>
							            </a>
							            <a href="#" class="list-group-item">
							                <div class="media-left pos-rel">
							                    <img class="img-circle img-xs" src="${Request.ctx}/common/img/profile-photos/8.png" alt="Profile Picture">
												<i class="badge badge-warning badge-stat badge-icon pull-left"></i>
							                </div>
							                <div class="media-body">
							                    <p class="mar-no">张同学</p>
							                    <small class="text-muted">困</small>
							                </div>
							            </a>
							            <a href="#" class="list-group-item">
							                <div class="media-left pos-rel">
							                    <img class="img-circle img-xs" src="${Request.ctx}/common/img/profile-photos/9.png" alt="Profile Picture">
												<i class="badge badge-danger badge-stat badge-icon pull-left"></i>
							                </div>
							                <div class="media-body">
							                    <p class="mar-no">老板</p>
							                    <small class="text-muted">下班办公室来一趟</small>
							                </div>
							            </a> -->
                                    </div>

                                    <hr>
                                    <p class="pad-hor text-semibold text-main">
                                        <span class="pull-right badge badge-success">离线</span> 离线好友
                                    </p>

                                    <!--Works-->
                                    <div class="list-group bg-trans">
                                        <a href="#" class="list-group-item">
                                            <span class="badge badge-purple badge-icon badge-fw pull-left"></span> Joey K. Greyson
                                        </a>
                                    </div>


                                    <!-- <hr>
                                    <p class="pad-hor mar-top text-semibold text-main">News</p>

                                    <div class="pad-hor">
                                        <p class="text-muted">Lorem ipsum dolor sit amet, consectetuer
                                            <a data-title="45%" class="add-tooltip text-semibold" href="#">adipiscing elit</a>, sed diam nonummy nibh. Lorem ipsum dolor sit amet.
                                        </p>
                                        <small class="text-muted"><em>Last Update : Des 12, 2014</em></small>
                                    </div> -->


                                </div>
                                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                                <!--End first tab (Contact list)-->


                                <!--Second tab (Custom layout)-->
                                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                                <div class="tab-pane fade" id="demo-asd-tab-2">

                                    <!--Monthly billing-->
                                    <div class="pad-all">
                                        <p class="text-semibold text-main">这是条类似公告的东西</p>
                                        <p class="text-muted">实在编不下去了,实在编不下去了实在编不下去了实在编不下去了实在编不下去了实在编不下去了实在编不下去了实在编不下去了.</p>
                                    </div>
                                    <hr class="new-section-xs">
                                    <div class="pad-all">
                                        <span class="text-semibold text-main">不知道是啥</span>
                                        <p class="text-muted text-sm">常用工具</p>
                                        <p class="text-2x text-thin text-main">新闻</p>
                                        <button class="btn btn-block btn-success mar-top">确认</button>
                                    </div>


                                    <hr>

                                    <p class="pad-hor text-semibold text-main">推送链接</p>

                                    <!--Simple Menu-->
                                    <div class="list-group bg-trans">
                                        <a href="#" class="list-group-item"><i class="demo-pli-information icon-lg icon-fw"></i> 链接1</a>
                                        <a href="#" class="list-group-item"><i class="demo-pli-mine icon-lg icon-fw"></i> 链接1</a>
                                        <!-- <a href="#" class="list-group-item"><span class="label label-info pull-right">New</span><i class="demo-pli-credit-card-2 icon-lg icon-fw"></i> Payment Options</a> -->
                                        <a href="#" class="list-group-item"><i class="demo-pli-support icon-lg icon-fw"></i> 链接1</a>
                                    </div>


                                    <hr>

                                    <div class="text-center">
                                        <div><i class="demo-pli-old-telephone icon-3x"></i></div>
                                        	纳尼?
                                        <p class="text-lg text-semibold text-main"> 123213 </p>
                                        <small><em>1111111111</em></small>
                                    </div>
                                </div>
                                <!--End second tab (Custom layout)-->
                                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->


                                <!--Third tab (Settings)-->
                                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                                <div class="tab-pane fade" id="demo-asd-tab-3">
                                    <ul class="list-group bg-trans">
                                        <li class="pad-top list-header">
                                            <p class="text-semibold text-main mar-no">个人设定</p>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="pull-right">
                                                <input class="toggle-switch" id="demo-switch-1" type="checkbox" checked>
                                                <label for="demo-switch-1"></label>
                                            </div>
                                            <p class="mar-no">显示个人状态</p>
                                            <small class="text-muted">设置的简单介绍设置的简单介绍设置的简单介绍设置的简单介绍设置的简单介绍.</small>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="pull-right">
                                                <input class="toggle-switch" id="demo-switch-2" type="checkbox" checked>
                                                <label for="demo-switch-2"></label>
                                            </div>
                                            <p class="mar-no">显示离线联系人</p>
                                            <small class="text-muted">设置的简单介绍设置的简单介绍设置的简单介绍设置的简单介绍设置的简单介绍.</small>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="pull-right">
                                                <input class="toggle-switch" id="demo-switch-3" type="checkbox">
                                                <label for="demo-switch-3"></label>
                                            </div>
                                            <p class="mar-no">允许所有人访问 </p>
                                            <small class="text-muted">设置的简单介绍设置的简单介绍设置的简单介绍设置的简单介绍设置的简单介绍. </small>
                                        </li>
                                    </ul>


                                    <hr>

                                    <ul class="list-group pad-btm bg-trans">
                                        <li class="list-header"><p class="text-semibold text-main mar-no">全局设定</p></li>
                                        <li class="list-group-item">
                                            <div class="pull-right">
                                                <input class="toggle-switch" id="demo-switch-4" type="checkbox" checked>
                                                <label for="demo-switch-4"></label>
                                            </div>
                                            	开启全局设置
                                        </li>
                                        <li class="list-group-item">
                                            <div class="pull-right">
                                                <input class="toggle-switch" id="demo-switch-5" type="checkbox" checked>
                                                <label for="demo-switch-5"></label>
                                            </div>
                                            	关闭所有人评论权限
                                        </li>
                                        <li class="list-group-item">
                                            <div class="pull-right">
                                                <input class="toggle-switch" id="demo-switch-6" type="checkbox" checked>
                                                <label for="demo-switch-6"></label>
                                            </div>
                                            	关闭所有人博客
                                        </li>
                                    </ul>

                                </div>
                                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                                <!--Third tab (Settings)-->

                            </div>
                        </div>
                    </div>
                </div>
            </aside>
<script type="text/javascript">
	function openChat(uid){
        pointLion.openChat(uid, function(){
            //console.log(sessionStorage[uid]);
            pointLion.recMsg('${username}',JSON.parse(sessionStorage[uid]));
        });
	}
    //关闭窗口
    function closeChat(){
        pointLion.closeChat();//关闭当前聊天窗口
    }
    //发送消息
    function send() {
        var msg = {};
        msg.from = '${username}';
        msg.to = $("#sendBtn").attr("to");
        msg.content = $("#myMessage").val();
        var message = pointLion.createMsg(msg);
        mySocket.send(JSON.stringify(message));
        pointLion.metalk(msg).appendTo($(".nano-content ul"));
        //显示自己信息
    }
	initMySocket();
	var mySocket;
	//重置mySocket
	function initMySocket(){
		mySocket = new WebSocket(ctx.replace("http", "ws")+"/chat.shtml");
	    mySocket.onopen = function(message) {
		};
		mySocket.onclose = function(message) {

	    };
	    mySocket.onmessage = function(message) {
            pointLion.recMsg('${username}',JSON.parse(message.data));
	        addUnReadMessage(JSON.parse(message.data).content);
	    };
		window.onbeforeunload = function() {
			mySocket.close();
	    };
	}

    //添加未读消息
    function addUnReadMessage(message) {

    	alert("收到来自未读的消息:@@@@@@@@@@@@@@"+message);
    	//更改数目
    	var messageCount = $("#messageCount").html();
    	if(messageCount){
	    	$("#messageCount").html(parseInt(messageCount)+1);
    	}else{
    		$("#messageCount").html(1);
    	}
    }
</script>