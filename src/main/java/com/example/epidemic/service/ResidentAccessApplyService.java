package com.example.epidemic.service;

import com.example.epidemic.entity.LoginUser;
import com.example.epidemic.entity.Resident;
import com.example.epidemic.entity.ResidentAccessApply;
import com.example.epidemic.entity.ResidentAccessApplyExample;
import com.example.epidemic.mapper.ResidentAccessApplyMapper;
import com.example.epidemic.mapper.ResidentMapper;
import com.example.epidemic.utils.IdWorker;
import com.example.epidemic.utils.Result;
import com.github.pagehelper.PageHelper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author
 * @email
 * @description 住户表 service
 */

@Service
@Transactional
public class ResidentAccessApplyService {


    @Autowired
    private ResidentAccessApplyMapper residentAccessApplyMapper;

    @Autowired
    private ResidentMapper residentMapper;

    @Autowired
    private HttpSession session;


    // 根据创建时间降序、并分页
    public Result list(int page, int limit, String query) {

        ResidentAccessApplyExample example = new ResidentAccessApplyExample();

        // 根据 name 升序
        example.setOrderByClause("create_time ASC,resident_id ASC,access_type ASC ");

        ResidentAccessApplyExample.Criteria criteria1 = example.createCriteria();
        ResidentAccessApplyExample.Criteria criteria2 = example.createCriteria();

        if (StringUtils.isNotEmpty(query)) {
            criteria1.andIdCardLike(query);
            criteria2.andNameLike(query);
        }

        example.or(criteria1);
        example.or(criteria2);

        Long count = residentAccessApplyMapper.countByExample(example);

        // 注意：这个PageHelper.startPage分页必须紧靠在分页查询前面。如果放在countByExample前面，分页无效
        PageHelper.startPage(page, limit);

        List<ResidentAccessApply> list = residentAccessApplyMapper.selectByExample(example);

        return new Result(20000, "查询成功", count, list);

    }

    public Result my(int page, int limit, String query) {

        ResidentAccessApplyExample example = new ResidentAccessApplyExample();

        // 根据 name 升序
        example.setOrderByClause("create_time ASC,resident_id ASC,access_type ASC ");

        ResidentAccessApplyExample.Criteria criteria1 = example.createCriteria();
        ResidentAccessApplyExample.Criteria criteria2 = example.createCriteria();
        LoginUser loginUserFromSession = (LoginUser) session.getAttribute("user");
        if (StringUtils.isNotEmpty(query)) {
            criteria1.andIdCardLike(query);
            criteria1.andResidentIdEqualTo(loginUserFromSession.getUserid());
            criteria2.andNameLike(query);
            criteria2.andResidentIdEqualTo(loginUserFromSession.getUserid());
        }

        example.or(criteria1);
        example.or(criteria2);

        Long count = residentAccessApplyMapper.countByExample(example);

        // 注意：这个PageHelper.startPage分页必须紧靠在分页查询前面。如果放在countByExample前面，分页无效
        PageHelper.startPage(page, limit);

        List<ResidentAccessApply> list = residentAccessApplyMapper.selectByExample(example);

        return new Result(20000, "查询成功", count, list);

    }


    // 增加
    public void add(ResidentAccessApply residentAccessApply) {

        IdWorker idWorker = new IdWorker(1, 1);
        residentAccessApply.setApplyId(String.valueOf(idWorker.nextId()));
        Resident resident = residentMapper.selectByPrimaryKey(residentAccessApply.getResidentId());
        residentAccessApply.setName(resident.getName());
        residentAccessApply.setIdCard(resident.getIdCard());
        residentAccessApplyMapper.insertSelective(residentAccessApply);

    }

    // 删除
    public void deleteById(String applyId) {
        residentAccessApplyMapper.deleteByPrimaryKey(applyId);
    }


    // 修改
    public void update(ResidentAccessApply apply) {
        residentAccessApplyMapper.updateByPrimaryKeySelective(apply);
    }


    // 根据Id查询
    public ResidentAccessApply findById(String residentId) {
        return residentAccessApplyMapper.selectByPrimaryKey(residentId);
    }


}
