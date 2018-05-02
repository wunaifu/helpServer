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
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>资源租用详情页面</title>

    <link href="/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css"/>
    <link href="/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css"/>
    <link href="/basic/css/demo.css" rel="stylesheet" type="text/css"/>
    <link type="text/css" href="/css/optstyle.css" rel="stylesheet"/>
    <link type="text/css" href="/css/style.css" rel="stylesheet"/>

    <script type="text/javascript" src="/basic/js/jquery-1.7.min.js"></script>
    <script type="text/javascript" src="/basic/js/quick_links.js"></script>

    <script type="text/javascript" src="/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
    <script type="text/javascript" src="/js/jquery.imagezoom.min.js"></script>
    <script type="text/javascript" src="/js/jquery.flexslider.js"></script>
    <script type="text/javascript" src="/js/list.js"></script>
    <script type="text/javascript" src="/js/server_mysenddetail_acceptlist.js"></script>

</head>
<%
    NowUser nowUser = new NowUser();
    if (request.getSession().getAttribute("nowUser") != null) {
        nowUser = (NowUser) request.getSession().getAttribute("nowUser");
    }
%>
<body>
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
        <div class="topMessage favorite">
            <div class="menu-hd"><a href="#" target="_top"><i
                    class="am-icon-heart am-icon-fw"></i><span>消息</span></a>
            </div>
        </div>
    </ul>
</div>

<!--悬浮搜索框-->

<div class="nav white">
    <div class="logo" style="margin-top:18px;font-size: 11px;width: 60px;">
        <a  href="/map"><%--<img src="/images/logo1.png"/>--%><i class="am-icon-map-marker"
                                                                style="color: #ff4d2d"></i><%=nowUser.getLocation()%>
        </a></div>
    <div class="logoBig">
        <li><img src="/images/logobig.png"/></li>
    </div>

    <!--搜索 start-->
    <jsp:include page="search.jsp"></jsp:include>
    <!--搜索 end-->
</div>

<div class="clear"></div>
<b class="line"></b>
<div class="listMain">
    <!--分类-->
    <div class="nav-table">
        <!--头 start-->
        <jsp:include page="midtop.jsp"></jsp:include>
        <!--头 end-->
    </div>
    <ol class="am-breadcrumb am-breadcrumb-slash">
        <li><a href="/index">首页</a></li>
        <li><a >资源服务</a></li>
        <li class="am-active">详情</li>
    </ol>
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
    <div class="scoll">
        <section class="slider">
            <div class="flexslider">
                <ul class="slides">
                    <li>
                        <img src="/resources/img/${orderUserDto.order.picture}" title="pic" />
                    </li>
                </ul>
            </div>
        </section>
    </div>

    <!--放大镜-->

    <div class="item-inform">
        <div class="clearfixLeft" id="clearcontent">

            <div class="box">
                <script type="text/javascript">
                    $(document).ready(function() {
                        $(".jqzoom").imagezoom();
                        $("#thumblist li a").click(function() {
                            $(this).parents("li").addClass("tb-selected").siblings().removeClass("tb-selected");
                            $(".jqzoom").attr('src', $(this).find("img").attr("mid"));
                            $(".jqzoom").attr('rel', $(this).find("img").attr("big"));
                        });
                    });
                </script>

                <div class="tb-booth tb-pic tb-s310">
                    <a href="/resources/img/${orderUserDto.order.picture}">
                        <img src="/resources/img/${orderUserDto.order.picture}" alt="细节展示放大镜特效"
                             rel="/resources/img/${orderUserDto.order.picture}" class="jqzoom" /></a>
                </div>
                <ul class="tb-thumb" id="thumblist">
                </ul>
            </div>

            <div class="clear"></div>
        </div>

        <div class="clearfixRight">

            <!--规格属性-->
            <!--名称-->
            <div class="tb-detail-hd">
                <h1>
                    ${orderUserDto.order.foodname}
                </h1>
            </div>
            <div class="tb-detail-list">
                <!--价格-->
                <div class="tb-detail-price">
                    <c:if test="${orderUserDto.order.daynumber>0}">
                    <li class="price iteminfo_price">
                        <dt>日租价</dt><dd><em>¥</em><b class="sys_item_price">${orderUserDto.order.daymoney}.00</b> </dd>
                        <span>可租${orderUserDto.order.daynumber}天</span>
                    </li>
                    </c:if>
                    <c:if test="${orderUserDto.order.monthnumber>0}">
                    <li class="price iteminfo_mktprice">
                        <dt>月租价</dt><dd><em>¥</em><b class="sys_item_price">${orderUserDto.order.monthmoney}.00</b></dd>
                        <span>可租${orderUserDto.order.monthnumber}月</span>
                    </li>
                    </c:if>
                    <div class="clear"></div>
                </div>
                <!--销量-->
                <ul class="tm-ind-panel">
                    <li class="tm-ind-item tm-ind-sellCount canClick">
                        <div class="tm-indcon"><span class="tm-label">押金</span><span class="tm-count">${orderUserDto.order.moneyamount}</span></div>
                    </li>
                    <li class="tm-ind-item tm-ind-sumCount canClick">
                        <div class="tm-indcon"><span class="tm-label">库存</span><span class="tm-count">
                        ${orderUserDto.order.amount - orderUserDto.order.outamount}/${orderUserDto.order.amount}</span></div>
                    </li>
                    <li class="tm-ind-item tm-ind-reviewCount canClick tm-line3">
                        <div class="tm-indcon">
                            <a href="/server/${orderUserDto.order.senderid}/userinfo">
                                <span class="tm-label">资源主人：</span><span class="tm-count">${orderUserDto.senderName}</span></a>
                        </div>
                    </li>
                </ul>
