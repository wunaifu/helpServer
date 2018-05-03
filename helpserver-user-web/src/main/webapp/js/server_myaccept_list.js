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
						+'<span style="margin: 0px 0px 0px 10px;">资源状态：<b style="color: #ff4d2d">'+item.orderState+'</b></span>';
					if(item.acceptorder.acceptstate==3 && item.acceptorder.datestate == 0){
						tr_str+='<span style="margin: 0px 0px 0px 10px;">租用状态：<b style="color: #ff4d2d">已超期</b></span>';
					}else if(item.acceptorder.acceptstate==3 && item.acceptorder.datestate==1){
						tr_str+='<span style="margin: 0px 0px 0px 10px;">租用状态：<b style="color: #12c34e">正常租用</b></span>';
					}else{

					}
					tr_str+='</div><a href="/server/'+item.orderId+'/detail" class="readmore">查看资源</a>';
					if(item.acceptorder.acceptstate==1){
						tr_str+='<a href="#" onclick="cancelOrder('+item.acceptorder.id+','+pageNum+')" style="margin-right: 10px;"'
							+'title="不需要该资源时，可以取消抢单" class="readmore">取消抢单</a>';
					}else if(item.acceptorder.acceptstate==2){
						tr_str+='<a href="#" onclick="cancelOrder('+item.acceptorder.id+','+pageNum+')" style="margin-right: 10px;"'
							+'title="不需要该资源时，可以取消抢单" class="readmore">取消抢单</a>';
						tr_str+='<a href="#" onclick="startMoney('+item.acceptorder.id+','+pagerList.currentPage+')" style="margin-right: 10px;"'
							+'title="租用开始时则开始计算租用时间" class="readmore">开始计费</a>';
					}else if(item.acceptorder.acceptstate==3){
						tr_str+='<a href="#" onclick="returnGoods('+item.acceptorder.id+','+pagerList.currentPage+')" style="margin-right: 10px;"'
							+'title="物品使用完成时应及时归还，避免影响信誉分及多余扣费" class="readmore">归还物品</a>';
					}else if(item.acceptorder.acceptstate==4){
						tr_str+='<a href="#" onclick="startMoney('+item.acceptorder.id+','+pagerList.currentPage+')" style="margin-right: 10px;"'
							+'title="物品已归还，请前往付款" class="readmore">去付款</a>';
					}else if(item.acceptorder.acceptstate==5){
						if(item.isOrNotComment==0){
							tr_str+='<a href="/server/'+item.acceptorder.id+'/tocomment" class="readmore" style="margin-right: 10px;">去评价</a>';
						}
					}else{

					}
					tr_str+='</ul><p class="autor">';
					if(item.acceptorder.acceptstate==-1){
						tr_str+='<span>状态：<a>被拒绝</a></span>'
							+'<span>&nbsp;拒绝时间：'+item.acceptorder.backtime+'</span>';
					}else if(item.acceptorder.acceptstate==0){
						tr_str+='<span>状态：<a>已取消</a></span>'
							+'<span>&nbsp;取消时间：'+item.acceptorder.backtime+'</span>';
					}else if(item.acceptorder.acceptstate==1){
						tr_str+='<span>状态：<a>待通过</a></span>'
							+'<span>&nbsp;抢单时间：'+item.acceptorder.accepttime+'</span>';
					}else if(item.acceptorder.acceptstate==2){
						tr_str+='<span>状态：<a>待获取资源</a></span>'
							+'<span>&nbsp;通过时间：'+item.acceptorder.suretime+'</span>';
					}else if(item.acceptorder.acceptstate==3){
						tr_str+='<span>状态：<a>租用中</a></span>'
							+'<span>&nbsp;获取时间：'+item.acceptorder.updatetime+'</span>';
					}else if(item.acceptorder.acceptstate==4){
						tr_str+='<span>状态：<a>已归还待付款</a></span>'
							+'<span>&nbsp;归还时间：'+item.acceptorder.finishtime+'</span>';
					}else if(item.acceptorder.acceptstate==5){
						if(item.isOrNotComment==0){
							tr_str+='<span>状态：<a>待评价</a></span>';
						}else {
							tr_str+='<span>状态：<a>已完成</a></span>';
						}
					}else{
						tr_str+='<span>状态：<a>已完成</a></span>'
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