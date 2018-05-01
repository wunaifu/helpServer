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
    <script type="text/javascript" src="/js/server_myaccept_list.js"></script>
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
            <form action="#"  method="post">
                <input id="searchInput" name="search" type="text" placeholder="搜索我预定的资源服务" autocomplete="off" required">
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
            <%--<div class="searchAbout">--%>
                <%--<span class="font-pale">相关搜索：</span>--%>
                <%--<a title="坚果" href="#">坚果</a>--%>
                <%--<a title="瓜子" href="#">瓜子</a>--%>
                <%--<a title="鸡腿" href="#">豆干</a>--%>

            <%--</div>--%>
            <ul class="select">
                <p class="title font-normal">
                    <span class="total fl">你一共预定了<strong class="num">${pagerList.totalRecord}</strong>条资源服务</span>
                </p>
                <div class="clear"></div>

            </ul>
            <div class="clear"></div>
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
                <div style="font-size: 15px;margin: 10px 0 10px 5px;padding: 5px;">
                    <%--<a href="/index" style="color: #0a628f">首页&nbsp;</a> >&nbsp;--%>
                    <%--&lt;%&ndash;<a style="color: #0a628f" href="/index_user">服务中心&nbsp;</a> >&nbsp;&ndash;%&gt;--%>
                    <%--<strong >搜索关键字</strong> /--%>
                    <%--<small><b style="color: #ff4d2d">${search}</b></small>--%>
                </div>
                <div id="list_tbody">
                <c:choose>
                    <c:when test="${pagerList.dataList.size()>0}">
                        <c:forEach items="${pagerList.dataList}" var="item" varStatus="status">
                            <div class="blogs">
                                <h3><a href="/server/${item.orderId}/detail" style="color: #0a628f">资源名字：${item.foodname}</a></h3>
                                抢单时间：${item.acceptorder.accepttime}
                                <figure><a href="/server/${item.senderId}/userinfo">
                                    <img style="width: 72px;height: 72px;" src="/resources/img/${item.sendUserIcon}"></a>
                                </figure>
                                <ul>
                                    <a href="/server/${item.orderId}/detail">
                                        <p>资源详情：<b style="color: #000000">${item.orderdetail}</b></p>
                                    </a>
                                    <div class="autor1">
                                        <span>发布者：<a href="/server/${item.senderId}/userinfo" style="color: #ff4d2d">${item.sendUserName}</a></span>
                                        <span style="margin: 0px 0px 0px 10px;">信誉分：<b style="color: #ff4d2d">${item.sendUserCredit}</b></span>
                                        <c:choose>
                                            <c:when test="${item.acceptorder.moneytype==0}">
                                                <span style="margin: 0px 0px 0px 10px;">计费方式：<b style="color: #ff4d2d">日租￥${item.acceptorder.money}</b></span>
                                                <span style="margin: 0px 0px 0px 10px;">租用时间：<b style="color: #ff4d2d">${item.acceptorder.number}天</b></span>
                                            </c:when>
                                            <c:otherwise>
                                                <span style="margin: 0px 0px 0px 10px;">计费方式：<b style="color: #ff4d2d">月租￥${item.acceptorder.money}</b></span>
                                                <span style="margin: 0px 0px 0px 10px;">租用时间：<b style="color: #ff4d2d">${item.acceptorder.number}月</b></span>
                                            </c:otherwise>
                                        </c:choose>
                                        <span style="margin: 0px 0px 0px 10px;">库存：<b style="color: #ff4d2d">${item.amount-item.outamount}/${item.amount}</b></span>
                                        <span style="margin: 0px 0px 0px 10px;">需要押金：<b style="color: #ff4d2d">￥${item.moneyamount}</b></span>
                                        <span style="margin: 0px 0px 0px 10px;">区域：<b style="color: #ff4d2d">${item.city}</b></span>
                                        <span style="margin: 0px 0px 0px 10px;">地址：<a href="/server/detail/${item.orderId}/map" style="color: #ff4d2d">${item.address}</a></span>
                                    </div>
                                    <c:choose>
                                        <c:when test="${item.acceptorder.acceptstate==1}">
                                            <a href="/server/${item.orderId}/detail" class="readmore">查看资源</a>
                                        </c:when>
                                        <c:when test="${item.acceptorder.acceptstate==2}">
                                            <a href="#" onclick="startMoney(${item.acceptorder.id},${pagerList.currentPage})"
                                               title="租用开始时则开始计算租用时间" class="readmore">开始计费</a>
                                        </c:when>
                                        <c:when test="${item.acceptorder.acceptstate==3}">
                                            <a href="#" onclick="startMoney(${item.acceptorder.id},${pagerList.currentPage})"
                                               title="物品使用完成时应及时归还，避免影响信誉分及多余扣费" class="readmore">归还物品</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="/server/${item.orderId}/detail" class="readmore">再次抢单</a>
                                        </c:otherwise>
                                    </c:choose>

                                </ul>
                                <p class="autor">
                                    <c:choose>
                                        <c:when test="${item.acceptorder.acceptstate==-1}">
                                            <span>状态：<a>被拒绝</a></span>
                                            <span>&nbsp;拒绝时间：${item.acceptorder.backtime}</span>
                                        </c:when>
                                        <c:when test="${item.acceptorder.acceptstate==0}">
                                            <span>状态：<a>已取消</a></span>
                                            <span>&nbsp;取消时间：${item.acceptorder.backtime}</span>
                                        </c:when>
                                        <c:when test="${item.acceptorder.acceptstate==1}">
                                            <span>状态：<a>待通过</a></span>
                                            <span>&nbsp;抢单时间：${item.acceptorder.accepttime}</span>
                                        </c:when>
                                        <c:when test="${item.acceptorder.acceptstate==2}">
                                            <span>状态：<a>待获取资源</a></span>
                                            <span>&nbsp;通过时间：${item.acceptorder.suretime}</span>
                                        </c:when>
                                        <c:when test="${item.acceptorder.acceptstate==3}">
                                            <span>状态：<a>已获取租用中</a></span>
                                            <span>&nbsp;获取时间：${item.acceptorder.updatetime}</span>
                                        </c:when>
                                        <c:when test="${item.acceptorder.acceptstate==4}">
                                            <span>状态：<a>已归还</a></span>
                                            <span>&nbsp;归还时间：${item.acceptorder.finishtime}</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span>状态：<a>待评价</a></span>
                                            <span>&nbsp;完成时间：${item.acceptorder.finishtime}</span>
                                        </c:otherwise>
                                    </c:choose>
                                </p>
                                <hr />
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <h1 align="center">未预定资源服务订单</h1>
                    </c:otherwise>
                </c:choose>
            </div>
            </div>
            <div class="clear "></div>
            <!--分页 -->
            <div id="list_nav">
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
                            <c:when test="${k==(pagerList.currentPage-3) || k == (pagerList.currentPage + 3)}">
                                <li><a>…</a></li>
                            </c:when>
                            <c:when test="${k==pagerList.currentPage}">
                                <li class="am-active"><a>${k}<span class="sr-only"></span></a></li>
                            </c:when>
                            <c:when test="${k < pagerList.currentPage - 3 || k > pagerList.currentPage + 3}">

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
            <div style="padding: 20px;"></div>
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
<script src="/js/jquery-1.7.2.min.js"></script>
<link rel="stylesheet" href="/css/alert.css"><!-- 弹窗  -->
<script src="/js/alert.js"></script>
<script type="text/javascript " src="/basic/js/quick_links.js "></script>
<script>

    function startMoney(acceptId,pageNum) {
        var url = "/accept/"+acceptId+"/dogetgoods";
        $.ajax({
            type : "POST",
            url: url,
            contentType : "application/json;charset=utf-8",
            dataType : "text",
            error : function() {
                $.myToast("请求失败，请重试！");
            },
            success : function (data) {
                console.log(data);
                if (data=="update_success") {
                    $.myToast("确认租用物品，开始计费！");
                    window.location.href="/server/myaccept/list?pageNum="+pageNum;
                }else{
                    $.myToast("操作失败，请稍后再试！");
                }
            }
        });
    }
</script>
</body>

</html>
