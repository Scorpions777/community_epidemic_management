package com.example.epidemic.service;

import com.example.epidemic.entity.LoginUser;
import com.example.epidemic.entity.Resident;
import com.example.epidemic.entity.VisitorAccessApply;
import com.example.epidemic.entity.VisitorAccessApplyExample;
import com.example.epidemic.mapper.ResidentMapper;
import com.example.epidemic.mapper.VisitorAccessApplyMapper;
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
public class VisitorAccessApplyService {


    @Autowired
    private VisitorAccessApplyMapper visitorAccessApplyMapper;

    @Autowired
    private ResidentMapper residentMapper;

    @Autowired
    private HttpSession session;


    // 根据创建时间降序、并分页
    public Result list(int page, int limit, String query) {

        VisitorAccessApplyExample example = new VisitorAccessApplyExample();

        // 根据 name 升序
        example.setOrderByClause("create_time ASC,resident_id ASC,access_type ASC ");

        VisitorAccessApplyExample.Criteria criteria1 = example.createCriteria();
        VisitorAccessApplyExample.Criteria criteria2 = example.createCriteria();

        if (StringUtils.isNotEmpty(query)) {
            criteria1.andIdCardLike(query);
            criteria2.andNameLike(query);
        }

        example.or(criteria1);
        example.or(criteria2);

        Long count = visitorAccessApplyMapper.countByExample(example);

        // 注意：这个PageHelper.startPage分页必须紧靠在分页查询前面。如果放在countByExample前面，分页无效
        PageHelper.startPage(page, limit);

        List<VisitorAccessApply> list = visitorAccessApplyMapper.selectByExample(example);

        return new Result(20000, "查询成功", count, list);

    }

    public Result my(int page, int limit, String query) {

        VisitorAccessApplyExample example = new VisitorAccessApplyExample();

        // 根据 name 升序
        example.setOrderByClause("create_time ASC,resident_id ASC,access_type ASC ");

        LoginUser loginUserFromSession = (LoginUser) session.getAttribute("user");

        VisitorAccessApplyExample.Criteria criteria1 = example.createCriteria();
        VisitorAccessApplyExample.Criteria criteria2 = example.createCriteria();
        if (StringUtils.isNotEmpty(query)) {
            criteria1.andIdCardLike(query);
            criteria1.andResidentIdEqualTo(loginUserFromSession.getUserid());
            criteria2.andNameLike(query);
            criteria2.andResidentIdEqualTo(loginUserFromSession.getUserid());
        }
        example.or(criteria1);
        example.or(criteria2);
        Long count = visitorAccessApplyMapper.countByExample(example);

        // 注意：这个PageHelper.startPage分页必须紧靠在分页查询前面。如果放在countByExample前面，分页无效
        PageHelper.startPage(page, limit);

        List<VisitorAccessApply> list = visitorAccessApplyMapper.selectByExample(example);

        return new Result(20000, "查询成功", count, list);

    }


    // 增加
    public void add(VisitorAccessApply visitorAccessApply) {

        IdWorker idWorker = new IdWorker(1, 1);
        visitorAccessApply.setApplyId(String.valueOf(idWorker.nextId()));
        Resident resident = residentMapper.selectByPrimaryKey(visitorAccessApply.getResidentId());
        visitorAccessApply.setResidentName(resident.getName());
        visitorAccessApplyMapper.insertSelective(visitorAccessApply);

    }

    // 删除
    public void deleteById(String applyId) {
        visitorAccessApplyMapper.deleteByPrimaryKey(applyId);
    }


    // 修改
    public void update(VisitorAccessApply apply) {
        visitorAccessApplyMapper.updateByPrimaryKeySelective(apply);
    }


    // 根据Id查询
    public VisitorAccessApply findById(String residentId) {
        return visitorAccessApplyMapper.selectByPrimaryKey(residentId);
    }


}
