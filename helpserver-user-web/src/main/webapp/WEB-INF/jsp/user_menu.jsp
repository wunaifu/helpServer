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
                <li><a href="/server/add">发服务</a></li>
                <li><a href="order.html">已发布</a></li>
                <li> <a href="change.html">已接单</a></li>
                <li> <a href="change.html">待评价</a></li>
                <li> <a href="comment.html">已完成</a></li>
            </ul>
        </li>
        <li class="person">
            <p><i class="am-icon-dollar"></i>我的资产</p>
            <ul>
                <li> <a href="/money/info">账户余额</a></li>
                <li> <a href="/money/pay">余额充值</a></li>
                <li> <a href="/money/getmoney">余额提现</a></li>
                <li> <a href="/gold/info">我的金币</a></li>
                <li> <a href="/gold/paybymoney">金币充值</a></li>
                <li> <a href="/gold/tomoney">金币提现</a></li>
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
                <li> <a href="#">我的消息</a></li>
            </ul>
        </li>
    </ul>

</aside>
