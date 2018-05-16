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

    <title>重新上架资源服务</title>

    <link href="/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

    <link href="/css/personal.css" rel="stylesheet" type="text/css">
    <link href="/css/infstyle.css" rel="stylesheet" type="text/css">
    <script src="/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script src="/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
    <link href="/css/stepstyle.css" rel="stylesheet" type="text/css">
</head>
<%
    NowUser nowUser = new NowUser();
    if (request.getSession().getAttribute("nowUser") != null) {
        nowUser = (NowUser) request.getSession().getAttribute("nowUser");
    }

%>
<body onload="init()">
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

                <!--搜索 start-->
                <jsp:include page="search.jsp"></jsp:include>
                <!--搜索 end-->
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

            <div class="user-info">
                <!--标题 -->
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><a href="/index" style="color: #0a628f">首页&nbsp;</a> >&nbsp;
                        <%--<a style="color: #0a628f" href="/index_user">服务中心&nbsp;</a> >&nbsp;--%>
                        <strong class="am-text-danger am-text-lg">发布资源服务</strong> /
                        <small>Server&nbsp;add</small>
                    </div>
                </div>
                <hr/>

                <div>
                    <p style="float:left;width: auto;color: #818482">
                        <input style="visibility: hidden" value="${moneyInfo}" id="moneyInfo">
                        发布资源服务需要扣除20余额的保障金，您当前的余额为<b style="color: black">[${moneyInfo}￥]</b>,请确保余额充足，余额会在订单服务完成后平台会自动归还。
                    </p>
                </div>
                <!--个人信息 -->
                <div class="info-main">
                    <form class="am-form am-form-horizontal" enctype="multipart/form-data"  action="/server/mysend/doupload" method="post" onsubmit="return checkData()">
                        <div class="clearfix"></div>
                        <input style="visibility: hidden" value="${orderUserDto.order.id}" name="orderId">
                        <div class="am-form-group">
                            <label for="ordertype" class="am-form-label">类型</label>
                            <div class="am-form-content birth">
                                <div class="birth-select2">
                                    <select data-am-selected id="ordertype" name="ordertype">
                                        <c:choose>
                                            <c:when test="${orderTypeList.size()>0}">
                                                <c:forEach items="${orderTypeList}" var="item">
                                                    <c:choose>
                                                        <c:when test="${item.typename==orderUserDto.orderTypeName}'}">
                                                            <option value="${item.id}" selected>${item.typename}</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value="${item.id}">${item.typename}</option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="0">没有类型</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="city" class="am-form-label">区域城市</label>
                            <div class="am-form-content birth">
                                <div class="birth-select2">
                                    <select data-am-selected id="city" name="city">
                                        <option value="${orderUserDto.order.city}">${orderUserDto.order.city}</option>
                                        <option value="广州市">广州</option>
                                        <option value="深圳市">深圳</option>
                                        <option value="江门市">江门</option>
                                        <option value="中山市">中山</option>
                                        <option value="湛江市">湛江</option>
                                        <option value="珠海市">珠海</option>
                                        <option value="汕头市">汕头</option>
                                        <option value="佛山市">佛山</option>
                                        <option value="茂名市">茂名</option>
                                        <option value="阳江市">阳江</option>
                                        <option value="清远市">清远</option>
                                        <option value="东莞市">东莞</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="name" class="am-form-label">资源名字</label>
                            <div class="am-form-content">
                                <input type="text" id="name" name="name" placeholder="长度不能超过20个汉字"
                                       value="${orderUserDto.order.foodname}"
                                       maxlength="20" required>
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="amount" class="am-form-label">资源库存</label>
                            <div class="am-form-content">
                                <input type="text" id="amount" name="amount" placeholder="资源库存"
                                       value="${orderUserDto.order.amount}"
                                       maxlength="8" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" required>
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="address" class="am-form-label">资源位置</label>
                            <div class="am-form-content">
                                <input type="text" id="address" name="address" placeholder="例：江门市蓬江区仓后街五邑大学"
                                       value="${orderUserDto.order.address}"
                                       maxlength="80" required>
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label  class="am-form-label">资源定位</label>
                            <div class="am-form-content">
                                <p ><a href="/server/map"><i class="am-icon-map-marker"></i>改定位</a></p>
                                <small>资源定位成功后，返回该页面继续填写</small>
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="money" class="am-form-label">押金￥</label>
                            <div class="am-form-content">
                                <input type="text" id="money" name="money" placeholder="接单者需要扣除的押金<300￥"
                                       value="${orderUserDto.order.moneyamount}"
                                       maxlength="8" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" required>
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="dayMoney" class="am-form-label">日租金￥</label>
                            <div class="am-form-content">
                                <input type="text" id="dayMoney" name="dayMoney" placeholder="每日租金"
                                       value="${orderUserDto.order.daymoney}"
                                       maxlength="8" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" required>
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="dayNumber" class="am-form-label">可租天数</label>
                            <div class="am-form-content">
                                <input type="text" id="dayNumber" name="dayNumber" placeholder="若不可按天租用，可租天数为0即可"
                                       value="${orderUserDto.order.daynumber}"
                                       maxlength="8" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" required>
                                <small>若不可按天租用，可租天数为0即可</small>
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="monthMoney" class="am-form-label">月租金￥</label>
                            <div class="am-form-content">
                                <input type="text" id="monthMoney" name="monthMoney" placeholder="每月租金"
                                       value="${orderUserDto.order.monthmoney}"
                                       maxlength="8" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" required>
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="monthNumber" class="am-form-label">可租月数</label>
                            <div class="am-form-content">
                                <input type="text" id="monthNumber" name="monthNumber" placeholder="若不可按月租用，可租月数为0即可"
                                       value="${orderUserDto.order.monthnumber}"
                                       maxlength="8" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" required>
                                <small>若不可按月租用，可租月数为0即可</small>
                            </div>
                        </div>
                        <div class="am-form-group" style="height: auto;">
                            <label for="detail" class="am-form-label">详情备注</label>
                            <div class="am-form-content">
                                <textarea type="text" id="detail" name="detail" placeholder="长度不能超过120个汉字"
                                          maxlength="120" rows="4" required>${orderUserDto.order.orderdetail}</textarea>
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="username" class="am-form-label">联系人</label>
                            <div class="am-form-content">
                                <input id="username" name="username" placeholder="服务联系人姓名/称呼" type="text" maxlength="20"
                                       value="${orderUserDto.order.callname}" required>
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="userphone" class="am-form-label">联系电话</label>
                            <div class="am-form-content">
                                <input id="userphone" name="userphone" placeholder="服务联系人的联系方式" type="text" maxlength="20"
                                       value="${orderUserDto.order.callphone}"
                                       onkeyup="this.value=this.value.replace(/[^-0-9]/g,'')" required>
                            </div>
                        </div>
                        <div class="authenticationPic">
                            <p class="title">上传资源图片</p>
                            <p class="tip">请按要求上传资源图片</p>
                            <ul class="cardlist">
                                <li>
                                    <div class="cardPic">
                                        <input id="file1" type="file" class="inputPic" allowexts="gif,jpeg,jpg,png,bmp" accept="image/*"
                                               name="file" onchange="c1()" accept=".jpg,.png,.jpeg,.JPG,.PNG,.JPEG,">
                                        <img src="/resources/img/${orderUserDto.order.picture}" id="show1">
                                        <div class="cardText"><i class="am-icon-plus"></i>
                                            <p>资源图片</p>
                                        </div>
                                        <p class="titleText">图片</p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="authenticationPic">
                            <p class="title">上传资源详情介绍图片</p>
                            <p class="tip">请按要求上传资源详情介绍图片</p>
                            <ul class="cardlist">
                                <li>
                                    <div class="cardPic">
                                        <input id="file2" type="file" class="inputPic" allowexts="gif,jpeg,jpg,png,bmp" accept="image/*"
                                               name="file" onchange="c2()" accept=".jpg,.png,.jpeg,.JPG,.PNG,.JPEG,">
                                        <img src="/resources/img/${orderUserDto.order.infopicture1}" id="show2">
                                        <div class="cardText"><i class="am-icon-plus"></i>
                                            <p>详情图片1</p>
                                        </div>
                                        <p class="titleText">图片1</p>
                                    </div>
                                </li>
                                <li>
                                    <div class="cardPic">
                                        <input id="file3" type="file" class="inputPic" allowexts="gif,jpeg,jpg,png,bmp" accept="image/*"
                                               name="file" onchange="c3()" accept=".jpg,.png,.jpeg,.JPG,.PNG,.JPEG,">
                                        <img src="/resources/img/${orderUserDto.order.infopicture2}" id="show3">
                                        <div class="cardText"><i class="am-icon-plus"></i>
                                            <p>详情图片2</p>
                                        </div>
                                        <p class="titleText">图片2</p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="info-btn">
                            <input value="确认上架" class="am-btn am-btn-danger" type="submit">
                        </div>

                    </form>
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
                    <li><a href="/server/mysend/list">发布中</a></li>
                    <li> <a href="/server/mysend/finishlist">已下架</a></li>
                    <li> <a href="/server/myaccept/list">租用中</a></li>
                    <li> <a href="/server/myaccept/finishlist">租用完成</a></li>
                </ul>
            </li>
        </ul>

    </aside>
