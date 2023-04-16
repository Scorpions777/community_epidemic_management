package com.example.epidemic.entity;


import java.io.Serializable;

/**
 *  公告表实体类
 */
public class News implements Serializable {

    private String newsId;

    /**
     *  公告标题
     */
    private String title;

    /**
     *  公告内容
     */
    private String content;


    public String getNewsId() {
        return newsId;
    }

    public void setNewsId(String newsId) {
        this.newsId = newsId == null ? null : newsId.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

   }