package com.yx.sys.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by 杨欣 on 2018/6/2.
 */
@Controller
@RequestMapping("/admin/bumph")
public class BumphController {

    @RequestMapping("/getDraftListPage.shtml")
    public String getDraftListPage(){
        return "bumph/draft/list";
    }
    @RequestMapping("/getDraftEditPage.shtml")
    public String getDraftEditPage(){
        return "bumph/draft/edit";
    }
}
