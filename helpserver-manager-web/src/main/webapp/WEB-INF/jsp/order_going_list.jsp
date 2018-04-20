<%@ page import="com.helpserver.utils.TimeUtil" %><%--
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
                        <span class="title">用户进行中订单列表</span>
                        <div class="description">以下是用户的进行中的资源服务订单列表.</div>
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
                                            <th class="manager-border2">发布人</th>
                                            <th class="manager-border2">资源名字</th>
                                            <th class="manager-border2">资源类型</th>
                                            <th class="manager-border2">地点</th>
                                            <th class="manager-border2">坐标</th>
                                            <th class="manager-border2">发布时间</th>
                                            <th class="manager-border2">使用时间</th>
                                            <th class="manager-border2">订单状态</th>
                                            <th hidden></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${orderUserDtoList}" var="item">
                                                <tr class="manager-bg input-lg">

                                                    <td class="manager-border2">${item.senderName}</td>
                                                    <td class="manager-border2">${item.order.name}</td>
                                                    <td class="manager-border2">${item.orderTypeName}</td>
                                                    <td class="manager-border2">${item.order.area}</td>
                                                    <td class="manager-border2">${item.order.sendtime}</td>
                                                    <td class="manager-border2">
                                                    ${TimeUtil.dateToStrMdHm(item.order.starttime)}-${TimeUtil.dateToStrMdHm(item.order.endtime)}</td>
                                                    <c:choose>
                                                        <c:when test="${item.order.orderstate==1}">
                                                            <td class="manager-border2"><b>抢单进行中</b></td>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <td class="manager-border2"><b>服务进行中</b></td>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <td class="manager-border2"  style="font-size: 17px">
                                                        <a href="/user/goldlist/${item.order.senderid}/detail">
                                                            <span class="label label-default">用户信息</span></a>
                                                        <a href="/gold/iolist">
                                                            <span class="label label-warning">服务详情</span></a>
                                                        <a href="/gold/inlist">
                                                            <span class="label label-default">抢单详情</span></a>
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
