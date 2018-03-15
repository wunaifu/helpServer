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

        <div class="bannerTwo">
            <!--轮播 -->
            <div class="am-slider am-slider-default scoll" data-am-flexslider id="demo-slider-0">
                <ul class="am-slides">
                    <li class="banner1">
                        <a href="introduction.html"><img src="/images/ad5.jpg"/></a>
                    </li>
                    <li class="banner2">
                        <a><img src="/images/ad6.jpg"/></a>
                    </li>
                    <li class="banner3">
                        <a><img src="/images/ad7.jpg"/></a>
                    </li>
                    <li class="banner4">
                        <a><img src="/images/ad8.jpg"/></a>
                    </li>
                </ul>
            </div>
            <div class="clear"></div>
        </div>

        <!--侧边导航 -->
        <div id="nav" class="navfull" style="position: static;min-height: 330px;max-height: 330px;">
            <div class="area clearfix">
                <div class="category-content" id="guide_2">

                    <div class="category" style="box-shadow:none ;margin-top: 2px;">
                        <ul class="category-list navTwo" id="js_climit_li">
                            <c:choose>
                                <c:when test="${orderTypeList.size()>0}">
                                    <c:forEach items="${orderTypeList}" var="typeitem" varStatus="status">
                                        <li>
                                            <div class="category-info">
                                                <h3 class="category-name b-category-name"><i><img src="/images/cake.png"></i><a
                                                        class="ml-22" title="点心">${typeitem.typename}</a></h3>
                                                <em>&gt;</em></div>
                                            <div class="menu-item menu-in top">
                                                <div class="area-in">
                                                    <div class="area-bg">
                                                        <div class="menu-srot">
                                                            <div class="sort-side">
                                                                <dl class="dl-sort">
                                                                    <dt><span title="蛋糕">蛋糕</span></dt>
                                                                    <dd><a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a></dd>
                                                                </dl>
                                                                <dl class="dl-sort">
                                                                    <dt><span title="蛋糕">点心</span></dt>
                                                                    <dd><a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a></dd>
                                                                </dl>
                                                            </div>
                                                            <div class="brand-side">
                                                                <dl class="dl-sort">
                                                                    <dt><span>实力商家</span></dt>
                                                                    <dd><a rel="nofollow" title="呵官方旗舰店" target="_blank" href="#"
                                                                           rel="nofollow"><span class="red">呵官方旗舰店</span></a></dd>
                                                                </dl>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <b class="arrow"></b>
                                        </li>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <li>
                                        <div class="category-info">
                                            <h3 class="category-name b-category-name"><i><img src="/images/cake.png"></i><a
                                                    class="ml-22" title="点心">其他</a></h3>
                                            <em>&gt;</em></div>
                                        <div class="menu-item menu-in top">
                                            <div class="area-in">
                                                <div class="area-bg">
                                                    <div class="menu-srot">
                                                        <div class="sort-side">
                                                            <dl class="dl-sort">
                                                                <dt><span title="蛋糕">蛋糕</span></dt>
                                                                <dd><a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a></dd>
                                                            </dl>
                                                            <dl class="dl-sort">
                                                                <dt><span title="蛋糕">点心</span></dt>
                                                                <dd><a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a></dd>
                                                            </dl>
                                                        </div>
                                                        <div class="brand-side">
                                                            <dl class="dl-sort">
                                                                <dt><span>实力商家</span></dt>
                                                                <dd><a rel="nofollow" title="呵官方旗舰店" target="_blank" href="#"
                                                                       rel="nofollow"><span class="red">呵官方旗舰店</span></a></dd>
                                                            </dl>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <b class="arrow"></b>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>
                </div>

            </div>
        </div>
        <!--导航 -->
        <script type="text/javascript">
            (function () {
                $('.am-slider').flexslider();
            });
            $(document).ready(function () {
                $("li").hover(function () {
                    $(".category-content .category-list li.first .menu-in").css("display", "none");
                    $(".category-content .category-list li.first").removeClass("hover");
                    $(this).addClass("hover");
                    $(this).children("div.menu-in").css("display", "block")
                }, function () {
                    $(this).removeClass("hover")
                    $(this).children("div.menu-in").css("display", "none")
                });
            })
        </script>
        <div class="clear"></div>
        <!--走马灯 -->

        <div class="marqueenTwo">
            <span class="marqueen-title"><i class="am-icon-volume-up am-icon-fw"></i>平台头条<em
                    class="am-icon-angle-double-right"></em></span>
            <div class="demo">

                <ul>
                    <%--<li class="title-first"><a target="_blank" href="#"><span>[特惠]</span>洋河年末大促，低至两件五折</a></li>--%>
                    <%--<li><a target="_blank" href="#"><span>[特惠]</span>女生节商城爆品1分秒</a></li>--%>
                    <%--<li><a target="_blank" href="#"><span>[公告]</span>华北、华中部分地区配送延迟</a></li>--%>
                    <%--<li><a target="_blank" href="#"><span>[特惠]</span>家电狂欢千亿礼券 买1送1！</a></li>--%>
                    <%--<li><a target="_blank" href="#"><span>[特惠]</span>洋河年末大促，低至两件五折</a></li>--%>
                    <%--<li><a target="_blank" href="#"><span>[公告]</span>华北、华中部分地区配送延迟</a></li>--%>
                    <c:choose>
                        <c:when test="${newsList.size()>0}">
                            <c:forEach items="${newsList}" var="newsitem" varStatus="status">
                                <c:choose>
                                    <c:when test="${status.index==0}">
                                        <li class="title-first"><a target="_blank" href="#"><span>[公告]</span>${newsitem.title}</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li><a target="_blank" href="#"><span>[公告]</span>${newsitem.title}</a></li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <li class="title-first"><a target="_blank" href="#"><span>[公告]</span>目前没有每日新鲜事</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>

            </div>
        </div>
        <div class="clear"></div>

    </div>

    <script type="text/javascript">
        if ($(window).width() < 640) {
            function autoScroll(obj) {
                $(obj).find("ul").animate({
                    marginTop: "-39px"
                }, 500, function () {
                    $(this).css({
                        marginTop: "0px"
                    }).find("li:first").appendTo(this);
                })
            }

            $(function () {
                setInterval('autoScroll(".demo")', 3000);
            })
        }
    </script>
