<%--
  Created by IntelliJ IDEA.
  User: wunaifu
  Date: 2018/1/11
  Time: 21:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head lang="en">
    <meta charset="UTF-8">
    <title>登录</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>

    <link rel="stylesheet" href="/AmazeUI-2.4.2/assets/css/amazeui.css"/>
    <link href="/css/dlstyle.css" rel="stylesheet" type="text/css">
    <link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>

<body>

<div class="login-boxtitle">
    <a href="#"><img alt="logo" src="../../images/logobig.png"/></a>
</div>

<div class="login-banner">
    <div class="login-main">
        <div class="login-banner-bg"><span></span><img src="../../images/big.jpg"/></div>
        <div class="login-box" style="padding: 20px;">

            <h3 class="title">登录服务平台</h3>
            <div class="clear"></div>
            <span id="killPhoneMessage" class="glyphicon"></span>

            <div class="login-form">
                <form style="margin-top: 5px;">
                    <div class="user-name">
                        <label for="user"><i class="am-icon-user"></i></label>
                        <input type="text" name="phone" id="user" placeholder="手机号"
                               onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" maxlength="11" minlength="11"
                               required>
                    </div>
                    <div class="user-pass" style="margin-top: 2px;">
                        <label for="password"><i class="am-icon-lock"></i></label>
                        <input type="password" name="password" id="password" placeholder="请输入密码"
                               onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9]/g,'')" maxlength="14" minlength="6"
                               required>
                    </div>
                </form>
            </div>

            <div class="login-links">
                <label for="remember-me"><input id="remember-me" type="checkbox">记住密码</label>
                <a href="#" class="am-fr">忘记密码</a>
                <a href="/register" class="zcnext am-fr am-btn-default">注册</a>
                <br/>
            </div>
            <div class="am-cf">
                <input type="submit" name="loginbt" value="登 录" onclick="fun()" class="am-btn am-btn-primary am-btn-sm">
            </div>
            <div class="partner">
                <h3>合作账号</h3>
                <div class="am-btn-group">
                    <li><a href="#"><i class="am-icon-qq am-icon-sm"></i><span>QQ登录</span></a></li>
                    <li><a href="#"><i class="am-icon-weibo am-icon-sm"></i><span>微博登录</span> </a></li>
                    <li><a href="#"><i class="am-icon-weixin am-icon-sm"></i><span>微信登录</span> </a></li>
                </div>
            </div>

        </div>
    </div>
</div>

<div class="footer ">
    <div class="footer-hd ">
        <p>
            <a href="# ">恒望科技</a>
            <b>|</b>
            <a href="# ">商城首页</a>
            <b>|</b>
            <a href="# ">支付宝</a>
            <b>|</b>
            <a href="# ">物流</a>
        </p>
    </div>
    <div class="footer-bd ">
        <p>
            <a href="# ">关于恒望</a>
            <a href="# ">合作伙伴</a>
            <a href="# ">联系我们</a>
            <a href="# ">网站地图</a>
            <em>© 2015-2025 Hengwang.com 版权所有. 更多模板 <a href="#" target="_blank" title="模板之家">模板之家</a> - Collect from <a
                    href="#" title="网页模板" target="_blank">网页模板</a></em>
        </p>
    </div>
</div>

<script src="/js/jquery-1.7.2.min.js"></script>
<script src="/js/jquery.ajaxchimp.min.js"></script>
<script src="/js/script.js"></script>
<link rel="stylesheet" href="/css/alert.css"><!-- 弹窗  -->
<script src="/js/alert.js"></script>
<script>
    function fun() {
        var phone = $("#user").val().replace(" ","");
        var password = $("#password").val().replace(" ","");
        if (phone==""){
            $('#killPhoneMessage').hide().html('<label style="color: red;align-content: center">手机号不能为空！</label>').show(300);
            $("#user").focus();
            return;
        }
        if (password==""){
            $('#killPhoneMessage').hide().html('<label style="color: red;align-content: center">密码不能为空！</label>').show(300);
            $("#password").focus();
            return;
        }
        $.ajax({
            type : "POST",
            url: "/user/dologin/" + phone + "/" + password,
            contentType : "application/json;charset=utf-8",
            dataType : "text",
            error : function() {
                $('#killPhoneMessage').hide().html('<label style="color: red">请求失败，请重试！</label>').show(300);
            },
            success:function (data) {
                if (data!=null) {
                    console.log(data);
                    if (data=="login_success"){
                        $.myAlert('注册成功，请登录！');
                        window.location.href="/index";
                    }
                    if (data=="phone_error"){
                        $('#killPhoneMessage').hide().html('<label style="color: red">手机号错误!</label>').show(300);
                        $("#user").select();
                        $("#user").focus();
//                        alert("账号错误，请确认！");
                    }
                    if (data=="password_error"){
                        $('#killPhoneMessage').hide().html('<label style="color: red">密码错误!</label>').show(300);
                        $("#password").select();
                        $("#password").focus();
//                        alert("密码错误，请确认！");
                    }
                }else {
//                    alert("请求失败，请重试！");
                    $('#killPhoneMessage').hide().html('<label style="color: red">请求失败，请重试！</label>').show(300);
                }
            }
        });
    }

</script>
</body>

</html>