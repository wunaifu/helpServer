package com.helpserver.controller;

import com.helpserver.pojo.News;
import com.helpserver.service.NewsService;
import com.helpserver.utils.SessionSetUtils;
import com.helpserver.utils.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * Created by wunaifu on 2018-03-06.
 */
@Controller
@RequestMapping("/news")
public class NewsController {

    @Autowired
    NewsService newsService;

    /**
     * 管理员查看每日新闻列表
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/list")
    public String newsList(HttpServletRequest request, Model model) {
        if (!SessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        List<News> newsList = newsService.getNewsList();
        model.addAttribute("newsList", newsList);
        return "news_list";
    }

    /**
     * 管理员通过id删除每日新闻
     * @param id
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/del/{id}")
    public String newsDelById(@PathVariable("id") int id, HttpServletRequest request, Model model) {
        if (!SessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        String result = newsService.deleteNewsById(id);
        if (result.equals("del_success")) {
            return "redirect:/news/list";
        }
        model.addAttribute("reason", "删除每日新闻失败，请稍后再试！");
        return "page_400";
    }

    /**
     * 管理员添加每日新闻
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/add")
    public String newsAdd(HttpServletRequest request, Model model) {
        if (!SessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        News news = new News();
        news.setTitle(title);
        news.setContent(content);
        news.setTime(TimeUtil.dateToString(new Date()));
        String result = newsService.insertNews(news);
        if (result.equals("insert_success")) {
            return "redirect:/news/list";
        }
        model.addAttribute("reason", "添加每日新闻失败，请稍后再试！");
        return "page_400";
    }

    /**
     * 跳转到每日新闻添加页面
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/addjsp")
    public String newsAddJsp(HttpServletRequest request, Model model) {
        if (!SessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        return "news_add";
    }

}
