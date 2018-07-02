package com.yx.sys.service;

import com.yx.support.shiro.ShiroUtil;
import com.yx.sys.entity.Menu;
import com.yx.sys.entity.Role;
import com.yx.sys.persistence.OaDaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by 杨欣 on 2018/4/24.
 */
@Service("roleService")
public class RoleService {
    @Resource(name = "dao")
    private OaDaoSupport dao;
    public List<Role> getRoles(Map param){
        return (List<Role>)dao.queryList("sys.getRoleById", param);
    }
    public List<Menu> getMenuByUserRole(String roleid){
        return (List<Menu>)dao.queryList("sys.getMenusByUserRole", roleid);
    }
    public List<Role> getRolesUser(String loginid){
        return (List<Role>)dao.queryList("sys.getRoleByLoginid", loginid);
    }
    public void save(Role r){
        dao.insert("sys.insertRole", r);
    }
    @Transactional(propagation = Propagation.REQUIRED,rollbackFor=Exception.class)
    public int changeRoleAuth(Map param){
        dao.delete("sys.deRolePermssions", param);
        return dao.insert("sys.authRolePermssions", param);
    }
}
