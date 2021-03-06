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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>安全设置</title>

    <link href="/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

    <link href="/css/personal.css" rel="stylesheet" type="text/css">
    <link href="/css/infstyle.css" rel="stylesheet" type="text/css">
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

            <!--标题 -->
            <div class="user-safety">
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><a href="/index" style="color: #0a628f">首页&nbsp;</a> >&nbsp;
                        <a style="color: #0a628f" href="/index_user">个人中心&nbsp;</a> >&nbsp;
                        <strong class="am-text-danger am-text-lg">账户安全</strong> / <small>Set&nbsp;up&nbsp;Safety</small>
                    </div>
                </div>
                <hr/>

                <!--头像 -->
                <div class="user-infoPic">

                    <div class="filePic">
                        <c:choose>
                            <c:when test="${userinfo.headicon!=null||userinfo.headicon!=''}">
                                <img id="show" class="userheadicon am-circle am-img-thumbnail"
                                     src="/resources/img/${userinfo.headicon}" alt=""/>
                            </c:when>
                            <c:otherwise>
                                <img id="show" class="am-circle am-img-thumbnail" src="/images/getAvatar.do.jpg" alt=""/>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <%--<p class="am-form-help">头像</p>--%>

                    <div class="info-m">
                        <div><b>手机号：<i>${userinfo.phone}</i></b></div>
                        <div><b>注册时间：<i>${userinfo.registertime}</i></b></div>
                        <div class="vip">
                            <c:choose>
                                <c:when test="${userinfo.permission==0}">
                                    <span></span><a href="/user/idcard" style="color: red;">未实名认证</a>
                                </c:when>
                                <c:otherwise>
                                    <span></span><a href="/user/idcard" style="color: green;">已实名认证</a>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>

                <div class="check">
                    <ul>
                        <li>
                            <i class="i-safety-lock"></i>
                            <div class="m-left">
                                <div class="fore1">登录密码</div>
                                <div class="fore2"><small>为保证您账号安全，建议您定期更改密码以保护账户安全。</small></div>
                            </div>
                            <div class="fore3">
                                <a href="/user/resetpsw">
                                    <div class="am-btn am-btn-secondary">修改</div>
                                </a>
                            </div>
                        </li>
                        <li>
                            <i class="i-safety-security"></i>
                            <div class="m-left">
                                <div class="fore1">忘记密码</div>
                                <div class="fore2"><small>忘记密码不要紧，可以通过手机验证码重置密码。</small></div>
                            </div>
                            <div class="fore3">
                                <a href="/user/findbackpsw">
                                    <div class="am-btn am-btn-secondary">重置</div>
                                </a>
                            </div>
                        </li>
                        <li>
                            <i class="i-safety-iphone"></i>
                            <div class="m-left">
                                <div class="fore1">手机验证</div>
                                <div class="fore2"><small>您验证的手机：${userinfo.phone} 若已丢失或停用，请立即更换</small></div>
                            </div>
                            <div class="fore3">
                                <a href="/user/bindphone">
                                    <div class="am-btn am-btn-secondary">换绑</div>
                                </a>
                            </div>
                        </li>
                        <%--<li>
                            <i class="i-safety-mail"></i>
                            <div class="m-left">
                                <div class="fore1">邮箱验证</div>
                                <div class="fore2"><small>您验证的邮箱：5831XXX@qq.com 可用于快速找回登录密码</small></div>
                            </div>
                            <div class="fore3">
                                <a href="email.html">
                                    <div class="am-btn am-btn-secondary">换绑</div>
                                </a>
                            </div>
                        </li>--%>
                        <li>
                            <i class="i-safety-idcard"></i>
                            <div class="m-left">
                                <div class="fore1">实名认证</div>
                                <div class="fore2"><small>用于提升账号的安全性和信任级别，认证后可进行资源任务抢单。</small></div>
                            </div>
                            <div class="fore3">
                                <a href="/user/idcard">
                                    <c:choose>
                                        <c:when test="${userinfo.permission==1}">
                                            <div class="am-btn am-btn-secondary">已认证</div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="am-btn am-btn-secondary">认证</div>
                                        </c:otherwise>
                                    </c:choose>
                                </a>
                            </div>
                        </li>
                        <li>
                            <i class="i-safety-wallet"></i>
                            <div class="m-left">
                                <div class="fore1">支付宝账号</div>
                                <div class="fore2"><small>填写支付宝账号，方便提现以及保证余额流通正常。</small></div>
                            </div>
                            <div class="fore3">
                                <a href="/user/setpay">
                                    <div class="am-btn am-btn-secondary">设置</div>
                                </a>
                            </div>
                        </li>

                    </ul>
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

</body>

</html>
