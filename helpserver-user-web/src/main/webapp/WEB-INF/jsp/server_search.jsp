<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.helpserver.dto.NowUser" %><%--
  Created by IntelliJ IDEA.
  User: wunaifu
  Date: 2018/1/11
  Time: 21:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>首页</title>

    <link href="/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css"/>
    <link href="/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css"/>

    <link href="/basic/css/demo.css" rel="stylesheet" type="text/css"/>
    <link href="/css/personal.css" rel="stylesheet" type="text/css">
    <link href="/css/vipstyle.css" rel="stylesheet" type="text/css">
    <link href="/css/hmstyle.css" rel="stylesheet" type="text/css"/>
    <link href="/css/base.css" rel="stylesheet">
    <link href="/css/index.css" rel="stylesheet">
    <link href="/css/media.css" rel="stylesheet">
    <script src="/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script src="/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
    <script src="/AmazeUI-2.4.2/assets/js/amazeui.js"></script>

    <%
        NowUser nowUser = new NowUser();
        if (request.getSession().getAttribute("nowUser") != null) {
            nowUser = (NowUser) request.getSession().getAttribute("nowUser");
        }

    %>
</head>

<body>
<div class="hmtop">
    <!-- top start -->

    <!--顶部导航条 -->
    <div class="am-container header">
        <ul class="message-l">
            <div class="topMessage">
                <div class="menu-hd">
                    <a href="/map" target="_top">定位：<%=nowUser.getLocation()%></a>
                    <a href="/index_user" target="_top" class="h"  style="margin-left: 50px;"><%=nowUser.getName()%>
                    </a>
                    <a href="/logout" target="_top">退出登录</a>
                </div>
            </div>
        </ul>
        <ul class="message-r">
            <div class="topMessage home">
                <div class="menu-hd"><a href="/index" target="_top" class="h">平台首页</a></div>
            </div>
            <div class="topMessage my-shangcheng">
                <div class="menu-hd MyShangcheng"><a href="/index_user" target="_top"><i
                        class="am-icon-user am-icon-fw"></i>个人中心</a></div>
            </div>
            <div class="topMessage mini-cart">
                <div class="menu-hd"><a id="mc-menu-hd" href="/index_myorder" target="_top"><i
                        class="am-icon-shopping-cart  am-icon-fw"></i><span>我的订单</span>
                    <!--<strong id="J_MiniCartNum" class="h">0</strong>--></a></div>
            </div>
            <div class="topMessage favorite">
                <div class="menu-hd"><a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>消息</span></a>
                </div>
            </div>
        </ul>
    </div>

    <!--悬浮搜索框-->

    <div class="nav white">
        <div class="logo" style="margin-top:18px;font-size: 12px;"><a href="/map"><%--<img src="/images/logo1.png"/>--%><%=nowUser.getLocation()%></a></div>
        <div class="logoBig">
            <li><img src="/images/logobig.png"/></li>
        </div>

        <div class="search-bar pr">
            <a name="index_none_header_sysc" href="#"></a>
            <form action="/searchserver">
                <input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">
                <input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
            </form>
        </div>
    </div>

    <!-- top end -->
    <div class="clear"></div>
</div>
<b class="line"></b>
<div class="shopNav">
    <div class="slideall" style="height: auto;">

        <div class="long-title"><span class="all-goods">全部分类</span></div>
        <div class="nav-cont">
            <ul>
                <li class="index"><a href="home2.html">首页</a></li>
                <li class="qc"><a href="#">服务</a></li>
                <li class="qc"><a href="#">趣事</a></li>
                <li class="qc last"><a href="#">大包装</a></li>
            </ul>
            <div class="nav-extra">
                <i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
                <i class="am-icon-angle-right" style="padding-left: 10px;"></i>
            </div>
        </div>
        <div class="clear"></div>

    </div>
