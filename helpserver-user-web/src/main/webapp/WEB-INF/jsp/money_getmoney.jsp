<%@ page import="com.helpserver.dto.NowUser" %><%--
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

    <title>余额提现</title>

    <%--<link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css">--%>
    <link href="/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

    <link href="/css/personal.css" rel="stylesheet" type="text/css">
    <link href="/css/stepstyle.css" rel="stylesheet" type="text/css">

    <script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
    <script src="/AmazeUI-2.4.2/assets/js/amazeui.js"></script>

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
                    <strong class="am-text-danger am-text-lg">余额提现</strong> /
                    <small>Get&nbsp;Money</small>
                </div>
            </div>
            <hr/>
            <!--进度条-->
            <div class="m-progress">
                <div class="m-progress-list">
							<span class="step-1 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
                                <p class="stage-name">提现到支付宝</p>
                            </span>
                    <span class="step-2 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">2<em class="bg"></em></i>
                                <p class="stage-name">完成</p>
                            </span>
                    <span class="u-progress-placeholder"></span>
                </div>
                <div class="u-progress-bar total-steps-2">
                    <div class="u-progress-bar-inner"></div>
                </div>
            </div>
            <form class="am-form am-form-horizontal" action="/money/dogetmoney" onsubmit="return suborder()"
                  method="post">
                <input style="visibility: hidden;" id="amount" value="${money.amount}">
                <div class="am-form-group bind">
                    <div class="am-form-content">您当前余额为${money.amount},请按实填写提现信息
                        </div>
                </div>
                <div class="am-form-group bind">
                    <label for="oldphone" class="am-form-label">验证手机</label>
                    <div class="am-form-content">
                        <span id="oldphone">${user.phone}</span>
                    </div>
                </div>
                <div class="am-form-group">
                    <label for="payaccount" class="am-form-label">支付宝号</label>
                    <div class="am-form-content">
                        <input type="tel" name="payaccount" id="payaccount" placeholder="支付宝账号" value="${user.payaccount}"
                               maxlength="35">
                    </div>
                </div>
                <div class="am-form-group">
                    <label for="payaccount" class="am-form-label">账号姓名</label>
                    <div class="am-form-content">
                        <input type="tel" name="payName" id="payName" placeholder="账号真实姓名" value="${user.name}"
                               maxlength="10">
                    </div>
                </div>
                <div class="am-form-group">
                    <label for="payaccount" class="am-form-label">提现余额</label>
                    <div class="am-form-content">
                        <input type="tel" name="money" id="money" placeholder="提现余额（1=1￥）" value="${money.amount}"
                               maxlength="3"  onkeyup="this.value=this.value.replace(/[^0-9]/g,'')">
                    </div>
                </div>

                <div class="am-form-group code">
                    <label for="user-new-code" class="am-form-label">验证码</label>
                    <div class="am-form-content">
                        <input type="tel" id="user-new-code" placeholder="短信验证码"
                               onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" maxlength="11">
                    </div>
                    <a class="btn" href="javascript:void(0);" onclick="get_new_code();" id="sendNewCode">
                        <div class="am-btn am-btn-danger" id="dyMobileButtonNew">验证码</div>
                    </a>
                </div>
                <div class="info-btn">
                    <input class="am-btn am-btn-danger" type="submit" value="申请提现">
                </div>

            </form>

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
<script>
    //    var mobile_code =  Math.ceil((Math.random()*9+1)*1000);
    var new_code = 1234;//Math.ceil((Math.random()*9+1)*1000);

    //验证新手机
    function get_new_code() {
        var money = $("#money").val().replace(" ", "");
        var amount = $("#amount").val().replace(" ", "");
        var payaccount = $("#payaccount").val().replace(" ", "");
        var payName = $("#payName").val().replace(" ", "");
        if (payaccount == "") {
            $.myToast("支付宝账号不能为空");
            $("#payaccount").focus();
            return false;
        }
        if (payName == "") {
            $.myToast("账号真实姓名不能为空");
            $("#payName").focus();
            return false;
        }
        if (money == "") {
            $.myToast("提现余额不能为空");
            $("#money").focus();
            return false;
        }
        if (parseInt(money) <1) {
            $.myToast("提现余额要大于1");
            $("#money").focus();
            return false;
        }
        if (parseInt(money) > parseInt(amount)) {
            $.myToast("提现余额超过已有余额");
            $("#money").focus();
            return false;
        }

        var phone = $("#oldphone").val().replace(" ", "");
        content = "您的验证码是：" + new_code + "。请不要把验证码泄露给其他人。";
        account = "C87765250";
        password = "4223e2ce730884f4024d753c5867b0ea";
        mobile = phone;
        RemainTimeNew();
//        $.ajax({
//            type : "GET",
//            url: "http://106.ihuyi.com/webservice/sms.php?method=Submit&account="+account+"&password="+password+"&content="+content+"&mobile="+mobile+"&format=json",
//            contentType : "application/x-www-form-urlencoded",
//            dataType : "json",
//            error : function() {
//            },
//            success:function (data,textStatus) {
//                console.log(data.toString());
//            }
//        });
    }
    var iTime2 = 59;
    var Account2;
    //时间60秒倒数
    function RemainTimeNew() {
        $("#sendNewCode").removeAttr('onclick');
        var iSecond2, sSecond2 = "", sTime = "";
        if (iTime2 >= 0) {
            iSecond2 = parseInt(iTime2 % 60);
            iMinute = parseInt(iTime2 / 60)
            if (iSecond2 >= 0) {
                if (iMinute > 0) {
                    sSecond2 = iMinute + "分" + iSecond2 + "秒";
                } else {
                    sSecond2 = iSecond2 + "秒";
                }
            }
            sTime = sSecond2;
            if (iTime2 == 0) {
                clearTimeout(Account2);
                sTime = '验证码';
                iTime2 = 59;
                $("#sendNewCode").attr("onclick", "get_new_code()");
            } else {
                Account2 = setTimeout("RemainTimeNew()", 1000);
                iTime2 = iTime2 - 1;
            }
        } else {
            sTime = '验证码';
        }
        $("#dyMobileButtonNew").text(sTime);
    }

    function suborder() {
        var money = $("#money").val().replace(" ", "");
        var amount = $("#amount").val().replace(" ", "");
        var payaccount = $("#payaccount").val().replace(" ", "");
        var payName = $("#payName").val().replace(" ", "");
        var newcode = $("#user-new-code").val().replace(" ", "");
        if (payaccount == "") {
            $.myToast("支付宝账号不能为空");
            $("#payaccount").focus();
            return false;
        }
        if (payName == "") {
            $.myToast("账号真实姓名不能为空");
            $("#payName").focus();
            return false;
        }
        if (money == "") {
            $.myToast("提现余额不能为空");
            $("#money").focus();
            return false;
        }
        if (parseInt(money) <1) {
            $.myToast("提现余额要大于1");
            $("#money").focus();
            return false;
        }
        if (parseInt(money) > parseInt(amount)) {
            $.myToast("提现余额超过已有余额");
            $("#money").focus();
            return false;
        }
        if (newcode == "") {
            $.myToast("验证码不能为空");
            return false;
        }
        if (newcode != new_code) {
            $.myToast("手机验证码错误");
            $("#user-new-code").select();
            $("#user-new-code").focus();
            return false;
        }
        return true;
    }
</script>
</html>
