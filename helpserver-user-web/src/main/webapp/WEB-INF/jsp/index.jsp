<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.helpserver.dto.NowUser" %><%--
  Created by IntelliJ IDEA.
  User: wunaifu
  Date: 2018/1/11
  Time: 21:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>
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
                    <a href="/map" target="_top">定位：<i class="am-icon-map-marker"></i><%=nowUser.getLocation()%>
                    </a>
                    <a href="/index_user" target="_top" class="h" style="margin-left: 50px;"><%=nowUser.getName()%>
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
            <%--<div class="topMessage favorite">--%>
                <%--<div class="menu-hd"><a href="#" target="_top"><i--%>
                        <%--class="am-icon-heart am-icon-fw"></i><span>消息</span></a>--%>
                <%--</div>--%>
            <%--</div>--%>
        </ul>
    </div>

    <!--悬浮搜索框-->

    <div class="nav white">
        <div class="logo" style="margin-top:18px;font-size: 11px;width: 60px;">
            <a href="/map"><i class="am-icon-map-marker" style="color: #ff4d2d"></i><%=nowUser.getLocation()%></a>
        </div>
        <div class="logoBig">
            <li><img src="/images/logobig.png"/></li>
        </div>

        <!--搜索 start-->
        <jsp:include page="search.jsp"></jsp:include>
        <!--搜索 end-->
    </div>

    <!-- top end -->
    <div class="clear"></div>
