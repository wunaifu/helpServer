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
                        <span class="title">申请身份认证列表</span>
                        <div class="description">以下是申请身份认证的用户列表.</div>
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
                                            <th class="manager-border2">账号</th>
                                            <th class="manager-border2">昵称</th>
                                            <th class="manager-border2">地址</th>
                                            <th class="manager-border2">真实姓名</th>
                                            <th class="manager-border2">身份证号</th>
                                            <th class="manager-border2">申请时间</th>
                                            <th class="manager-border2">验证状态</th>
                                            <th hidden></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${identityList}" var="item">
                                                <tr class="manager-bg input-lg">

                                                    <td class="manager-border2">${item.user.phone}</td>
                                                    <td class="manager-border2">${item.user.nickname}</td>
                                                    <td class="manager-border2">${item.user.address}</td>
                                                    <td class="manager-border2">${item.identity.name}</td>
                                                    <td class="manager-border2">${item.identity.idcard}</td>
                                                    <td class="manager-border2">${item.identity.asktime}</td>
                                                    <c:choose>
                                                        <c:when test="${item.identity.checkstate==0}">
                                                            <td class="manager-border2"style="color: #ff721f"><b>待认证</b></td>
                                                        </c:when>
                                                        <c:when test="${item.identity.checkstate==1}">
                                                            <td class="manager-border2"style="color: green"><b>已认证</b></td>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <td class="manager-border2"style="color: red"><b>不通过</b></td>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <td class="manager-border2"  style="font-size: 17px">
                                                        <a href="/user/unidentity/${item.user.userid}/detail">
                                                            <span class="label label-default">详情</span></a>
                                                        <%--<a href="/user/uselist/${item.user.userid}/detail">--%>
                                                            <%--<span class="label label-success">通过</span></a>--%>
                                                        <%--<a href="/user/ban/${item.user.userid}">--%>
                                                            <%--<span class="label label-danger">不通过</span></a>--%>
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

</html>
