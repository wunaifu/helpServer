<%--
  Created by IntelliJ IDEA.
  User: wunaifu
  Date: 2018/1/11
  Time: 21:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>后台管理首页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Fonts
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:300,400' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900' rel='stylesheet' type='text/css'> -->
    <!-- CSS Libs -->
    <link rel="stylesheet" type="text/css" href="/lib/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/lib/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="/lib/css/animate.min.css">
    <link rel="stylesheet" type="text/css" href="/lib/css/bootstrap-switch.min.css">
    <link rel="stylesheet" type="text/css" href="/lib/css/checkbox3.min.css">
    <link rel="stylesheet" type="text/css" href="/lib/css/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="/lib/css/dataTables.bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/lib/css/select2.min.css">
    <!-- CSS App -->
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link rel="stylesheet" type="text/css" href="/css/mycss.css">
    <link rel="stylesheet" type="text/css" href="/css/themes/flat-blue.css">
</head>

<body class="flat-blue">
    <div class="app-container">
        <div class="row content-container">

            <!-- 头部 start -->
            <jsp:include page="head.jsp"/>
            <!-- 头部 end -->

            <!-- Main Content start-->
            <div class="container-fluid">
                <div class="side-body">
                    <div class="page-title">
                        <span class="title">未处理反馈列表</span>
                        <div class="description">以下是未处理反馈列表信息.</div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="card">
                                <div class="card-header">

                                    <div class="card-title">
                                    <div class="title"></div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <table class="datatable table table-striped" cellspacing="0" width="100%">
                                        <thead>
                                        <tr>
                                            <th class="manager-border2">用户账号</th>
                                            <th class="manager-border2">用户昵称</th>
                                            <th class="manager-border2">反馈信息</th>
                                            <th class="manager-border2">申请时间</th>
                                            <th class="manager-border2">回复内容</th>
                                            <th class="manager-border2">处理</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${feedbackDtoList}" var="item" varStatus="status">
                                                <tr class="manager-bg input-lg">
                                                    <td class="manager-border2">${item.user.phone}</td>
                                                    <td class="manager-border2">${item.user.nickname}</td>
                                                    <td class="manager-border2">${item.feedback.feedbackinfo}</td>
                                                    <td class="manager-border2">${item.feedback.feedbacktime}</td>
                                                    <td class="manager-border2">
                                                        <input name="reply${status.index}"  maxlength="50"
                                                               placeholder="请填写回复内容" id="reply${status.index}">
                                                        <input id="id${status.index}" class="hidden" value="${item.feedback.feedbackid}">
                                                    </td>
                                                    <td class="manager-border2"  style="font-size: 17px">
                                                        <a href="#" onclick="checkReply(${item.feedback.feedbackid},${status.index})"><span class="label label-success">回复</span></a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
			<!-- Main Content end-->
        </div>
        <footer class="app-footer">
            <div class="wrapper">
                <span class="pull-right">2.1 <a href="#"><i class="fa fa-long-arrow-up"></i></a></span> © 2015 Copyright.
            </div>
        </footer>
    </div>
    <!-- Javascript Libs -->
    <script type="text/javascript" src="/lib/js/jquery.min.js"></script>
    <script type="text/javascript" src="/lib/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/lib/js/Chart.min.js"></script>
    <script type="text/javascript" src="/lib/js/bootstrap-switch.min.js"></script>

    <script type="text/javascript" src="/lib/js/jquery.matchHeight-min.js"></script>
    <script type="text/javascript" src="/lib/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="/lib/js/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript" src="/lib/js/select2.full.min.js"></script>
    <script type="text/javascript" src="/lib/js/ace/ace.js"></script>
    <script type="text/javascript" src="/lib/js/ace/mode-html.js"></script>
    <script type="text/javascript" src="/lib/js/ace/theme-github.js"></script>
    <!-- Javascript -->
    <script type="text/javascript" src="/js/app.js"></script>
</body>
<link rel="stylesheet" href="/css/myalert.css"><!-- 弹窗  -->
<script src="/js/myalert.js"></script>
<script>
    function checkReply(id,index) {
        var reply = $("#reply"+index).val();
        var id = $("#id"+index).val();
        if (reply==''){
            $.myToast("回复内容不能为空");
            $("#reply" + index).focus();
            return false;
        }
        $.ajax({
            type : "POST",
            url: "/feedback/dispose?id=" + id + "&reply=" + encodeURI(encodeURI(reply)),
            contentType : "application/x-www-form-urlencoded;charset=utf-8",
//            contentType : "text/html; encoding=gb18030",
            dataType : "text",
//            data:{
//                id:id,
//                reply:reply
//            },
            error : function() {
                $.myToast("请求失败，请重试");
            },
            success:function (data) {
                if (data!=null) {
                    console.log(data);
                    if (data == "update_success") {
                        $.myToast('已处理');
                        window.location.href = "/feedback/undisposelist";
                    }else {
                        $.myToast('回复失败，请重试');
                    }
                }else{
                    $.myToast('回复失败，请重试');
                }
            }
        });
    }
</script>
</html>
