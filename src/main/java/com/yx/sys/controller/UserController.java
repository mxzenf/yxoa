package com.yx.sys.controller;

import com.yx.sys.comm.Constant;
import com.yx.sys.entity.User;
import com.yx.sys.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 杨欣 on 2018/5/22.
 */
@Controller
@RequestMapping("/admin/user")
public class UserController {

    @Resource(name = "userService")
    private UserService us;

    @RequestMapping("/getListPage.shtml")
    public String index(){
        return "user/list";
    }
    @RequestMapping("/listData.shtml")
    @ResponseBody
    public List<User> listData(@RequestParam(value = "orgid",required = false) String orgid, @RequestParam(value="pageNumber", required=false) int pageNumber, @RequestParam(value="pageSize", required=false) int pageSize){
        Map<String ,Object> param = new HashMap<String ,Object>();
        param.put("orgid", orgid);
        param.put("start", (pageNumber-1)*pageSize);
        param.put("end", pageNumber*pageSize);
        return us.getUsersByOrgId(param);
    }
    @RequestMapping("/getEditPage.shtml")
    public String getEditPage(@RequestParam(value = "orgid",required = false) String orgid,@RequestParam(value = "loginid",required = false) String loginid,Model m){
        if(null!= loginid && loginid.length()>0){
            User user = us.getUser(loginid);
            m.addAttribute("u",user);
            m.addAttribute("o", us.getUserOrg(user));
        }
        return "user/edit";
    }
    @RequestMapping("/save.shtml")
    @ResponseBody
    public Map<String, Object> save(@RequestBody User user){
        Map<String, Object> res = new HashMap<String, Object>();
        if(null==user.getId()){
            us.createUser(user);
        } else {
            us.updateUser(user);
        }
        res.put("success", Constant.SUCCESS);
        return res;
    }
    @RequestMapping("/getGiveUserRolePage.shtml")
    public String getGiveUserRolePage(@RequestParam("loginid") String loginid,Model m){
        m.addAttribute("loginid", loginid);
        return "user/giveUserRole";
    }
    @RequestMapping("/giveUserRole.shtml")
    @ResponseBody
    public Map<String, String> giveUserRole(@RequestBody Map m){
        Map<String, String> res = new HashMap<String, String>();
        m.put("rs", m.get("data").toString().split(","));
        us.changeRoleAuth(m);
        res.put("success", Constant.SUCCESS);
        return res;
    }
}
