#include("../../include.ftl")
<style>
	.speech{
		min-width:200px;
	}
</style>
							<div class="panel" style="margin: 0px;">
					            <!--Heading-->
					            <div class="panel-heading">
					                <div class="panel-control">
					                    <div class="btn-group">
					                        <button type="button" class="btn btn-default" data-toggle="dropdown"><i class="demo-pli-gear icon-lg"></i></button>
					                        <ul class="dropdown-menu dropdown-menu-right">
					                            <li><a href="#">在线</a></li>
					                            <li><a href="#">忙碌</a></li>
					                            <li><a href="#">离开</a></li>
					                            <li class="divider"></li>
					                            <li><a href="javascript:void(0);" onclick="closeChat()">关闭</a></li>
					                        </ul>
					                    </div>
					                </div>
					                <h3 class="panel-title">#(user.name)</h3>
					            </div>
					
					            <!--Widget body-->
					            <div>
					                <div class="nano" style="height:400px">
					                    <div class="nano-content pad-all">
					                        <ul class="list-unstyled media-block" id="chatMessage">
					                            <li class="mar-btm">
					                                <div class="media-left">
					                                    <img src="${Request.ctx}/common/img/profile-photos/1.png" class="img-circle img-sm" alt="Profile Picture">
					                                </div>
					                                <div class="media-body pad-hor">
					                                    <div class="speech">
					                                        <a href="#" class="media-heading">#(user.name)</a>
					                                        <p>你好！</p>
					                                        <p class="speech-time">
					                                        <i class="demo-pli-clock icon-fw"></i>09:23
					                                        </p>
					                                    </div>
					                                </div>
					                            </li>
					                            <li class="mar-btm">
					                                <div class="media-right">
					                                    <img src="${Request.ctx}/common/img/profile-photos/8.png" class="img-circle img-sm" alt="Profile Picture">
					                                </div>
					                                <div class="media-body pad-hor speech-right">
					                                    <div class="speech">
					                                        <a href="#" class="media-heading">我</a>
					                                        <p>好个屁！</p>
					                                        <p class="speech-time">
					                                            <i class="demo-pli-clock icon-fw"></i> 09:23AM
					                                        </p>
					                                    </div>
					                                </div>
					                            </li>
					                        </ul>
					                    </div>
					                </div>
					
					                <!--Widget footer-->
					                <div class="panel-footer" style="height:100px">
					                    <div class="row">
					                        <div class="col-xs-9">
					                            <textarea type="text" id="myMessage" class="form-control chat-input" style="resize: none;"></textarea>
					                        </div>
					                        <div class="col-xs-3">
					                            <button class="btn btn-primary btn-block" type="button" onclick="send()">发送</button>
					                        </div>
					                    </div>
					                </div>
					            </div>
					        </div>
<script type="text/javascript">
	var friendchat = new WebSocket("ws://"+document.location.host+"/admin/friendchat/#(user.username)");
	friendchat.onopen = function(message) {

	};
	friendchat.onclose = function(message) {

    };
	/**
	*  聊天窗口收到信息的回调
	**/
	friendchat.onmessage = function(message) {
		alert("收到信息来自聊天窗口的消息:!!!!!!!!!!!!!!!!!!!!!"+message.data);
    };
    //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
	window.onbeforeunload = function() {
		
    };
    
    
    //发送消息
    function send() {
        var message = $("#myMessage").val();
        friendchat.send(message);
        //显示自己信息
    }
    //关闭窗口
    function closeChat(){
    	friendchat.close();//关闭当前的链接
    	parent.initMySocket();//父页面开启当前用户监控链接
    	parent.pointLion.closeChat();//关闭当前聊天窗口
    }
</script>