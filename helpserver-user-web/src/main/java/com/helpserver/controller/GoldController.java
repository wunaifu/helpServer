package com.helpserver.controller;

import com.helpserver.dto.NowUser;
import com.helpserver.pojo.User;
import com.helpserver.service.GoldService;
import com.helpserver.service.UserService;
import com.helpserver.utils.SessionSetUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by wunaifu on 2018/1/18.
 */
@Controller
public class GoldController {

    @Autowired
    GoldService goldService;


}