</div>
<div class="shopMainbg">
    <div class="shopMain" id="shopmain">

        <!--热门活动 -->

        <div class="am-container">
            <!--<hr />-->

            <div class="bloglistindex" style="background-color: #f8f8f8;margin-bottom: 10px;">
                <h2>
                    <!--<p style="float:left;">互助服务</p>-->
                    <p style="float:right;"><a href="/server/add"><span>发起服务</span></a></p>
                </h2>
                <div class="clear "></div>
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
<div class=tip>
    <div id="sidebar">
        <div id="wrap">
            <div id="prof" class="item ">
                <a href="# ">
                    <span class="setting "></span>
                </a>
                <div class="ibar_login_box status_login ">
                    <div class="avatar_box ">
                        <p class="avatar_imgbox "><img src="/images/no-img_mid_.jpg "/></p>
                        <ul class="user_info ">
                            <li>用户名：<%=nowUser.getName()%></li>
                            <li>级&nbsp;别：普通会员</li>
                        </ul>
                    </div>
                    <div class="login_btnbox ">
                        <a href="# " class="login_order ">我的订单</a>
                        <a href="# " class="login_favorite ">我的收藏</a>
                    </div>
                    <i class="icon_arrow_white "></i>
                </div>

            </div>
            <div id="shopCart " class="item ">
                <a href="# ">
                    <span class="message "></span>
                </a>
                <p>
                    购物车
                </p>
                <p class="cart_num ">0</p>
            </div>
            <div id="asset " class="item ">
                <a href="# ">
                    <span class="view "></span>
                </a>
                <div class="mp_tooltip ">
                    我的资产
                    <i class="icon_arrow_right_black "></i>
                </div>
            </div>

            <div id="foot " class="item ">
                <a href="# ">
                    <span class="zuji "></span>
                </a>
                <div class="mp_tooltip ">
                    我的足迹
                    <i class="icon_arrow_right_black "></i>
                </div>
            </div>

            <div id="brand " class="item ">
                <a href="#">
                    <span class="wdsc "><img src="/images/wdsc.png "/></span>
                </a>
                <div class="mp_tooltip ">
                    我的收藏
                    <i class="icon_arrow_right_black "></i>
                </div>
            </div>

            <div id="broadcast " class="item ">
                <a href="# ">
                    <span class="chongzhi "><img src="/images/chongzhi.png "/></span>
                </a>
                <div class="mp_tooltip ">
                    我要充值
                    <i class="icon_arrow_right_black "></i>
                </div>
            </div>

            <div class="quick_toggle ">
                <li class="qtitem ">
                    <a href="# "><span class="kfzx "></span></a>
                    <div class="mp_tooltip ">客服中心<i class="icon_arrow_right_black "></i></div>
                </li>
                <!--二维码 -->
                <li class="qtitem ">
                    <a href="#none "><span class="mpbtn_qrcode "></span></a>
                    <div class="mp_qrcode " style="display:none; "><img src="/images/weixin_code_145.png "/><i
                            class="icon_arrow_white "></i></div>
                </li>
                <li class="qtitem ">
                    <a href="#top " class="return_top "><span class="top "></span></a>
                </li>
            </div>

            <!--回到顶部 -->
            <div id="quick_links_pop " class="quick_links_pop hide "></div>

        </div>

    </div>
    <div id="prof-content " class="nav-content ">
        <div class="nav-con-close ">
            <i class="am-icon-angle-right am-icon-fw "></i>
        </div>
        <div>
            我
        </div>
    </div>
    <div id="shopCart-content " class="nav-content ">
        <div class="nav-con-close ">
            <i class="am-icon-angle-right am-icon-fw "></i>
        </div>
        <div>
            购物车
        </div>
    </div>
    <div id="asset-content " class="nav-content ">
        <div class="nav-con-close ">
            <i class="am-icon-angle-right am-icon-fw "></i>
        </div>
        <div>
            资产
        </div>

        <div class="ia-head-list ">
            <a href="# " target="_blank " class="pl ">
                <div class="num ">0</div>
                <div class="text ">优惠券</div>
            </a>
            <a href="# " target="_blank " class="pl ">
                <div class="num ">0</div>
                <div class="text ">红包</div>
            </a>
            <a href="# " target="_blank " class="pl money ">
                <div class="num ">￥0</div>
                <div class="text ">余额</div>
            </a>
        </div>

    </div>
    <div id="foot-content " class="nav-content ">
        <div class="nav-con-close ">
            <i class="am-icon-angle-right am-icon-fw "></i>
        </div>
        <div>
            足迹
        </div>
    </div>
    <div id="brand-content " class="nav-content ">
        <div class="nav-con-close ">
            <i class="am-icon-angle-right am-icon-fw "></i>
        </div>
        <div>
            收藏
        </div>
    </div>
    <div id="broadcast-content " class="nav-content ">
        <div class="nav-con-close ">
            <i class="am-icon-angle-right am-icon-fw "></i>
        </div>
        <div>
            充值
        </div>
    </div>
</div>
<script>
    window.jQuery || document.write('<script src="/basic/js/jquery.min.js "><\/script>');
</script>
<script type="text/javascript " src="/basic/js/quick_links.js "></script>
</body>

</html>
