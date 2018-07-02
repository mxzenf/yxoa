package com.yx.sys.controller;

import com.yx.sys.comm.Constant;
import com.yx.sys.entity.Menu;
import com.yx.sys.entity.Org;
import com.yx.sys.service.OrgService;
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
import java.util.stream.Collectors;

/**
 * Created by 杨欣 on 2018/5/13.
 */
@Controller
@RequestMapping("/admin/org")
public class OrgController {
    @Resource(name = "orgService")
    private OrgService os;
    @RequestMapping("getListPage.shtml")
    public String index(){
        return "org/list";
    }
    @RequestMapping("/listData.shtml")
    @ResponseBody
    public List<Org> listData(@RequestParam(value = "pid",required = false) String pid,@RequestParam(value="pageNumber", required=false) int pageNumber, @RequestParam(value="pageSize", required=false) int pageSize){
        Map<String ,Object> param = new HashMap<String ,Object>();
        param.put("pid", pid);
        param.put("start", (pageNumber-1)*pageSize);
        param.put("end", pageNumber*pageSize);
        return os.getOrgByPid(param);
    }
    @RequestMapping("/getOrgTree.shtml")
    @ResponseBody
    public List<Map<String, String>> getOrgTree(){
        return os.getAllOrgs().stream().map(o -> {
            Map<String,String> tm = new HashMap<String,String>();
            tm.put("id", o.getId());
            tm.put("name", o.getName());
            tm.put("pId", o.getParent_id());
            return tm;
        }).collect(Collectors.toList());
    }
    @RequestMapping("/save.shtml")
    @ResponseBody
    public Map<String, Object> save(@RequestBody Org org){
        Map<String, Object> res = new HashMap<String, Object>();
        res.put("success", Constant.SUCCESS);
        if(org.getId() != null || org.getId().length()>0){
            os.modifyOrg(org);
        } else {
            os.createOrg(org);
        }

        return res;
    }
    @RequestMapping("/getSelectOneOrgPage.shtml")
    public String getSelectOneOrgPage(){
        return "common/pointLion/selectOneOrg/selectOneOrg";
    }
    @RequestMapping("/getEditPage.shtml")
    public String getEditPage(@RequestParam(value = "id", required = false) String id, Model m){
        if(null!= id && id.length()>0){
            Org org = os.getOrgByPid(new HashMap(){
                {
                    put("id", id);
                }
            }).get(0);
            m.addAttribute("o", org);
            Org pOrg = null;
            if (!"0".equals(org.getParent_id())){
                pOrg = os.getOrgByPid(new HashMap(){
                    {
                        put("id", org.getParent_id());
                    }
                }).get(0);
                m.addAttribute("pName", pOrg.getName());
            }
        }
        return "org/edit";
    }
    @RequestMapping("/getSelectManyOrgPage.shtml")
    public String getSelectManyOrgPage(){
        return "common/pointLion/selectManyOrg/selectManyOrg";
    }
}
