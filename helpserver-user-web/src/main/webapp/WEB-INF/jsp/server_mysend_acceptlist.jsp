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
    <script type="text/javascript" src="/js/server_mysend_acceptlist.js"></script>
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
                    <a href="/map" target="_top">定位：<i class="am-icon-map-marker"></i><%=nowUser.getLocation()%></a>
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
                <p class="title font-normal"><input id="orderIdStr" value="${orderinfo.id}" style="visibility: hidden"/>
                    <span class="total fl">物品${orderinfo.foodname}一共有<strong class="num">${pagerList.totalRecord}</strong>个资源服务预抢单</span>
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
                                <h3><a href="/server/${item.acceptorder.accepterid}/userinfo" style="color: #0a628f">抢单者：${item.acceptUserName}</a></h3>
                                抢单时间：${item.acceptorder.accepttime}
                                <figure><a href="/server/${item.acceptorder.accepterid}/userinfo">
                                    <img style="width: 72px;height: 72px;" src="/resources/img/${item.acceptUserIcon}"></a>
                                </figure>
                                <ul>
                                    <div class="autor1">
                                        <span>信誉分：<b style="color: #ff4d2d">${item.acceptUserCredit}</b></span>
                                        <c:choose>
                                            <c:when test="${item.acceptorder.moneytype==0}">
                                                <span style="margin: 0px 0px 0px 10px;">计费方式：<b style="color: #ff4d2d">日租￥${item.acceptorder.money}</b></span>
                                                <span style="margin: 0px 0px 0px 10px;">租用时间：<b style="color: #ff4d2d">${item.acceptorder.gettype}天</b></span>
                                            </c:when>
                                            <c:otherwise>
                                                <span style="margin: 0px 0px 0px 10px;">计费方式：<b style="color: #ff4d2d">月租￥${item.acceptorder.money}</b></span>
                                                <span style="margin: 0px 0px 0px 10px;">租用时间：<b style="color: #ff4d2d">${item.acceptorder.gettype}月</b></span>
                                            </c:otherwise>
                                        </c:choose>
                                        <span style="margin: 0px 0px 0px 10px;">租用数量：<b style="color: #ff4d2d">${item.acceptorder.number}</b></span>
                                        <span style="margin: 0px 0px 0px 10px;">预计费用：<b style="color: #ff4d2d">
                                            ￥${item.acceptorder.number*item.acceptorder.money*item.acceptorder.gettype}</b></span>
                                        <span style="margin: 0px 0px 0px 10px;">库存：<b style="color: #ff4d2d">${orderinfo.amount-orderinfo.outamount}/${orderinfo.amount}</b></span>
                                        <span style="margin: 0px 0px 0px 10px;">需要押金：<b style="color: #ff4d2d">￥${orderinfo.moneyamount}</b></span>
                                        <span style="margin: 0px 0px 0px 10px;">区域：<b style="color: #ff4d2d">${orderinfo.city}</b></span>
                                        <c:choose>
                                            <c:when test="${orderinfo.orderstate == 1 }">
                                                <span style="margin: 0px 0px 0px 10px;">资源状态：<b style="color: #ff4d2d">发布中</b></span>
                                            </c:when>
                                            <c:when test="${orderinfo.orderstate == 1 }">
                                                <span style="margin: 0px 0px 0px 10px;">资源状态：<b style="color: #ff4d2d">已下架</b></span>
                                            </c:when>
                                            <c:otherwise>
                                                <span style="margin: 0px 0px 0px 10px;">资源状态：<b style="color: #ff4d2d">已禁止</b></span>
                                            </c:otherwise>
                                        </c:choose>

                                        <c:choose>
                                            <c:when test="${item.acceptorder.acceptstate==3 &&item.acceptorder.datestate == 0 }">
                                                <span style="margin: 0px 0px 0px 10px;">状态：<b style="color: #ff4d2d">已超期</b></span>
                                            </c:when>
                                            <c:when test="${item.acceptorder.acceptstate==3 && item.acceptorder.datestate==1}">
                                                <span style="margin: 0px 0px 0px 10px;">状态：<b style="color: #12c34e">正常租用</b></span>
                                            </c:when>
                                            <c:otherwise>

                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <c:choose>
                                        <c:when test="${item.acceptorder.acceptstate==-1}">
                                            <a href="#" onclick="agreeAccept(1,${item.acceptorder.id},${item.acceptorder.number}
                                                    ,${orderinfo.amount-orderinfo.outamount},${orderinfo.id},${pagerList.currentPage})"
                                               class="readmore">通过抢单</a>
                                        </c:when>
                                        <c:when test="${item.acceptorder.acceptstate==1}">
                                            <a href="#" onclick="agreeAccept(1,${item.acceptorder.id},${item.acceptorder.number}
                                                    ,${orderinfo.amount-orderinfo.outamount},${orderinfo.id},${pagerList.currentPage})"
                                               class="readmore">通过抢单</a>
                                            <a href="#" onclick="agreeAccept(0,${item.acceptorder.id},${item.acceptorder.number}
                                                    ,${orderinfo.amount-orderinfo.outamount},${orderinfo.id},${pagerList.currentPage})"
                                               class="readmore" style="margin-right: 10px;">拒绝抢单</a>
                                        </c:when>
                                        <c:when test="${item.acceptorder.acceptstate==2}">
                                            <a href="#" onclick="startMoney(${item.acceptorder.id},${orderinfo.id},${pagerList.currentPage})" title="租用开始时则开始计算租用时间" class="readmore">开始计费</a>
                                        </c:when>
                                        <c:when test="${item.acceptorder.acceptstate==5}">
                                                <c:if test="${item.isOrNotComment==0}">
                                                    <a href="/server/mysend/${item.acceptorder.id}/tocomment" class="readmore">去评价</a>
                                                </c:if>
                                        </c:when>
                                        <c:otherwise>

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
                                            <span>状态：<a>租用中</a></span>
                                            <span>&nbsp;获取时间：${item.acceptorder.updatetime}</span>
                                        </c:when>
                                        <c:when test="${item.acceptorder.acceptstate==4}">
                                            <span>状态：<a>已归还待付款</a></span>
                                            <span>&nbsp;归还时间：${item.acceptorder.finishtime}</span>
                                        </c:when>
                                        <c:when test="${item.acceptorder.acceptstate==5}">
                                            <span>状态：<a>已收款</a></span>
                                            <span>&nbsp;收款时间：${item.acceptorder.backtime}</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span>状态：<a>已完成</a></span>
                                            <span>&nbsp;完成时间：${item.acceptorder.finishtime}</span>
                                        </c:otherwise>
                                    </c:choose>
                                </p>
                                <hr />
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <h1 align="center">未有预定资源服务订单</h1>
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
    <%--<li><a href="/index_myorder"><i class="am-icon-shopping-basket"></i>订单</a></li>--%>
    <li><a href="/index_user"><i class="am-icon-user"></i>我的</a></li>
