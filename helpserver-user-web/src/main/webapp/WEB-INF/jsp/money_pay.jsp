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

    <title>账户余额充值</title>

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
                    <strong class="am-text-danger am-text-lg">余额充值</strong> /
                    <small>Money&nbsp;Pay</small>
                </div>
            </div>
            <hr/>
            <div class="authentication">
                <form action="/money/dopay" onsubmit="return suborder()"
                      enctype="multipart/form-data" method="post">
                    <p class="tip"><a href="/money/payhistory" style="color: #0a628f;font-size: 17px;">充值历史>></a></p>
                    <div class="authenticationInfo">
                        <p class="title">填写充值信息</p>
                        <div class="am-form-group">
                            <label for="pay" class="am-form-label">充值金额</label>
                            <div class="am-form-content">
                                <input type="tel" id="pay" name="pay" placeholder="请输入充值金额"
                                       onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" maxlength="3">
                            </div>
                        </div>
                    </div>
                    <div class="authenticationPic">
                        <p class="title">请使用支付宝扫码付款</p>
                        <%--<p class="tip">支付成功后上传付款截图</p>--%>
                        <ul class="cardlist">
                            <li>
                                <div class="cardPic">
                                    <img src="http://localhost:8082/resources/img/${payAccount.payphoto}" width="100%" height="100%">
                                    <p class="titleText">收款图</p>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="authenticationPic">
                        <p class="title">上传付款完成截图</p>
                        <p class="tip">请按要求上传付款完成截图</p>
                        <ul class="cardlist">
                            <li>
                                <div class="cardPic">
                                    <img src="/resources/img/payshotcut.png" style="max-width: 165px;max-height: 259px;">
                                    <div class="cardText"><i class="am-icon-plus"></i>
                                        <p>示例</p>
                                    </div>
                                    <p class="titleText">示例</p>
                                </div>
                            </li>
                            <li>
                                <div class="cardPic">
                                    <input id="file2" type="file" class="inputPic" allowexts="gif,jpeg,jpg,png,bmp"
                                           accept="image/*"
                                           name="file" onchange="c2()" accept=".jpg,.png,.jpeg,.JPG,.PNG,.JPEG,">
                                    <img src="/images/cardbg.jpg" id="show2" style="max-width: 165px;max-height: 259px;">
                                    <div class="cardText"><i class="am-icon-plus"></i>
                                        <p>付款截图</p>
                                    </div>
                                    <p class="titleText">付款截图</p>
                                </div>
                            </li>
                        </ul>
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
        if (pay == '') {
            $.myToast("请输入充值金额");
            $("#pay").focus();
            return false;
        }
        return true;
    }
</script>
</html>
