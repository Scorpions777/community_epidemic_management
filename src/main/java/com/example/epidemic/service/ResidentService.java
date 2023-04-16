package com.example.epidemic.service;

import com.example.epidemic.entity.Address;
import com.example.epidemic.entity.Resident;
import com.example.epidemic.entity.ResidentExample;
import com.example.epidemic.mapper.ResidentMapper;
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
 * @description 住户表 service
 */

@Service
@Transactional
public class ResidentService {


    @Autowired
    private ResidentMapper residentMapper;

    @Autowired
    private AddressService addressService;


    // 根据创建时间降序、并分页
    public Result list(int page, int limit, String query) {

        ResidentExample example = new ResidentExample();

        // 根据 name 升序
        example.setOrderByClause("community_name ASC,building_number ASC,room_number ASC ");

        ResidentExample.Criteria criteria1 = example.createCriteria();
        ResidentExample.Criteria criteria2 = example.createCriteria();
        ResidentExample.Criteria criteria3 = example.createCriteria();
        ResidentExample.Criteria criteria4 = example.createCriteria();

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

        Integer count = residentMapper.countByExample(example);

        // 注意：这个PageHelper.startPage分页必须紧靠在分页查询前面。如果放在countByExample前面，分页无效
        PageHelper.startPage(page, limit);

        List<Resident> list = residentMapper.selectByExample(example);

        return new Result(20000, "查询成功", count.longValue(), list);

    }


    // 增加
    public void add(Resident resident) {

        IdWorker idWorker = new IdWorker(1, 1);

        resident.setResidentId(String.valueOf(idWorker.nextId()));

        Address address = addressService.findById(resident.getAddressId());

        resident.setCommunityName(address.getCommunityName());

        resident.setBuildingNumber(address.getBuildingNumber());

        resident.setRoomNumber(address.getRoomNumber());

        residentMapper.insertSelective(resident);

    }

    // 删除
    public void deleteById(String residentId) {
        residentMapper.deleteByPrimaryKey(residentId);
    }


    // 修改
    public void update(Resident resident) {
        residentMapper.updateByPrimaryKeySelective(resident);
    }


    // 根据Id查询
    public Resident findById(String residentId) {
        return residentMapper.selectByPrimaryKey(residentId);
    }


}
