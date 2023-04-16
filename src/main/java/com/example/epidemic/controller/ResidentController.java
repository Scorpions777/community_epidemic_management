package com.example.epidemic.controller;

import com.example.epidemic.entity.Resident;
import com.example.epidemic.service.ResidentService;
import com.example.epidemic.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

/**
 * @author
 * @email
 * @description 住户表 controller
 */

@RestController
@RequestMapping("resident")
public class ResidentController {

    @Autowired
    private ResidentService residentService;

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

        return residentService.list(page, limit, "%" + query + "%");

    }

    

    /**
     * 增加
     *
     * @param resident 页面提交的resident对象
     * @return 自定义的Result返回结果类对象
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Result add(Resident resident) {

        residentService.add(resident);

        return new Result(20000, "增加成功");
    }


    /**
     * 根据 id 删除
     *
     * @param residentId 页面提交的id
     * @return 自定义的Result返回结果类对象
     */
    @RequestMapping(value = "/delete/{residentId}", method = RequestMethod.DELETE)
    @ResponseBody
    public Result deleteById(@PathVariable String residentId) {
        residentService.deleteById(residentId);
        return new Result(20000, "删除成功");
    }

    /**
     * 修改
     *
     * @param resident 页面提交的resident对象
     * @return 自定义的Result返回结果类对象
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public Result update(Resident resident) {

        residentService.update(resident);
        return new Result(20000, "修改成功");
    }


}
