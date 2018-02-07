<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wunaifu
  Date: 2018/1/28
  Time: 22:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>意见反馈</title>

    <link href="/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
    <link href="/css/personal.css" rel="stylesheet" type="text/css">

    <%--<link href="/css/base.css" rel="stylesheet">--%>
    <link href="/css/index.css" rel="stylesheet">
    <link href="/css/media.css" rel="stylesheet">
    <script src="/AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
    <script src="/AmazeUI-2.4.2/assets/js/amazeui.js" type="text/javascript"></script>

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
        </div>
    </article>
</header>

<div class="nav-table">
    <div class="long-title"><span class="all-goods">全部分类</span></div>
    <div class="nav-cont">
        <ul>
            <li class="index"><a href="#">首页</a></li>
            <li class="qc"><a href="#">闪购</a></li>
            <li class="qc"><a href="#">限时抢</a></li>
            <li class="qc"><a href="#">团购</a></li>
            <li class="qc last"><a href="#">大包装</a></li>
        </ul>
        <div class="nav-extra">
            <i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
            <i class="am-icon-angle-right" style="padding-left: 10px;"></i>
        </div>
    </div>
</div>
<b class="line"></b>

<div class="center">
    <div class="col-main">
        <div class="main-wrap">
            <!--标题 -->
            <div class="am-cf am-padding">
                <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">历史反馈信息</strong> / <small>FeedbackHistory</small></div>
            </div>
            <hr/>
            <div class="am-container">
                <!--<hr />-->

                <div class="bloglistindex">
                    <c:forEach items="${feedbackList}" var="feedbackitem">
                        <div class="blogs">
                            <ul style="width: 100%">
                                <a href="#">
                                    <p>${feedbackitem.feedbackinfo}
                                    </p>
                                </a>
                                <c:choose>
                                    <c:when test="${feedbackitem.reply==null||feedbackitem.reply==''}">
                                        <div class="autor1" style="margin: 2px 20px 0 20px;">
                                            <span style="float: left;"><p>管理员未处理</p></span>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="autor1" style="margin: 2px 20px 0 20px;">
                                            <div><p style="float: left;">处理情况：${feedbackitem.reply}</p></div>
                                        </div>
                                        <div class="autor1" style="margin: 2px 20px 0 20px;">
                                            <div><p style="float: left;">处理时间：${feedbackitem.replytime}</p></div>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </ul>
                            <p class="autor"><span>反馈时间：${feedbackitem.feedbacktime}</span>
                            </p>
                        </div>
                    </c:forEach>
                </div>
                <div class="clear "></div>
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
