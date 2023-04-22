package com.example.epidemic.controller;

import com.example.epidemic.entity.LoginUser;
import com.example.epidemic.entity.News;
import com.example.epidemic.service.NewsService;
import com.example.epidemic.service.UserService;
import com.example.epidemic.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("user")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private NewsService newsService;
    @Autowired
    private HttpSession session;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public Result login(LoginUser user, Model model) {

        LoginUser loginUser = userService.login(user);

        if (loginUser == null) {
            return new Result(20001, "手机或密码错误");
        }

        session.setAttribute("user", loginUser);

        return new Result(20000, "登陆成功");

    }

    @RequestMapping("/logout")
    public ModelAndView logout() {
        session.invalidate();
        return new ModelAndView("/users/login");
//        return "redirect:/users/login";
    }

    @RequestMapping(value = "/password", method = RequestMethod.POST)
    @ResponseBody
    public Result updatePassword(String password1, String password2) {
        LoginUser loginUserFromSession = (LoginUser) session.getAttribute("user");
        if (loginUserFromSession == null) {
            return new Result(20001, "请先登录");
        }
        if (!loginUserFromSession.getPassword().equals(password1)) {
            return new Result(20001, "原密码错误");
        }
        loginUserFromSession.setPassword(password2);
        userService.updatePassword(loginUserFromSession);
        session.invalidate();
        return new Result(20000, "密码修改成功");
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public Result update(LoginUser loginUser) {

        LoginUser userFromSession = (LoginUser) session.getAttribute("user");

        if (userFromSession == null) {
            return new Result(20001, "请先登录");
        }

        if (!userFromSession.getPhone().equals(loginUser.getPhone())) {
            return userService.updatePhone(userFromSession, loginUser.getPhone());
        } else {
            return new Result(20001, "手机号未修改");
        }
    }

    @RequestMapping("/news")
    public ModelAndView news() {
        List<News> newsList = newsService.findAll();
        return new ModelAndView("/users/news", "news", newsList);
    }

    @RequestMapping("/resident/applyList")
    public Result residentApplyList(@RequestParam int page,
                                    @RequestParam int limit,
                                    @RequestParam(required = false, defaultValue = "") String query) {
        return userService.residentApplyList(page, limit, "%" + query + "%");
    }
}
