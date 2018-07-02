package com.yx.sys.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import java.util.HashMap;
import java.util.Map;

public class InitPageInterceptor extends HandlerInterceptorAdapter {

    private Logger logger = LoggerFactory.getLogger(InitPageInterceptor.class);
    @Override
    public boolean preHandle(HttpServletRequest request,
            HttpServletResponse response, Object handler) throws Exception {
        //web根路径绑定
        String ctx = request.getScheme()+"://"+ request.getServerName()+":"+
                request.getServerPort() + request.getContextPath();
        request.setAttribute("ctx", ctx);
        //初始化面包屑导航
        Map<String, Object> pageTitleBread = new HashMap<String, Object>();
        pageTitleBread.put("url", ((HttpServletRequest)request).getServletPath());
        request.setAttribute("pageTitleBread", pageTitleBread);
        return super.preHandle(request, response, handler);
    }
    
}
