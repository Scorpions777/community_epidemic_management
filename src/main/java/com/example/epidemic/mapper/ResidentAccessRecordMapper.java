package com.example.epidemic.mapper;

import com.example.epidemic.entity.ResidentAccessRecord;
import com.example.epidemic.entity.ResidentAccessRecordExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ResidentAccessRecordMapper {
    int countByExample(ResidentAccessRecordExample example);

    int deleteByExample(ResidentAccessRecordExample example);

    int deleteByPrimaryKey(String recordId);

    int insert(ResidentAccessRecord record);

    int insertSelective(ResidentAccessRecord record);

    List<ResidentAccessRecord> selectByExample(ResidentAccessRecordExample example);

    ResidentAccessRecord selectByPrimaryKey(String recordId);

    int updateByExampleSelective(@Param("record") ResidentAccessRecord record, @Param("example") ResidentAccessRecordExample example);

    int updateByExample(@Param("record") ResidentAccessRecord record, @Param("example") ResidentAccessRecordExample example);

    int updateByPrimaryKeySelective(ResidentAccessRecord record);

    int updateByPrimaryKey(ResidentAccessRecord record);
}