<div class="clear"></div>
<!--活动	-->
<div class="shopPromotion gold">
    <div class="hot">
        <dt class="tb-metatit">资源地址</dt>
        <div class="gold-list">
            <a href="/server/detail/${orderUserDto.order.id}/map"><p style="font-size: smaller;">${orderUserDto.order.address}</p></a>
        </div>
    </div>
    <div class="clear"></div>
</div>
</div>

<div class="pay">
    <div class="pay-opt">
        <a href="/index"><span class="am-icon-home am-icon-fw">首页</span></a>
        <a href="/server/mysend/${orderUserDto.order.id}/update"><span class="am-icon-heart am-icon-fw">修改</span></a>

    </div>
    <li>
        <div class="clearfix tb-btn tb-btn-buy">
            <a title="下架该资源" href="/server/mysend/${orderUserDto.order.id}/download">立即下架</a>
        </div>
    </li>
    <li>
        <div class="clearfix tb-btn tb-btn-basket">
            <a title="去查看抢单列表" href="/server/mysend/${orderUserDto.order.id}/acceptlist" ><i></i>抢单列表</a>
        </div>
    </li>
</div>

</div>

<div class="clear"></div>

</div>

<div class="clear"></div>

<!-- introduce-->

<div class="introduce">
    <div class="browse">
        <div class="mc">
            <ul>
            </ul>
        </div>
    </div>
    <div class="introduceMain">
        <div class="am-tabs" data-am-tabs>
            <ul class="am-avg-sm-3 am-tabs-nav am-nav am-nav-tabs">
                <li class="am-active">
                    <a href="#">
                        <span class="index-needs-dt-txt">资源详情</span></a>
                </li>
                <li>
                    <a href="#">
                        <span class="index-needs-dt-txt">抢单列表</span></a>
                </li>
                <li>
                    <a href="#">
                        <span class="index-needs-dt-txt">全部评价</span></a>
                </li>
            </ul>

            <div class="am-tabs-bd">

                <div class="am-tab-panel am-fade am-in am-active">
                    <div class="J_Brand">

                        <div class="attr-list-hd tm-clear">
                            <h4>相关信息：</h4></div>
                        <div class="clear"></div>
                        <ul id="J_AttrUL">
                            <li title="">资源类型:&nbsp;${orderUserDto.orderTypeName}</li>
                            <li title="">联系人:&nbsp;${orderUserDto.order.callname}</li>
                            <li title="">联系方式：&nbsp;${orderUserDto.order.callphone}</li>
                            <li title="">发布时间：&nbsp;${orderUserDto.order.sendtime}</li>
                            <li title="">详情备注：&nbsp;${orderUserDto.order.orderdetail}</li>
                        </ul>
                        <div class="clear"></div>
                    </div>

                    <div class="details">
                        <div class="attr-list-hd after-market-hd">
                            <h4>资源详情介绍</h4>
                        </div>
                        <div class="twlistNews">
                            <img src="/resources/img/${orderUserDto.order.infopicture1}" />
                            <img src="/resources/img/${orderUserDto.order.infopicture2}" />
                        </div>
                    </div>
                    <div class="clear"></div>

                </div>

                <div class="am-tab-panel am-fade">

                    <div class="tb-r-filter-bar">
                        <b id="orderIdStr" style="visibility: hidden">${orderUserDto.order.id}</b>
                    </div>
                    <div class="clear"></div>

                    <ul class="am-comments-list am-comments-list-flip">
                        <div id="list_tbody">
                        <c:choose>
                            <c:when test="${pagerAccept.dataList.size()>0}">
                                <c:forEach items="${pagerAccept.dataList}" var="item">
                                    <li class="am-comment">
                                        <!-- 评论容器 -->
                                                <a href="/server/${item.acceptorder.accepterid}/userinfo">
                                                    <img class="am-comment-avatar" src="/resources/img/${item.acceptUserIcon}" /> </a>
                                        <div class="am-comment-main">
                                            <header class="am-comment-hd">
                                                <div class="am-comment-meta">
                                                    <a class="am-comment-author">b***1 (匿名)</a>
                                                    抢单于<time datetime="">${item.acceptorder.accepttime}</time>
                                                    &nbsp;&nbsp;信誉分<b style="color: #ff4d2d">${item.acceptUserCredit}</b>
                                                </div>
                                            </header>
                                            <div class="am-comment-bd">
                                                <div class="tb-rev-item " data-id="255776406962">
                                                        <c:choose>
                                                            <c:when test="${item.acceptorder.acceptstate==1}">
                                                                <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                                    状态：抢单中
                                                                </div>
                                                            </c:when>
                                                            <c:when test="${item.acceptorder.acceptstate==2}">
                                                                <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                                    状态：资源租用中
                                                                </div>
                                                                <div class="tb-r-act-bar">
                                                                    开始租用时间：${item.acceptorder.suretime}
                                                                </div>
                                                            </c:when>
                                                            <c:when test="${item.acceptorder.acceptstate==3}">
                                                                <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                                    状态：已完成
                                                                </div>
                                                                <div class="tb-r-act-bar">
                                                                    开始租用时间：${item.acceptorder.suretime}&nbsp;&nbsp;完成时间：${item.acceptorder.finishtime}
                                                                </div>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                                    状态：已取消
                                                                </div>
                                                                <div class="tb-r-act-bar">
                                                                    取消时间：${item.acceptorder.backtime}
                                                                </div>
                                                            </c:otherwise>
                                                        </c:choose>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <h1 align="center">未有人抢单</h1>
                            </c:otherwise>
                        </c:choose>
                        </div>
                    </ul>

                    <div class="clear"></div>

                    <!--分页 -->
                    <div id="list_nav">
                        <ul class="am-pagination am-pagination-left">
                            <c:choose>
                                <c:when test="${pagerAccept.currentPage==1||pagerAccept.totalPage==0}">
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
                                        <a onclick="click_pageNum(${pagerAccept.currentPage-1})">
                                            <span>«</span>
                                        </a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                            <c:forEach var="k" begin="1" end="${pagerAccept.totalPage}">
                                <c:choose>
                                    <c:when test="${k==(pagerAccept.currentPage-4) || k == (pagerAccept.currentPage + 4)}">
                                        <li><a>…</a></li>
                                    </c:when>
                                    <c:when test="${k==pagerAccept.currentPage}">
                                        <li class="am-active"><a>${k}<span class="sr-only"></span></a></li>
                                    </c:when>
                                    <c:when test="${k < pagerAccept.currentPage - 4 || k > pagerAccept.currentPage + 4}">

                                    </c:when>
                                    <c:otherwise>
                                        <li>
                                            <a onclick="click_pageNum(${k})">${k}</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <c:choose>
                                <c:when test="${pagerAccept.currentPage == pagerAccept.totalPage || pagerAccept.totalPage == 0}">
                                    <li class="am-disabled">
                                        <a >
                                            <span >»</span>
                                        </a>
                                    </li>
                                    <li class="am-disabled"><a>尾页</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li>
                                        <a onclick="click_pageNum(${pagerAccept.currentPage+1})">
                                            <span >»</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a onclick="click_pageNum(${pagerAccept.totalPage})">尾页</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>
                    <div class="clear"></div>

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
                                <img class="am-comment-avatar" src="/images/hwbn40x40.jpg" />
                                <!-- 评论者头像 -->
                            </a>

                            <div class="am-comment-main">
                                <!-- 评论内容容器 -->
                                <header class="am-comment-hd">
                                    <!--<h3 class="am-comment-title">评论标题</h3>-->
                                    <div class="am-comment-meta">
                                        <!-- 评论元数据 -->
                                        <a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
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
                        <div class="tb-rate-alert type-attention">购买前请查看该商品的 <a href="#" target="_blank">购物保障</a>，明确您的售后保障权益。</div>
                    </div>

                </div>


            </div>

        </div>

        <div class="clear"></div>

        <!--底部 start-->
        <jsp:include page="footer.jsp"></jsp:include>
        <!--底部 end-->
    </div>