</div>
<!--菜单 -->

<script src="/js/jquery-1.7.2.min.js"></script>
<link rel="stylesheet" href="/css/alert.css"><!-- 弹窗  -->
<script src="/js/alert.js"></script>
<script type="text/javascript " src="/basic/js/quick_links.js "></script>
<script>
    function agreeAccept(state, acceptId,number,amount,orderId,pageNum) {
        if(state=='1' && (parseInt(amount) < parseInt(number))) {
            $.myToast("库存不足,无法同意该抢单");
        }else{
            var url = "/server/mysend/acceptlist/doagree?state="+state+"&acceptId="+acceptId;
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
                    if (data=="agree_success") {
                        $.myToast("同意抢单成功！");
                        window.location.href="/server/mysend/"+orderId+"/acceptlist?pageNum="+pageNum;
                    } else if (data=="disagree_success") {
                        $.myToast("拒绝抢单成功，押金已归还！");
                        window.location.href="/server/mysend/"+orderId+"/acceptlist?pageNum="+pageNum;
                    } else{
                        $.myToast("操作失败，请稍后再试！");

                    }
                }
            });
        }
    }

    function startMoney(acceptId,orderId,pageNum) {
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
                    window.location.href="/server/mysend/"+orderId+"/acceptlist?pageNum="+pageNum;
                }else{
                    $.myToast("操作失败，请稍后再试！");

                }
            }
        });
    }
</script>
</body>

</html>
