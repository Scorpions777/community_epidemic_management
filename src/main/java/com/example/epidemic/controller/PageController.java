package com.example.epidemic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author
 * @email
 * @description 页面跳转控制器
 */
@Controller
public class PageController {


    // 首页路径映射
    @RequestMapping("/")
    public String login() {
        return "login";
    }


    @RequestMapping("/{page}")
    public String page(@PathVariable String page) {
        return page;
    }

    @RequestMapping("/admins/{page}")
    public String page2(@PathVariable String page) {
        return "admins/" + page;
    }

    @RequestMapping("/admins/{path}/{page}")
    public String page4(@PathVariable String path, @PathVariable String page) {
        return "admins/" + path + "/" + page;
    }

    @RequestMapping("/users/{page}")
    public String page3(@PathVariable String page) {
        return "users/" + page;
    }

    @RequestMapping("/users/{path}/{page}")
    public String page5(@PathVariable String path, @PathVariable String page) {
        return "users/" + path + "/" + page;
    }


}
