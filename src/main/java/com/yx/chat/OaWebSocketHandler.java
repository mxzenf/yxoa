package com.yx.chat;

import com.alibaba.fastjson.JSON;
import com.yx.support.shiro.ShiroUtil;
import com.yx.sys.comm.Constant;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * 服务端websocket收发handler
 * Created by 杨欣 on 2018/4/1.
 */
public class OaWebSocketHandler implements WebSocketHandler {
    private static final Logger log = LoggerFactory.getLogger(OaWebSocketHandler.class);
    private Map<String, WebSocketSession> users = new HashMap<String, WebSocketSession>();
    @Override
    public void afterConnectionEstablished(WebSocketSession webSocketSession) throws Exception {
        Object user = webSocketSession.getAttributes().get(Constant.USER_KEY);
        Map m = webSocketSession.getAttributes();
        if (null != user && user.toString().length() > 0) {
            log.info("用户:" + user + "上线了");
            users.put(user.toString(), webSocketSession);
        }

    }

    /**
     * 处理消息
     * @param webSocketSession
     * @param webSocketMessage
     * @throws Exception
     */
    @Override
    public void handleMessage(WebSocketSession webSocketSession, WebSocketMessage<?> webSocketMessage) throws Exception {
        String message = webSocketMessage.getPayload().toString();
        log.info("收到消息 :" + message);
        Map msgMap = JSON.parseObject(message,Map.class);
        users.get(msgMap.get("to")).sendMessage(webSocketMessage);
    }

    @Override
    public void handleTransportError(WebSocketSession webSocketSession, Throwable throwable) throws Exception {

    }

    @Override
    public void afterConnectionClosed(WebSocketSession webSocketSession, CloseStatus closeStatus) throws Exception {
        Object user = webSocketSession.getAttributes().get(Constant.USER_KEY);
        log.info("用户:" + user + "下线了");
        users.remove(user);
    }

    @Override
    public boolean supportsPartialMessages() {
        return false;
    }
}
