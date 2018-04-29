// JavaScript Document
var search;
$(document).ready(function() {
	search = $("#searchStr").text();
	console.log("search=" + search);
	//订单列表ajax请求

})
function click_pageNum(pageNum){
	var url = "/server/searchjson?search="+encodeURI(encodeURI(search))+"&pageNum="+pageNum;
	$.ajax({
		type : "POST",
		url: url,
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		error : function() {
			alert("请求失败，请重试！");
		},
		success:function (data) {
			var list = data.dataList;
			var totalPage = data.totalPage;
			var currentPage = data.currentPage;
			var nav_str = add_nav(currentPage,totalPage);
			console.log(data);
			if(list.length==0){
				$("#list_tbody").text("");
				$("#list_tbody").append('<h1 align="center">未有资源服务订单</h1>');
				$("#list_nav").text("");
				$("#list_nav").append(nav_str);
			}else{
				$("#list_tbody").text("");
				$.each(list,function(i,item){
					var tr_str = '<div class="blogs">'
						+'<h3><a href="/server/'+item.order.id+'/detail" style="color: #0a628f">资源名字：'+item.order.foodname+'</a></h3>'
						+'<figure><a href="/server/'+item.order.senderid+'/userinfo">'
						+'<img style="width: 72px;height: 72px;" src="/resources/img/'+item.senderIcon+'"></a>'
						+'</figure>'
						+'<ul>'
						+'<a href="/server/'+item.order.id+'/detail">'
						+'<p>资源详情：<b style="color: #000000">'+item.order.orderdetail+'</b>'
						+'</p>'
						+'</a>'
						+'<div class="autor1">'
						+'<span>类型：<b style="color: #ff4d2d">'+item.orderTypeName+'</b></span>'
						+'<c:if test="+item.order.daynumber>0+">'
						+'<span style="margin: 0px 0px 0px 10px;">日租费：<b style="color: #ff4d2d">'+item.order.daymoney+'￥</b></span>'
						+'</c:if>'
						+'<c:if test="+item.order.monthnumber>0+">'
						+'<span style="margin: 0px 0px 0px 10px;">月租费：<b style="color: #ff4d2d">'+item.order.monthmoney+'￥</b></span>'
						+'</c:if>'
						+'<span style="margin: 0px 0px 0px 10px;">库存：<b style="color: #ff4d2d">'
						+(item.order.amount-item.order.outamount)+'/'+item.order.amount+'</b></span>'
						+'<span style="margin: 0px 0px 0px 10px;">需要押金：<b style="color: #ff4d2d">'+item.order.moneyamount+'￥</b></span>'
						+'<span style="margin: 0px 0px 0px 10px;">区域：<b style="color: #ff4d2d">'+item.order.city+'</b></span>'
						+'<span style="margin: 0px 0px 0px 10px;">地址：<a href="/server/detail/'+item.order.id+'/map" style="color: #ff4d2d">'
						+item.order.address+'</a></span>'
						+'</div>'
						+'<a href="/server/'+item.order.id+'/detail" class="readmore">马上抢单</a>'
						+'</ul>'
						+'<p class="autor"><span>发布者：<a href="/server/'+item.order.senderid+'/userinfo">"+item.senderName+"</a> </span>'
						+'<span>发布时间：'+item.order.sendtime+'</span>'
						+'</p>'
						+'<hr />'
						+'</div>';
					$("#list_tbody").append(tr_str);
				});
				$("#list_nav").text("");
				$("#list_nav").append(nav_str);
			}
		}
	});
}

function add_nav(pageNum,totalPage){
	console.log(pageNum + " " + totalPage);
	var nav_str;
	nav_str='<ul class="am-pagination am-pagination-left">';
	if(pageNum==1||totalPage==0){
		nav_str+='<li class="am-disabled"><a>首页</a></li> <li class="am-disabled"> <a > <span >«</span> </a> </li>';
	}else{
	nav_str+='<li><a onclick="click_pageNum(1)">首页</a></li><li> <a onclick="click_pageNum('+(pageNum-1)+')"> <span>«</span> </a> </li>';
	}
	var k=1;
	for(;k<=totalPage;k++) {
		if(k==(pageNum-4) || k == (pageNum + 4)){
			nav_str+='<li><a>…</a></li>';
		} else if (k==pageNum){
			nav_str+='<li class="am-active"><a>'+k+'<span class="sr-only"></span></a></li>';
		} else if (k < pageNum - 4 || k > pageNum + 4){

		} else{
			nav_str+='<li> <a onclick="click_pageNum('+k+')">'+k+'</a> </li>';
		}
	}
	if(pageNum == totalPage || totalPage == 0) {
		nav_str+='<li class="am-disabled"><a ><span >»</span></a></li><li class="am-disabled"><a>尾页</a></li>';
	}else{
	nav_str+='<li> <a onclick="click_pageNum('+(pageNum+1)+')"> <span >»</span> </a> </li> <li> '
		+ '<a onclick="click_pageNum('+totalPage+')">尾页</a> </li>';
	}
	nav_str+='</ul>';
	return nav_str;
}