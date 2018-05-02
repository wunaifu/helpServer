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

    <title>发表评论</title>

    <link href="/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

    <link href="/css/personal.css" rel="stylesheet" type="text/css">
    <link href="/css/appstyle.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
</head>

<body>
<!--头 -->
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

            <div class="user-comment">
                <!--标题 -->
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">发表评论</strong> / <small>Make&nbsp;Comments</small></div>
                </div>
                <hr/>

                <div class="comment-main">
                    <form method="post" action="/server/mysend/comment">
                        <div class="comment-list">
                            <div class="item-pic">
                                <a href="#" class="J_MakePoint">
                                    <img src="/resources/img/${orderUserDto.order.picture}" class="itempic">
                                </a>
                            </div>
                            <div class="item-title">

                                <div class="item-name">
                                    <a href="#">
                                        <p class="item-basic-info">${orderUserDto.order.foodname}</p>
                                    </a>
                                </div>
                                <div class="item-info">
                                    <div class="info-little">
                                        <span>租用者：${orderUserDto.accepterName}</span>
                                    </div>
                                    <div class="item-price">
                                        <c:choose>
                                            <c:when test="${acceptorder.moneytype==0}">
                                                日租：<strong>${orderUserDto.order.daymoney}.00￥</strong>
                                            </c:when>
                                            <c:otherwise>
                                                月租：<strong>${orderUserDto.order.monthmoney}.00￥</strong>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="item-price">
                                        租借数量：<strong>${acceptorder.number}件</strong>
                                    </div>
                                    <div class="item-price">
                                        租金：<strong>${needMoney}.00￥</strong>
                                    </div>
                                </div>
                            </div>
                            <div class="clear"></div>
                            <div class="item-comment">
                                <textarea placeholder="请写下对此次出借的感受吧，对他人帮助很大哦！" name="content" required></textarea>
                            </div>
                            <input name="acceptId" value="${acceptorder.id}" required hidden/>
                            <div class="item-opinion">
                                <li><input type="radio"name="score" required class="op1" value="5"/>5<i class="am-icon-star-o"></i></li>
                                <li><input type="radio"name="score" required class="op1" value="4"/>4<i class="am-icon-star-o"></i></li>
                                <li><input type="radio"name="score" required class="op2" value="3"/>3<i class="am-icon-star-o"></i></li>
                                <li><input type="radio"name="score" required class="op3" value="2"/>2<i class="am-icon-star-o"></i></li>
                                <li><input type="radio"name="score" required class="op3" value="1"/>1<i class="am-icon-star-o"></i></li>
                            </div>
                        </div>
                        <div class="info-btn">
                            <input class="am-btn am-btn-danger" type="submit" value="发表评论"/>
                        </div>
                    </form>

                </div>

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

<script type="text/javascript">
    $(document).ready(function() {
        $(".comment-list .item-opinion li").click(function() {
            $(this).prevAll().children('i').removeClass("active");
            $(this).nextAll().children('i').removeClass("active");
            $(this).children('i').addClass("active");

        });
    })
</script>
</body>

</html>