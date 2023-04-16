package com.example.epidemic.mapper;

import com.example.epidemic.entity.Returnees;
import com.example.epidemic.entity.ReturneesExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReturneesMapper {
    int countByExample(ReturneesExample example);

    int deleteByExample(ReturneesExample example);

    int deleteByPrimaryKey(String returneesId);

    int insert(Returnees record);

    int insertSelective(Returnees record);

    List<Returnees> selectByExample(ReturneesExample example);

    Returnees selectByPrimaryKey(String returneesId);

    int updateByExampleSelective(@Param("record") Returnees record, @Param("example") ReturneesExample example);

    int updateByExample(@Param("record") Returnees record, @Param("example") ReturneesExample example);

    int updateByPrimaryKeySelective(Returnees record);

    int updateByPrimaryKey(Returnees record);
}