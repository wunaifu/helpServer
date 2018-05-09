<%--
  Created by IntelliJ IDEA.
  User: wunaifu
  Date: 2018-01-24
  Time: 18:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <title>管理员登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Fonts
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:300,400' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900' rel='stylesheet' type='text/css'>-->
    <!-- CSS Libs -->
    <link rel="stylesheet" type="text/css" href="/lib/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/lib/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="/lib/css/animate.min.css">
    <link rel="stylesheet" type="text/css" href="/lib/css/bootstrap-switch.min.css">
    <link rel="stylesheet" type="text/css" href="/lib/css/checkbox3.min.css">
    <link rel="stylesheet" type="text/css" href="/lib/css/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="/lib/css/dataTables.bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/lib/css/select2.min.css">
    <!-- CSS App -->
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link rel="stylesheet" type="text/css" href="/css/themes/flat-blue.css">
</head>

<body class="flat-blue login-page" style="background-color:#818482;">
<div class="container">
    <h1 class="login-title" align="center" style="margin-top: 150px;color: #ffffff;font-size:45px;">
        <b>服务平台后台管理</b></h1>
    <div class="login-box">
        <div>
            <div class="login-form row">
                <div class="col-sm-12 text-center login-header">
                    <i class="login-logo fa fa-connectdevelop fa-5x"></i>

                </div>
                <div class="col-sm-12">
                    <div class="login-body">
                        <div class="progress hidden" id="login-progress">
                            <div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                                Log In...
                            </div>
                        </div>
                        <form>
                            <div class="control">
                                <input type="text" class="form-control"
                                       id="user" placeholder="手机号" value="13531097736"
                                       onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9]/g,'')" maxlength="11"/>
                            </div>
                            <div class="control">
                                <input type="password" class="form-control"
                                       id="password" placeholder="请输入密码" value="123456"
                                       onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9]/g,'')" maxlength="14"/>
                            </div>
                        </form>
                        <div class="login-button text-center">
                                <button type="submit" class="btn btn-primary" onclick="fun()">登&nbsp;录</button>
                            </div>

                    </div>
                    <div class="login-footer">
                        <span class="text-right"><a href="#" class="color-white">忘记密码?</a></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Javascript Libs -->
<script type="text/javascript" src="/lib/js/jquery.min.js"></script>
<script type="text/javascript" src="/lib/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/lib/js/Chart.min.js"></script>
<script type="text/javascript" src="/lib/js/bootstrap-switch.min.js"></script>

<script type="text/javascript" src="/lib/js/jquery.matchHeight-min.js"></script>
<script type="text/javascript" src="/lib/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/lib/js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="/lib/js/select2.full.min.js"></script>
<script type="text/javascript" src="/lib/js/ace/ace.js"></script>
<script type="text/javascript" src="/lib/js/ace/mode-html.js"></script>
<script type="text/javascript" src="/lib/js/ace/theme-github.js"></script>
<!-- Javascript -->
<script type="text/javascript" src="/js/app.js"></script>
</body>

<script>
    function fun() {
        var phone = $("#user").val().replace(" ","");

        var password = $("#password").val().replace(" ","");
        console.log(phone+"password="+password);
        if (phone==""||password==""){
            alert("内容不能为空！");
            return;
        }
        $.ajax({
            type : "POST",
            url: "/manager/dologin/" + phone + "/" + password,
            contentType : "application/json;charset=utf-8",
            dataType : "text",
            error : function() {
//                $('#killPhoneMessage').hide().html('<label style="color: red">请求失败，请重试！</label>').show(300);
                alert("请求失败，请重试！");
            },
            success:function (data) {
                if (data!=null) {
                    console.log(data);
                    if (data=="login_success"){
                        window.location.href="/index";
//                        alert("登录成功！");
                    }
                    if (data=="phone_error"){
//                        $('#killPhoneMessage').hide().html('<label style="color: red">手机号错误!</label>').show(300);
                        alert("账号错误，请确认！");
                    }
                    if (data=="password_error"){
//                        $('#killPhoneMessage').hide().html('<label style="color: red">密码错误!</label>').show(300);
                        alert("密码错误，请确认！");
                    }
                }else {
                    alert("请求失败，请重试！");
//                    $('#killPhoneMessage').hide().html('<label style="color: red">请求失败，请重试！</label>').show(300);
                }
            }
        });
    }

</script>
</html>

