<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="stylesheet" type="text/css" href="/css/themes/flat-blue.css">
</head>

<body class="flat-blue">
<div class="app-container">
    <div class="row content-container">

        <!-- 头部 start -->
        <jsp:include page="head.jsp"/>
        <!-- 头部 end -->
        <%--<jsp:useBean id="user" class="com.helpserver.pojo.User" scope="page"></jsp:useBean>--%>
        <!-- Main Content start-->
        <div class="container-fluid">
            <div class="side-body">
                <div class="page-title">
                    <span class="title">我的支付账号信息</span>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="tables">
                                    <div class="bs-example widget-shadow"
                                         data-example-id="hoverable-table">
                                        <div>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="row">
                                            <div class="form-body">
                                                    <ul class="list-group text-left">
                                                        <form action="/manager/update/payaccount"
                                                              enctype="multipart/form-data" method="post">
                                                            <input name="id" class="hidden" value="${payaccount.id}">
                                                        <li class="list-group-item">修改时间：${payaccount.time}</li>
                                                        <li class="list-group-item">支付宝支付码：
                                                            <input id="file" type="file" class="inputPic" allowexts="gif,jpeg,jpg,png,bmp" accept="image/*"
                                                                   name="file" onchange="c1()" accept=".jpg,.png,.jpeg,.JPG,.PNG,.JPEG,">
                                                            <img style="width: 216px;height: 326px;" id="show"
                                                                 src="/resources/img/${payaccount.payphoto}">

                                                        </li>
                                                        <li class="list-group-item">
                                                            <span class="label label-success" style="font-size: 14px;width: 120px;">
                                                                <input type="submit" value="保存" style="background: none;border: none">
                                                            </span>
                                                        </li>
                                                        </form>
                                                    </ul>
                                            </div>
                                        </div>

                                        <div class="clearfix"></div>
                                    </div>
                                </div>
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
<script type="text/javascript" src="/js/index.js"></script>
</body>
<script>
    function c1() {
        var r = new FileReader();
        f = document.getElementById('file').files[0];
        r.readAsDataURL(f);
        r.onload = function (e) {
            document.getElementById('show').src = this.result;
        };
    }
</script>
</html>
