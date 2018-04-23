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
    <link href="/css/seastyle.css" rel="stylesheet" type="text/css" />
    <script src="/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script src="/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
    <script src="/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
    <script type="text/javascript" src="/basic/js/jquery-1.7.min.js"></script>
    <script type="text/javascript" src="/js/script.js"></script>
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
<div class="am-g am-g-fixed">
    <div class="am-u-sm-12 am-u-md-12">
        <div class="theme-popover">
            <div class="searchAbout">
                <span class="font-pale">相关搜索：</span>
                <a title="坚果" href="#">坚果</a>
                <a title="瓜子" href="#">瓜子</a>
                <a title="鸡腿" href="#">豆干</a>

            </div>
            <ul class="select">
                <p class="title font-normal">
                    <span class="fl">松子</span>
                    <span class="total fl">搜索到<strong class="num">997</strong>件相关商品</span>
                </p>
                <div class="clear"></div>
                <li class="select-result">
                    <dl>
                        <dt>已选</dt>
                        <dd class="select-no"></dd>
                        <p class="eliminateCriteria">清除</p>
                    </dl>
                </li>
                <div class="clear"></div>
                <%--<li class="select-list">--%>
                    <%--<dl id="select1">--%>
                        <%--<dt class="am-badge am-round">品牌</dt>--%>

                        <%--<div class="dd-conent">--%>
                            <%--<dd class="select-all selected"><a href="#">全部</a></dd>--%>
                            <%--<dd><a href="#">百草味</a></dd>--%>
                            <%--<dd><a href="#">良品铺子</a></dd>--%>
                            <%--<dd><a href="#">新农哥</a></dd>--%>
                            <%--<dd><a href="#">楼兰蜜语</a></dd>--%>
                            <%--<dd><a href="#">口水娃</a></dd>--%>
                            <%--<dd><a href="#">考拉兄弟</a></dd>--%>
                        <%--</div>--%>

                    <%--</dl>--%>
                <%--</li>--%>
                <%--<li class="select-list">--%>
                    <%--<dl id="select2">--%>
                        <%--<dt class="am-badge am-round">种类</dt>--%>
                        <%--<div class="dd-conent">--%>
                            <%--<dd class="select-all selected"><a href="#">全部</a></dd>--%>
                            <%--<dd><a href="#">东北松子</a></dd>--%>
                            <%--<dd><a href="#">巴西松子</a></dd>--%>
                            <%--<dd><a href="#">夏威夷果</a></dd>--%>
                            <%--<dd><a href="#">松子</a></dd>--%>
                        <%--</div>--%>
                    <%--</dl>--%>
                <%--</li>--%>
                <%--<li class="select-list">--%>
                    <%--<dl id="select3">--%>
                        <%--<dt class="am-badge am-round">选购热点</dt>--%>
                        <%--<div class="dd-conent">--%>
                            <%--<dd class="select-all selected"><a href="#">全部</a></dd>--%>
                            <%--<dd><a href="#">手剥松子</a></dd>--%>
                            <%--<dd><a href="#">薄壳松子</a></dd>--%>
                            <%--<dd><a href="#">进口零食</a></dd>--%>
                            <%--<dd><a href="#">有机零食</a></dd>--%>
                        <%--</div>--%>
                    <%--</dl>--%>
                <%--</li>--%>
                <%--<li class="select-list">--%>
                    <%--<dl id="select4">--%>
                        <%--<dt class="am-badge am-round">选购热点</dt>--%>
                        <%--<div class="dd-conent">--%>
                            <%--<dd class="select-all selected"><a href="#">全部</a></dd>--%>
                            <%--<dd><a href="#">手剥松子</a></dd>--%>
                            <%--<dd><a href="#">薄壳松子</a></dd>--%>
                            <%--<dd><a href="#">进口零食</a></dd>--%>
                            <%--<dd><a href="#">有机零食</a></dd>--%>
                        <%--</div>--%>
                    <%--</dl>--%>
                <%--</li>--%>
                <%--<li class="select-list">--%>
                    <%--<dl id="select5">--%>
                        <%--<dt class="am-badge am-round">选购热点</dt>--%>
                        <%--<div class="dd-conent">--%>
                            <%--<dd class="select-all selected"><a href="#">全部</a></dd>--%>
                            <%--<dd><a href="#">手剥松子</a></dd>--%>
                            <%--<dd><a href="#">薄壳松子</a></dd>--%>
                            <%--<dd><a href="#">进口零食</a></dd>--%>
                            <%--<dd><a href="#">有机零食</a></dd>--%>
                        <%--</div>--%>
                    <%--</dl>--%>
                <%--</li>--%>

            </ul>
            <div class="clear"></div>
        </div>
        <%--<div class="search-content">--%>
            <%--<div class="sort">--%>
                <%--<li class="first"><a title="综合">综合排序</a></li>--%>
                <%--<li><a title="销量">销量排序</a></li>--%>
                <%--<li><a title="价格">价格优先</a></li>--%>
                <%--<li class="big"><a title="评价" href="#">评价为主</a></li>--%>
            <%--</div>--%>
            <%--<div class="clear"></div>--%>

        <%--</div>--%>
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
<script>
    window.jQuery || document.write('<script src="basic/js/jquery-1.9.min.js"><\/script>');
</script>
<script type="text/javascript " src="/basic/js/quick_links.js "></script>
</body>

</html>
