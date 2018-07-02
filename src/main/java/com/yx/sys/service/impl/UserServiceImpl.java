package com.yx.sys.service.impl;

import java.util.*;

import com.yx.support.shiro.PasswordHelper;
import com.yx.sys.entity.Org;
import com.yx.sys.entity.User;
import com.yx.sys.service.UserService;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

public class UserServiceImpl extends BaseServiceImpl implements UserService {

    PasswordHelper ph;

    public PasswordHelper getPh() {
        return ph;
    }

    public void setPh(PasswordHelper ph) {
        this.ph = ph;
    }

    @Override
    public User getUser(String loginid) {
        if(null==loginid ||
           0==loginid.length()){
            return null; 
        }
        //System.out.print("dao是否为空"+(null == dao));
        return (User)dao.queryObject("sys.getUserById", loginid);
    }
    @Override
    public Set<String> findPermissions(String loginid) {
        HashSet<String> perms = new HashSet<String>();
        List<String> l1 = (List<String>)dao.queryList("sys.getPerms", loginid);
        if(null == l1) {
            return Collections.emptySet();
        }
        perms.addAll(l1);
        return perms;
    }

    @Override
    public Set<String> findRoles(String loginid) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List<User> getUsersByOrgId(Map param) {
        return (List<User>)dao.queryList("sys.getUserByOrfId",param);
    }

    @Override
    public void createUser(User user) {
        ph.encryptPassword(user);
        dao.insert("sys.insertUser",user);
    }

    @Override
    public Org getUserOrg(User user) {
        Map<String, String> param = new HashMap<String, String>();
        param.put("start", "0");
        param.put("end", "10");
        param.put("id", user.getOrgid());
        return (Org)dao.queryObject("sys.getOrgById", param);
    }

    @Override
    public void updateUser(User user) {
        if(user.getPassword() != null && user.getPassword().length() > 0){
            ph.encryptPassword(user);
        }
        dao.update("sys.updateUser", user);
    }
    @Transactional(propagation = Propagation.REQUIRED,rollbackFor=Exception.class)
    public int changeRoleAuth(Map param){
        String loginid = param.get("loginid")+"";
        User user = (User)dao.queryObject("sys.getUserById",loginid);
        param.put("user_id", user.getId());

        dao.delete("sys.deRoles", param);
        return dao.insert("sys.authRoles", param);
    }
}
