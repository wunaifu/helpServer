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

    <title>个人资料</title>

    <link href="/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
    <link href="/css/personal.css" rel="stylesheet" type="text/css">
    <link href="/css/infstyle.css" rel="stylesheet" type="text/css">
    <link type="text/css" href="/css/optstyle.css" rel="stylesheet" />
    <link type="text/css" href="/css/style.css" rel="stylesheet" />
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
                            <a href="#" target="_top">定位：<i class="am-icon-map-marker"></i><%=nowUser.getLocation()%></a>
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
                        <div class="menu-hd"><a id="mc-menu-hd" href="/server/myaccept/list" target="_top"><i
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
                <%--<div class="logo"><img src="/images/logo1.png"/></div>--%>
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

            <div class="user-info" style="max-width: none">
                <!--标题 -->
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><a href="/index" style="color: #0a628f">首页&nbsp;</a> >&nbsp;
                        <a style="color: #0a628f" href="">服务中心&nbsp;</a> >&nbsp;
                        <strong class="am-text-danger am-text-lg">用户信息</strong>
                    </div>
                </div>
                <hr/>

                <!--个人信息 -->
                <div class="listMain">

                    <script type="text/javascript">
                        $(function() {});
                        $(window).load(function() {
                            $('.flexslider').flexslider({
                                animation: "slide",
                                start: function(slider) {
                                    $('body').removeClass('loading');
                                }
                            });
                        });
                    </script>
                    <!-- introduce-->

                    <div class="introduce">
                        <div class="introduceMain"  style="width: 100%">
                            <div class="am-tabs" data-am-tabs>

                                <div class="am-tabs-bd">

                                    <div class="am-tab-panel am-fade am-in am-active">
                                        <div class="details">
                                            <div class="twlistNews">
                                                <img style="width: 80px;height: 80px;" src="/resources/img/${user.headicon}" />

                                            </div>
                                        </div>
                                        <div class="clear"></div>
                                        <div align="left" style="margin-left: 20px;vertical-align: top;color: #666;font-size:14px;">
                                            <%--<ul id="J_AttrUL">--%>
                                            <div style="margin-top: 10px;"><b style="color: #101010;">姓名:</b>&nbsp;${user.name}</div>
                                            <div style="margin-top: 10px;"><b style="color: #101010;">昵称:</b>&nbsp;${user.nickname}</div>
                                            <div style="margin-top: 10px;"><b style="color: #101010;">地址:</b>&nbsp;${user.name}</div>
                                            <%--<div style="margin-top: 10px;"><b style="color: #101010;">时间:</b>&nbsp;${user.name}</div>--%>
                                            <c:choose>
                                                <c:when test="${user.sex==1}">
                                                    <div style="margin-top: 10px;"><b style="color: #101010;">性别:</b>&nbsp;男</div>
                                                </c:when>
                                                <c:when test="${user.sex==0}">
                                                    <div style="margin-top: 10px;"><b style="color: #101010;">性别:</b>&nbsp;女</div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div style="margin-top: 10px;"><b style="color: #101010;">性别:</b>&nbsp;未知</div>
                                                </c:otherwise>
                                            </c:choose>
                                            <c:choose>
                                                <c:when test="${user.permission==1}">
                                                    <div style="margin-top: 10px;"><b style="color: #101010;">权限:</b>&nbsp;已实名</div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div style="margin-top: 10px;"><b style="color: #101010;">权限:</b>&nbsp;未认证</div>
                                                </c:otherwise>
                                            </c:choose>
                                            <div style="margin-top: 10px;"><b style="color: #101010;">个人简介：</b>&nbsp;${user.userinfo}
                                            </div>
                                            <%--</ul>--%>
                                            <div class="clear"></div>
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
                    <li><a href="/server/add">发服务</a></li>
                    <li><a href="/server/mysend/list">已发布</a></li>
                    <li> <a href="/server/myaccept/list">已接单</a></li>
                    <li> <a href="#">待评价</a></li>
                    <li> <a href="#">已完成</a></li>
                </ul>
            </li>
        </ul>

    </aside>
</div>

</body>

</html>
