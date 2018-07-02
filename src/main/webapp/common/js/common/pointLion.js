var pointLion;
pointLion = function () {
	/***
	 * 选择一个组织结构方法
	 */
	var selectOneOrgNode = {};//机构数据
	var selectOneOrg = function (callback) {
		layer.open({
			type: 2,
			title: false, //不显示标题栏
			area: ['300px', '550px'],
			shade: 0.8,
			id: 'selectOneOrg', //设定一个id，防止重复弹出
			resize: false,
			closeBtn: false,
			isOutAnim: false,
			btn: ['确定', '取消'],
			btnAlign: 'c',
			content: ctx + '/admin/org/getSelectOneOrgPage.shtml',
			success: function (layero) {

			},
			yes: function () {
				if (callback != null) {
					callback(selectOneOrgNode);
				}
				layer.closeAll();
			}
		});

	};
	//获取选择好的机构数据---提供给弹出层调用
	var setOneOrgNode = function (treeNode) {
		selectOneOrgNode = treeNode;
	};
	/***
	 * 选择多个组织结构方法
	 */
	var selectManyOrgNode;//机构数据
	var selectManyOrg = function (callback) {
		layer.open({
			type: 2,
			title: false, //不显示标题栏
			area: ['300px', '550px'],
			shade: 0.8,
			id: 'selectOneOrg', //设定一个id，防止重复弹出
			resize: false,
			closeBtn: false,
			isOutAnim: false,
			btn: ['确定', '取消'],
			btnAlign: 'c',
			content: ctx + '/admin/org/getSelectManyOrgPage.shtml',
			success: function (layero) {

			},
			yes: function () {
				if (callback != null) {
					callback(selectManyOrgNode);
				}
				layer.closeAll();
			}
		});

	};
	//获取选择好的机构数据---提供给弹出层调用
	var setManyOrgNode = function (treeNode) {
		selectManyOrgNode = treeNode;
	};
	/***
	 * 公用弹出提醒
	 */
	var alertMsg = function (msg, type, size, callback) {
		var t = "mint";//默认颜色
		var s = "small";
		if (type) {
			t = type;
		}
		if (size) {
			s = size;
		}
		bootbox.dialog({
			buttons: {
				ok: {
					label: '确定',
					className: "btn-" + t,
					callback: function () {
						if (callback != null) {
							callback();
						}
					},
				}
			},
			message: msg,
			title: '提示信息',
			size: s,
			animateIn: 'flipInX',
			animateOut: 'flipOutX'
		});
	};
	/***
	 * 公用弹出提醒
	 */
	var confimMsg = function (msg, size, callback) {
		var s = "small";
		if (size) {
			s = size;
		}
		bootbox.dialog({
			buttons: {
				cancel: {
					label: '取消',
					className: "btn-default",
					callback: function () {

					}
				},
				ok: {
					label: '确定',
					className: "btn-mint",
					callback: function () {
						if (callback != null) {
							callback();
						}
					}
				}

			},
			message: msg,
			title: '向您确认',
			size: s,
			animateIn: 'swing',
			animateOut: 'hinge'
		});
	};
	/**
	 * 接收消息处理
	 */
	var recMsg;
	recMsg = function (uid, msg) {
		if (sessionStorage[msg.from]) {
		} else {
		}
		sessionStorage[msg.from] = JSON.stringify(msg);
		if ($("#sendBtn").attr("to")) {
			var rm = template(msg);
			rm.appendTo($(".nano-content ul"));
		} else {

		}
	};
	var metalk = function(msg){
		var t = '<li class="mar-btm">\
			<div class="media-right">\
			<img src="/common/img/profile-photos/8.png" class="img-circle img-sm" alt="Profile Picture">\
			</div>\
			<div class="media-body pad-hor speech-right">\
			<div class="speech">\
			<a href="#" class="media-heading">我</a>\
			<p><content></content></p>\
			<p class="speech-time">\
				<i class="demo-pli-clock icon-fw"></i><sendtime></sendtime>\
			</p>\
			</div>\
			</div>\
			</li>';
		var me = $(t);
		me.find("content").replaceWith(msg.content);
		me.find("sendtime").replaceWith(msg.sendtime);
		me.find("img").attr("src",ctx+"/common/img/profile-photos/8.png");
		return me;
	}
	var template = function(msg){
		var t = '<li class="mar-btm">\
						<div class="media-left">\
						<img src="/common/img/profile-photos/1.png" class="img-circle img-sm" alt="Profile Picture">\
						</div>\
						<div class="media-body pad-hor">\
						<div class="speech">\
						<a href="#" class="media-heading"><name></name></a>\
					    <p><content></content></p>\
						<p class="speech-time">\
							<i class="demo-pli-clock icon-fw"></i><sendtime></sendtime>\
						</p>\
						</div>\
						</div>\
						</li>';
		var me = $(t);
		me.find("name").replaceWith(msg.from);
		me.find("content").replaceWith(msg.content);
		me.find("sendtime").replaceWith(msg.sendtime);
		me.find("img").attr("src",ctx+"/common/img/profile-photos/1.png");
		return me;
	};
	/***
	 * 弹出即时聊天页面
	 */
	var chatId;
	var openChat = function (uid, callback) {

		chatId = layer.open({
			type: 1,
			title: false, //不显示标题栏
			area: ['500px', '552px'],
			shade: 0.8,
			id: 'openChat', //设定一个id，防止重复弹出
			resize: false,
			closeBtn: false,
			isOutAnim: false,
			btnAlign: 'c',
			//content: ctx+'/admin/chat/getChatPage?id='+uid,
			content: chatwin(uid),
			success: function (layero) {
				if(callback){
					callback();
				}
			}
		});
	};
	var closeChat = function () {
		layer.close(chatId);
	};
	/**
	 * 消息格式
	 */
	var createMsg = function (msg) {
		var date = new Date();
		return {
			"from": msg.from,
			"to": msg.to,
			"content": msg.content,
			"sendtime": date.getHours() + ":" + date.getMinutes()
		};
	};
	var chatwin = function (uid) {
		return '<div class="panel" style="margin: 0px;" id="chatwin"> \
	                   <div class="panel-heading">\
	                   <div class="panel-control">\
	                   <div class="btn-group">\
	                   <button type="button" class="btn btn-default" data-toggle="dropdown"><i class="demo-pli-gear icon-lg"></i></button>\
	                   <ul class="dropdown-menu dropdown-menu-right">\
					   <li><a href="#">在线</a></li>\
						<li><a href="#">忙碌</a></li>\
						<li><a href="#">离开</a></li>\
						<li class="divider"></li>\
						<li><a href="javascript:void(0);" onclick="closeChat()">关闭</a></li>\
						</ul>\
						</div>\
						</div>\
						<h3 class="panel-title">对话框</h3>\
						</div>\
						<div>\
			            <div class="nano" style="height:400px">\
						<div class="nano-content pad-all">\
						<ul class="list-unstyled media-block" id="chatMessage">\
						</ul>\
						</div>\
						</div>\
					<div class="panel-footer" style="height:100px">\
						<div class="row">\
						<div class="col-xs-9">\
						<textarea type="text" id="myMessage" class="form-control chat-input" style="resize: none;"></textarea>\
						</div>\
						<div class="col-xs-3">\
						<button id="sendBtn" class="btn btn-primary btn-block" type="button" onclick="send()" to=' + uid + '>发送</button>\
						</div>\
						</div>\
						</div>\
						</div>\
						</div>'
			;
	};
	return {
		selectOneOrg: selectOneOrg,
		setOneOrgNode: setOneOrgNode,
		alertMsg: alertMsg,
		confimMsg: confimMsg,
		openChat: openChat,
		closeChat: closeChat,
		selectManyOrg: selectManyOrg,
		setManyOrgNode: setManyOrgNode,
		createMsg: createMsg,
		recMsg: recMsg,
		metalk:metalk
	};
}();