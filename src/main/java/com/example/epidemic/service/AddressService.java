package com.example.epidemic.service;

import com.example.epidemic.entity.Address;
import com.example.epidemic.entity.AddressExample;
import com.example.epidemic.mapper.AddressMapper;
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
 * @description 地址表 service
 */

@Service
@Transactional
public class AddressService {


    @Autowired
    private AddressMapper addressMapper;


    // 根据创建时间降序、并分页
    public Result list(int page, int limit, String query) {

        AddressExample example = new AddressExample();

        // 根据 name 升序
        example.setOrderByClause("community_name ASC,building_number ASC,room_number ASC ");

        AddressExample.Criteria criteria1 = example.createCriteria();
        AddressExample.Criteria criteria2 = example.createCriteria();
        AddressExample.Criteria criteria3 = example.createCriteria();
        System.out.println(query);
        if (StringUtils.isNotEmpty(query)) {
            criteria1.andCommunityNameLike(query);
            criteria2.andBuildingNumberLike(query);
            criteria3.andRoomNumberLike(query);
        }

        example.or(criteria1);
        example.or(criteria2);
        example.or(criteria3);

        Integer count = addressMapper.countByExample(example);

        // 注意：这个PageHelper.startPage分页必须紧靠在分页查询前面。如果放在countByExample前面，分页无效
        PageHelper.startPage(page, limit);

        List<Address> list = addressMapper.selectByExample(example);

        return new Result(20000, "查询成功", count.longValue(), list);

    }


    // 增加
    public void add(Address address) {

        IdWorker idWorker = new IdWorker(1, 1);

        address.setAddressId(String.valueOf(idWorker.nextId()));



        addressMapper.insertSelective(address);

    }

    // 删除
    public void deleteById(String addressId) {
        addressMapper.deleteByPrimaryKey(addressId);
    }


    // 修改
    public void update(Address address) {
        addressMapper.updateByPrimaryKeySelective(address);
    }


    // 根据Id查询
    public Address findById(String addressId) {
        return addressMapper.selectByPrimaryKey(addressId);
    }


    public List<Address> findAll() {
        return addressMapper.selectByExample(null);
    }
}
