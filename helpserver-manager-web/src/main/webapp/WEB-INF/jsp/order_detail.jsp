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
                    <span class="title">资源订单的详细信息</span>
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

                                            <div class="item-title text-left">


                                            </div>
                                            <div class="form-body">
                                                <ul class="list-group text-left">

                                                    <li class="list-group-item">用户：${orderUserDto.senderName}</li>
                                                    <li class="list-group-item">资源名字：${orderUserDto.order.foodname}</li>
                                                    <li class="list-group-item">资源类型：${orderUserDto.bigTypeName}/${orderUserDto.orderTypeName}</li>
                                                    <li class="list-group-item">服务费用：${orderUserDto.order.moneyamount}</li>
                                                    <li class="list-group-item">备注详情：${orderUserDto.order.orderdetail}</li>
                                                    <li class="list-group-item">资源地点：${orderUserDto.order.foodname}</li>
                                                    <li class="list-group-item">详细坐标：${orderUserDto.order.pointinfo}</li>
                                                    <li class="list-group-item">发布时间：${orderUserDto.order.sendtime}</li>
                                                    <li class="list-group-item">使用时间：${orderUserDto.order.starttime}-${orderUserDto.order.endtime}</li>
                                                    <li class="list-group-item">联系电话：${orderUserDto.order.callname}</li>
                                                    <li class="list-group-item">联系人：${orderUserDto.order.callphone}</li>
                                                    <c:choose>
                                                        <c:when test="${orderUserDto.order.orderstate==1}">
                                                            <li class="list-group-item">订单状态：抢单进行中</li>
                                                        </c:when>
                                                        <c:when test="${orderUserDto.order.orderstate==2}">
                                                            <li class="list-group-item">订单状态：服务进行中</li>
                                                            <li class="list-group-item">确认抢单者时间：${orderUserDto.order.updatetime}</li>
                                                        </c:when>
                                                        <c:when test="${orderUserDto.order.orderstate==3}">
                                                            <li class="list-group-item">订单状态：已结束</li>
                                                            <li class="list-group-item">结束时间：${orderUserDto.order.updatetime}</li>
                                                        </c:when>
                                                        <c:when test="${orderUserDto.order.orderstate==4}">
                                                            <li class="list-group-item">订单状态：已取消</li>
                                                            <li class="list-group-item">撤单原因：${orderUserDto.order.repealreason}</li>
                                                            <li class="list-group-item">撤单时间：${orderUserDto.order.repealtime}</li>
                                                        </c:when>
                                                        <c:when test="${orderUserDto.order.orderstate==-1}">
                                                            <li class="list-group-item">订单状态：已禁用</li>
                                                            <li class="list-group-item">禁用时间：${orderUserDto.order.updatetime}</li>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <li class="list-group-item">订单状态：草稿</li>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <li class="list-group-item" style="text-align: left">
                                                        <span>资源图片:<img style="min-width: 210px;min-height: 320px;"
                                                                        src="http://localhost:8083/resources/img/${orderUserDto.order.picture}">
                                                        </span>
                                                    </li>
                                                    <%--<c:if test="${moneyAddDto.moneyadd.gettime==null||moneyAddDto.moneyadd.gettime==''}">--%>
                                                        <%--<li class="list-group-item">--%>
                                                            <%--<a href="/money/agree/${moneyAddDto.moneyadd.id}">--%>
                                                            <%--<span class="label label-success"--%>
                                                                  <%--style="font-size: 14px;width: 120px;">通过充值</span></a>--%>
                                                                <%--&lt;%&ndash;<a href="/gold/check/disagree/${goldAddDto.goldadd.id}">&ndash;%&gt;--%>
                                                                <%--&lt;%&ndash;<span class="label label-danger"&ndash;%&gt;--%>
                                                                <%--&lt;%&ndash;style="font-size: 14px;width: 120px;">不通过充值</span></a>&ndash;%&gt;--%>
                                                        <%--</li>--%>
                                                    <%--</c:if>--%>

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
<%--<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>--%>
<%--<script src="/js/jquery.ajaxchimp.min.js"></script>--%>
</body>

</html>
