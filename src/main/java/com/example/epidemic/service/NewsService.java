package com.example.epidemic.service;

import com.example.epidemic.entity.News;
import com.example.epidemic.entity.NewsExample;
import com.example.epidemic.mapper.NewsMapper;
import com.example.epidemic.utils.IdWorker;
import com.example.epidemic.utils.Result;
import com.github.pagehelper.PageHelper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author
 * @email
 * @description 地址表 service
 */

@Service
@Transactional
public class NewsService {


    @Autowired
    private NewsMapper newsMapper;


    // 根据创建时间降序、并分页
    public Result list(int page, int limit, String query) {

        NewsExample example = new NewsExample();

        // 根据 name 升序
        example.setOrderByClause("title ASC,content ASC ");

        NewsExample.Criteria criteria1 = example.createCriteria();
        NewsExample.Criteria criteria2 = example.createCriteria();

        if (StringUtils.isNotEmpty(query)) {
            criteria1.andTitleLike(query);
            criteria2.andContentLike(query);
        }

        example.or(criteria1);
        example.or(criteria2);

        Integer count = newsMapper.countByExample(example);

        // 注意：这个PageHelper.startPage分页必须紧靠在分页查询前面。如果放在countByExample前面，分页无效
        PageHelper.startPage(page, limit);

        List<News> list = newsMapper.selectByExample(example);

        return new Result(20000, "查询成功", count.longValue(), list);

    }


    // 增加
    public void add(News news) {

        IdWorker idWorker = new IdWorker(1, 1);

        news.setNewsId(String.valueOf(idWorker.nextId()));



        newsMapper.insertSelective(news);

    }

    // 删除
    public void deleteById(String newsId) {
        newsMapper.deleteByPrimaryKey(newsId);
    }


    // 修改
    public void update(News news) {
        newsMapper.updateByPrimaryKeySelective(news);
    }


    // 根据Id查询
    public News findById(String newsId) {
        return newsMapper.selectByPrimaryKey(newsId);
    }


    public List<News> findAll() {
        return newsMapper.selectByExample(null);
    }
}
