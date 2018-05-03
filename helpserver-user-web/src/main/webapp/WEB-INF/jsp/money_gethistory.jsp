<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wunaifu
  Date: 2018/1/28
  Time: 22:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>账户余额提现历史</title>

    <link href="/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
    <link href="/css/personal.css" rel="stylesheet" type="text/css">
    <link href="/css/point.css" rel="stylesheet" type="text/css">
    <script src="/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script src="/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
    <link rel="stylesheet" href="/css/alert.css"><!-- 弹窗  -->
    <script src="/js/alert.js"></script>
</head>

<body>
<!--头 -->
<header>
    <article>
        <div class="mt-logo">
            <!-- top start -->
            <jsp:include page="topuser.jsp"></jsp:include>
            <!-- top end -->
            <div class="clear"></div>
        </div>
    </article>
</header>

<div class="nav-table">
    <!--头 start-->
    <jsp:include page="midtop.jsp"></jsp:include>
    <!--头 end-->
</div>
<b class="line"></b>

<div class="center">
    <div class="col-main">
        <div class="main-wrap">
            <div class="points">
                <!--标题 -->
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><a href="/index" style="color: #0a628f">首页&nbsp;</a> >&nbsp;
                        <a style="color: #0a628f" href="/index_user">个人中心&nbsp;</a> >&nbsp;
                        <strong class="am-text-danger am-text-lg">余额提现历史</strong> / <small>GetMoney&nbsp;History</small>
                    </div>
                </div>
                <hr/>
                <div class="pointsTitle">
                    <div class="usable">可用余额<span>${money.amount}.00￥</span></div>
                    <div class="pointshop"><a href="/money/getmoney"><i><img src="/images/u5.png" /></i>去提现</a></div>
                    <div class="pointshop" style="margin-left: 80px;"><a href="/money/pay"><i><img src="/images/u5.png" /></i>去充值</a></div>

                    <div class="signIn"><a href="/money/payhistory"><i class="am-icon-calendar"></i>充值历史</a></div>

                </div>
                <div class="pointlist am-tabs" data-am-tabs>
                    <ul class="am-avg-sm-2 am-tabs-nav am-nav am-nav-tabs">
                        <li class="am-active"><a href="#tab1">已提现</a></li>
                        <li><a href="#tab2">审核中</a></li>
                    </ul>
                    <div class="am-tabs-bd">
                        <div class="am-tab-panel am-fade am-in am-active" id="tab1">
                            <table>
                                <b></b>
                                <thead>
                                <tr>
                                    <th class="th1">提现数额</th>
                                    <th class="th2">申请时间</th>
                                    <th class="th3">成功时间</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:choose>
                                    <c:when test="${moneygetedList.size()>0}">
                                        <c:forEach items="${moneygetedList}" var="itemed">
                                            <tr>
                                                <td class="pointType">-${itemed.amount}￥</td>
                                                <td class="pointNum">${itemed.time}</td>
                                                <td class="pointTime">${itemed.gettime}</td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                                <td class="pointType">无</td>
                                                <td class="pointNum">无</td>
                                                <td class="pointTime">未提现</td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                                </tbody>
                            </table>
                        </div>
                        <div class="am-tab-panel am-fade" id="tab2">
                            <table>
                                <b></b>
                                <thead>
                                <tr>
                                    <th class="th1">提现数额</th>
                                    <th class="th2">申请时间</th>
                                    <th class="th3">成功时间</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:choose>
                                    <c:when test="${moneygetingList.size()>0}">
                                        <c:forEach items="${moneygetingList}" var="iteming">
                                            <tr>
                                                <td class="pointType">-${iteming.amount}￥</td>
                                                <td class="pointNum">${iteming.time}</td>
                                                <td class="pointTime">审核中</td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td class="pointType">无</td>
                                            <td class="pointNum">无</td>
                                            <td class="pointTime">未提现</td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                                </tbody>
                            </table>
                        </div>

                    </div>

                </div>
            </div>
        </div>
        <!--底部 start-->
        <jsp:include page="footer.jsp"></jsp:include>
        <!--底部 end-->
    </div>

    <!--侧边菜单 start-->
    <jsp:include page="user_menu.jsp"></jsp:include>
    <!--侧边菜单 end-->
</div>

</body>

</html>
