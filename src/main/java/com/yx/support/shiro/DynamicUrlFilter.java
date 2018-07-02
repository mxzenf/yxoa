package com.yx.support.shiro;

import com.yx.sys.service.UserService;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.apache.shiro.web.util.WebUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by 杨欣 on 2018/3/26.
 * 动态URL访问控制
 */
public class DynamicUrlFilter extends AccessControlFilter {

    public String getUnauthorizedUrl() {
        return unauthorizedUrl;
    }

    public void setUnauthorizedUrl(String unauthorizedUrl) {
        this.unauthorizedUrl = unauthorizedUrl;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public UserService getUserService() {
        return userService;
    }

    public String getSuccessUrl() {
        return successUrl;
    }

    public void setSuccessUrl(String successUrl) {
        this.successUrl = successUrl;
    }


    public ArrayList<String> getUninterceptUrls() {
        return uninterceptUrls;
    }

    public void setUninterceptUrls(ArrayList<String> uninterceptUrls) {
        this.uninterceptUrls = uninterceptUrls;
    }

    private ArrayList<String> uninterceptUrls;
    private String successUrl;
    private String unauthorizedUrl;
    private UserService userService;
    /**
     * 缓存用户访问URL
     * 有个缺陷如果新授权由于缓存仍然无法操作新权限
     */
    private Map<String, Set<String>> cacheUserUrls = new ConcurrentHashMap<String, Set<String>>();
    private static Logger logger = LoggerFactory.getLogger(DynamicUrlFilter.class);
    @Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {
        if (request instanceof HttpServletRequest) {
            logger.info("访问url:" + ((HttpServletRequest)request).getServletPath());
            Set<String> urls = cacheUserUrls.get(ShiroUtil.getUserName());
            if (null == urls) {
                urls = userService.findPermissions(ShiroUtil.getUserName());
                urls.addAll(getUninterceptUrls());
                urls.add(getSuccessUrl());
                cacheUserUrls.put(ShiroUtil.getUserName(), urls);
            }
            for (String url : urls) {
                if (super.pathsMatch(url,request)) {
                    return true;
                }
            }
            saveRequestAndRedirectUnauthorized(request, response);
            return false;
        }
        return true;
    }

    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
        return false;
    }

    /**
     * 权限不够跳转
     * @param request
     * @param response
     * @throws IOException
     */
    private void saveRequestAndRedirectUnauthorized(ServletRequest request, ServletResponse response) throws IOException {
        saveRequest(request);
        WebUtils.issueRedirect(request, response, getUnauthorizedUrl());
    }

}
