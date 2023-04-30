package com.example.epidemic.controller;

import com.example.epidemic.entity.ResidentAccessApply;
import com.example.epidemic.service.ResidentAccessApplyService;
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
@RequestMapping("residentAccessApply")
public class ResidentAccessApplyController {

    @Autowired
    private ResidentAccessApplyService residentAccessApplyService;

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

        return residentAccessApplyService.list(page, limit, "%" + query + "%");

    }

    @RequestMapping("/my")
    @ResponseBody
    public Result my(@RequestParam int page,
                     @RequestParam int limit,
                     @RequestParam(required = false, defaultValue = "") String query) {

        return residentAccessApplyService.my(page, limit, "%" + query + "%");

    }


    /**
     * 增加
     *
     * @param residentAccessApply 页面提交的resident对象
     * @return 自定义的Result返回结果类对象
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Result add(ResidentAccessApply residentAccessApply) {

        residentAccessApplyService.add(residentAccessApply);

        return new Result(20000, "增加成功");
    }


    /**
     * 根据 id 删除
     *
     * @param applyId 页面提交的id
     * @return 自定义的Result返回结果类对象
     */
    @RequestMapping(value = "/delete/{applyId}", method = RequestMethod.DELETE)
    @ResponseBody
    public Result deleteById(@PathVariable String applyId) {
        residentAccessApplyService.deleteById(applyId);
        return new Result(20000, "删除成功");
    }

    /**
     * 修改
     *
     * @param residentAccessApply 页面提交的resident对象
     * @return 自定义的Result返回结果类对象
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public Result update(ResidentAccessApply residentAccessApply) {

        residentAccessApplyService.update(residentAccessApply);
        return new Result(20000, "修改成功");
    }


}
