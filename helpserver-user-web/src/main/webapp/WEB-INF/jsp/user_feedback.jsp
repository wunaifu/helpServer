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
                <div class="am-fl am-cf"><a href="/index" style="color: #0a628f">首页&nbsp;</a> >&nbsp;
                    <a style="color: #0a628f" href="/index_user">个人中心&nbsp;</a> >&nbsp;
                    <strong class="am-text-danger am-text-lg">意见反馈</strong> / <small>Suggest</small></div>
            </div>
            <hr/>
            <div class="suggestmain">
                <p style="margin:20px 0 20px 0;">
                    <a href="/user/feedbacklist"><strong style="margin:20px 0 20px 0;font-size: 16px;color: #22898f">
                    历史反馈信息>>
                    </strong></a>
                </p>
                <p>请留下您的宝贵意见：</p>
                <form action="/user/insertFeedback" method="post">
                <div class="suggestDetail">
                    <p>描述问题：</p>
                    <blockquote class="textArea">
                        <textarea name="opinionContent" id="say_some" cols="60" rows="5" autocomplete="off"
                                  required maxlength="180" placeholder="在此描述您的意见具体内容"></textarea>
                        <div class="fontTip"><%--<i class="cur">0</i> / <i>200</i>--%></div>
                    </blockquote>
                </div>
                <input class="am-btn am-btn-danger anniu" type="submit" value="提交">
                </form>
                <p class="suggestTel"><i class="am-icon-phone"></i>客服电话：400-007-1234</p>
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
