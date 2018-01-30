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

    <title>绑定手机</title>

    <link href="/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

    <link href="/css/personal.css" rel="stylesheet" type="text/css">
    <link href="/css/stepstyle.css" rel="stylesheet" type="text/css">
    <link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css">

    <script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
    <script src="/AmazeUI-2.4.2/assets/js/amazeui.js"></script>

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

            <div class="am-cf am-padding">
                <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">绑定手机</strong> /
                    <small>Bind&nbsp;Phone</small>
                </div>
            </div>
            <hr/>
            <!--进度条-->
            <div class="m-progress">
                <div class="m-progress-list">
							<span class="step-1 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
                                <p class="stage-name">绑定手机</p>
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
            <form class="am-form am-form-horizontal" action="/user/dobindphone" onsubmit="return suborder()"
                  method="post">
                <input class="hidden" id="oldphone" value="<%=nowUser.getPhone()%>">
                <input class="hidden" name="userId" value="<%=nowUser.getUserid()%>">
                <div class="am-form-group bind">
                    <label for="user-phone" class="am-form-label">验证手机</label>
                    <div class="am-form-content">
                        <span id="user-phone"><%=nowUser.getPhone()%></span>
                    </div>
                </div>
                <div class="am-form-group code">
                    <label for="user-code" class="am-form-label">验证码</label>
                    <div class="am-form-content">
                        <input type="tel" id="user-code" placeholder="短信验证码"
                               onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" maxlength="11" required>
                    </div>
                    <a class="btn" href="javascript:void(0);" onclick="get_old_code();" id="sendOldCode">
                        <div class="am-btn am-btn-danger" id="dyMobileButtonold">验证码</div>
                    </a>
                </div>
                <div class="am-form-group">
                    <label for="newphone" class="am-form-label">验证手机</label>
                    <div class="am-form-content">
                        <input type="tel" name="newphone" id="newphone" placeholder="绑定新手机号"
                               onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" maxlength="11" minlength="11"
                               required>
                    </div>
                </div>
                <div class="am-form-group code">
                    <label for="user-new-code" class="am-form-label">验证码</label>
                    <div class="am-form-content">
                        <input type="tel" id="user-new-code" placeholder="短信验证码"
                               onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" maxlength="11" required>>
                    </div>
                    <a class="btn" href="javascript:void(0);" onclick="get_new_code();" id="sendNewCode">
                        <div class="am-btn am-btn-danger" id="dyMobileButtonNew">验证码</div>
                    </a>
                </div>
                <div class="info-btn">
                    <input class="am-btn am-btn-danger" type="submit" value="保存修改">
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
<link rel="stylesheet" href="/css/alert.css"><!-- 弹窗  -->
<script src="/js/alert.js"></script>
<script>
    //    var mobile_code =  Math.ceil((Math.random()*9+1)*1000);
    var old_code = "4321";
    var new_code = "1234";
    //验证旧手机
    function get_old_code() {

        var phone = $("#oldphone").val().replace(" ", "");
//        old_code = mobile_code.substring(0, 3);
        content = "您的验证码是：" + old_code + "。请不要把验证码泄露给其他人。";
        account = "C62138766";
        password = "f2f3a56a1bd4de09fd0b4fb5c7f6ba4a";
        mobile = phone;
        RemainTimeOld();
//        $.ajax({
//            type : "GET",
//            url: "http://106.ihuyi.com/webservice/sms.php?method=Submit&account="+account+"&password="+password+"&content="+content+"&mobile="+mobile+"&format=json",
//            contentType : "application/x-www-form-urlencoded",
//            dataType : "json",
//            error : function() {
////                alert("请求失败，请重试！");
//            },
//            success:function (data,textStatus) {
//                console.log(data.toString());
//            }
//        });
    }
    var iTime1 = 59;
    var Account1;
    //时间60秒倒数
    function RemainTimeOld() {
        $("#sendOldCode").removeAttr('onclick');
        var iSecond, sSecond = "", sTime = "";
        if (iTime1 >= 0) {
            iSecond = parseInt(iTime1 % 60);
            iMinute = parseInt(iTime1 / 60)
            if (iSecond >= 0) {
                if (iMinute > 0) {
                    sSecond = iMinute + "分" + iSecond + "秒";
                } else {
                    sSecond = iSecond + "秒";
                }
            }
            sTime = sSecond;
            if (iTime1 == 0) {
                clearTimeout(Account1);
                sTime = '验证码';
                iTime1 = 59;
                $("#sendOldCode").attr("onclick", "get_old_code()");
            } else {
                Account1 = setTimeout("RemainTimeOld()", 1000);
                iTime1 = iTime1 - 1;
            }
        } else {
            sTime = 'nothing';
        }
        $("#dyMobileButtonold").text(sTime);
    }

    //验证新手机
    function get_new_code() {

        var newphone = $("#newphone").val().replace(" ", "");
        if (newphone == "") {
            $.myToast("手机号不能为空");
            $("#newphone").focus();
            return;
        }
        if (newphone.length != 11) {
            $.myToast("手机号格式不正确");
            $("#phone").select();
            $("#phone").focus();
            return;
        }

//        new_code = mobile_code.substring(0, 3);
        content = "您的验证码是：" + new_code + "。请不要把验证码泄露给其他人。";
        account = "C62138766";
        password = "f2f3a56a1bd4de09fd0b4fb5c7f6ba4a";
        mobile = newphone;
        RemainTimeNew();
//        $.ajax({
//            type : "GET",
//            url: "http://106.ihuyi.com/webservice/sms.php?method=Submit&account="+account+"&password="+password+"&content="+content+"&mobile="+mobile+"&format=json",
//            contentType : "application/x-www-form-urlencoded",
//            dataType : "json",
//            error : function() {
////                alert("请求失败，请重试！");
//            },
//            success:function (data,textStatus) {
//                console.log(data.toString());
//            }
//        });
    }
    ;
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
            sTime = 'nothing';
        }
        $("#dyMobileButtonNew").text(sTime);
    }

    function suborder() {
        var usercode = $("#user-code").val().replace(" ", "");
        var newcode = $("#user-new-code").val().replace(" ", "");
        if (usercode == "" || newcode == "") {
            $.myToast("验证码不能为空");
            return false;
        }
        if (usercode != old_code) {
            $.myToast("旧手机验证码错误");
            $("#user-code").select();
            $("#user-code").focus();
            return false;
        }
        if (newcode != new_code) {
            $.myToast("新手机验证码错误");
            $("#user-new-code").select();
            $("#user-new-code").focus();
            return false;
        }
        return true;
    }
</script>
</html>
