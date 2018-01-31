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

    <title>实名认证</title>

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
                <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">实名认证</strong> / <small>Real&nbsp;authentication</small></div>
            </div>
            <hr/>
            <div class="authentication">
                <form action="/user/doidcard" onsubmit="return suborder()"
                      enctype="multipart/form-data" method="post">

                    <c:choose>
                        <c:when test="${identity==null||identity=='null'}">
                            <input value="0" style="visibility: hidden" name="id">
                            <p class="tip">请填写您身份证上的真实信息，以用于报关审核</p>
                            <div class="authenticationInfo">
                                <p class="title">填写个人信息</p>

                                <div class="am-form-group">
                                    <label for="username" class="am-form-label">真实姓名</label>
                                    <div class="am-form-content">
                                        <input type="text" id="username" name="name" placeholder="请输入您的真实姓名"
                                               maxlength="10">
                                    </div>
                                </div>
                                <div class="am-form-group">
                                    <label for="userIDcard" class="am-form-label">身份证号</label>
                                    <div class="am-form-content">
                                        <input type="tel" id="userIDcard" name="idcard" placeholder="请输入您的身份证信息"
                                               onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9]/g,'')" maxlength="20" minlength="6">
                                    </div>
                                </div>
                            </div>
                            <div class="authenticationPic">
                                <p class="title">上传身份证照片</p>
                                <p class="tip">请按要求上传身份证</p>
                                <ul class="cardlist">
                                    <li>
                                        <div class="cardPic">
                                            <input id="file1" type="file" class="inputPic" allowexts="gif,jpeg,jpg,png,bmp" accept="image/*"
                                                   name="file" onchange="c1()" accept=".jpg,.png,.jpeg,.JPG,.PNG,.JPEG,">
                                            <img src="/images/cardbg.jpg" id="show1">
                                            <div class="cardText"><i class="am-icon-plus"></i>
                                                <p>正面照片</p>
                                            </div>
                                            <p class="titleText">身份证正面</p>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="cardPic">
                                            <input id="file2" type="file" class="inputPic" allowexts="gif,jpeg,jpg,png,bmp" accept="image/*"
                                                   name="file" onchange="c2()" accept=".jpg,.png,.jpeg,.JPG,.PNG,.JPEG,">
                                            <img src="/images/cardbg.jpg" id="show2">
                                            <div class="cardText"><i class="am-icon-plus"></i>
                                                <p>背面照片</p>
                                            </div>
                                            <p class="titleText">身份证背面</p>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <input value="${identity.id}" style="visibility: hidden" name="id">
                            <p class="tip">请填写您身份证上的真实信息，以用于报关审核</p>
                            <div class="authenticationInfo">
                                <p class="title">填写个人信息</p>

                                <div class="am-form-group">
                                    <label for="username" class="am-form-label">真实姓名</label>
                                    <div class="am-form-content">
                                        <input type="text" id="username" name="name" placeholder="请输入您的真实姓名"
                                               maxlength="10" value="${identity.name}">
                                    </div>
                                </div>
                                <div class="am-form-group">
                                    <label for="userIDcard" class="am-form-label">身份证号</label>
                                    <div class="am-form-content">
                                        <input type="tel" id="userIDcard" name="idcard" placeholder="请输入您的身份证信息" value="${identity.idcard}"
                                               onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9]/g,'')" maxlength="20" minlength="6">
                                    </div>
                                </div>
                            </div>
                            <div class="authenticationPic">
                                <p class="title">上传身份证照片</p>
                                <p class="tip">请按要求上传身份证</p>
                                <ul class="cardlist">
                                    <li>
                                        <div class="cardPic">
                                            <input id="file1" type="file" class="inputPic" allowexts="gif,jpeg,jpg,png,bmp" accept="image/*"
                                                   name="file" onchange="c1()" accept=".jpg,.png,.jpeg,.JPG,.PNG,.JPEG,">
                                            <img src="/resources/img/${identity.frontphoto}" id="show1">
                                            <div class="cardText"><i class="am-icon-plus"></i>
                                                <p>正面照片</p>
                                            </div>
                                            <p class="titleText">身份证正面</p>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="cardPic">
                                            <input id="file2" type="file" class="inputPic" allowexts="gif,jpeg,jpg,png,bmp" accept="image/*"
                                                   name="file" onchange="c2()" accept=".jpg,.png,.jpeg,.JPG,.PNG,.JPEG,">
                                            <img src="/resources/img/${identity.backphoto}" id="show2">
                                            <div class="cardText"><i class="am-icon-plus"></i>
                                                <p>背面照片</p>
                                            </div>
                                            <p class="titleText">身份证背面</p>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </c:otherwise>
                    </c:choose>

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

    function suborder() {
        var username = $("#username").val().replace(" ", "");
        var userIDcard = $("#userIDcard").val().replace(" ", "");
        //var f1 =  $("#file1").val()
        //var f2 =  $("#file2").val()
        if (username== '') {
            $.myToast("姓名不能为空");
            $("#username").focus();
            return false;
        }
        if (userIDcard== '') {
            $.myToast("身份证号不能为空");
            $("#userIDcard").focus();
            return false;
        }
//        if (f1== '') {
//            $.myToast("身份证正面图不能为空");
//            return false;
//        }
//        if (f2=='') {
//            $.myToast("身份证反面图不能为空");
//            return false;
//        }
        return true;
    }
</script>
</html>
