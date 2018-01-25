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
    <title>注册</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>

    <link rel="stylesheet" href="/AmazeUI-2.4.2/assets/css/amazeui.min.css"/>
    <link href="/css/dlstyle.css" rel="stylesheet" type="text/css">
    <script src="/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script src="/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>

</head>

<body>

<div class="login-boxtitle">
    <a href="home/demo.html"><img alt="" src="../../images/logobig.png"/></a>
</div>

<div class="res-banner">
    <div class="res-main">
        <div class="login-banner-bg"><span></span><img src="../../images/big.jpg"/></div>
        <div class="login-box">
            <div class="am-tabs" id="doc-my-tabs">

                <h3 class="title">手机号注册</h3>

                <div class="clear"></div>
                <span id="killPhoneMessage" class="glyphicon"></span>

                <div class="am-tab-panel am-active">
                    <form method="post">
                        <div class="user-phone">
                            <label for="phone"><i class="am-icon-mobile-phone am-icon-md"></i></label>
                            <input type="tel" name="phone" id="phone" placeholder="请输入手机号"
                                   onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" maxlength="11" minlength="11" required>
                        </div>
                        <div class="verification">
                            <label for="code"><i class="am-icon-code-fork"></i></label>
                            <input type="tel" name="code" id="code" placeholder="请输入验证码">
                            <a class="btn" href="javascript:void(0);" onclick="get_mobile_code();" id="sendMobileCode">
                                <span id="dyMobileButton">获取</span></a>
                        </div>
                        <div class="user-pass">
                            <label for="password"><i class="am-icon-lock"></i></label>
                            <input type="password" name="password" id="password" placeholder="设置密码"
                                   onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9]/g,'')" maxlength="14" minlength="6">
                        </div>
                        <div class="user-pass">
                            <label for="passwordRepeat"><i class="am-icon-lock"></i></label>
                            <input type="password" name="passwordRepeat" id="passwordRepeat" placeholder="确认密码"
                                   onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9]/g,'')" maxlength="14" minlength="6">
                        </div>
                    </form>
                    <div class="login-links">
                        <label for="reader-me">
                            <input id="reader-me" type="checkbox"> 点击表示您同意服务平台《服务协议》
                        </label>
                        <a href="/login" class="zcnext am-fr am-btn-default">登录</a>
                        <br/>
                    </div>
                    <div class="am-cf">
                        <input type="submit" name="" value="注册" onclick="register();" class="am-btn am-btn-primary am-btn-sm am-fl">
                    </div>

                    <hr>
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
                <em>© 2015-2025 Hengwang.com 版权所有. 更多模板 <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a>
                    - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></em>
            </p>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="../../js/jquery-1.7.2.min.js"></script>
<script>
//    var mobile_code =  Math.ceil((Math.random()*9+1)*1000);
    var mobile_code =  "1234";
    function get_mobile_code(){
        var phone = $("#phone").val().replace(" ","");
        if(phone==""){
//            alert("手机号不能为空！");
            $('#killPhoneMessage').hide().html('<label style="color: red;align-content: center">手机号不能为空！</label>').show(300);
            return;
        }
        if(phone.length!=11) {
//            alert("手机号格式不对！");
            $('#killPhoneMessage').hide().html('<label style="color: red;align-content: center">手机号格式不对！</label>').show(300);
            return;
        }
//        mobile_code = mobile_code.substring(0, 3);
        console.log(mobile_code);
        content="您的验证码是：" + mobile_code + "。请不要把验证码泄露给其他人。";
        account="C62138766";
        password="f2f3a56a1bd4de09fd0b4fb5c7f6ba4a";
        mobile= phone;
        RemainTime();
//        $.ajax({
//            type : "GET",
//            url: "http://106.ihuyi.com/webservice/sms.php?method=Submit&account="+account+"&password="+password+"&content="+content+"&mobile="+mobile+"&format=json",
//            contentType : "application/x-www-form-urlencoded",
//            dataType : "json",
//            error : function() {
////                alert("请求失败，请重试！");
//            },
//            success:function (data,textStatus) {
//                console.log(data.toString());
//            }
//        });
    };
    var iTime = 59;
    var Account;
    //时间60秒倒数
    function RemainTime(){
//        $("#sendMobileCode").disabled=true;
        $("#sendMobileCode").removeAttr('onclick');
//        $('#sendMobileCode').unbind("click");
//        console.log($("#dyMobileButton").val)
        var iSecond,sSecond="",sTime="";
        if (iTime >= 0){
            iSecond = parseInt(iTime%60);
            iMinute = parseInt(iTime/60)
            if (iSecond >= 0){
                if(iMinute>0){
                    sSecond = iMinute + "分" + iSecond + "秒";
                }else{
                    sSecond = iSecond + "秒";
                }
            }
            sTime=sSecond;
            if(iTime==0){
                clearTimeout(Account);
                sTime='获取';
                iTime = 59;
                $("#sendMobileCode").attr("onclick", "get_mobile_code()");
            }else{
                Account = setTimeout("RemainTime()",1000);
                iTime=iTime-1;
            }
        }else{
            sTime='nothing';
        }
        $("#dyMobileButton").text(sTime);
    }

    function register() {
        var code = $("#code").val().replace(" ","");
        var phone = $("#phone").val().replace(" ","");
        var password = $("#password").val().replace(" ","");
        var passwordRepeat = $("#passwordRepeat").val().replace(" ","");
        if (code=="" || phone=="" || password== "" || passwordRepeat == ""){
//            alert("内容不能为空！");
            $('#killPhoneMessage').hide().html('<label style="color: red;align-content: center">内容不能为空！</label>').show(300);
            return;
        }
        if (code==mobile_code) {
            if (password.length<6){
//            alert("内容不能为空！");
                $('#killPhoneMessage').hide().html('<label style="color: red;align-content: center">密码长度不能少于6位！</label>').show(300);
                return;
            }
            if (password != passwordRepeat){
//            alert("内容不能为空！");
                $('#killPhoneMessage').hide().html('<label style="color: red;align-content: center">两次输入密码不一致！</label>').show(300);
                return;
            }
            $.ajax({
                type : "POST",
                url: "/user/doregister/" + phone + "/" + password,
                contentType : "application/json;charset=utf-8",
                dataType : "text",
                error : function() {
                    $('#killPhoneMessage').hide().html('<label style="color: red">请求失败，请重试！</label>').show(300);
//                alert("请求失败，请重试！");
                },
                success:function (data) {
                    if (data!=null) {
                        console.log(data);
                        if (data=="register_success"){
                            window.location.href="/login";
//                        alert("注册成功！");
                        }
                        if (data=="register_failure"){
                            $('#killPhoneMessage').hide().html('<label style="color: red">注册失败，请重试！</label>').show(300);
//                        alert("注册失败，请确认！");
                        }
                        if (data=="user_exist"){
                            $('#killPhoneMessage').hide().html('<label style="color: red">已存在该手机用户!</label>').show(300);
//                        alert("已存在该手机用户！");
                        }
                    }else {
//                    alert("请求失败，请重试！");
                        $('#killPhoneMessage').hide().html('<label style="color: red">请求失败，请重试！</label>').show(300);
                    }
                }
            });
        }else {
            $('#killPhoneMessage').hide().html('<label style="color: red;align-content: center">验证码错误!</label>').show(300);
            return;
//            alert("验证码错误，请确认您输入的验证码是否正确？")
        }

    }
</script>
</html>
