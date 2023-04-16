package com.example.epidemic.controller;

import com.example.epidemic.entity.Address;
import com.example.epidemic.queryVo.AddressQueryVo;
import com.example.epidemic.service.AddressService;
import com.example.epidemic.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author
 * @email
 * @description 地址表 controller
 */

@RestController
@RequestMapping("address")
public class AddressController {

    @Autowired
    private AddressService addressService;

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

        return addressService.list(page, limit, "%" + query + "%");

    }


    @RequestMapping("/all")
    @ResponseBody
    public List<AddressQueryVo> list() {

        List<Address> list = addressService.findAll();

        List<AddressQueryVo> addressQueryVoList = new ArrayList<AddressQueryVo>();

        for (Address address : list) {
            addressQueryVoList.add(new AddressQueryVo(address.getAddressId(),
                    address.getCommunityName() +
                            address.getBuildingNumber() +
                            address.getRoomNumber()));

        }
        return addressQueryVoList;
    }


    /**
     * 增加
     *
     * @param address 页面提交的address对象
     * @return 自定义的Result返回结果类对象
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Result add(Address address) {

        addressService.add(address);

        return new Result(20000, "增加成功");
    }


    /**
     * 根据 id 删除
     *
     * @param addressId 页面提交的id
     * @return 自定义的Result返回结果类对象
     */
    @RequestMapping(value = "/delete/{addressId}", method = RequestMethod.DELETE)
    @ResponseBody
    public Result deleteById(@PathVariable String addressId) {
        addressService.deleteById(addressId);
        return new Result(20000, "删除成功");
    }

    /**
     * 修改
     *
     * @param address 页面提交的address对象
     * @return 自定义的Result返回结果类对象
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public Result update(Address address) {
        System.out.println(address.getHouser());
        addressService.update(address);
        return new Result(20000, "修改成功");
    }


}
