package com.yx.support.shiro;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;

import com.yx.sys.entity.User;
import com.yx.sys.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 用户验证realm,参考shiro官网
 */
public class UserRealm extends AuthorizingRealm {
    private UserService us;
    private PasswordHelper ph;
    private static Logger logger = LoggerFactory.getLogger(UserRealm.class);
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        String username = (String)principals.getPrimaryPrincipal();
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        authorizationInfo.setRoles(us.findRoles(username));
        authorizationInfo.setStringPermissions(us.findPermissions(username));

        return authorizationInfo;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(
            AuthenticationToken token) throws AuthenticationException {
        String username = token.getPrincipal()==null?"":token.getPrincipal().toString();
        User user = us.getUser(username);
        logger.info("用户名验证:" + username);
        if(null == user){
            throw new UnknownAccountException();
        }
        if(user.getLocked()){
            throw new LockedAccountException();
        }

        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
                user.getLoginid(), //用户名
                user.getPassword(), //密码
                ByteSource.Util.bytes(ph.getUserSalt(user)),//salt=username+salt
                getName()  //realm name
        );
        logger.info("验证信息:" + authenticationInfo);
        return authenticationInfo;
    }

    public UserService getUs() {
        return us;
    }

    public void setUs(UserService us) {
        this.us = us;
    }

    public PasswordHelper getPh() {
        return ph;
    }

    public void setPh(PasswordHelper ph) {
        this.ph = ph;
    }
    
}
