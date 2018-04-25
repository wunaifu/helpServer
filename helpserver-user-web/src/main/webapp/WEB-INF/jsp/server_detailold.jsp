<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.helpserver.dto.NowUser" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018-01-28
  Time: 17:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>资源服务订单详情</title>

    <link href="/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
    <link href="/css/personal.css" rel="stylesheet" type="text/css">
    <link href="/css/infstyle.css" rel="stylesheet" type="text/css">
    <link type="text/css" href="/css/optstyle.css" rel="stylesheet"/>
    <link type="text/css" href="/css/style.css" rel="stylesheet"/>
    <script src="/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script src="/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
    <script type="text/javascript" src="/basic/js/quick_links.js"></script>

    <script type="text/javascript" src="/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
    <script type="text/javascript" src="/js/jquery.imagezoom.min.js"></script>
    <script type="text/javascript" src="/js/jquery.flexslider.js"></script>
    <script type="text/javascript" src="/js/list.js"></script>
</head>
<%
    NowUser nowUser = new NowUser();
    if (request.getSession().getAttribute("nowUser") != null) {
        nowUser = (NowUser) request.getSession().getAttribute("nowUser");
    }

%>
<body>
<!--头 -->
<header>
    <article>
        <div class="mt-logo">
            <!-- top start -->
            <!--顶部导航条 -->
            <div class="am-container header">
                <ul class="message-l">
                    <div class="topMessage">
                        <div class="menu-hd">
                            <a href="#" target="_top">定位：<%=nowUser.getLocation()%>
                            </a>
                            <a href="/index_user" target="_top" class="h"><%=nowUser.getName()%>
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
                        <div class="menu-hd"><a href="#" target="_top"><i
                                class="am-icon-heart am-icon-fw"></i><span>消息</span></a>
                        </div>
                    </div>
                </ul>
            </div>

            <!--悬浮搜索框-->

            <div class="nav white">
                <%--<div class="logo"><img src="/images/logo1.png"/></div>--%>
                <div class="logoBig">
                    <li><img src="/images/logobig.png"/></li>
                </div>

                <div class="search-bar pr">
                    <a name="index_none_header_sysc" href="#"></a>
                    <form action="/searchserver">
                        <input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索"
                               autocomplete="off">
                        <input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
                    </form>
                </div>
            </div>
            <!-- top end -->

            <div class="clear"></div>
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

            <div class="user-info" style="max-width: none">
                <!--标题 -->
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><a href="/index" style="color: #0a628f">首页&nbsp;</a> >&nbsp;
                        <%--<a style="color: #0a628f" href="/index_user">服务中心&nbsp;</a> >&nbsp;--%>
                        <strong class="am-text-danger am-text-lg">服务详情</strong> /
                        <small>Server&nbsp;add</small>
                    </div>
                </div>
                <hr/>

                <!--个人信息 -->
                <div class="listMain">

                    <script type="text/javascript">
                        $(function () {
                        });
                        $(window).load(function () {
                            $('.flexslider').flexslider({
                                animation: "slide",
                                start: function (slider) {
                                    $('body').removeClass('loading');
                                }
                            });
                        });
                    </script>
                    <!-- introduce-->

                    <div class="introduce">
                        <div class="introduceMain" style="width: 100%">
                            <div class="am-tabs" data-am-tabs>

                                <ul class="am-avg-sm-3 am-tabs-nav am-nav am-nav-tabs">
                                    <li class="am-active">
                                        <a href="#">
                                            <span class="index-needs-dt-txt">服务详情</span></a>
                                    </li>

                                    <li>
                                        <a href="#">
                                            <span class="index-needs-dt-txt">接单人</span></a>
                                    </li>

                                    <li>
                                        <a href="#">
                                            <span class="index-needs-dt-txt">全部评价</span></a>
                                    </li>
                                </ul>

                                <div class="am-tabs-bd">

                                    <div class="am-tab-panel am-fade am-in am-active">
                                        <div class="details">
                                            <div class="attr-list-hd after-market-hd">
                                                <h4>资源名字：${orderUserDto.order.foodname}</h4>
                                            </div>
                                        </div>
                                        <div class="clear"></div>
                                        <div align="left"
                                             style="margin-left: 20px;vertical-align: top;color: #666;font-size:14px;">
                                            <%--<ul id="J_AttrUL">--%>
                                            <div style="margin-top: 10px;"><b
                                                    style="color: #101010;">服务类型:</b>&nbsp;${orderUserDto.orderTypeName}
                                            </div>
                                            <div style="margin-top: 10px;"><b
                                                    style="color: #101010;">资源费用:</b>&nbsp;${orderUserDto.order.moneyamount}￥
                                            </div>
                                            <div style="margin-top: 10px;"><b
                                                    style="color: #101010;">资源数量:</b>&nbsp;${orderUserDto.order.amount}
                                            </div>
                                            <div style="margin-top: 10px;"><b
                                                    style="color: #101010;">服务区域:</b>&nbsp;${orderUserDto.order.city}
                                            </div>
                                            <div style="margin-top: 10px;"><b
                                                    style="color: #101010;">详细地址:</b>&nbsp;${orderUserDto.order.address}
                                            </div>
                                            <div style="margin-top: 10px;"><b
                                                    style="color: #101010;">精细定位:</b>&nbsp;
                                                <a href="/server/detail/${orderUserDto.order.id}/map"><i class="am-icon-map-marker"></i>去查看</a>
                                            </div>
                                            <div style="margin-top: 10px;"><b
                                                    style="color: #101010;">可使用时间:</b>&nbsp;${orderUserDto.order.starttime}到${orderUserDto.order.endtime}
                                            </div>
                                            <div style="margin-top: 10px;"><b
                                                    style="color: #101010;">详情备注：</b>&nbsp;${orderUserDto.order.orderdetail}
                                            </div>
                                            <%--<c:if test="${orderUserDto.order.accepterid==-1}">--%>
                                                <div style="margin-top: 10px;"><b
                                                        style="color: #101010;">联系人:</b>&nbsp;${orderUserDto.order.callname}
                                                </div>
                                                <div style="margin-top: 10px;"><b style="color: #101010;">联系方式：</b>&nbsp;${orderUserDto.order.callphone}
                                                </div>
                                            <%--</c:if>--%>
                                            <div style="margin-top: 10px;">
                                                <b style="color: #101010;">资源照片：</b>&nbsp;
                                                <c:choose>
                                                    <c:when test="${orderUserDto.order.picture==null||orderUserDto.order.picture==''}">
                                                        没有图片
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img src="/resources/img/${orderUserDto.order.picture}"
                                                                style="max-height: 600px;max-width: 400px;">
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <%--</ul>--%>
                                            <div class="clear"></div>
                                        </div>
                                    </div>

                                    <div class="am-tab-panel am-fade">
                                        <ul class="am-comments-list am-comments-list-flip">
                                            <li class="am-comment">
                                                <!-- 接单人容器 -->
                                                <a href="/server/userinfo">
                                                    <img class="am-comment-avatar" src="/images/hwbn40x40.jpg"/>
                                                    <!-- 接单人头像 -->
                                                </a>

                                                <div class="am-comment-main">
                                                    <!-- 接单内容容器 -->
                                                    <header class="am-comment-hd">
                                                        <!--<h3 class="am-comment-title">评论标题</h3>-->
                                                        <div class="am-comment-meta">
                                                            <!-- 评论元数据 -->
                                                            <a href="#link-to-user" class="am-comment-author">张三疯</a>
                                                            <!-- 评论者 -->
                                                            接单于
                                                            <time datetime="">2015-11-02 17:46:20</time>
                                                        </div>
                                                    </header>

                                                    <div class="am-comment-bd">
                                                        <div class="tb-rev-item " data-id="255776406962">
                                                            <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                                取消理由：摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
                                                            </div>
                                                            <div class="tb-r-act-bar">
                                                                状态：已取消&nbsp;&nbsp;取消时间：2015-11-02 17:46:20
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <!-- 评论内容 -->
                                                </div>
                                            </li>

                                            <li class="am-comment">
                                                <!-- 接单人容器 -->
                                                <a href="/server/userinfo">
                                                    <img class="am-comment-avatar" src="/images/hwbn40x40.jpg"/>
                                                    <!-- 接单人头像 -->
                                                </a>

                                                <div class="am-comment-main">
                                                    <!-- 接单内容容器 -->
                                                    <header class="am-comment-hd">
                                                        <!--<h3 class="am-comment-title">评论标题</h3>-->
                                                        <div class="am-comment-meta">
                                                            <!-- 评论元数据 -->
                                                            <a href="#link-to-user" class="am-comment-author">张无忌</a>
                                                            <!-- 评论者 -->
                                                            接单于
                                                            <time datetime="">2015-11-02 17:46:20</time>
                                                        </div>
                                                    </header>

                                                    <div class="am-comment-bd">
                                                        <div class="tb-rev-item " data-id="255776406962">
                                                            <div class="tb-r-act-bar">
                                                                状态：进行中&nbsp;&nbsp;
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- 评论内容 -->
                                                </div>
                                            </li>

                                        </ul>
                                    </div>

                                    <div class="am-tab-panel am-fade">

                                        <div class="actor-new">
                                            <div class="rate">
                                                <strong>100<span>%</span></strong><br> <span>好评度</span>
                                            </div>
                                            <dl>
                                                <dt>买家印象</dt>
                                                <dd class="p-bfc">
                                                    <q class="comm-tags"><span>味道不错</span><em>(2177)</em></q>
                                                    <q class="comm-tags"><span>颗粒饱满</span><em>(1860)</em></q>
                                                    <q class="comm-tags"><span>口感好</span><em>(1823)</em></q>
                                                    <q class="comm-tags"><span>商品不错</span><em>(1689)</em></q>
                                                    <q class="comm-tags"><span>香脆可口</span><em>(1488)</em></q>
                                                    <q class="comm-tags"><span>个个开口</span><em>(1392)</em></q>
                                                    <q class="comm-tags"><span>价格便宜</span><em>(1119)</em></q>
                                                    <q class="comm-tags"><span>特价买的</span><em>(865)</em></q>
                                                    <q class="comm-tags"><span>皮很薄</span><em>(831)</em></q>
                                                </dd>
                                            </dl>
                                        </div>
                                        <div class="clear"></div>
                                        <div class="tb-r-filter-bar">
                                            <ul class=" tb-taglist am-avg-sm-4">
                                                <li class="tb-taglist-li tb-taglist-li-current">
                                                    <div class="comment-info">
                                                        <span>全部评价</span>
                                                        <span class="tb-tbcr-num">(32)</span>
                                                    </div>
                                                </li>

                                                <li class="tb-taglist-li tb-taglist-li-1">
                                                    <div class="comment-info">
                                                        <span>好评</span>
                                                        <span class="tb-tbcr-num">(32)</span>
                                                    </div>
                                                </li>

                                                <li class="tb-taglist-li tb-taglist-li-0">
                                                    <div class="comment-info">
                                                        <span>中评</span>
                                                        <span class="tb-tbcr-num">(32)</span>
                                                    </div>
                                                </li>

                                                <li class="tb-taglist-li tb-taglist-li--1">
                                                    <div class="comment-info">
                                                        <span>差评</span>
                                                        <span class="tb-tbcr-num">(32)</span>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="clear"></div>

                                        <ul class="am-comments-list am-comments-list-flip">
                                            <li class="am-comment">
                                                <!-- 评论容器 -->
                                                <a href="">
                                                    <img class="am-comment-avatar" src="/images/hwbn40x40.jpg"/>
                                                    <!-- 评论者头像 -->
                                                </a>

                                                <div class="am-comment-main">
                                                    <!-- 评论内容容器 -->
                                                    <header class="am-comment-hd">
                                                        <!--<h3 class="am-comment-title">评论标题</h3>-->
                                                        <div class="am-comment-meta">
                                                            <!-- 评论元数据 -->
                                                            <a href="#link-to-user" class="am-comment-author">b***1
                                                                (匿名)</a>
                                                            <!-- 评论者 -->
                                                            评论于
                                                            <time datetime="">2015年11月02日 17:46</time>
                                                        </div>
                                                    </header>

                                                    <div class="am-comment-bd">
                                                        <div class="tb-rev-item " data-id="255776406962">
                                                            <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                                摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
                                                            </div>
                                                            <div class="tb-r-act-bar">
                                                                颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <!-- 评论内容 -->
                                                </div>
                                            </li>
                                            <li class="am-comment">
                                                <!-- 评论容器 -->
                                                <a href="">
                                                    <img class="am-comment-avatar" src="/images/hwbn40x40.jpg"/>
                                                    <!-- 评论者头像 -->
                                                </a>

                                                <div class="am-comment-main">
                                                    <!-- 评论内容容器 -->
                                                    <header class="am-comment-hd">
                                                        <!--<h3 class="am-comment-title">评论标题</h3>-->
                                                        <div class="am-comment-meta">
                                                            <!-- 评论元数据 -->
                                                            <a href="#link-to-user" class="am-comment-author">l***4
                                                                (匿名)</a>
                                                            <!-- 评论者 -->
                                                            评论于
                                                            <time datetime="">2015年10月28日 11:33</time>
                                                        </div>
                                                    </header>

                                                    <div class="am-comment-bd">
                                                        <div class="tb-rev-item " data-id="255095758792">
                                                            <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                                没有色差，很暖和……美美的
                                                            </div>
                                                            <div class="tb-r-act-bar">
                                                                颜色分类：蓝调灰&nbsp;&nbsp;尺码：2XL
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <!-- 评论内容 -->
                                                </div>
                                            </li>
                                            <li class="am-comment">
                                                <!-- 评论容器 -->
                                                <a href="">
                                                    <img class="am-comment-avatar" src="/images/hwbn40x40.jpg"/>
                                                    <!-- 评论者头像 -->
                                                </a>

                                                <div class="am-comment-main">
                                                    <!-- 评论内容容器 -->
                                                    <header class="am-comment-hd">
                                                        <!--<h3 class="am-comment-title">评论标题</h3>-->
                                                        <div class="am-comment-meta">
                                                            <!-- 评论元数据 -->
                                                            <a href="#link-to-user" class="am-comment-author">b***1
                                                                (匿名)</a>
                                                            <!-- 评论者 -->
                                                            评论于
                                                            <time datetime="">2015年11月02日 17:46</time>
                                                        </div>
                                                    </header>

                                                    <div class="am-comment-bd">
                                                        <div class="tb-rev-item " data-id="255776406962">
                                                            <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                                摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
                                                            </div>
                                                            <div class="tb-r-act-bar">
                                                                颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <!-- 评论内容 -->
                                                </div>
                                            </li>
                                            <li class="am-comment">
                                                <!-- 评论容器 -->
                                                <a href="">
                                                    <img class="am-comment-avatar" src="/images/hwbn40x40.jpg"/>
                                                    <!-- 评论者头像 -->
                                                </a>

                                                <div class="am-comment-main">
                                                    <!-- 评论内容容器 -->
                                                    <header class="am-comment-hd">
                                                        <!--<h3 class="am-comment-title">评论标题</h3>-->
                                                        <div class="am-comment-meta">
                                                            <!-- 评论元数据 -->
                                                            <a href="#link-to-user" class="am-comment-author">h***n
                                                                (匿名)</a>
                                                            <!-- 评论者 -->
                                                            评论于
                                                            <time datetime="">2015年11月25日 12:48</time>
                                                        </div>
                                                    </header>

                                                    <div class="am-comment-bd">
                                                        <div class="tb-rev-item " data-id="258040417670">
                                                            <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                                式样不错，初冬穿
                                                            </div>
                                                            <div class="tb-r-act-bar">
                                                                颜色分类：柠檬黄&nbsp;&nbsp;尺码：L
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- 评论内容 -->
                                                </div>
                                            </li>
                                            <li class="am-comment">
                                                <!-- 评论容器 -->
                                                <a href="">
                                                    <img class="am-comment-avatar" src="/images/hwbn40x40.jpg"/>
                                                    <!-- 评论者头像 -->
                                                </a>

                                                <div class="am-comment-main">
                                                    <!-- 评论内容容器 -->
                                                    <header class="am-comment-hd">
                                                        <!--<h3 class="am-comment-title">评论标题</h3>-->
                                                        <div class="am-comment-meta">
                                                            <!-- 评论元数据 -->
                                                            <a href="#link-to-user" class="am-comment-author">b***1
                                                                (匿名)</a>
                                                            <!-- 评论者 -->
                                                            评论于
                                                            <time datetime="">2015年11月02日 17:46</time>
                                                        </div>
                                                    </header>

                                                    <div class="am-comment-bd">
                                                        <div class="tb-rev-item " data-id="255776406962">
                                                            <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                                摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
                                                            </div>
                                                            <div class="tb-r-act-bar">
                                                                颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <!-- 评论内容 -->
                                                </div>
                                            </li>
                                            <li class="am-comment">
                                                <!-- 评论容器 -->
                                                <a href="">
                                                    <img class="am-comment-avatar" src="/images/hwbn40x40.jpg"/>
                                                    <!-- 评论者头像 -->
                                                </a>

                                                <div class="am-comment-main">
                                                    <!-- 评论内容容器 -->
                                                    <header class="am-comment-hd">
                                                        <!--<h3 class="am-comment-title">评论标题</h3>-->
                                                        <div class="am-comment-meta">
                                                            <!-- 评论元数据 -->
                                                            <a href="#link-to-user" class="am-comment-author">l***4
                                                                (匿名)</a>
                                                            <!-- 评论者 -->
                                                            评论于
                                                            <time datetime="">2015年10月28日 11:33</time>
                                                        </div>
                                                    </header>

                                                    <div class="am-comment-bd">
                                                        <div class="tb-rev-item " data-id="255095758792">
                                                            <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                                没有色差，很暖和……美美的
                                                            </div>
                                                            <div class="tb-r-act-bar">
                                                                颜色分类：蓝调灰&nbsp;&nbsp;尺码：2XL
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <!-- 评论内容 -->
                                                </div>
                                            </li>

                                        </ul>

                                        <div class="clear"></div>

                                        <!--分页 -->
                                        <ul class="am-pagination am-pagination-right">
                                            <li class="am-disabled"><a href="#">&laquo;</a></li>
                                            <li class="am-active"><a href="#">1</a></li>
                                            <li><a href="#">2</a></li>
                                            <li><a href="#">3</a></li>
                                            <li><a href="#">4</a></li>
                                            <li><a href="#">5</a></li>
                                            <li><a href="#">&raquo;</a></li>
                                        </ul>
                                        <div class="clear"></div>

                                        <div class="tb-reviewsft">
                                            <div class="tb-rate-alert type-attention">购买前请查看该商品的 <a href="#"
                                                                                                    target="_blank">购物保障</a>，明确您的售后保障权益。
                                            </div>
                                        </div>

                                    </div>

                                </div>

                            </div>

                            <div class="clear"></div>
                        </div>

                    </div>
                </div>

            </div>

        </div>
        <!--底部 start-->
        <jsp:include page="footer.jsp"></jsp:include>
        <!--底部 end-->
    </div>

    <aside class="menu">
        <ul>
            <li class="person active">
                <a href="#"><i class="am-icon-user"></i>服务中心</a>
            </li>
            <li class="person">
                <p><i class="am-icon-balance-scale"></i>我的服务</p>
                <ul>
                    <li><a href="#">已发布</a></li>
                    <li><a href="#">已接单</a></li>
                    <li><a href="#">待评价</a></li>
                    <li><a href="#">已完成</a></li>
                    <li><a href="#">草稿箱</a></li>
                </ul>
            </li>
        </ul>

    </aside>
</div>

</body>

</html>
