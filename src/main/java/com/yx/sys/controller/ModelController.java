package com.yx.sys.controller;

import com.yx.sys.comm.Constant;
import com.yx.sys.entity.Model;
import com.yx.sys.service.ModelService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 杨欣 on 2018/5/1.
 */
@Controller
@RequestMapping("/admin/model")
public class ModelController {
    @Resource(name = "modelService")
    private ModelService ms;
    @RequestMapping("/getListPage.shtml")
    public String getListPage(){
        return "workflow/model/list";
    }
    @RequestMapping("/listData.shtml")
    @ResponseBody
    public List<Model> listData(@RequestParam(value="pageNumber", required=false) int pageNumber,@RequestParam(value="pageSize", required=false) int pageSize,@RequestParam(value="mid", required=false) String mid){
        Map<String ,Object> param = new HashMap<String ,Object>();
        param.put("pageNumber", pageNumber);
        param.put("pageSize", pageSize);
        param.put("mid", mid);
        List<Model> models = ms.getAllModel(param);
        return models;
    }
    @RequestMapping("/getAddPage.shtml")
    public String getAddPage(){
        return "workflow/model/add";
    }
    @RequestMapping("/save.shtml")
    @ResponseBody
    public Map<String, String> save(@RequestBody Map m) throws UnsupportedEncodingException {
        Map<String, String> res = new HashMap<String, String>();
        res.put("id", ms.createModel(m.get("name")+"", m.get("key")+""));
        res.put("success", Constant.SUCCESS);
        return res;
    }
    @RequestMapping("/deploy.shtml")
    @ResponseBody
    public Map<String, String> deploy(String id){
        Map<String, String> res = new HashMap<String, String>();
        res.put("message", ms.deploy(id));
        return res;
    }
    @RequestMapping("/delete.shtml")
    @ResponseBody
    public Map<String, String> delete(String id){
        Map<String, String> res = new HashMap<String, String>();
        ms.delete(id);
        res.put("success", Constant.SUCCESS);
        return res;
    }
}
