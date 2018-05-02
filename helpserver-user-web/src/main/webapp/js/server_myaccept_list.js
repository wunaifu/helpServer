// JavaScript Document
// var search;
$(document).ready(function() {
// 	search = $("#searchStr").text();
// 	console.log("search=" + search);
// 	//订单列表ajax请求
//
})
function click_pageNum(pageNum){
	var url = "/server/myaccept/listjson?pageNum="+pageNum;
	$.ajax({
		type : "POST",
		url: url,
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		error : function() {
			alert("请求失败，请重试！");
		},
		success:function (data) {
			if(data==null) {
				window.location.href="/page_403";
			}
			var list = data.dataList;
			var totalPage = data.totalPage;
			var currentPage = data.currentPage;
			var nav_str = add_nav(currentPage,totalPage);
			console.log(data);
			if(list.length==0){
				$("#list_tbody").text("");
				$("#list_tbody").append('<h1 align="center">未预定资源服务订单</h1>');
				$("#list_nav").text("");
				$("#list_nav").append(nav_str);
			}else{
				$("#list_tbody").text("");
				$.each(list,function(i,item){
					//console.log(item);
					var tr_str = '<div class="blogs">'
					+'<h3><a href="/server/'+item.orderId+'/detail" style="color: #0a628f">资源名字：'+item.foodname+'</a></h3>'
					+'抢单时间：'+item.acceptorder.accepttime
					+'<figure><a href="/server/'+item.sendId+'/userinfo">'
					+'<img style="width: 72px;height: 72px;" src="/resources/img/'+item.sendUserIcon+'"></a>'
					+'</figure>'
					+'<ul>'
					+'<a href="/server/'+item.orderId+'/detail">'
					+'<p>资源详情：<b style="color: #000000">'+item.orderdetail+'</b></p>'
					+'</a>'
					+'<div class="autor1">'
					+'<span>发布者：<a href="/server/'+item.senderId+'/userinfo" style="color: #ff4d2d">'+item.sendUserName+'</a></span>'
					+'<span style="margin: 0px 0px 0px 10px;">信誉分：<b style="color: #ff4d2d">'+item.sendUserCredit+'</b></span>';
					if(item.acceptorder.moneytype==0){
						tr_str+='<span style="margin: 0px 0px 0px 10px;">计费方式：<b style="color: #ff4d2d">日租￥'+item.acceptorder.money+'</b></span>'
							+'<span style="margin: 0px 0px 0px 10px;">租用时间：<b style="color: #ff4d2d">'+item.acceptorder.number+'天</b></span>';
					}else{
						tr_str+='<span style="margin: 0px 0px 0px 10px;">计费方式：<b style="color: #ff4d2d">月租￥'+item.acceptorder.money+'</b></span>'
							+'<span style="margin: 0px 0px 0px 10px;">租用时间：<b style="color: #ff4d2d">'+item.acceptorder.number+'月</b></span>';
					}
					tr_str+='<span style="margin: 0px 0px 0px 10px;">库存：<b style="color: #ff4d2d">'+(item.amount-item.outamount)+'/'
						+item.amount+'</b></span>'
						+'<span style="margin: 0px 0px 0px 10px;">需要押金：<b style="color: #ff4d2d">￥'+item.moneyamount+'</b></span>'
						+'<span style="margin: 0px 0px 0px 10px;">区域：<b style="color: #ff4d2d">'+item.city+'</b></span>'
						+'<span style="margin: 0px 0px 0px 10px;">地址：<a href="/server/detail/'+item.orderId+'/map" style="color: #ff4d2d">'
						+item.address+'</a></span>'
						+'</div>';
					if(item.acceptorder.acceptstate==1){
						tr_str+='<a href="#" class="readmore">查看详情</a>';
					}else if(item.acceptorder.acceptstate==2){
						tr_str+='<a href="#" class="readmore">结束租用</a>';
					}else{
						tr_str+='<a href="/server/'+item.orderId+'/detail" class="readmore">再次抢单</a>';
					}
					tr_str+='</ul><p class="autor">';
					if(item.acceptorder.acceptstate==0){
						tr_str+='<span>状态：<a>已取消</a></span>'
							+'<span>&nbsp;取消时间：'+item.acceptorder.backtime+'</span>';
					}else if(item.acceptorder.acceptstate==1){
						tr_str+='<span>状态：<a>待通过</a></span>'
							+'<span>&nbsp;抢单时间：'+item.acceptorder.accepttime+'</span>';
					}else if(item.acceptorder.acceptstate==2){
						tr_str+='<span>状态：<a>租用中</a></span>'
							+'<span>&nbsp;通过时间：'+item.acceptorder.suretime+'</span>';
					}else if(item.acceptorder.acceptstate==4){
						tr_str+='<span>状态：<a>已下架</a></span>'
							+'<span>&nbsp;下架时间：'+item.repealtime+'</span>';
					}else{
						tr_str+='<span>状态：<a>已结束</a></span>'
							+'<span>&nbsp;完成时间：'+item.acceptorder.finishtime+'</span>';
					}
					tr_str+='</p><hr /></div>';
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
		if(k==(pageNum-3) || k == (pageNum + 3)){
			nav_str+='<li><a>…</a></li>';
		} else if (k==pageNum){
			nav_str+='<li class="am-active"><a>'+k+'<span class="sr-only"></span></a></li>';
		} else if (k < pageNum - 3 || k > pageNum + 3){

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