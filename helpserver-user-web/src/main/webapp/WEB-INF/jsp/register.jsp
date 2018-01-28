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
    <a href="home/demo.html"><img alt="" src="/images/logobig.png"/></a>
</div>

<div class="res-banner">
    <div class="res-main">
        <div class="login-banner-bg"><span></span><img src="../../images/big.jpg"/></div>
        <div class="login-box"  style="padding: 20px;">
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
                        <label for="readerme">
                            <input id="readerme" onclick="agree();" type="checkbox"> 点击表示您同意服务平台《服务协议》
                        </label>
                        <a href="/login" class="zcnext am-fr am-btn-default">登录</a>
                        <br/>
                    </div>
                    <div class="am-cf">
                        <input disabled="disabled" type="submit" name="" value="注册" id="registerbutton" class="am-btn am-btn-primary am-btn-sm am-fl">
                    </div>

                    <hr>
                </div>

            </div>

        </div>
    </div>

    <jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
<link rel="stylesheet" href="/css/alert.css"><!-- 弹窗  -->
<script src="/js/alert.js"></script>
<script>
//    var mobile_code =  Math.ceil((Math.random()*9+1)*1000);
    var mobile_code =  "1234";
    function get_mobile_code(){
        var phone = $("#phone").val().replace(" ","");
        if(phone==""){
            $('#killPhoneMessage').hide().html('<label style="color: red;align-content: center">手机号不能为空！</label>').show(300);
            $("#phone").focus();
            return;
        }
        if(phone.length!=11) {
            $('#killPhoneMessage').hide().html('<label style="color: red;align-content: center">手机号格式不正确！</label>').show(300);
            $("#phone").select();
            $("#phone").focus();
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
    //点击协议的同意按钮
    function agree() {
        //如果同意协议，则可以点击注册按钮
        if($("#readerme").attr("checked") == "checked") {
            $("#registerbutton").removeAttr("disabled");
            $("#registerbutton").attr("onclick", "register();");
        }
        else {
            $("#registerbutton").attr("disabled", "disabled");
        }
    }
    function register() {
        var code = $("#code").val().replace(" ","");
        var phone = $("#phone").val().replace(" ","");
        var password = $("#password").val().replace(" ","");
        var passwordRepeat = $("#passwordRepeat").val().replace(" ","");
        if (phone==""){
            $('#killPhoneMessage').hide().html('<label style="color: red;align-content: center">手机号不能为空！</label>').show(300);
            $("#phone").focus();
            return;
        }
        if (phone.length!=11){
            $('#killPhoneMessage').hide().html('<label style="color: red;align-content: center">手机号格式不正确！</label>').show(300);
            $("#phone").select();
            $("#phone").focus();
            return;
        }
        if (code==""){
            $('#killPhoneMessage').hide().html('<label style="color: red;align-content: center">验证码不能为空！</label>').show(300);
            $("#code").focus();
            return;
        }
        if (password== "" ){
            $('#killPhoneMessage').hide().html('<label style="color: red;align-content: center">密码不能为空！</label>').show(300);
            $("#password").focus();
            return;
        }
        if (passwordRepeat == ""){
            $('#killPhoneMessage').hide().html('<label style="color: red;align-content: center">密码不能为空！</label>').show(300);
            $("#passwordRepeat").focus();
            return;
        }
        if (code==mobile_code) {
            if (password.length<6){
                $('#killPhoneMessage').hide().html('<label style="color: red;align-content: center">密码长度不能少于6位！</label>').show(300);
                $("#password").select();
                $("#password").focus();
                return;
            }
            if (password != passwordRepeat){
                $('#killPhoneMessage').hide().html('<label style="color: red;align-content: center">两次输入密码不一致！</label>').show(300);
                $("#password").focus();
                return;
            }
            $.ajax({
                type : "POST",
                url: "/user/doregister/" + phone + "/" + password,
                contentType : "application/json;charset=utf-8",
                dataType : "text",
                error : function() {
                    $('#killPhoneMessage').hide().html('<label style="color: red">请求失败，请重试！</label>').show(300);
                },
                success:function (data) {
                    if (data!=null) {
                        console.log(data);
                        if (data=="register_success"){
                            //alert("注册成功，请登录！");
                            //$.myToast('注册成功，请登录！');
                            $.myAlert('注册成功，请登录！');
                            //window.location.href="/login";
                        }
                        if (data=="register_failure"){
                            $('#killPhoneMessage').hide().html('<label style="color: red">注册失败，请重试！</label>').show(300);
                        }
                        if (data=="user_exist"){
                            $('#killPhoneMessage').hide().html('<label style="color: red">已存在该手机用户!</label>').show(300);
                            $("#phone").select();
                            $("#phone").focus();
                        }
                    }else {
                        $('#killPhoneMessage').hide().html('<label style="color: red">请求失败，请重试！</label>').show(300);
                    }
                }
            });
        }else {
            $('#killPhoneMessage').hide().html('<label style="color: red;align-content: center">验证码错误!</label>').show(300);
            $("#code").select();
            $("#code").focus();
            return;
        }

    }
</script>
</html>
