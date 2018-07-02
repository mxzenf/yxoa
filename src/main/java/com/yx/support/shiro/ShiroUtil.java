package com.yx.support.shiro;

import com.yx.sys.comm.Constant;
import com.yx.sys.entity.User;
import com.yx.sys.service.UserService;
import com.yx.utils.BeanUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.SessionDAO;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * shiro工具类
 * Created by 杨欣 on 2018/3/18.
 */
public class ShiroUtil {
    public static boolean isLogin() {
        return SecurityUtils.getSubject().isAuthenticated();
    }

    /**
     * 根据输入的用户和密码进行登录
     * @param username
     * @param password
     * @return
     */
    public static String login(String username, String password) {
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);

        try {
            SecurityUtils.getSubject().login(token);
            return Constant.SUCCESS;
        } catch (UnknownAccountException uae) {
            //用户名不存在
        } catch (IncorrectCredentialsException ice) {
            //密码不对
        } catch (LockedAccountException lae) {
            //账户被锁定
        } catch(AuthenticationException ae){

        }
        return "用户名/密码错误";
    }

    /**
     * 获取当前会话登录用户
     * @return
     */
    public static String getUserName(){
        return SecurityUtils.getSubject().getPrincipal().toString();
    }

    /**
     * 获取在线用户
     * @return
     */
    public static List<User> getActiveUsers() {
        List<User> users = new ArrayList<User>();
        SessionDAO sessionDao = (SessionDAO)BeanUtil.getBean("sessionDAO");
        Collection<Session> sessions = sessionDao.getActiveSessions();
        UserService us = (UserService)BeanUtil.getBean("userService");
        for (Session s : sessionDao.getActiveSessions()) {
            if (null != s.getAttribute(Constant.USER_KEY) &&
                !ShiroUtil.getUserName().equals(s.getAttribute(Constant.USER_KEY).toString())){
                users.add(us.getUser(s.getAttribute(Constant.USER_KEY).toString()));
            }
        }
        return users;
    }
}
