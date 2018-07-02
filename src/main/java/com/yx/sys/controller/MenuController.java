package com.yx.sys.controller;

import com.alibaba.fastjson.JSON;
import com.yx.sys.comm.Constant;
import com.yx.sys.entity.Menu;
import com.yx.sys.entity.TreeNode;
import com.yx.sys.service.MenuService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Created by 杨欣 on 2018/4/14.
 */
@Controller
@RequestMapping("/admin/menu")
public class MenuController {
    @Resource(name = "menuService")
    private MenuService ms;
    @RequestMapping("/getListPage.shtml")
    public String index(Model model){
        model.addAttribute("menus", ms.getAllMenus());
        return "menu/list";
    }
    @RequestMapping("/getChangeIconPage.shtml")
    public String getChangeIconPage(@RequestParam("mid") int mid, Model m) {
        m.addAttribute("mid", mid);
        return "menu/changeIcon";
    }
    @RequestMapping("/getEditPage.shtml")
    public String getEditPage(@RequestParam(value="id", required=false) String id, Model model){
        if (null != id && id.length()>0) {
            Menu menu = ms.getMenuById(id);
            Menu pm   = ms.getMenuById(menu.getParent_id());
            model.addAttribute("menu", menu);
            model.addAttribute("p", pm);
        }
        return "menu/edit";
    }

    /**
     * 直接返回非字符串,convert会自动转json
     * @param mid
     * @param icon
     * @return
     */
    @RequestMapping("/changeIcon.shtml")
    @ResponseBody
    public String changeIcon(String mid, String icon){
        Map<String, String> res = new HashMap<String, String>();
        Menu menu = ms.getMenuById(mid);
        if (null == menu) {
            res.put("success", null);
        } else {
            menu.setIcon(icon);
            ms.modifyMenu(menu);
            res.put("success", Constant.SUCCESS);
        }
        return JSON.toJSONString(res);
    }
    @RequestMapping("/save.shtml")
    @ResponseBody
    public Map<String, Object> save(@RequestBody Menu menu) throws Exception {
        Map<String, Object> res = new HashMap<String, Object>();
        if (menu.getUrl() == null || menu.getUrl().length() == 0) {
            menu.setIsparent("1");
        }
        menu.setId(null);
        int row = ms.createMenu(menu);
        res.put("success", Constant.SUCCESS);
        return res;
    }
    @RequestMapping("/getAllMenuTree.shtml")
    @ResponseBody
    public List<Map<String, String>> getAllMenuTree(@RequestParam(value = "ifshow", required = false) String ifshow){
      List<TreeNode<Menu>> menus = ms.getAllMenus();
      List<Map<String, String>> treeMenu = new ArrayList<Map<String, String>>();
      menus.stream().forEach(m -> {
          ms.treeNodeToList(m, treeMenu, ifshow);
      });

      return treeMenu.stream().map(m -> {
          Map<String,String> tm = new HashMap<String,String>();
          tm.put("id", m.get("id"));
          tm.put("name", m.get("name"));
          tm.put("pId", m.get("parent_id"));
          return tm;
      }).collect(Collectors.toList());
    }
    @RequestMapping("/getSelectOneMenuPage.shtml")
    public String getSelectOneMenuPage(){
        return "menu/selectOneMenu";
    }

}
