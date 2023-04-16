package com.example.epidemic.mapper;

import com.example.epidemic.entity.VisitorAccessRecord;
import com.example.epidemic.entity.VisitorAccessRecordExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface VisitorAccessRecordMapper {
    int countByExample(VisitorAccessRecordExample example);

    int deleteByExample(VisitorAccessRecordExample example);

    int deleteByPrimaryKey(String recordId);

    int insert(VisitorAccessRecord record);

    int insertSelective(VisitorAccessRecord record);

    List<VisitorAccessRecord> selectByExample(VisitorAccessRecordExample example);

    VisitorAccessRecord selectByPrimaryKey(String recordId);

    int updateByExampleSelective(@Param("record") VisitorAccessRecord record, @Param("example") VisitorAccessRecordExample example);

    int updateByExample(@Param("record") VisitorAccessRecord record, @Param("example") VisitorAccessRecordExample example);

    int updateByPrimaryKeySelective(VisitorAccessRecord record);

    int updateByPrimaryKey(VisitorAccessRecord record);
}