<%--
  Created by IntelliJ IDEA.
  User: wunaifu
  Date: 2018/1/28
  Time: 23:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--搜索 start-->
<div class="search-bar pr">
    <a name="index_none_header_sysc" href="#"></a>
    <form action="/server/search" method="post">
        <input id="searchInput" name="search" type="text" placeholder="搜索" autocomplete="off" required>
        <input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
    </form>
</div>
<!--搜索 end-->