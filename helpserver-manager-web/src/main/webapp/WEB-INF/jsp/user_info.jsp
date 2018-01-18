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
    <link rel="stylesheet" type="text/css" href="../../lib/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../../lib/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="../../lib/css/animate.min.css">
    <link rel="stylesheet" type="text/css" href="../../lib/css/bootstrap-switch.min.css">
    <link rel="stylesheet" type="text/css" href="../../lib/css/checkbox3.min.css">
    <link rel="stylesheet" type="text/css" href="../../lib/css/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="../../lib/css/dataTables.bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../../lib/css/select2.min.css">
    <!-- CSS App -->
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <link rel="stylesheet" type="text/css" href="../../css/themes/flat-blue.css">
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
                        <span class="title">账号${userinfo.phone}的信息</span>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="tables">
                                        <div class="bs-example widget-shadow"
                                             data-example-id="hoverable-table">
                                            <div>
                                                <h3>
                                                    <a href="#"><span class="label label-success">修改信息</span></a>
                                                </h3>
                                            </div>
                                            <div>
                                                <div class="clearfix"></div>
                                            </div>
                                            <div class="row">

                                                <div class="item-title">
                                                    <h4 class="text-center"></h4>
                                                </div>
                                                <div class="form-body">
                                                    <div id="page-wrapper">
                                                        <div style="padding: 30px;">
                                                            <div class="tables">
                                                                <div class="bs-example widget-shadow"
                                                                     data-example-id="hoverable-table">
                                                                    <div class="row">
                                                                        <div class="form-body">
                                                                            <form action="addClient" method="post" enctype="multipart/form-data"
                                                                                  class="bs-example bs-example-form" role="form" name="touxiangform">
                                                                                <input type="text" class="hidden"
                                                                                       id="userUserGradeId" name="userUserGradeId" value="">
                                                                                <div class=" form-group-lg">
                                                                                    <label><i class="fa fa-user fa-fw"></i>账号：</label>
                                                                                    <input type="text" class="form-control" maxlength="16"
                                                                                           onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9]/g,'')"
                                                                                           id="inputUserAccount" name="inputUserAccount" placeholder="登录账号" required>
                                                                                </div>
                                                                                <div class=" form-group-lg">
                                                                                    <label><i class="fa fa-user fa-fw"></i>姓名：</label>
                                                                                    <input type="text" class="form-control" maxlength="16"
                                                                                           id="inputName" name="inputName" placeholder="姓名" required>
                                                                                </div>
                                                                                <div class=" form-group-lg">
                                                                                    <label><i class="fa fa-user fa-fw"></i>密码：</label>
                                                                                    <input type="text" class="form-control" readonly="true" maxlength="16" value="123456"
                                                                                           id="inputPassword" name="inputPassword" placeholder="密码" required>
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <button type="submit" class="btn bottom-up">提交</button>
                                                                                </div>
                                                                            </form>
                                                                        </div>
                                                                    </div>

                                                                    <div class="clearfix"></div>
                                                                </div>
                                                            </div>
                                                            <div class="row calender widget-shadow" style="display: none">
                                                                <h4 class="title">Calender</h4>
                                                                <div class="cal1"></div>
                                                            </div>
                                                            <div class="clearfix"></div>
                                                        </div>
                                                    </div>
                                                    <!--
                                                    <ul class="list-group">
                                                        <li class="list-group-item">头像：${userinfo.headicon}</li>
                                                        <li class="list-group-item">账号：${userinfo.phone}</li>
                                                        <li class="list-group-item">姓名：${userinfo.name}</li>
                                                        <li class="list-group-item">手机：${userinfo.phone}</li>
                                                        <li class="list-group-item">昵称：${userinfo.nickname}</li>
                                                        <li class="list-group-item">地址：${userinfo.address}</li>
                                                        <li class="list-group-item">年龄：${userinfo.age}</li>
                                                        <c:choose>
                                                            <c:when test="${userinfo.sex==0}">
                                                                <li class="list-group-item">性别：女</li>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <li class="list-group-item">性别：男</li>
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <li class="list-group-item">简介：${userinfo.userinfo}</li>
                                                        <li class="list-group-item">注册时间：${userinfo.registertime}</li>
                                                        <c:choose>
                                                            <c:when test="${userinfo.permission==0}">
                                                                <li class="list-group-item">权限：普通用户</li>
                                                            </c:when>
                                                            <c:when test="${userinfo.permission==1}">
                                                                <li class="list-group-item">权限：可接单用户</li>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <li class="list-group-item">权限：被禁用用户</li>
                                                                <li class="list-group-item">禁用时间：${userinfo.bantime}</li>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </ul>
                                                    -->
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
            <script type="text/javascript" src="../../lib/js/jquery.min.js"></script>
            <script type="text/javascript" src="../../lib/js/bootstrap.min.js"></script>
            <script type="text/javascript" src="../../lib/js/Chart.min.js"></script>
            <script type="text/javascript" src="../../lib/js/bootstrap-switch.min.js"></script>
            <script type="text/javascript" src="../../lib/js/jquery.matchHeight-min.js"></script>
            <script type="text/javascript" src="../../lib/js/jquery.dataTables.min.js"></script>
            <script type="text/javascript" src="../../lib/js/dataTables.bootstrap.min.js"></script>
            <script type="text/javascript" src="../../lib/js/select2.full.min.js"></script>
            <script type="text/javascript" src="../../lib/js/ace/ace.js"></script>
            <script type="text/javascript" src="../../lib/js/ace/mode-html.js"></script>
            <script type="text/javascript" src="../../lib/js/ace/theme-github.js"></script>
            <!-- Javascript -->
            <script type="text/javascript" src="../../js/app.js"></script>
            <script type="text/javascript" src="../../js/index.js"></script>
</body>

</html>
