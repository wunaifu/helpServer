package com.helpserver.controller;

import com.helpserver.dto.NowUser;
import com.helpserver.pojo.User;
import com.helpserver.service.UserService;
import com.helpserver.utils.DESUtils;
import com.helpserver.utils.JsonUtils;
import com.helpserver.utils.ResponseUtils;
import com.helpserver.utils.SessionSetUtils;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.FileUploadBase.FileSizeLimitExceededException;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.ProgressListener;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.jstl.sql.Result;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import static jdk.nashorn.internal.runtime.regexp.joni.Config.log;

/**
 * Created by wunaifu on 2018/1/11.
 */
@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    UserService userService;

    /**
     * 个人信息页面
     *
     * @param request
     * @return
     */
    @RequestMapping("/info")
    public String userInfo(HttpServletRequest request, Model model) {
        if (!SessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        NowUser nowUser = (NowUser) request.getSession().getAttribute("nowUser");
        User user = userService.selectByPrimaryKey(nowUser.getUserid());
        user.setPassword("******");
        model.addAttribute("userinfo", user);
        return "user_info";
    }

    /**
     * 修改个人信息
     *
     * @param request
     * @return
     */
    @RequestMapping("/update")
    public String userUpdate(@RequestParam(value = "file", required = false)
                                     MultipartFile file, HttpServletRequest request, Model model){
        if (!SessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        NowUser nowUser = (NowUser) request.getSession().getAttribute("nowUser");
        String fileName = null;
        try {
            if (file != null) {
                String picture = file.getOriginalFilename();
                if (picture.equals("")) {
                } else {// 保存
                    String filePath = request.getSession().getServletContext().getRealPath("/") + "resources/img/"+nowUser.getUserid()+"/";
                    fileName = UUID.randomUUID() + picture.substring(picture.lastIndexOf("."));
                    System.out.println("**********" + filePath);
                    System.out.println("**********" + fileName);
                    File targetFile = new File(filePath, fileName); // 新建文件
                    if (!targetFile.exists()) { // 判断文件的路径是否存在
                        targetFile.mkdirs(); // 如果文件不存在 在目录中创建文件夹 这里要注意mkdir()和mkdirs()的区别
                    }
                    file.transferTo(targetFile); // 传送 失败就抛异常
                    // 执行更新图片在服务器的地址
                    fileName=nowUser.getUserid()+"/"+fileName;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("message", "传送失败，请重试！");
            return "page_400";
        }
        String nickname = request.getParameter("nickname");
        int userid = Integer.parseInt(request.getParameter("userid"));
        String sexStr = request.getParameter("sex");
        int sex = 1;
        if (sexStr.equals("女")) {
            sex = 0;
        }
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String address = request.getParameter("address");
        String userinfo = request.getParameter("userinfo");

        User user = new User();
        user.setUserid(userid);
        user.setNickname(nickname);
        user.setSex(sex);
        user.setName(name);
        user.setAge(age);
        user.setAddress(address);
        user.setUserinfo(userinfo);
        user.setHeadicon(fileName);
        if (userService.updateUser(user)) {
            model.addAttribute("userinfo", user);
            return "page_success";
        }
        return "page_400";

    }

    /**
     * 安全设置页面
     *
     * @param request
     * @return
     */
    @RequestMapping("/safety")
    public String userSafety(HttpServletRequest request,Model model) {
        if (!SessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        NowUser nowUser = (NowUser) request.getSession().getAttribute("nowUser");
        User user = userService.selectByPrimaryKey(nowUser.getUserid());
        user.setPassword("******");
        model.addAttribute("userinfo", user);
        return "user_safety";
    }

    /**
     * 修改密码页面
     *
     * @param request
     * @return
     */
    @RequestMapping("/resetpsw")
    public String userResetPsw(HttpServletRequest request) {
        if (!SessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        return "user_resetpsw";
    }

    /**
     * 修改密码，修改成功，则重新登录
     *
     * @param request
     * @return
     */
    @RequestMapping("/doresetpsw")
    public String doresetpsw(HttpServletRequest request,Model model) {
        if (!SessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        String oldPsw = request.getParameter("oldpsw");
        String newPsw = request.getParameter("newpsw");
        oldPsw = DESUtils.getMD5Str(oldPsw);
        newPsw = DESUtils.getMD5Str(newPsw);

        NowUser nowUser = (NowUser) request.getSession().getAttribute("nowUser");
        String result = userService.doResetPsw(nowUser.getUserid(), oldPsw, newPsw);
        if (result.equals("oldpsw_error")) {
            model.addAttribute("message", "旧密码错误，请确认密码！");
            return "page_400";
        } else if (result.equals("resetpsw_error")) {
            model.addAttribute("message", "重设密码失败，请稍后再试！");
            return "page_400";
        }
        request.getSession().removeAttribute("nowUser");
        return "page_resetpsw_success";
    }

    /**
     * 修改手机页面
     *
     * @param request
     * @return
     */
    @RequestMapping("/bindphone")
    public String userBindPhone(HttpServletRequest request) {
        if (!SessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        return "user_bindphone";
    }

    /**
     * 身份验证页面
     *
     * @param request
     * @return
     */
    @RequestMapping("/idcard")
    public String userIDcard(HttpServletRequest request) {
        if (!SessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        return "user_idcard";
    }

    /**
     * 登录接口，返回登录信息，
     * 1.login_success
     * 2.password_error
     * 3.phone_error
     * 4.phone_ban
     *
     * @param request
     */
    @RequestMapping(value = "/dologin/{phone}/{password}")
    public void dologin(@PathVariable("phone") String phone, @PathVariable("password") String password,
                        HttpServletRequest request, HttpServletResponse response) {
        String result = userService.loginByPhoneAndPsw(phone, password);
        //登录成功，session保存当前用户数据
        if (result.equals("login_success")) {
            User user = userService.getUserByPhone(phone);
            if (user != null) {
                NowUser nowUser = new NowUser();
                nowUser.setUserid(user.getUserid());
                nowUser.setPhone(user.getPhone());
                nowUser.setName(user.getName());
                nowUser.setPermission(user.getPermission());

                request.getSession().setAttribute("nowUser", nowUser);
            }
        }
        ResponseUtils.renderJson(response, result);
    }

    /**
     * 注册接口，返回注册信息
     * 1、user_exist
     * 2、register_success
     * 3、register_failure
     *
     * @param request
     */
    @RequestMapping(value = "/doregister/{phone}/{password}")
    public void doregister(@PathVariable("phone") String phone, @PathVariable("password") String password,
                           HttpServletRequest request, HttpServletResponse response) {
        String result = userService.registerByPhoneAndPsw(phone, password);
        ResponseUtils.renderJson(response, result);
    }


    @RequestMapping("/feedback")
    public String feedback(HttpServletRequest request) {
        if (!SessionSetUtils.isUserLogin(request)) {
            return "page_403";
        }
        return "user_feedback";
    }
}

