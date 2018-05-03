<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.helpserver.dto.NowUser" %><%--
  Created by IntelliJ IDEA.
  User: wunaifu
  Date: 2018/1/11
  Time: 21:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>

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
    <script type="text/javascript" src="/js/server_searchlist.js"></script>
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
            <%--<div class="topMessage favorite">--%>
                <%--<div class="menu-hd"><a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>消息</span></a>--%>
                <%--</div>--%>
            <%--</div>--%>
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
            <form action="/server/search"  method="post">
                <input id="searchInput" name="search" type="text" placeholder="搜索" autocomplete="off" required value="${search}">
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

        <!--头 start-->
        <jsp:include page="midtop.jsp"></jsp:include>
        <!--头 end-->
        <div class="clear"></div>

    </div>
</div>
<div class="am-g am-g-fixed">
    <div class="am-u-sm-12 am-u-md-12">
        <div class="theme-popover">
            <%--<div class="searchAbout">--%>
                <%--<span class="font-pale">相关搜索：</span>--%>
                <%--<a title="坚果" href="#">坚果</a>--%>
                <%--<a title="瓜子" href="#">瓜子</a>--%>
                <%--<a title="鸡腿" href="#">豆干</a>--%>

            <%--</div>--%>
            <ul class="select">
                <p class="title font-normal">
                    <span class="fl"><%--<a href="/index" style="color: #0a628f">首页</a>>--%>搜索关键字 /
                    <small><b style="color: #ff4d2d" id="searchStr">${search}</b></small></span>
                    <span class="total fl">搜索到<strong class="num">${pagerList.totalRecord}</strong>件相关资源</span>
                </p>
                <div class="clear"></div>
                <%--<li class="select-result">--%>
                    <%--<dl>--%>
                        <%--<dt>已选</dt>--%>
                        <%--<dd class="select-no"></dd>--%>
                        <%--<p class="eliminateCriteria">清除</p>--%>
                    <%--</dl>--%>
                <%--</li>--%>
                <%--<div class="clear"></div>--%>
               <%-- <c:choose>
                    <c:when test="${orderTypeDtoList.size()>0}">
                        <c:forEach items="${orderTypeDtoList}" var="item" varStatus="status">
                            <li class="select-list">
                                <dl id="select2">
                                    <dt class="am-badge am-round">${item.bigtype.typename}</dt>
                                    <div class="dd-conent">
                                        &lt;%&ndash;<dd class="select-all selected"><a href="#">全部</a></dd>&ndash;%&gt;
                                        <c:choose>
                                            <c:when test="${item.ordertypeList.size()>0}">
                                                <c:forEach items="${item.ordertypeList}" var="itemtype">
                                                    <dd><a href="#">${itemtype.typename}</a></dd>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <dd><a href="#">其他</a></dd>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </dl>
                            </li>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <li class="select-list">
                            <dl id="select1">
                                <dt class="am-badge am-round">全部</dt>
                                <div class="dd-conent">
                                    <dd class="select-all selected"><a href="#">全部</a></dd>
                                    <dd><a href="#">其他</a></dd>
                                </div>
                            </dl>
                        </li>
                    </c:otherwise>
                </c:choose>--%>
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
                <div style="font-size: 15px;margin: 10px 0 10px 5px;padding: 5px;">
                    <%--<a href="/index" style="color: #0a628f">首页&nbsp;</a> >&nbsp;--%>
                    <%--&lt;%&ndash;<a style="color: #0a628f" href="/index_user">服务中心&nbsp;</a> >&nbsp;&ndash;%&gt;--%>
                    <%--<strong >搜索关键字</strong> /--%>
                    <%--<small><b style="color: #ff4d2d"><%=search%></b></small>--%>
                </div>
                <div id="list_tbody">
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
                                        <span style="margin: 0px 0px 0px 10px;">地址：<a href="/server/detail/${item.order.id}/map" style="color: #ff4d2d">${item.order.address}</a></span>
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
                </div>
            </div>
            <div class="clear "></div>
            <!--分页 -->
            <div id="list_nav">
            <%--<ul class="am-pagination am-pagination-left">
                <li class="am-disabled"><a href="#">&laquo;</a></li>
                <li class="am-active"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">&raquo;</a></li>
            </ul>--%>
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
                        <li><a onclick="click_pageNum(1)">首页</a></li>
                        <li>
                            <a onclick="click_pageNum(${pagerList.currentPage-1})">
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
                                <a onclick="click_pageNum(${k})">${k}</a>
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
                            <a onclick="click_pageNum(${pagerList.currentPage+1})">
                                <span >»</span>
                            </a>
                        </li>
                        <li>
                            <a onclick="click_pageNum(${pagerList.totalPage})">尾页</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
            </div>
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
    <li><a href="/index"><i class="am-icon-home "></i>首页</a></li>
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
