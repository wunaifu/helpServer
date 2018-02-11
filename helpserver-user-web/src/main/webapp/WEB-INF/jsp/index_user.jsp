<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018-01-23
  Time: 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>个人中心</title>

    <link href="/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
    <link href="/css/personal.css" rel="stylesheet" type="text/css">
    <link href="/css/vipstyle.css" rel="stylesheet" type="text/css">
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
    <div class="long-title"><span class="all-goods">全部分类</span></div>
    <div class="nav-cont">
        <ul>
            <li class="index"><a href="#">首页</a></li>
            <li class="qc"><a href="#">服务</a></li>
            <li class="qc"><a href="#">趣事</a></li>
            <!--<li class="qc last"><a href="#">大包装</a></li>-->
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
            <div class="wrap-left">
                <div class="wrap-list">
                    <div class="m-user">
                        <!--个人信息 -->

                        <div class="m-userinfo">
                            <a href="#">
                                <div class="tipsBox"><i class="am-icon-envelope"></i></div>
                            </a>
                            <div class="m-baseinfo">
                                <a class="m-pic" href="/user/info">

                                    <c:choose>
                                        <c:when test="${userinfo.headicon!=''||userinfo.headicon!=null}">
                                            <img id="show" class="userheadicon am-circle am-img-thumbnail"
                                                 src="/resources/img/${userinfo.headicon}" alt=""/>
                                        </c:when>
                                        <c:otherwise>
                                            <img id="show" class="am-circle am-img-thumbnail" src="/images/getAvatar.do.jpg" alt=""/>
                                        </c:otherwise>
                                    </c:choose>
                                </a>
                                <div class="m-info">
                                    <a href="/user/info" ><em class="s-name">${userinfo.phone}</em></a>
                                    <div class="vip1">
                                        <c:choose>
                                            <c:when test="${userinfo.permission==0}">
                                                <a href="/user/idcard"><span></span><em>未实名</em></a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="/user/idcard"><span></span><em>已实名</em></a>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="safeText"><a><em style="margin-left:20px ;">${userinfo.registertime}</em>注册</a>
                                        <div class="progressBar"><span style="left: -95px;" class="progress"></span></div>
                                    </div>
                                    <div class="m-address">
                                        <c:choose>
                                            <c:when test="${gold.state==0}">
                                                <a href="/gold/dosignin" class="i-trigger">签到+1</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="#"onclick="$.myToast('今日已签到');" class="i-trigger">已签到</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                            <div class="m-right">
                                <div class="m-new">
                                    <a href="#"><i class="am-icon-dropbox  am-icon-md" style="padding-right:5px ;"></i>消息盒子</a>
                                </div>
                            </div>
                        </div>

                        <!--个人资产-->
                        <div class="m-userproperty">
                            <div class="s-bar">
                                <i class="s-icon"></i>个人资产
                            </div>
                            <p class="m-wallet">
                                <a href="#">
                                    <em class="m-num">0.00</em>
                                    <span class="m-title">账户余额</span>
                                </a>
                            </p>
                            <p class="m-bill">
                                <a href="/gold/info">
                                    <em class="m-num">${gold.goldamount}</em>
                                    <span class="m-title">总金币</span>
                                </a>
                            </p>
                            <p class="m-coupon">
                                <a href="/gold/pay">
                                    <em class="m-num">${gold.payamount}</em>
                                    <span class="m-title">已充值</span>
                                </a>
                            </p>
                        </div>

                        <!--我的钱包-->
                        <div class="wallet">
                            <div class="s-bar">
                                <i class="s-icon"></i>服务平台
                            </div>
                            <p class="m-big squareS">
                                <a href="#">
                                    <i><img src="/images/shopping.png"/></i>
                                    <span class="m-title">能互助</span>
                                </a>
                            </p>
                            <p class="m-big squareA">
                                <a href="#">
                                    <i><img src="/images/safe.png"/></i>
                                    <span class="m-title">够安全</span>
                                </a>
                            </p>
                            <p class="m-big squareL">
                                <a href="#">
                                    <i><img src="/images/profit.png"/></i>
                                    <span class="m-title">能赚钱</span>
                                </a>
                            </p>
                        </div>

                    </div>
                    <div class="box-container-bottom"></div>

                    <!--订单 -->
                    <div class="m-order">
                        <div class="s-bar">
                            <i class="s-icon"></i>我的订单
                            <a class="i-load-more-item-shadow" href="order.html">全部订单</a>
                        </div>
                        <ul>
                            <li><a href="order.html"><i><img src="/images/pay.png"/></i><span>已发布</span></a></li>
                            <li><a href="order.html"><i><img src="/images/send.png"/></i><span>已接单</span></a></li>
                            <li><a href="order.html"><i><img src="/images/comment.png"/></i><span>待评价</span></a></li>
                            <li><a href="order.html"><i><img src="/images/receive.png"/></i><span>已完成</span></a></li>
                            <li><a href="change.html"><i><img src="/images/refund.png"/></i><span>草稿箱</span></a></li>
                        </ul>
                        <div class="orderContentBox">
                            <div class="orderContent">
                                <div class="orderContentpic">
                                    <div class="imgBox">
                                        <a href="orderinfo.html"><img src="/images/youzi.jpg"></a>
                                    </div>
                                </div>
                                <div class="detailContent">
                                    <a href="orderinfo.html" class="delivery">标题：帮忙打包饭菜</a>
                                    <div class="orderID">
                                        <span class="time">服务时间：2016-03-09 21:52:47</span>
                                    </div>
                                    <div class="orderID">
                                        <span class="num">内容：求五邑大学同学帮忙打包饭菜</span>
                                    </div>
                                </div>
                                <div class="state">
                                    <span class="num">2/5人抢单</span>
                                </div>
                                <div class="price"><!--<span class="sym">¥</span>-->10<span class="sym">金币</span></div>

                            </div>
                            <a href="javascript:void(0);" class="btnPay">抢单</a>
                        </div>

                        <div class="orderContentBox">
                            <div class="orderContent">
                                <div class="orderContentpic">
                                    <div class="imgBox">
                                        <a href="orderinfo.html"><img src="/images/youzi.jpg"></a>
                                    </div>
                                </div>
                                <div class="detailContent">
                                    <a href="orderinfo.html" class="delivery">标题：帮忙打包饭菜</a>
                                    <div class="orderID">
                                        <span class="time">服务时间：2016-03-09 21:52:47</span>
                                    </div>
                                    <div class="orderID">
                                        <span class="num">内容：求五邑大学同学帮忙打包饭菜</span>
                                    </div>
                                </div>
                                <div class="state">
                                    <span class="num">2/5人抢单</span>
                                </div>
                                <div class="price"><!--<span class="sym">¥</span>-->10<span class="sym">金币</span></div>

                            </div>
                            <a href="javascript:void(0);" class="btnPay">抢单</a>
                        </div>
                    </div>
                    <!--九宫格-->
                    <div class="user-squaredIcon">
                        <div class="s-bar">
                            <i class="s-icon"></i>我的常用
                        </div>
                        <ul>
                            <a href="order.html">
                                <li class="am-u-sm-4"><i class="am-icon-truck am-icon-md"></i>
                                    <p>服务查询</p>
                                </li>
                            </a>
                            <a href="collection.html">
                                <li class="am-u-sm-4"><i class="am-icon-heart am-icon-md"></i>
                                    <p>我的收藏</p>
                                </li>
                            </a>
                            <a href="foot.html">
                                <li class="am-u-sm-4"><i class="am-icon-paw am-icon-md"></i>
                                    <p>我的足迹</p>
                                </li>
                            </a>
                            <a href="#">
                                <li class="am-u-sm-4"><i class="am-icon-gift am-icon-md"></i>
                                    <p>为你推荐</p>
                                </li>
                            </a>
                            <a href="blog.html">
                                <li class="am-u-sm-4"><i class="am-icon-share-alt am-icon-md"></i>
                                    <p>我的分享</p>
                                </li>
                            </a>
                            <a href="/home/home2.html">
                                <li class="am-u-sm-4"><i class="am-icon-clock-o am-icon-md"></i>
                                    <p>趣事活动</p>
                                </li>
                            </a>

                        </ul>
                    </div>

                    <div class="user-suggestion">
                        <div class="s-bar">
                            <i class="s-icon"></i>&nbsp;
                        </div>
                        <a href="/user/feedback"><div class="s-bar">
                            <i class="s-icon"></i>意见反馈
                        </div></a>
                        <hr style="margin: 0 10px 0 10px;">
                        <a href="/logout">
                            <div class="s-bar">
                            <i class="s-icon"></i>退出登录
                        </div></a>
                        <hr style="margin: 0 10px 0 10px;">
                        <div style="margin-bottom: 30px;"></div>
                    </div>

                </div>
            </div>
            <div class="wrap-right">

                <!-- 日历-->
                <div class="day-list">
                    <div class="s-title">
                        每日新鲜事
                    </div>
                    <div class="s-box">
                        <ul>
                            <li><a><p>粮油冲锋周 满128减18</p></a></li>
                            <li><a><p>防晒这么重要的事怎能随意</p></a></li>
                            <li><a><p>春日护肤面膜不可少，你选对了吗？</p></a></li>
                            <li><a><p>纯粹时尚，摩登出游，吸睛美衣</p></a></li>
                            <li><a><p>粮油冲锋周 满128减18</p></a></li>
                            <li><a><p>春日护肤面膜不可少，你选对了吗？</p></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="clear"></div>

        </div>
        <!--底部 start-->
        <jsp:include page="footer.jsp"></jsp:include>
        <!--底部 end-->
    </div>

    <!--侧边菜单 start-->
    <jsp:include page="user_menu.jsp"></jsp:include>
    <!--侧边菜单 end-->

</div>
<!--引导 -->
<div class="navCir">
    <li><a href="/index"><i class="am-icon-home "></i>首页</a></li>
    <li><a href="/index_type"><i class="am-icon-list"></i>分类</a></li>
    <li><a href="/index_myorder"><i class="am-icon-shopping-basket"></i>订单</a></li>
    <li class="active"><a href="/index_user"><i class="am-icon-user"></i>我的</a></li>
</div>
</body>

</html>