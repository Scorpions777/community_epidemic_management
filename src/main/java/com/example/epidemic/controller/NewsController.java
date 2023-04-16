package com.example.epidemic.controller;

import com.example.epidemic.entity.News;
import com.example.epidemic.service.NewsService;
import com.example.epidemic.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * @author
 * @email
 * @description 公告表 controller
 */

@RestController
@RequestMapping("news")
public class NewsController {

    @Autowired
    private NewsService newsService;

    @Autowired
    private HttpSession session;


    /**
     * 单条件分页查询
     *
     * @param page  前端提交的page当前页码
     * @param limit 前端提交的每页显示条数
     * @param query 前端提交的查询参数
     * @return 自定义的Result返回结果类对象
     */
    @RequestMapping("/list")
    @ResponseBody
    public Result list(@RequestParam int page,
                       @RequestParam int limit,
                       @RequestParam(required = false, defaultValue = "") String query) {

        System.out.println(query);
        return newsService.list(page, limit, "%" + query + "%");


    }


    /**
     * 增加
     *
     * @param news 页面提交的returnees对象
     * @return 自定义的Result返回结果类对象
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Result add(News news) {

        newsService.add(news);

        return new Result(20000, "增加成功");
    }


    /**
     * 根据 id 删除
     *
     * @param newsId 页面提交的id
     * @return 自定义的Result返回结果类对象
     */
    @RequestMapping(value = "/delete/{newsId}", method = RequestMethod.DELETE)
    @ResponseBody
    public Result deleteById(@PathVariable String newsId) {
        newsService.deleteById(newsId);
        return new Result(20000, "删除成功");
    }

    /**
     * 修改
     *
     * @param news 页面提交的returnees对象
     * @return 自定义的Result返回结果类对象
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public Result update(News news) {

        newsService.update(news);
        return new Result(20000, "修改成功");
    }


}
