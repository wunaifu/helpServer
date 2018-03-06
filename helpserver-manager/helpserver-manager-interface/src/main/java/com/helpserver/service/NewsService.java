package com.helpserver.service;

import com.helpserver.pojo.News;

import java.util.List;

/**
 * Created by wunaifu on 2018/3/06.
 */
public interface NewsService {

    String insertNews(News news);

    String deleteNewsById(int id);

    News getNewsById(int id);

    List<News> getNewsList();
}
