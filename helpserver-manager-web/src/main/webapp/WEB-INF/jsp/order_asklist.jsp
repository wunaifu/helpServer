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
                        <span class="title">资源服务抢单列表</span>
                        <div class="description">以下是${order.foodname}资源的抢单列表.</div>
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
                                            <th class="manager-border2">抢单者</th>
                                            <th class="manager-border2">资源拥有者</th>
                                            <th class="manager-border2">资源名字</th>
                                            <th class="manager-border2">资源可使用时间</th>
                                            <th class="manager-border2">抢单时间</th>
                                            <th class="manager-border2">抢单状态</th>
                                            <th hidden></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${acceptOrderUserDtoList}" var="item">
                                                <tr class="manager-bg input-lg">

                                                    <td class="manager-border2">${item.acceptUserName}</td>
                                                    <td class="manager-border2">${item.sendUserName}</td>
                                                    <td class="manager-border2">${item.orderGoodsName}</td>
                                                    <td class="manager-border2">${order.starttime}-${order.endtime}</td>
                                                    <td class="manager-border2">${item.acceptorder.accepttime}</td>
                                                    <c:choose>
                                                        <c:when test="${item.acceptorder.acceptstate==1}">
                                                            <td class="manager-border2"><b>抢单成功</b></td>
                                                        </c:when>
                                                        <c:when test="${item.acceptorder.acceptstate==2}">
                                                            <td class="manager-border2"><b>已完成</b></td>
                                                        </c:when>
                                                        <c:when test="${item.acceptorder.acceptstate==3}">
                                                            <td class="manager-border2"><b>抢单已取消</b></td>
                                                        </c:when>
                                                        <c:when test="${item.acceptorder.acceptstate==4}">
                                                            <td class="manager-border2"><b>抢单失败</b></td>
                                                        </c:when>
                                                        <c:when test="${item.acceptorder.acceptstate==5}">
                                                            <td class="manager-border2"><b>发布方已取消</b></td>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <td class="manager-border2"><b>抢单进行中</b></td>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <td class="manager-border2"  style="font-size: 17px">
                                                        <a href="/user/goldlist/${item.acceptorder.accepterid}/detail">
                                                            <span class="label label-default">抢单者信息</span></a>
                                                        <a href="/order/${order.id}/detail">
                                                            <span class="label label-warning">服务详情</span></a>
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
