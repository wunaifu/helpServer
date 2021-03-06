<%--
  Created by IntelliJ IDEA.
  User: wunaifu
  Date: 2018/1/11
  Time: 21:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>后台管理首页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Fonts
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:300,400' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900' rel='stylesheet' type='text/css'> -->
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
    <link rel="stylesheet" type="text/css" href="/css/mycss.css">
    <link rel="stylesheet" type="text/css" href="/css/themes/flat-blue.css">
</head>

<body class="flat-blue">
    <div class="app-container">
        <div class="row content-container">

            <!-- 头部 start -->
            <jsp:include page="head.jsp"/>
            <!-- 头部 end -->

            <!-- Main Content start-->
            <div class="container-fluid">
                <div class="side-body">
                    <div class="page-title">
                        <span class="title">被禁用用户列表</span>
                        <div class="description">以下是在服务平台不具有访问权限的用户.</div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="card">
                                <div class="card-header">

                                    <div class="card-title">
                                    <div class="title"></div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <table class="datatable table table-striped" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th class="manager-border2">头像</th>
                                                <th class="manager-border2">姓名</th>
                                                <th class="manager-border2 manager-hidden1">手机</th>
                                                <th class="manager-border2 manager-hidden1">昵称</th>
                                                <th class="manager-border2 manager-hidden3">地址</th>
                                                <th class="manager-border2 manager-hidden2">注册时间</th>
                                                <th class="manager-border2 manager-hidden1">禁用时间</th>
                                                <th class="manager-border2">使用权限</th>
                                                <th hidden></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${userList}" var="item">
                                                <tr class="manager-bg input-lg">
                                                    <c:choose>
                                                        <c:when test="${item.headicon==null||item.headicon==''}">
                                                            <td class="manager-border2">
                                                                <img src="/img/profile/profile-1.jpg" width="40px" height="30px"title="头像" alt="无图"></td>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <td class="manager-border2" style="width: 60px;height: 30px">
                                                                <img width="40px" height="30px" src="/img/profile/profile-1.jpg"title="头像"></td>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <td class="manager-border2">${item.name}</td>
                                                    <td class="manager-border2 manager-hidden1">${item.phone}</td>
                                                    <td class="manager-border2 manager-hidden1">${item.nickname}</td>
                                                    <td class="manager-border2 manager-hidden3">${item.address}</td>
                                                    <td class="manager-border2 manager-hidden2">${item.registertime}</td>
                                                    <td class="manager-border2 manager-hidden1">${item.bantime}</td>
                                                    <td class="manager-border2" style="color: red">被禁用</td>
                                                    <td class="manager-border2" style="font-size: 17px">
                                                        <a href="/user/banlist/${item.userid}/detail"><span class="label label-success">详情</span></a>
                                                        <a href="/user/unban/${item.userid}"><span class="label label-success">取消禁用</span></a>
                                                    </td>

                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
			<!-- Main Content end-->
        </div>
        <footer class="app-footer">
            <div class="wrapper">
                <span class="pull-right">2.1 <a href="#"><i class="fa fa-long-arrow-up"></i></a></span> © 2015 Copyright.
            </div>
        </footer>
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
                        window.location.href="/manager/index";
                        alert("登录成功！");
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
