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
    <script src="/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=YUqCLjiE9ymXaCpOpZGU2sCZ6WXGHTGf"></script>
</head>

<body onload="dingwei();">

<div class="login-boxtitle">
    <a href="#"><img alt="logo" src="/images/logobig.png"/></a>
</div>

<div class="login-banner">
    <div class="login-main">
        <div class="login-banner-bg"><span></span><img src="/images/big.jpg"/></div>
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
                    <div class="verification">
                        <label for="code"><i class="am-icon-code-fork"></i></label>
                        <input type="tel" name="code" id="code" placeholder="请输入验证码">
                        <a class="btn" href="javascript:void(0);" onclick="get_mobile_code1();" id="sendMobileCode">
                            <span id="dyMobileButton">获取</span></a>
                    </div>
                </form>
            </div>

            <div class="login-links">

                <a href="login" class="am-fr">记得密码</a>
                <%--<a href="/login" class="zcnext am-fr am-btn-default">登录</a>--%>
                <br/>
            </div>
            <div class="am-cf">
                <input type="submit" name="loginbt" value="登 录" onclick="dologinf()" class="am-btn am-btn-primary am-btn-sm">
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
<div id="allmap" style="visibility: hidden"></div>
<!--底部 start-->
<jsp:include page="footer.jsp"></jsp:include>
<!--底部 end-->
<script src="/js/jquery.ajaxchimp.min.js"></script>
<script src="/js/script.js"></script>
<link rel="stylesheet" href="/css/alert.css"><!-- 弹窗  -->
<script src="/js/alert.js"></script>
<script>
    var myLocationHere;
    function dingwei() {
        var map = new BMap.Map("allmap");
        map.centerAndZoom(new BMap.Point(113.090575, 22.599154), 11);
        function myFun(result) {
            var cityName = result.name;
            map.setCenter(cityName);
            var local = new BMap.LocalSearch(map, {
                renderOptions: {map: map}
            });
            local.search(cityName);
            myLocationHere = cityName;
            //alert("myLocationHere=" + myLocationHere);
            $.myToast("您位于"+myLocationHere)
        }
        var myCity = new BMap.LocalCity();
        myCity.get(myFun);
    }


    var mobile_code =  Math.ceil((Math.random()*9+1)*1000);
//        mobile_code = mobile_code.substring(0, 3);
//    var mobile_code =  "1234";
    function get_mobile_code1(){
        var phone = $("#user").val().replace(" ","");
        if(phone==""){
            $('#killPhoneMessage').hide().html('<label style="color: red;align-content: center">手机号不能为空！</label>').show(300);
            $("#user").focus();
            return;
        }
        if(phone.length!=11) {
            $('#killPhoneMessage').hide().html('<label style="color: red;align-content: center">手机号格式不正确！</label>').show(300);
            $("#user").select();
            $("#user").focus();
            return;
        }
        console.log(mobile_code);
        content="您的验证码是：" + mobile_code + "。请不要把验证码泄露给其他人。";
        account="C87765250";
        password="4223e2ce730884f4024d753c5867b0ea";
        mobile= phone;
        RemainTime();
        $.ajax({
            type : "GET",
            url: "http://106.ihuyi.com/webservice/sms.php?method=Submit&account="+account+"&password="+password+"&content="+content+"&mobile="+mobile+"&format=json",
            contentType : "application/x-www-form-urlencoded",
            dataType : "json",
            error : function() {
            },
            success:function (data,textStatus) {
                console.log(data.toString());
            }
        });
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
            sTime='获取';
        }
        $("#dyMobileButton").text(sTime);
    }

    function dologinf() {
        var code = $("#code").val().replace(" ","");
        var phone = $("#user").val().replace(" ","");
        if (phone==""){
            $('#killPhoneMessage').hide().html('<label style="color: red;align-content: center">手机号不能为空！</label>').show(300);
            $("#user").focus();
            return;
        }
        if (phone.length!=11){
            $('#killPhoneMessage').hide().html('<label style="color: red;align-content: center">手机号格式不正确！</label>').show(300);
            $("#user").select();
            $("#user").focus();
            return;
        }
        if (code==""){
            $('#killPhoneMessage').hide().html('<label style="color: red;align-content: center">验证码不能为空！</label>').show(300);
            $("#code").focus();
            return;
        }
        if (code==mobile_code) {
            if (myLocationHere==""||myLocationHere==null||myLocationHere==undefined){
                myLocationHere="江门市";
            }
            $.ajax({
                type : "POST",
                url: "/user/fdologin/?phone=" + phone+ "&location=" +encodeURI(encodeURI(myLocationHere)),
                contentType : "application/json;charset=utf-8",
                dataType : "text",
                error : function() {
                    $('#killPhoneMessage').hide().html('<label style="color: red">请求失败，请重试！</label>').show(300);
                },
                success:function (data) {
                    if (data!=null) {
                        console.log(data);
                        if (data=="login_success"){
                            $.myAlert('登录成功');
                            window.location.href="/index";
                        }
                        if (data=="phone_error"){
                            $('#killPhoneMessage').hide().html('<label style="color: red">没有该手机账户!</label>').show(300);
                            $("#user").select();
                            $("#user").focus();
//                        alert("账号错误，请确认！");
                        }
                        if (data=="phone_ban"){
                            $('#killPhoneMessage').hide().html('<label style="color: red">手机账户被禁用!</label>').show(300);
                            $("#user").select();
                            $("#user").focus();
//                        alert("账号错误，请确认！");
                        }
                    }else {
//                    alert("请求失败，请重试！");
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
</body>

</html>