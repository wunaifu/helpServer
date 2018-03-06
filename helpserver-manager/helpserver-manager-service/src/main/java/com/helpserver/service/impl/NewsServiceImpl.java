package com.helpserver.service.impl;

import com.helpserver.dao.FeedbackDao;
import com.helpserver.dao.NewsDao;
import com.helpserver.dao.UserDao;
import com.helpserver.pojo.*;
import com.helpserver.service.FeedbackService;
import com.helpserver.service.NewsService;
import com.helpserver.utils.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by wunaifu on 2018/3/06.
 */
@Service
public class NewsServiceImpl implements NewsService {

    @Autowired
    NewsDao newsDao;

    @Override
    public String insertNews(News news) {
        if (newsDao.insert(news) == 1) {
            return "insert_success";
        }
        return "insert_error";
    }

    @Override
    public String deleteNewsById(int id) {
        if (newsDao.deleteByPrimaryKey(id) == 1) {
            return "del_success";
        }
        return "del_error";
    }

    @Override
    public List<News> getNewsList() {
        NewsExample newsExample = new NewsExample();
        NewsExample.Criteria criteria = newsExample.createCriteria();
        criteria.andIdIsNotNull();
        newsExample.setOrderByClause("time desc");
        return newsDao.selectByExample(newsExample);
    }

    @Override
    public News getNewsById(int id) {
        return newsDao.selectByPrimaryKey(id);
    }
}
