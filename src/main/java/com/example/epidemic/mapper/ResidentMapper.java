package com.example.epidemic.mapper;

import com.example.epidemic.entity.Resident;
import com.example.epidemic.entity.ResidentExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ResidentMapper {
    int countByExample(ResidentExample example);

    int deleteByExample(ResidentExample example);

    int deleteByPrimaryKey(String residentId);

    int insert(Resident record);

    int insertSelective(Resident record);

    List<Resident> selectByExample(ResidentExample example);

    Resident selectByPrimaryKey(String residentId);

    int updateByExampleSelective(@Param("record") Resident record, @Param("example") ResidentExample example);

    int updateByExample(@Param("record") Resident record, @Param("example") ResidentExample example);

    int updateByPrimaryKeySelective(Resident record);

    int updateByPrimaryKey(Resident record);
}