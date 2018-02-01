package com.helpserver.controller;

import com.helpserver.pojo.Identity;
import com.helpserver.pojo.User;
import com.helpserver.pojo.UserInfoDto;
import com.helpserver.service.IdentityService;
import com.helpserver.service.UserService;
import com.helpserver.utils.DESUtils;
import com.helpserver.utils.ResponseUtils;
import com.helpserver.utils.SessionSetUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

import static jdk.nashorn.internal.runtime.regexp.joni.Config.log;

/**
 * Created by wunaifu on 2018/1/11.
 * 你好啊冲突
 * ninsdfakajsdf
 */
@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    UserService userService;
    @Autowired
    IdentityService identityService;

    /**
     * 管理员查看实名认证审核列表
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/unidentitylist")
    public String unIdentityList(HttpServletRequest request,Model model) throws Exception {
        if (!SessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        //获取待审核列表
        List<UserInfoDto> userInfoDtoList = identityService.getUserInfoDtoListByCheckState(0);
        model.addAttribute("identityList", userInfoDtoList);
        return "user_unidentity_list";
    }

    /**
     * 管理员查看实名认证者详情
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{page}/{userId}/detail")
    public String unIdentityDetail(@PathVariable("userId") int userId,@PathVariable("page") String page,
                                   HttpServletRequest request,Model model) throws Exception {
        if (!SessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        //获取待审核列表
        UserInfoDto userInfoDto = identityService.getUserInfoDtoByUserId(userId);
        model.addAttribute("userInfoDto", userInfoDto);
        model.addAttribute("pageF", page);
        return "user_identity_detail";
    }

    /**
     * 管理员通过审核
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/agree/{userId}/{page}")
    public String agreeIdentity(@PathVariable("userId") int userId,@PathVariable("page") String page,
                                   HttpServletRequest request,Model model) throws Exception {
        if (!SessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        //获取待审核列表
        UserInfoDto userInfoDto = identityService.getUserInfoDtoByUserId(userId);
        model.addAttribute("userInfoDto", userInfoDto);
        model.addAttribute("pageF", page);
        return "user_identity_detail";
    }

    /**
     * 管理员不通过审核
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/disagree/{userId}/{page}")
    public String disagreeIdentity(@PathVariable("userId") int userId,@PathVariable("page") String page,
                                HttpServletRequest request,Model model) throws Exception {
        if (!SessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        //获取待审核列表
        UserInfoDto userInfoDto = identityService.getUserInfoDtoByUserId(userId);
        model.addAttribute("userInfoDto", userInfoDto);
        model.addAttribute("pageF", page);
        return "user_identity_detail";
    }

    /**
     * 管理员查看已被禁用用户列表
     * 1、可以查看用户详情
     * 2、可以取消禁用
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/banlist")
    public String fineAllBanUser(HttpServletRequest request,Model model) throws Exception {
        if (!SessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        List<User> userList = userService.getUserListByPermission(2);
//        System.out.println("userList===" + userList.toString());
        model.addAttribute("userList", userList);
        return "user_beban_list";
    }

    /**
     * 管理员查看已被禁用用户列表
     * 1、可以查看用户详情
     * 2、重置密码
     * 3、禁用
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/uselist")
    public String fineAllUsingUser(HttpServletRequest request,Model model) throws Exception {
        if (!SessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        List<User> userList = userService.getAllUseingUserList();
//        System.out.println("userList===" + userList.toString());
        model.addAttribute("userList", userList);
        return "user_using_list";
    }

    /**
     * 管理员查看用户详细信息
     * @param userId
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/{page}/{userId}/detail")
    public String getUserByUserId(@PathVariable("userId") int userId,@PathVariable("page") String page,
                                  HttpServletRequest request,Model model) throws Exception {
        if (!SessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        User user = userService.selectByPrimaryKey(userId);
        System.out.println("user===" + user.getName());
        System.out.println("page===" +page);
//        String pageStr = "";
//        if (permission == 2) {
//            pageStr = "banlist";
//        } else {
//            pageStr = "uselist";
//        }
        model.addAttribute("userinfo", user);
//        model.addAttribute("pageinfo", pageStr);
        return "user_info";
    }

    /**
     * 管理员取消禁用用户
     * @param request
     */
    @RequestMapping(value = "/unban/{userId}")
    public String unbanUser(@PathVariable("userId") String userId,
                        HttpServletRequest request) throws Exception {
        if (!SessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        int userIdINT = Integer.parseInt(userId);
        if (userService.managerUnBanUser(userIdINT,0)) {
            return "redirect:/user/banlist";
        }
        return "page_400";
//        ResponseUtils.renderJson(response,result);
    }

    /**
     * 管理员禁用用户
     * @param request
     */
    @RequestMapping(value = "/ban/{userId}")
    public String banUser(@PathVariable("userId") String userId,
                            HttpServletRequest request, HttpServletResponse response) {
        if (!SessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        int userIdINT = Integer.parseInt(userId);
        if (userService.managerBanUser(userIdINT,2)) {
            return "redirect:/user/uselist";
        }
        return "page_400";
    }

    /**
     * 管理员重置用户密码为123456
     * @param request
     */
    @RequestMapping(value = "/resetpsw/{userId}")
    public String resetUserPsw(@PathVariable("userId") String userId,
                          HttpServletRequest request, HttpServletResponse response) {
        if (!SessionSetUtils.isManagerLogin(request)) {
            return "page_403";
        }
        int userIdINT = Integer.parseInt(userId);
        String psw = DESUtils.getMD5Str("123456");
        if (userService.managerResetUserPsw(userIdINT,psw)) {
            return "redirect:/user/uselist";
        }
        return "page_400";
    }

}