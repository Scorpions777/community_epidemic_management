package com.example.epidemic.controller;

import com.example.epidemic.entity.Admin;
import com.example.epidemic.service.AdminService;
import com.example.epidemic.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;


/**
 * @author
 * @email
 * @description 管理员 controller
 */
@Controller
@RequestMapping("admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private HttpSession session;


    // 登录
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public Result login(Admin admin, Model model) {

        Admin adminFromDB = adminService.login(admin);

        if (adminFromDB == null) {
            return new Result(20001, "手机或密码错误");
        }

        session.setAttribute("admin", adminFromDB);

        return new Result(20000, "登陆成功");

    }


    /**
     * 修改密码
     *
     * @param password1 原密码
     * @param password2 新密码
     * @return 自定义响应对象Result
     */
    @RequestMapping(value = "/password", method = RequestMethod.POST)
    @ResponseBody
    public Result updatePassword(String password1, String password2) {

        Admin adminFromSession = (Admin) session.getAttribute("admin");

        if (adminFromSession == null) {
            return new Result(20001, "请先登录");
        }

        if (!adminFromSession.getPassword().equals(password1)) {
            return new Result(20001, "原密码错误");
        }

        adminFromSession.setPassword(password2);

        adminService.updatePassword(adminFromSession);

        session.invalidate();

        return new Result(20000, "密码修改成功");
    }

    /**
     * 修改个人资料
     *
     * @return 自定义响应对象Result
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public Result update(Admin admin) {

        Admin adminFromSession = (Admin) session.getAttribute("admin");

        if (adminFromSession == null) {
            return new Result(20001, "请先登录");
        }

        if (!adminFromSession.getPhone().equals(admin.getPhone())) {
            Admin admin1 = adminService.findByPhone(admin.getPhone());
            if (admin1 != null) {
                return new Result(20001, "手机号已存在");
            }
        }
        
        adminFromSession.setNickname(admin.getNickname());

        adminFromSession.setPhone(admin.getPhone());

        adminService.update(adminFromSession);

        session.setAttribute("admin", adminFromSession);

        return new Result(20000, "修改成功");

    }


    // 退出登录
    @RequestMapping("/logout")
    public String logout() {
        session.invalidate();
        return "/login";
    }


}
