package com.example.epidemic.service;

import com.example.epidemic.entity.Address;
import com.example.epidemic.entity.Returnees;
import com.example.epidemic.entity.ReturneesExample;
import com.example.epidemic.mapper.ReturneesMapper;
import com.example.epidemic.utils.IdWorker;
import com.example.epidemic.utils.Result;
import com.github.pagehelper.PageHelper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author
 * @email
 * @description 返乡人员表 service
 */

@Service
@Transactional
public class ReturneesService {


    @Autowired
    private ReturneesMapper returneesMapper;


    @Autowired
    private AddressService addressService;


    // 根据创建时间降序、并分页
    public Result list(int page, int limit, String query) {

        ReturneesExample example = new ReturneesExample();


        example.setOrderByClause("return_time DESC,community_name ASC,building_number ASC,room_number ASC ");

        ReturneesExample.Criteria criteria1 = example.createCriteria();
        ReturneesExample.Criteria criteria2 = example.createCriteria();
        ReturneesExample.Criteria criteria3 = example.createCriteria();
        ReturneesExample.Criteria criteria4 = example.createCriteria();

        if (StringUtils.isNotEmpty(query)) {
            criteria1.andCommunityNameLike(query);
            criteria2.andBuildingNumberLike(query);
            criteria3.andRoomNumberLike(query);
            criteria4.andNameLike(query);
        }

        example.or(criteria1);
        example.or(criteria2);
        example.or(criteria3);
        example.or(criteria4);

        Integer count = returneesMapper.countByExample(example);

        // 注意：这个PageHelper.startPage分页必须紧靠在分页查询前面。如果放在countByExample前面，分页无效
        PageHelper.startPage(page, limit);

        List<Returnees> list = returneesMapper.selectByExample(example);

        return new Result(20000, "查询成功", count.longValue(), list);

    }


    // 增加
    public void add(Returnees returnees) {

        IdWorker idWorker = new IdWorker(1, 1);

        returnees.setReturneesId(String.valueOf(idWorker.nextId()));

        Address address = addressService.findById(returnees.getAddressId());

        returnees.setCommunityName(address.getCommunityName());

        returnees.setBuildingNumber(address.getBuildingNumber());

        returnees.setRoomNumber(address.getRoomNumber());

        returneesMapper.insertSelective(returnees);

    }

    // 删除
    public void deleteById(String returneesId) {
        returneesMapper.deleteByPrimaryKey(returneesId);
    }


    // 修改
    public void update(Returnees returnees) {
        returneesMapper.updateByPrimaryKeySelective(returnees);
    }


    // 根据Id查询
    public Returnees findById(String returneesId) {
        return returneesMapper.selectByPrimaryKey(returneesId);
    }


}
