package com.yx.sys.controller;

import com.yx.sys.comm.Constant;
import com.yx.sys.entity.Menu;
import com.yx.sys.entity.Role;
import com.yx.sys.entity.TreeNode;
import com.yx.sys.service.RoleService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.*;
import java.util.stream.Collectors;

/**
 * Created by 杨欣 on 2018/4/24.
 */
@Controller
@RequestMapping("/admin/role")
public class RoleController {
    @Resource(name = "roleService")
    private RoleService rs;
    @RequestMapping("/getListPage.shtml")
    public String getListPage(){
        return "role/list";
    }
    @RequestMapping("/listData.shtml")
    @ResponseBody
    public List<Role> listData(@RequestParam(value = "roleid", required = false) String roleid){
        List<Role> roles = rs.getRoles(new HashMap(){
            {
                put("id", roleid);
            }
        });
        return roles;
    }
    @RequestMapping("/getGiveAuthPage.shtml")
    public String getGiveAuthPage(@RequestParam("roleid") String roleid, Model model){
        model.addAttribute("roleid", roleid);
        return "role/giveAuth";
    }
    @RequestMapping("/getRoleAuthByRoleid.shtml")
    @ResponseBody
    public List<Menu> getRoleAuthByRoleid(@RequestParam("roleid") String roleid){
        return rs.getMenuByUserRole(roleid);
    }
    @RequestMapping("/getAllRoleByUserid.shtml")
    @ResponseBody
    public List<Role> getAllRoleByUserid(@RequestParam("loginid") String loginid){
        List<Role> roles = rs.getRolesUser(loginid);

        return roles;
    }
    @RequestMapping("/getEditPage.shtml")
    public String getEditPage(@RequestParam(value = "id", required = false) String id, Model model){
        if (null == id || id.length() == 0) {

        } else {
            final String rid = id;
            List<Role> l = rs.getRoles(new HashMap() {
                {
                    put("id", rid);
                }
            });
            if (null!=l && l.size()>0) {
                model.addAttribute("r", l.get(0));
            }
        }
        return "role/edit";
    }
    @RequestMapping("/save.shtml")
    @ResponseBody
    public Map<String, String> save(@RequestBody Role r){
        rs.save(r);
        Map<String, String> res = new HashMap<String, String>();
        res.put("success", Constant.SUCCESS);
        return res;
    }
    @RequestMapping("/changeRoleAuth.shtml")
    @ResponseBody
    public Map<String, String> changeRoleAuth(@RequestBody Map m){
        Map<String, String> res = new HashMap<String, String>();
        m.put("rs", m.get("data").toString().split(","));
        rs.changeRoleAuth(m);
        res.put("success", Constant.SUCCESS);
        return res;
    }
    @RequestMapping("/getAllRoleTreeNode.shtml")
    @ResponseBody
    public List<Role> getAllRoleTreeNode(){
        List<Role> roles = rs.getRoles(Collections.EMPTY_MAP);

        return roles;
    }
}
