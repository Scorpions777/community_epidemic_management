package com.example.epidemic.service;

import com.example.epidemic.entity.Admin;
import com.example.epidemic.entity.AdminExample;
import com.example.epidemic.mapper.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author
 * @email
 * @description
 */

@Service
public class AdminService {

    @Autowired
    private AdminMapper adminMapper;


    /**
     * 登录
     *
     * @param admin 对象
     * @return 对象
     */
    public Admin login(Admin admin) {

        AdminExample example = new AdminExample();

        example.createCriteria().andPhoneEqualTo(admin.getPhone()).andPasswordEqualTo(admin.getPassword());

        List<Admin> admins = adminMapper.selectByExample(example);

        if (admins.size() == 0) {
            return null;
        }

        return admins.get(0);

    }


    /**
     *  根据id查询
     * @param adminId
     * @return
     */
    public Admin findById(String adminId) {
        return adminMapper.selectByPrimaryKey(adminId);
    }

    /**
     *  修改密码
     * @param admin
     */
    public void updatePassword(Admin admin) {
        adminMapper.updateByPrimaryKeySelective(admin);
    }


    /**
     *  修改资料
     * @param admin
     */
    public void update(Admin admin) {
        adminMapper.updateByPrimaryKeySelective(admin);
    }

    public Admin findByPhone(String phone) {

        AdminExample example = new AdminExample();

        example.createCriteria().andPhoneEqualTo(phone);

        List<Admin> admins = adminMapper.selectByExample(example);

        if (admins.size() == 0) {
            return null;
        }

        return admins.get(0);
    }
}