</div>
</div>

</body>
<link rel="stylesheet" href="/css/alert.css"><!-- 弹窗  -->
<script src="/js/alert.js"></script>
<script>
//    function checkAddAccept() {
//
//        var outamount = $("#outamount").val();
//        var daynumber1 = $("#daynumber1").val();
//        var monthnumber1 = $("#monthnumber1").val();
//        var amount = $("#text_box").val();
//        var useTime = $("#text_box1").val();
//        var mymoney = $("#mymoney").val();
//        var moneyamount = $("#moneyamount").val();
//
//        if(parseInt(moneyamount)>parseInt(mymoney)){
//            $.myToast("可用余额不足以抵扣押金");
//            return false;
//        }
//        if(parseInt(amount)<1){
//            $.myToast("租借数量要大于0");
//            return false;
//        }
//        if(parseInt(useTime)<1){
//            $.myToast("租借天数要大于0");
//            return false;
//        }
//
//        if(parseInt(outamount)<parseInt(amount)){
//            $.myToast("租借数量大于可供出借数量");
//            return false;
//        }
//        if ($("#myRadio1").attr("checked")) {
//            if(parseInt(daynumber1)<parseInt(useTime)){
//                $.myToast("租借天数大于可供出借天数");
//                return false;
//            }
//        }
//        if ($("#myRadio2").attr("checked")) {
//            if(parseInt(monthnumber1)<parseInt(useTime)){
//                $.myToast("租借月数大于可供出借月数");
//                return false;
//            }
//        }
//
//    }

</script>
</html>