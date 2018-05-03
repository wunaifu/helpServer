<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wunaifu
  Date: 2018/1/28
  Time: 22:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>金币提现为余额</title>

    <link href="/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

    <link href="/css/personal.css" rel="stylesheet" type="text/css">
    <link href="/css/stepstyle.css" rel="stylesheet" type="text/css">
    <%--<link href="/css/infstyle.css" rel="stylesheet" type="text/css">--%>

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

            <div class="am-cf am-padding">
                <div class="am-fl am-cf"><a href="/index" style="color: #0a628f">首页&nbsp;</a> >&nbsp;
                    <a style="color: #0a628f" href="/index_user">个人中心&nbsp;</a> >&nbsp;
                    <strong class="am-text-danger am-text-lg">金币提现为余额</strong> /
                    <small>Gold&nbsp;ToMoney</small>
                </div>
            </div>
            <hr/>
            <div class="authentication">
                <form action="/gold/dotomoney" onsubmit="return suborder()"
                      enctype="multipart/form-data" method="post">
                    <p class="tip"><a href="/gold/info" style="color: #0a628f;font-size: 17px;">金币收支历史>></a></p>
                    <p class="tip"><a href="/gold/paybymoney" style="color: #0a628f;font-size: 17px;">充值金币>></a></p>
                    <div class="authenticationInfo">
                        <p class="title">填写提现为余额的金币数  可用金币${gold.goldamount}个</p>
                        <div class="am-form-group">
                            <label for="pay" class="am-form-label">提现金币数</label>
                            <div class="am-form-content">
                                <input type="tel" id="pay" name="pay" placeholder="100个金币=10￥,100的倍数"
                                       onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" maxlength="3">
                                <input type="text" value="${gold.goldamount}" id="money" style="visibility: hidden">
                            </div>
                        </div>
                    </div>

                    <div class="info-btn">
                        <input style="width: 100%" type="submit" class="am-btn am-btn-danger" value="提交">
                    </div>
                </form>
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

</body>
<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
<link rel="stylesheet" href="/css/alert.css"><!-- 弹窗  -->
<script src="/js/alert.js"></script>
<script type="text/javascript">
    function c2() {
        var r = new FileReader();
        f = document.getElementById('file2').files[0];
        r.readAsDataURL(f);
        r.onload = function (e) {
            document.getElementById('show2').src = this.result;
        };
    }

    function suborder() {
        var pay = $("#pay").val().replace(" ", "");
        var money = $("#money").val().replace(" ", "");
        if (pay == '') {
            $.myToast("请输入提现金币数");
            $("#pay").focus();
            return false;
        }
        if ( parseInt(pay) <= 0) {
            $.myToast("提现金币数需是100的倍数");
            $("#pay").focus();
            return false;
        }
        if ( parseInt(pay) > parseInt(money)) {
            $.myToast("已超过拥有的金币数");
            $("#pay").focus();
            return false;
        }
        if ( parseInt(pay) > 0 && (parseInt(pay)%100 != 0) ) {
            $.myToast("提现金币数需是100的倍数");
            $("#pay").focus();
            return false;
        }
        return true;
    }
</script>
</html>
