<%--
  Created by IntelliJ IDEA.
  User: wunaifu
  Date: 2018/1/28
  Time: 23:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<aside class="menu">
    <ul>
        <li class="person active">
            <a href="/index_user"><i class="am-icon-user"></i>个人中心</a>
        </li>
        <li class="person">
            <p><i class="am-icon-newspaper-o"></i>个人资料</p>
            <ul>
                <li> <a href="/user/info">个人信息</a></li>
                <li> <a href="/user/safety">安全设置</a></li>
            </ul>
        </li>
        <li class="person">
            <p><i class="am-icon-balance-scale"></i>我的服务</p>
            <ul>
                <li><a href="order.html">已发布</a></li>
                <li> <a href="change.html">已接单</a></li>
                <li> <a href="change.html">待评价</a></li>
                <li> <a href="comment.html">已完成</a></li>
                <li><a href="order.html">草稿箱</a></li>
            </ul>
        </li>
        <li class="person">
            <p><i class="am-icon-dollar"></i>我的资产</p>
            <ul>
                <li> <a href="points.html">我的金币</a></li>
                <li> <a href="walletlist.html">账户余额</a></li>
                <li> <a href="coupon.html">我的充值 </a></li>
                <li> <a href="bonus.html">我的提现</a></li>
            </ul>
        </li>

        <li class="person">
            <p><i class="am-icon-tags"></i>我的收藏</p>
            <ul>
                <li> <a href="collection.html">收藏</a></li>
                <li> <a href="foot.html">足迹</a></li>
            </ul>
        </li>

        <li class="person">
            <p><i class="am-icon-qq"></i>在线客服</p>
            <ul>
                <li> <a href="/user/feedback">意见反馈</a></li>
                <li> <a href="/user/newslist">我的消息</a></li>
            </ul>
        </li>
    </ul>

</aside>
