package com.yx.sys.controller;

import com.yx.support.shiro.ShiroUtil;
import com.yx.sys.comm.Constant;
import com.yx.sys.entity.Menu;
import com.yx.sys.entity.Notice;
import com.yx.sys.entity.TreeNode;
import com.yx.sys.entity.User;
import com.yx.sys.service.MenuService;
import com.yx.sys.service.NoticeService;
import com.yx.sys.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class LoginController {
    private Logger logger = LoggerFactory.getLogger(LoginController.class);
    @Resource(name = "menuService")
    private MenuService ms;
    @Resource(name = "noticeService")
    private NoticeService ns;
    @Resource(name = "userService")
    private UserService us;
    @RequestMapping("/")
    public String index(){

        return "forward:/u/login.shtml";
    }
    
    @RequestMapping("/u/login.shtml")
    public String login(HttpServletRequest req, Model model){
        if (ShiroUtil.isLogin()) {

            return "redirect:/admin/home.shtml";
        }

        return "login";
    }

    /**
     * 登录通过后首页
     * @param model
     * @return
     */
    @RequestMapping("/admin/home.shtml")
    public String home(Model model){
        List<User> users = ShiroUtil.getActiveUsers();
        List<TreeNode<Menu>> menus = ms.createUserMenu(ShiroUtil.getUserName());
        model.addAttribute("menus", menus);
        model.addAttribute("username" ,ShiroUtil.getUserName());
        model.addAttribute("users", users);
        User user = us.getUser(ShiroUtil.getUserName());
        List<Notice> NoticeList = ns.getNoticeByUser(user.getId()+"");
        model.addAttribute("NoticeList", NoticeList);

        return "home";
    }

    /**
     * 如果使用了formauthenticationfilter登录可以不用自己实现登录逻辑
     * @param username ftl用户名
     * @param password ftl密码
     * @param model    springmvc上下文模型视图
     * @return
     */
    @RequestMapping(value="/u/doLogin.shtml",method = RequestMethod.POST)
    public String doLogin(@RequestParam("username") String username,@RequestParam("password") String password, Model model){
        logger.info("用户:" + username + "请求登录");
        String res = ShiroUtil.login(username,password);
        if (Constant.SUCCESS.equals(res)){
            return "redirect:/admin/home.shtml";
        } else {
            model.addAttribute("error", res);
            return "redirect:/admin/login.shtml";
        }
    }

    /**
     * 测试url
     * @return
     */
    @RequestMapping("/admin/test.shtml")
    public String test() {
        return "test";
    }
}
