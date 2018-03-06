package com.helpserver.controller;

import com.helpserver.pojo.News;
import com.helpserver.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Administrator on 2018-03-06.
 */
@Controller
@RequestMapping("/news")
public class NewsController {

    @Autowired
    NewsService newsService;

    @RequestMapping("/list")
    public String newsList(HttpServletRequest request, Model model) {
        List<News> newsList = newsService.getNewsList();
        model.addAttribute("newsList", newsList);
        return "server_add";
    }

}
