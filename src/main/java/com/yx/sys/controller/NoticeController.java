package com.yx.sys.controller;

import com.yx.support.shiro.ShiroUtil;
import com.yx.sys.comm.Constant;
import com.yx.sys.entity.Notice;
import com.yx.sys.entity.Org;
import com.yx.sys.entity.User;
import com.yx.sys.service.NoticeService;
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
 * Created by 杨欣 on 2018/6/6.
 */
@Controller
@RequestMapping("/admin/notice")
public class NoticeController {
    @Resource(name = "noticeService")
    private NoticeService ns;
    @Resource(name = "userService")
    private UserService us;

    @RequestMapping("/getListPage.shtml")
    public String getListPage() {
        return "notice/list";
    }

    @RequestMapping("/getEditPage.shtml")
    public String getEditPage(Model model, @RequestParam(value = "id", required = false) String id, @RequestParam(value = "view", required = false) String view) {
        Map m = new HashMap();
        if (null == id || 0 == id.length()) {
            String username = ShiroUtil.getUserName();
            User user = us.getUser(username);
            Org org = us.getUserOrg(user);
            m.put("sender_id", user.getId());
            m.put("sender_name", user.getUsername());
            m.put("sender_orgid", user.getOrgid());
            m.put("sender_orgname", org.getName());
        } else {
            Notice notice = null;
            if (null != view && 0 < view.length()) {
                model.addAttribute("view", view);
            }
            notice = ns.getNoticeById(id);
            notice.setContent(ns.decode(notice.getContent()));
            model.addAttribute("o", notice);
            m.put("sender_id", notice.getSender_id());
            m.put("sender_name", notice.getSender_name());
            m.put("sender_orgid", notice.getSender_orgid());
            m.put("sender_orgname", notice.getSender_orgname());

        }
        model.addAttribute("u", m);
        return "notice/edit";
    }

    /**
     * 根据id是否为空判断是新发通知还是修改原来的通知
     * @param notice
     * @return
     * @throws Exception
     */
    @RequestMapping("/save.shtml")
    @ResponseBody
    public Map<String, Object> save(@RequestBody Notice notice) throws Exception {
        Map<String, Object> res = new HashMap<String, Object>();
        //生成通知
        ns.save(notice);
        //通知对应的用户
        ns.noticeUser(notice);
        res.put("success", Constant.SUCCESS);
        return res;
    }

    /**
     * 发布通知
     * @param m
     * @return
     */
    @RequestMapping("/publish.shtml")
    @ResponseBody
    public Map<String, Object> publish(@RequestBody Map m) {
        Map<String, Object> res = new HashMap<String, Object>();
        ns.publish(m.get("id") + "");
        res.put("success", Constant.SUCCESS);
        return res;
    }

    @RequestMapping("/getListData.shtml")
    @ResponseBody
    public List<Notice> getListData(@RequestParam(value = "pageNumber", required = false) int pageNumber, @RequestParam(value = "pageSize", required = false) int pageSize) {
        Map<String, Integer> param = new HashMap<>();
        param.put("start", (pageNumber - 1) * pageSize);
        param.put("end", pageNumber * pageSize);
        return ns.getAllNotice(param);
    }
    @RequestMapping("/viewNotice.shtml")
    public String viewNotice(@RequestParam(value = "id", required = true) String id,Model m){
        Notice n = ns.getNoticeById(id);
        n.setContent(ns.decode(n.getContent()));
        m.addAttribute("notice",n);
        return "notice/view";
    }

    /**
     * 签收通知
     * @return
     */
    @RequestMapping("/sign.shtml")
    @ResponseBody
    public Map<String, Object> sign(@RequestBody Map m){
        Map<String, Object> res = new HashMap<String, Object>();
        m.put("user_id", us.getUser(ShiroUtil.getUserName()).getId());
        ns.sign(m);
        res.put("success", Constant.SUCCESS);
        return res;
    }
}
