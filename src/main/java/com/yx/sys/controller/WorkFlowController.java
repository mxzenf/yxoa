package com.yx.sys.controller;

import com.yx.sys.entity.Model;
import com.yx.sys.service.ModelService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Created by 杨欣 on 2018/5/15.
 */
@Controller
@RequestMapping("/admin/workflow")
public class WorkFlowController {
    @Resource(name = "modelService")
    private ModelService ms;
    @RequestMapping("/getListPage.shtml")
    public String getListPage(){
        return "workflow/list";
    }
    @RequestMapping("/listData.shtml")
    @ResponseBody
    public List<?> listData(@RequestParam(value="pageNumber", required=false) int pageNumber, @RequestParam(value="pageSize", required=false) int pageSize){
        Map<String ,Object> param = new HashMap<String ,Object>();
        param.put("start", (pageNumber-1)*pageSize);
        param.put("end", pageNumber*pageSize);
        List<Map<String, Object>> l = ms.getFlows(param);
        if(null == l || l.size() == 0){
            return Collections.emptyList();
        }
        return l.stream().map(f->{
            Map t = new HashMap();
            f.forEach((k,v)->t.put(k.toLowerCase(),v));
            return t;
        }).collect(Collectors.toList());
    }
}