</div>
<b class="line"></b>
<div class="shopNav">
    <div class="slideall" style="height: auto;">

        <!--头 start-->
        <jsp:include page="midtop.jsp"></jsp:include>
        <!--头 end-->

        <div class="bannerTwo">
            <!--轮播 -->
            <div class="am-slider am-slider-default scoll" data-am-flexslider id="demo-slider-0">
                <ul class="am-slides">
                    <li class="banner1">
                        <a><img src="/images/ad5.jpg"/></a>
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
                                <c:when test="${orderTypeDtoList.size()>0}">
                                    <c:forEach items="${orderTypeDtoList}" var="bigitem" varStatus="status">
                                        <li>
                                            <div class="category-info">
                                                <h3 class="category-name b-category-name"><i><img
                                                        src="/images/cake.png"></i><a
                                                        class="ml-22" title="${bigitem.bigtype.typename}">${bigitem.bigtype.typename}</a></h3>
                                                <em>&gt;</em></div>
                                            <div class="menu-item menu-in top">
                                                <div class="area-in">
                                                    <div class="area-bg">
                                                        <div class="menu-srot">
                                                            <div class="sort-side">
                                                                <dl class="dl-sort">
                                                                    <dt><span
                                                                            title="${bigitem.bigtype.typename}">${bigitem.bigtype.typename}</span>
                                                                    </dt>
                                                            <c:choose>
                                                                <c:when test="${bigitem.ordertypeList.size()>0}">
                                                                    <c:forEach items="${bigitem.ordertypeList}"
                                                                               var="typeitem" varStatus="status">
                                                                                <dd><a title="${typeitem.typename}"
                                                                                       href="#"><span>${typeitem.typename}</span></a>
                                                                                </dd>
                                                                    </c:forEach>
                                                                </c:when>

                                                            </c:choose>
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
                                            <h3 class="category-name b-category-name"><i><img
                                                    src="/images/cake.png"></i><a
                                                    class="ml-22" title="没有类型">没有类型</a></h3>
                                            <em>&gt;</em></div>
                                        <div class="menu-item menu-in top">
                                            <div class="area-in">
                                                <div class="area-bg">
                                                    <div class="menu-srot">
                                                        <div class="sort-side">
                                                            <dl class="dl-sort">
                                                                <dt><span title="没有类型">没有类型</span></dt>
                                                                <dd><a title="没有类型" href="#"><span>没有类型</span></a></dd>
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
                            <c:if test="${orderTypeDtoList.size()<10}">
                                <c:forEach begin="1" end="${10-orderTypeDtoList.size()}">
                                    <li></li>
                                </c:forEach>
                            </c:if>
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
                                        <li class="title-first"><a
                                                                   href="#"><span>[公告]</span>${newsitem.title}</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li><a href="#"><span>[公告]</span>${newsitem.title}</a></li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <li class="title-first"><a href="#"><span>[公告]</span>目前没有每日新鲜事</a></li>
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
                <h2 style="padding: 1px;margin: 0 0;">
                    <a href="/server/add"><p class="am-icon-angle-right" style="float:left;font-size: 14px;padding: 1px"><span>去发布资源服务</span></p></a>
                    <p style="float:right;font-size: 12px;">来看看您需要的资源</p>
                </h2>
                <div class="clear "></div>
                <div class="blogs">
                    <h3>您缺少资源吗？这里有您需要资源服务，快来看一看，租用您需要的资源吧。</h3>
                    <ul>
                        <p>
                        </p>
                    </ul>
                </div>
                <c:choose>
                    <c:when test="${pagerList.dataList.size()>0}">
                        <c:forEach items="${pagerList.dataList}" var="item" varStatus="status">
                            <div class="blogs">
                                <h3><a href="/server/${item.order.id}/detail" style="color: #0a628f">资源名字：${item.order.foodname}</a></h3>
                                <figure><a href="/server/${item.order.senderid}/userinfo">
                                    <img style="width: 72px;height: 72px;" src="/resources/img/${item.senderIcon}"></a>
                                </figure>
                                <ul>
                                    <a href="/server/${item.order.id}/detail">
                                        <p>资源详情：<b style="color: #000000">${item.order.orderdetail}</b>
                                        </p>
                                    </a>
                                    <div class="autor1">
                                        <span>类型：<b style="color: #ff4d2d">${item.orderTypeName}</b></span>
                                        <c:if test="${item.order.daynumber>0}">
                                            <span style="margin: 0px 0px 0px 10px;">日租费：<b style="color: #ff4d2d">${item.order.daymoney}￥</b></span>
                                        </c:if>
                                        <c:if test="${item.order.monthnumber>0}">
                                            <span style="margin: 0px 0px 0px 10px;">月租费：<b style="color: #ff4d2d">${item.order.monthmoney}￥</b></span>
                                        </c:if>
                                        <span style="margin: 0px 0px 0px 10px;">库存：<b style="color: #ff4d2d">${item.order.amount-item.order.outamount}/${item.order.amount}</b></span>
                                        <span style="margin: 0px 0px 0px 10px;">需要押金：<b style="color: #ff4d2d">${item.order.moneyamount}￥</b></span>
                                        <span style="margin: 0px 0px 0px 10px;">区域：<b style="color: #ff4d2d">${item.order.city}</b></span>
                                        <span style="margin: 0px 0px 0px 10px;">地址：<b style="color: #ff4d2d">${item.order.address}</b></span>
                                    </div>
                                    <a href="/server/${item.order.id}/detail" class="readmore">马上抢单</a>
                                </ul>
                                <p class="autor"><span>发布者：<a href="/server/${item.order.senderid}/userinfo">${item.senderName}</a> </span>
                                    <span>发布时间：${item.order.sendtime}</span>
                                    <%--<span>收藏（<a>459</a>）</span><span>浏览（<a>30</a>）</span>--%>
                                </p>
                                <hr />
                                <%--<div class="dateview">${item.order.sendtime}</div>--%>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <h1 align="center">未有资源服务订单</h1>
                    </c:otherwise>
                </c:choose>
                <div class="blogs">
                    <h3></h3>
                    <figure></a>
                    </figure>
                    <ul>

                    </ul>
                    <p class="autor">
                    </p>
                </div>

            </div>
            <ul class="am-pagination am-pagination-left">
                <c:choose>
                    <c:when test="${pagerList.currentPage==1||pagerList.totalPage==0}">
                        <li class="am-disabled"><a>首页</a></li>
                        <li class="am-disabled">
                            <a >
                                <span >«</span>
                            </a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="/index?pageNum=1">首页</a></li>
                        <li>
                            <a href="/index?pageNum=${pagerList.currentPage-1}">
                                <span>«</span>
                            </a>
                        </li>
                    </c:otherwise>
                </c:choose>
                <c:forEach var="k" begin="1" end="${pagerList.totalPage}">
                    <c:choose>
                        <c:when test="${k==(pagerList.currentPage-4) || k == (pagerList.currentPage + 4)}">
                            <li><a>…</a></li>
                        </c:when>
                        <c:when test="${k==pagerList.currentPage}">
                            <li class="am-active"><a>${k}<span class="sr-only"></span></a></li>
                        </c:when>
                        <c:when test="${k < pagerList.currentPage - 4 || k > pagerList.currentPage + 4}">

                        </c:when>
                        <c:otherwise>
                            <li>
                                <a href="/index?pageNum=${k}">${k}</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:choose>
                    <c:when test="${pagerList.currentPage == pagerList.totalPage || pagerList.totalPage == 0}">
                        <li class="am-disabled">
                            <a >
                                <span >»</span>
                            </a>
                        </li>
                        <li class="am-disabled"><a>尾页</a></li>
                    </c:when>
                    <c:otherwise>
                        <li>
                            <a href="/index?pageNum=${pagerList.currentPage+1}">
                                <span >»</span>
                            </a>
                        </li>
                        <li>
                            <a href="/index?pageNum=${pagerList.totalPage}">尾页</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
            <div class="clear "></div>
            <div style="padding: 25px;"></div>
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
    <%--<li><a href="/index_myorder"><i class="am-icon-shopping-basket"></i>订单</a></li>--%>
    <li><a href="/index_user"><i class="am-icon-user"></i>我的</a></li>
</div>

<script>
    window.jQuery || document.write('<script src="/basic/js/jquery.min.js "><\/script>');
</script>
<script type="text/javascript " src="/basic/js/quick_links.js "></script>
</body>

</html>
