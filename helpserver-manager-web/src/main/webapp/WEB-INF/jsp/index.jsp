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
    <link rel="stylesheet" type="text/css" href="/css/themes/flat-blue.css">
</head>

<body class="flat-blue" onload="initMyData(${year})">
    <div class="app-container">
        <div class="row content-container">

            <!-- 头部 start -->
            <jsp:include page="head.jsp"/>
            <!-- 头部 end -->

            <!-- Main Content start-->
            <div class="container-fluid">
                <div class="side-body padding-top">
                    <div class="row" style="float: left">
                        <h2>年份：<select style="margin-left:50px;width: 300px;font-size: 25px;">
                            <option  href="/index?year=${year}">${year}</option>
                            <c:forEach items="${yearList}" var="item">
                                <c:choose>
                                    <c:when test="${item==year}">
                                    </c:when>
                                    <c:otherwise><a href="/index?year=${item}"><option>${item}</option></a></c:otherwise>
                                </c:choose>

                            </c:forEach>
                        </select></h2>

                    </div>
                    <div class="clearfix"></div>
                    <div class="row">
                        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                            <a href="#">
                                <div class="card red summary-inline">
                                    <div class="card-body">
                                        <i class="icon fa fa-header fa-4x"></i>
                                        <div class="content">
                                            <c:choose>
                                                <c:when test="${backdataList.size()<1}">
                                                    <div class="title">0人</div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="title">${backdataList.get(month-1).allmen}人</div>
                                                </c:otherwise>
                                            </c:choose>
                                            <div class="sub-title">年注册总人数</div>
                                        </div>
                                        <div class="clear-both"></div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                            <a href="#">
                                <div class="card yellow summary-inline">
                                    <div class="card-body">
                                        <i class="icon fa fa-inbox fa-4x"></i>
                                        <div class="content">
                                            <c:choose>
                                                <c:when test="${backdataList.size()<1}">
                                                    <div class="title">0单</div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="title">${backdataList.get(month-1).allorders}单</div>
                                                </c:otherwise>
                                            </c:choose>
                                            <div class="sub-title">订单成交总数</div>
                                        </div>
                                        <div class="clear-both"></div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                            <a href="#">
                                <div class="card green summary-inline">
                                    <div class="card-body">
                                        <i class="icon fa fa-money fa-4x"></i>
                                        <div class="content">
                                            <c:choose>
                                                <c:when test="${backdataList.size()<1}">
                                                    <div class="title">￥0</div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="title">￥${backdataList.get(month-1).allmoney}</div>
                                                </c:otherwise>
                                            </c:choose>
                                            <div class="sub-title">平台总收入</div>
                                        </div>
                                        <div class="clear-both"></div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="row  no-margin-bottom" style="width: 100%">
                        <div class="col-sm-6 col-xs-12">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="card primary">
                                        <div class="card-jumbotron no-padding">
                                            <canvas id="jumbotron-line-chart1" class="chart no-padding"></canvas>
                                        </div>
                                        <div class="card-body half-padding">
                                            <c:choose>
                                                <c:when test="${backdataList.size()<1}">
                                                    <h4 class="float-left no-margin font-weight-300">注册总人数</h4>
                                                    <h2 class="float-right no-margin font-weight-300">0人</h2>
                                                </c:when>
                                                <c:otherwise>
                                                    <h4 class="float-left no-margin font-weight-300">注册总人数</h4>
                                                    <h2 class="float-right no-margin font-weight-300">${backdataList.get(month-1).allmen}人</h2>
                                                </c:otherwise>
                                            </c:choose>

                                            <div class="clear-both"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row  no-margin-bottom" style="width: 100%">
                        <div class="col-sm-6 col-xs-12">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="card primary">
                                        <div class="card-jumbotron no-padding">
                                            <canvas id="jumbotron-line-chart2" class="chart no-padding"></canvas>
                                        </div>
                                        <div class="card-body half-padding">
                                            <c:choose>
                                                <c:when test="${backdataList.size()<1}">
                                                    <h4 class="float-left no-margin font-weight-300">订单成交总数</h4>
                                                    <h2 class="float-right no-margin font-weight-300">0单</h2>
                                                </c:when>
                                                <c:otherwise>
                                                    <h4 class="float-left no-margin font-weight-300">订单成交总数</h4>
                                                    <h2 class="float-right no-margin font-weight-300">${backdataList.get(month-1).allorders}单</h2>
                                                </c:otherwise>
                                            </c:choose>

                                            <div class="clear-both"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row  no-margin-bottom" style="width: 100%">
                        <div class="col-sm-6 col-xs-12">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="card primary">
                                        <div class="card-jumbotron no-padding">
                                            <canvas id="jumbotron-line-chart3" class="chart no-padding"></canvas>
                                        </div>
                                        <div class="card-body half-padding">
                                            <c:choose>
                                                <c:when test="${backdataList.size()<1}">
                                                    <h4 class="float-left no-margin font-weight-300">平台总收入</h4>
                                                    <h2 class="float-right no-margin font-weight-300">￥0</h2>
                                                </c:when>
                                                <c:otherwise>
                                                    <h4 class="float-left no-margin font-weight-300">平台总收入</h4>
                                                    <h2 class="float-right no-margin font-weight-300">￥${backdataList.get(month-1).allmoney}</h2>
                                                </c:otherwise>
                                            </c:choose>

                                            <div class="clear-both"></div>
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
                <span class="pull-right">2.1 <a href="#"><i class="fa fa-long-arrow-up"></i></a></span> © 2018 Copyright. More Info <a target="_blank" title="wnf">wnf</a> - Collect from <a title="wnf" target="_blank">wnf</a>
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
            <script type="text/javascript" src="/js/myindex.js"></script>
</body>

</html>
