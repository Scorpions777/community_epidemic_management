package com.example.epidemic.service;

import com.example.epidemic.entity.ResidentAccessRecord;
import com.example.epidemic.entity.ResidentAccessRecordExample;
import com.example.epidemic.mapper.ResidentAccessRecordMapper;
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
public class ResidentAccessRecordService {


    @Autowired
    private ResidentAccessRecordMapper residentAccessRecordMapper;


    // 根据创建时间降序、并分页
    public Result list(int page, int limit, String query) {

        ResidentAccessRecordExample example = new ResidentAccessRecordExample();


        example.setOrderByClause("create_time DESC,id_card DESC");

        ResidentAccessRecordExample.Criteria criteria1 = example.createCriteria();
        ResidentAccessRecordExample.Criteria criteria2 = example.createCriteria();
        ResidentAccessRecordExample.Criteria criteria3 = example.createCriteria();

        if (StringUtils.isNotEmpty(query)) {
            criteria1.andNameLike(query);
            criteria2.andIdCardLike(query);
            criteria3.andPlaceLike(query);
        }

        example.or(criteria1);
        example.or(criteria2);
        example.or(criteria3);

        Integer count = residentAccessRecordMapper.countByExample(example);

        // 注意：这个PageHelper.startPage分页必须紧靠在分页查询前面。如果放在countByExample前面，分页无效
        PageHelper.startPage(page, limit);

        List<ResidentAccessRecord> list = residentAccessRecordMapper.selectByExample(example);

        return new Result(20000, "查询成功", count.longValue(), list);

    }


    // 增加
    public void add(ResidentAccessRecord residentAccessRecord) {

        IdWorker idWorker = new IdWorker(1, 1);

        residentAccessRecord.setRecordId(String.valueOf(idWorker.nextId()));

        residentAccessRecord.setCreateTime(new Date());

        residentAccessRecordMapper.insertSelective(residentAccessRecord);

    }

    // 删除
    public void deleteById(String residentAccessRecordId) {
        residentAccessRecordMapper.deleteByPrimaryKey(residentAccessRecordId);
    }


    // 修改
    public void update(ResidentAccessRecord residentAccessRecord) {
        residentAccessRecordMapper.updateByPrimaryKeySelective(residentAccessRecord);
    }


    // 根据Id查询
    public ResidentAccessRecord findById(String residentAccessRecordId) {
        return residentAccessRecordMapper.selectByPrimaryKey(residentAccessRecordId);
    }


}
