<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018-01-28
  Time: 18:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>全部分类</title>
    <link href="/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
    <link href="/basic/css/demo.css" rel="stylesheet" type="text/css" />
    <link href="/css/sortstyle.css" rel="stylesheet" type="text/css" />
    <script src="/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
</head>

<body>

<div class="hmtop">
    <!-- top start -->
    <jsp:include page="top.jsp"></jsp:include>
    <!-- top end -->
    <div class="clear"></div>
</div>



<!--主体-->

<div id="nav" class="navfull">
    <div class="area clearfix">
        <div class="category-content" id="guide_2">
            <div class="long-title"><span class="all-goods">全部分类</span><span id="meauBack"><a href="/index">返回</a></span></div>
            <div class="category">
                <ul class="category-list" id="js_climit_li">
                <c:choose>
                    <c:when test="${orderTypeDtoList.size()>0}">
                        <c:forEach items="${orderTypeDtoList}" var="bigitem" varStatus="status">
                            <c:choose>
                                <c:when test="${status.index==0}">
                                    <li class="appliance js_toggle relative first selected">
                                </c:when>
                                <c:when test="${status.index==orderTypeDtoList.size()}">
                                    <li class="appliance js_toggle relative last">
                                </c:when>
                                <c:otherwise>
                                    <li class="appliance js_toggle relative">
                                </c:otherwise>
                            </c:choose>
                        <div class="category-info">
                            <h3 class="category-name b-category-name"><i><img src="/images/cookies.png"></i>
                                <a class="ml-22" title="${bigitem.bigtype.typename}">${bigitem.bigtype.typename}</a></h3>
                            <em>&gt;</em></div>
                        <div class="menu-item menu-in top">
                            <div class="area-in">
                                <div class="area-bg">
                                    <div class="menu-srot">
                                        <div class="brand-side">
                                            <dl class="dl-sort"><dt><span>为您推荐</span></dt>
                                                <img src="/images/TJ.jpg">
                                            </dl>
                                        </div>
                                        <div class="sort-side">
                                            <dl class="dl-sort">
                                                <dt><span title="${bigitem.bigtype.typename}">${bigitem.bigtype.typename}</span></dt>
                                            <c:choose>
                                                <c:when test="${bigitem.ordertypeList.size()>0}">
                                                    <c:forEach items="${bigitem.ordertypeList}" var="typeitem">
                                                            <dd><a title="${typeitem.typename}" href="/type/server/${typeitem.id}/search"><span>${typeitem.typename}</span></a></dd>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <dl class="dl-sort">
                                                        <dd><a title="没有子类型" href="#"><span>没有子类型</span></a></dd>
                                                    </dl>
                                                </c:otherwise>
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
                        <li class="appliance js_toggle relative first">
                            <div class="category-info">
                                <h3 class="category-name b-category-name"><i><img src="/images/package.png"></i><a class="ml-22" title="其他">其他</a></h3>
                                <em>&gt;</em></div>
                            <div class="menu-item menu-in top">
                                <div class="area-in">
                                    <div class="area-bg">
                                        <div class="menu-srot">
                                            <div class="brand-side">
                                                <dl class="dl-sort"><dt><span>为您推荐</span></dt>
                                                    <img src="/images/TJ.jpg">
                                                </dl>
                                            </div>
                                            <div class="sort-side">
                                                <dl class="dl-sort">
                                                    <dt><span title="其他">其他</span></dt>
                                                    <dd><a title="其他" href="#"><span>其他</span></a></dd>
                                                </dl>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </li>
                    </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>

    </div>
</div>
<script type="text/javascript">
    $(document).ready(function() {
        $("li").click(function() {
            $(this).addClass("selected").siblings().removeClass("selected");
        })
    })
</script>
<div class="clear"></div>
<!--引导 -->
<div class="navCir">
    <li><a href="/index"><i class="am-icon-home "></i>首页</a></li>
    <li class="active"><a href="/index_type"><i class="am-icon-list"></i>分类</a></li>
    <%--<li><a href="/index_myorder"><i class="am-icon-shopping-basket"></i>订单</a></li>--%>
    <li><a href="/index_user"><i class="am-icon-user"></i>我的</a></li>
</div>
</body>

</html>