</div>
<div class="shopMainbg">
    <div class="shopMain" id="shopmain">
        <!--热门活动 -->
        <div class="am-container">

            <!--<hr />-->
            <div class="bloglistindex" style="background-color: #f8f8f8;margin-bottom: 10px;">
                <h2>
                    <p style="float:left;">资源互助服务</p>
                </h2>
                <div class="clear "></div>
                <div style="font-size: 15px;margin: 10px 0 10px 5px;padding: 5px;"><a href="/index" style="color: #0a628f">首页&nbsp;</a> >&nbsp;
                    <%--<a style="color: #0a628f" href="/index_user">服务中心&nbsp;</a> >&nbsp;--%>
                    <strong >搜索关键字</strong> /
                    <small>家教</small>
                </div>
                <div class="blogs">
                    <h3><a href="/server/detail">犯错了怎么办？</a></h3>
                    <figure><a href="/server/userinfo"><img style="width: 72px;height: 72px;" src="/images/01.jpg"></a>
                    </figure>
                    <ul>
                        <a href="/server/detail">
                            <p>看到昔日好友发了一篇日志《咎由自取》他说他是一个悲观者，
                                感觉社会抛弃了他，脾气、性格在6年的时间里变化很大，很难适应这个社会。
                                人生其实就是不断犯错的过程，在这个过程中不断的犯错，不断的吸取教训，
                                不断的成长。也许日子里的惊涛骇浪，不过是人生中的水花摇晃，别用显微镜放大你的悲伤。
                            </p>
                        </a>
                        <div class="autor1">
                            <span>分类：零活</span>
                            <span style="margin: 0px 0px 0px 10px;">酬劳：￥100</span>
                            <span style="margin: 0px 0px 0px 10px;">服务点：蓬江区</span>
                            <span style="margin: 0px 0px 0px 10px;">服务时间：中午9点半前</span>
                        </div>
                        <a href="/index_myorder" target="_blank" class="readmore">马上抢单</a>
                    </ul>
                    <p class="autor"><span>主人：杨青青</span>
                        <span>已抢单（<a>3/5</a>）</span>
                        <span>收藏（<a>459</a>）</span><span>浏览（<a>30</a>）</span>
                    </p>
                    <div class="dateview">04-08 12:12:12</div>
                </div>
                <div class="blogs">
                    <h3><a href="/server/detail">犯错了怎么办？</a></h3>
                    <figure><a href="/server/userinfo"><img style="width: 72px;height: 72px;" src="/images/01.jpg"></a>
                    </figure>
                    <ul>
                        <a href="/server/detail">
                            <p>看到昔日好友发了一篇日志《咎由自取》他说他是一个悲观者，
                                感觉社会抛弃了他，脾气、性格在6年的时间里变化很大，很难适应这个社会。
                                人生其实就是不断犯错的过程，在这个过程中不断的犯错，不断的吸取教训，
                                不断的成长。也许日子里的惊涛骇浪，不过是人生中的水花摇晃，别用显微镜放大你的悲伤。
                            </p>
                        </a>
                        <div class="autor1">
                            <span>分类：零活</span>
                            <span style="margin: 0px 0px 0px 10px;">酬劳：￥100</span>
                            <span style="margin: 0px 0px 0px 10px;">服务点：蓬江区</span>
                            <span style="margin: 0px 0px 0px 10px;">服务时间：中午9点半前</span>
                        </div>
                        <a href="/index_myorder" target="_blank" class="readmore">马上抢单</a>
                    </ul>
                    <p class="autor"><span>主人：杨青青</span>
                        <span>已抢单（<a>3/5</a>）</span>
                        <span>收藏（<a>459</a>）</span><span>浏览（<a>30</a>）</span>
                    </p>
                    <div class="dateview">04-08 12:12:12</div>
                </div>
                <div class="blogs">
                    <h3><a href="/server/detail">犯错了怎么办？</a></h3>
                    <figure><a href="/server/userinfo"><img style="width: 72px;height: 72px;" src="/images/01.jpg"></a>
                    </figure>
                    <ul>
                        <a href="/server/detail">
                            <p>看到昔日好友发了一篇日志《咎由自取》他说他是一个悲观者，
                                感觉社会抛弃了他，脾气、性格在6年的时间里变化很大，很难适应这个社会。
                                人生其实就是不断犯错的过程，在这个过程中不断的犯错，不断的吸取教训，
                                不断的成长。也许日子里的惊涛骇浪，不过是人生中的水花摇晃，别用显微镜放大你的悲伤。
                            </p>
                        </a>
                        <div class="autor1">
                            <span>分类：零活</span>
                            <span style="margin: 0px 0px 0px 10px;">酬劳：￥100</span>
                            <span style="margin: 0px 0px 0px 10px;">服务点：蓬江区</span>
                            <span style="margin: 0px 0px 0px 10px;">服务时间：中午9点半前</span>
                        </div>
                        <a href="/index_myorder" target="_blank" class="readmore">马上抢单</a>
                    </ul>
                    <p class="autor"><span>主人：杨青青</span>
                        <span>已抢单（<a>3/5</a>）</span>
                        <span>收藏（<a>459</a>）</span><span>浏览（<a>30</a>）</span>
                    </p>
                    <div class="dateview">04-08 12:12:12</div>
                </div>

            </div>
            <div class="clear "></div>
            <!--分页 -->
            <ul class="am-pagination am-pagination-left">
                <li class="am-disabled"><a href="#">&laquo;</a></li>
                <li class="am-active"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">&raquo;</a></li>
            </ul>
        </div>
        <div class="clear "></div>
    </div>

    <!--底部 start-->
    <jsp:include page="footer.jsp"></jsp:include>
    <!--底部 end-->
</div>
</div>
</div>
</div>

<!--引导 -->
<div class="navCir">
    <li class="active"><a href="/index"><i class="am-icon-home "></i>首页</a></li>
    <li><a href="/index_type"><i class="am-icon-list"></i>分类</a></li>
    <li><a href="/index_myorder"><i class="am-icon-shopping-basket"></i>订单</a></li>
    <li><a href="/index_user"><i class="am-icon-user"></i>我的</a></li>
</div>
<!--菜单 -->

<script type="text/javascript " src="/basic/js/quick_links.js "></script>
</body>

</html>
