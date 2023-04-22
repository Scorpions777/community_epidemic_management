package com.example.epidemic.service;

import com.example.epidemic.entity.*;
import com.example.epidemic.mapper.ResidentMapper;
import com.example.epidemic.mapper.ReturneesMapper;
import com.example.epidemic.utils.LoginTypeConstants;
import com.example.epidemic.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class UserService {

    @Autowired
    private ResidentMapper residentMapper;

    @Autowired
    private ReturneesMapper returneesMapper;

    @Autowired
    private HttpSession session;

    public LoginUser login(LoginUser user) {
        LoginUser loginUser = new LoginUser();
        // 尝试登录住户
        ResidentExample residentExample = new ResidentExample();
        residentExample.createCriteria().andPhoneEqualTo(user.getPhone());
        List<Resident> residents = residentMapper.selectByExample(residentExample);
        for (Resident resident : residents) {
            if (resident.getPassword() != null && resident.getPassword().equals(user.getPassword())) {
                loginUser.setPhone(resident.getPhone());
                loginUser.setLoginname(resident.getName());
                loginUser.setUserid(resident.getResidentId());
                loginUser.setPassword(resident.getPassword());
                loginUser.setLoginType(LoginTypeConstants.RESIDENT_TYPE);
                return loginUser;
            } else if (resident.getIdCard().substring(resident.getIdCard().length() - 6).equals(user.getPassword())) {
                loginUser.setPhone(resident.getPhone());
                loginUser.setLoginname(resident.getName());
                loginUser.setUserid(resident.getResidentId());
                loginUser.setPassword(resident.getIdCard().substring(resident.getIdCard().length() - 6));
                loginUser.setLoginType(LoginTypeConstants.RESIDENT_TYPE);
                return loginUser;
            }
        }
        // 尝试登录返乡
        ReturneesExample returneesExample = new ReturneesExample();
        returneesExample.createCriteria().andPhoneEqualTo(user.getPhone());
        List<Returnees> returnees = returneesMapper.selectByExample(returneesExample);
        for (Returnees item : returnees) {
            if (item.getPassword() != null && item.getPassword().equals(user.getPassword())) {
                loginUser.setPhone(item.getPhone());
                loginUser.setLoginname(item.getName());
                loginUser.setUserid(item.getReturneesId());
                loginUser.setPassword(item.getPassword());
                loginUser.setLoginType(LoginTypeConstants.RETURNEES_TYPE);
                return loginUser;
            } else if (item.getIdCard().substring(item.getIdCard().length() - 6).equals(user.getPassword())) {
                loginUser.setPhone(item.getPhone());
                loginUser.setLoginname(item.getName());
                loginUser.setUserid(item.getReturneesId());
                loginUser.setPassword(item.getIdCard().substring(item.getIdCard().length() - 6));
                loginUser.setLoginType(LoginTypeConstants.RETURNEES_TYPE);
                return loginUser;
            }
        }
        return null;
    }

    public void updatePassword(LoginUser loginUserFromSession) {
        if (LoginTypeConstants.RESIDENT_TYPE.equals(loginUserFromSession.getLoginType())) {
            Resident resident = residentMapper.selectByPrimaryKey(loginUserFromSession.getUserid());
            resident.setPassword(loginUserFromSession.getPassword());
            residentMapper.updateByPrimaryKey(resident);
        } else if (LoginTypeConstants.RETURNEES_TYPE.equals(loginUserFromSession.getLoginType())) {
            Returnees returnees = returneesMapper.selectByPrimaryKey(loginUserFromSession.getUserid());
            returnees.setPassword(loginUserFromSession.getPassword());
            returneesMapper.updateByPrimaryKey(returnees);
        }
    }

    public Result updatePhone(LoginUser userFromSession, String phone) {
        if (LoginTypeConstants.RESIDENT_TYPE.equals(userFromSession.getLoginType())) {
            ResidentExample residentExample = new ResidentExample();
            residentExample.createCriteria().andPhoneEqualTo(phone);
            if (residentMapper.countByExample(residentExample) > 0) {
                return new Result(20001, "手机号已存在");
            }
            Resident resident = residentMapper.selectByPrimaryKey(userFromSession.getUserid());
            resident.setPhone(phone);
            residentMapper.updateByPrimaryKey(resident);
        } else if (LoginTypeConstants.RETURNEES_TYPE.equals(userFromSession.getLoginType())) {
            ReturneesExample returneesExample = new ReturneesExample();
            returneesExample.createCriteria().andPhoneEqualTo(phone);
            if (returneesMapper.countByExample(returneesExample) > 0) {
                return new Result(20001, "手机号已存在");
            }
            Returnees returnees = returneesMapper.selectByPrimaryKey(userFromSession.getUserid());
            returnees.setPhone(phone);
            returneesMapper.updateByPrimaryKey(returnees);
        }
        userFromSession.setPhone(phone);
        session.setAttribute("user", userFromSession);
        return new Result(20000, "修改成功");
    }

    public Result residentApplyList(int page, int limit, String query) {
        return null;
    }
}
