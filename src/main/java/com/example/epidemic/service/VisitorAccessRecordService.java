package com.example.epidemic.service;

import com.example.epidemic.entity.Address;
import com.example.epidemic.entity.VisitorAccessRecord;
import com.example.epidemic.entity.VisitorAccessRecordExample;
import com.example.epidemic.mapper.VisitorAccessRecordMapper;
import com.example.epidemic.utils.IdWorker;
import com.example.epidemic.utils.Result;
import com.github.pagehelper.PageHelper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * @author
 * @email
 * @description 住户出入登记表 service
 */

@Service
@Transactional
public class VisitorAccessRecordService {


    @Autowired
    private AddressService addressService;

    @Autowired
    private VisitorAccessRecordMapper visitorAccessRecordMapper;


    // 根据创建时间降序、并分页
    public Result list(int page, int limit, String query) {

        VisitorAccessRecordExample example = new VisitorAccessRecordExample();


        example.setOrderByClause("create_time DESC,name DESC");

        VisitorAccessRecordExample.Criteria criteria1 = example.createCriteria();
        VisitorAccessRecordExample.Criteria criteria2 = example.createCriteria();
        VisitorAccessRecordExample.Criteria criteria3 = example.createCriteria();

        if (StringUtils.isNotEmpty(query)) {
            criteria1.andNameLike(query);
            criteria2.andIdCardLike(query);
            criteria3.andPhoneLike(query);
        }

        example.or(criteria1);
        example.or(criteria2);
        example.or(criteria3);

        Integer count = visitorAccessRecordMapper.countByExample(example);

        // 注意：这个PageHelper.startPage分页必须紧靠在分页查询前面。如果放在countByExample前面，分页无效
        PageHelper.startPage(page, limit);

        List<VisitorAccessRecord> list = visitorAccessRecordMapper.selectByExample(example);

        return new Result(20000, "查询成功", count.longValue(), list);

    }


    // 增加
    public void add(VisitorAccessRecord visitorAccessRecord) {

        IdWorker idWorker = new IdWorker(1, 1);

        visitorAccessRecord.setRecordId(String.valueOf(idWorker.nextId()));

        visitorAccessRecord.setCreateTime(new Date());

        Address address = addressService.findById(visitorAccessRecord.getAddressId());

        visitorAccessRecord.setCommunityName(address.getCommunityName());

        visitorAccessRecord.setBuildingNumber(address.getBuildingNumber());

        visitorAccessRecord.setRoomNumber(address.getRoomNumber());

        visitorAccessRecordMapper.insertSelective(visitorAccessRecord);

    }

    // 删除
    public void deleteById(String visitorAccessRecordId) {
        visitorAccessRecordMapper.deleteByPrimaryKey(visitorAccessRecordId);
    }


    // 修改
    public void update(VisitorAccessRecord visitorAccessRecord) {
        visitorAccessRecordMapper.updateByPrimaryKeySelective(visitorAccessRecord);
    }


    // 根据Id查询
    public VisitorAccessRecord findById(String visitorAccessRecordId) {
        return visitorAccessRecordMapper.selectByPrimaryKey(visitorAccessRecordId);
    }


}