</div>
<%--<script language="javascript" type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>--%>
<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
<link rel="stylesheet" href="/css/alert.css"><!-- 弹窗  -->
<script src="/js/alert.js"></script>
<script type="text/javascript">
    function c1() {
        var r = new FileReader();
        f = document.getElementById('file1').files[0];
        r.readAsDataURL(f);
        r.onload = function (e) {
            document.getElementById('show1').src = this.result;
        };
    }
    function c2() {
        var r = new FileReader();
        f = document.getElementById('file2').files[0];
        r.readAsDataURL(f);
        r.onload = function (e) {
            document.getElementById('show2').src = this.result;
        };
    }
    function c3() {
        var r = new FileReader();
        f = document.getElementById('file3').files[0];
        r.readAsDataURL(f);
        r.onload = function (e) {
            document.getElementById('show3').src = this.result;
        };
    }

    function checkData() {
        var moneyInfo = $("#moneyInfo").val().replace(" ", "");
        var money = $("#money").val().replace(" ", "");
        var dayNumber = $("#dayNumber").val().replace(" ", "");
        var monthNumber = $("#monthNumber").val().replace(" ", "");
        if (parseInt(moneyInfo) < 20) {
            $.myToast("余额不足，不可发布订单");
            return false;
        }
        if (parseInt(dayNumber) <= 0 && parseInt(monthNumber) <= 0) {
            $.myToast("可租天数和月数不能同时为0");
            return false;
        }
        if (parseInt(money) >= 300) {
            $.myToast("押金不能超过300");
            $("#money").focus();
            return false;
        }
        return true;
    }

    function init() {
        var moneyInfo = $("#moneyInfo").val().replace(" ", "");
        if (parseInt(moneyInfo) < 20) {
            $.myToast("余额不足，不可发布订单");
        }

    }
</script>
</body>

</html>
