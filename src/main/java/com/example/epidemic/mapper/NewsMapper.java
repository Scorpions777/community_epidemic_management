package com.example.epidemic.mapper;

import com.example.epidemic.entity.News;
import com.example.epidemic.entity.NewsExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NewsMapper {
    int countByExample(NewsExample example);

    int deleteByExample(NewsExample example);

    int deleteByPrimaryKey(String newsId);

    int insert(News record);

    int insertSelective(News record);

    List<News> selectByExample(NewsExample example);

    News selectByPrimaryKey(String newsId);

    int updateByExampleSelective(@Param("record") News record, @Param("example") NewsExample example);

    int updateByExample(@Param("record") News record, @Param("example") NewsExample example);

    int updateByPrimaryKeySelective(News record);

    int updateByPrimaryKey(News record);
}