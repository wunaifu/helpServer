// JavaScript Document
// var search;
$(document).ready(function() {
// 	search = $("#searchStr").text();
// 	console.log("search=" + search);
// 	//订单列表ajax请求
//
})
function click_pageNum(pageNum){
	var url = "/server/mysend/listjson?pageNum="+pageNum;
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
				$("#list_tbody").append('<h1 align="center">未发布资源服务订单</h1>');
				$("#list_nav").text("");
				$("#list_nav").append(nav_str);
			}else{
				$("#list_tbody").text("");
				$.each(list,function(i,item){
					//console.log(item);
					var tr_str = '<div class="blogs">'
						+'<h3><a href="/server/mysend/'+item.order.id+'/detail" style="color: #0a628f">资源名字：'+item.order.foodname+'</a></h3>'
						+'<figure><a href="/server/'+item.order.senderid+'/userinfo">'
						+'<img style="width: 72px;height: 72px;" src="/resources/img/'+item.senderIcon+'"></a>'
						+'</figure>'
						+'<ul>'
						+'<a href="/server/mysend/'+item.order.id+'/detail">'
						+'<p>资源详情：<b style="color: #000000">'+item.order.orderdetail+'</b>'
						+'</p>'
						+'</a>'
						+'<div class="autor1">'
						+'<span>类型：<b style="color: #ff4d2d">'+item.orderTypeName+'</b></span>';
					if(item.order.daynumber>0){
						tr_str+='<span style="margin: 0px 0px 0px 10px;">日租费：<b style="color: #ff4d2d">￥'+item.order.daymoney+'</b></span>';
					}
					if(item.order.monthnumber>0){
						tr_str+='<span style="margin: 0px 0px 0px 10px;">月租费：<b style="color: #ff4d2d">￥'+item.order.monthmoney+'</b></span>';
					}
					tr_str+='<span style="margin: 0px 0px 0px 10px;">库存：<b style="color: #ff4d2d">'
						+(item.order.amount-item.order.outamount)+'/'+item.order.amount+'</b></span>'
						+'<span style="margin: 0px 0px 0px 10px;">需要押金：<b style="color: #ff4d2d">￥'+item.order.moneyamount+'</b></span>'
						+'<span style="margin: 0px 0px 0px 10px;">区域：<b style="color: #ff4d2d">'+item.order.city+'</b></span>'
						+'<span style="margin: 0px 0px 0px 10px;">地址：<b style="color: #ff4d2d">'+item.order.address+'</b></span>'
						+'</div>'
						+'<a href="/server/mysend/'+item.order.id+'/download" class="readmore">立即下架</a>'
						+'<a href="/server/mysend/'+item.order.id+'/update" class="readmore" style="margin-right: 10px;">修改信息</a>'
						+'<a href="/server/mysend/'+item.order.id+'/acceptlist" class="readmore" style="margin-right: 10px;">抢单列表</a>'
						+'</ul>'
						+'<p class="autor">';
					if(item.order.orderstate==1){
						tr_str+='<span>状态:<a>发布中</a></span>'
							+'<span>&nbsp;发布时间:'+item.order.sendtime+'</span>';
					}else if(item.order.orderstate==-1){
						tr_str+='<span>状态:<a>已禁用</a></span>'
							+'<span>&nbsp;禁用时间:'+item.order.updatetime+'</span>'
							+'<span>&nbsp;发布时间:'+item.order.sendtime+'</span>';
					}else{
						tr_str+='<span>状态:<a>已下架</a></span>'
							+'<span>&nbsp;下架时间:'+item.order.updatetime+'</span>'
							+'<span>&nbsp;发布时间:'+item.order.sendtime+'</span>';
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