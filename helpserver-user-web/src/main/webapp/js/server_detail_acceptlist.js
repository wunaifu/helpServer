// JavaScript Document
var orderIdStr;
$(document).ready(function() {
	orderIdStr = $("#orderIdStr").text();
	console.log("orderIdStr=" + orderIdStr);
	//订单列表ajax请求

})
function click_pageNum(pageNum){
	var url = "/server/acceptlist?orderId="+orderIdStr+"&pageNum="+pageNum;
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
				$("#list_tbody").append('<h1 align="center">未有人抢单</h1>');
				$("#list_nav").text("");
				$("#list_nav").append(nav_str);
			}else{
				$("#list_tbody").text("");
				$.each(list,function(i,item){
					var tr_str = '<li class="am-comment">'
						+'<a href="/server/'+item.acceptorder.accepterid+'/userinfo">'
						+'<img class="am-comment-avatar" src="/resources/img/'+item.acceptUserIcon+'" /> </a>'
						+'<div class="am-comment-main">'
						+'<header class="am-comment-hd">'
						+'<div class="am-comment-meta">'
						+'<a class="am-comment-author">b***1 (匿名)</a>'
						+'抢单于<time datetime="">'+item.acceptorder.accepttime+'</time>'
						+'&nbsp;&nbsp;评分<b style="color: #ff4d2d">'+item.acceptUserCredit+'</b>'
						+'</div>'
						+'</header>'
						+'<div class="am-comment-bd">'
						+'<div class="tb-rev-item " data-id="255776406962">';
					if(item.acceptorder.acceptstate==-1){
						tr_str+='	<div class="J_TbcRate_ReviewContent tb-tbcr-content ">'
							+'	状态：被拒绝'
							+'</div>'
							+'<div class="tb-r-act-bar">'
							+'	拒绝时间：'+item.acceptorder.backtime
							+'</div>';
					}else if(item.acceptorder.acceptstate==0){
						tr_str+='	<div class="J_TbcRate_ReviewContent tb-tbcr-content ">'
							+'	状态：已取消'
							+'</div>'
							+'<div class="tb-r-act-bar">'
							+'	取消时间：'+item.acceptorder.backtime
							+'</div>';
					}else if(item.acceptorder.acceptstate==1){
						tr_str+='	<div class="J_TbcRate_ReviewContent tb-tbcr-content ">'
							+'	状态：预抢中'
							+'</div>'
							+'<div class="tb-r-act-bar">'
							+'	预抢时间：'+item.acceptorder.accepttime
							+'</div>';
					}else if(item.acceptorder.acceptstate==2){
						tr_str+='	<div class="J_TbcRate_ReviewContent tb-tbcr-content ">'
							+'	状态：待获取资源'
							+'</div>'
							+'<div class="tb-r-act-bar">'
							+'	通过时间：'+item.acceptorder.suretime
							+'</div>';
					}else if(item.acceptorder.acceptstate==3){
						tr_str+='	<div class="J_TbcRate_ReviewContent tb-tbcr-content ">'
							+'	状态：租用中'
							+'</div>'
							+'<div class="tb-r-act-bar">'
							+'	获取时间：'+item.acceptorder.updatetime
							+'</div>';
					}else if(item.acceptorder.acceptstate==4){
						tr_str+='	<div class="J_TbcRate_ReviewContent tb-tbcr-content ">'
							+'	状态：已归还待付款'
							+'</div>'
							+'<div class="tb-r-act-bar">'
							+'	归还时间：'+item.acceptorder.finishtime
							+'</div>';
					}else if(item.acceptorder.acceptstate==5){
						tr_str+='	<div class="J_TbcRate_ReviewContent tb-tbcr-content ">'
							+'	状态：已付款'
							+'</div>'
							+'<div class="tb-r-act-bar">'
							+'	完成时间：'+item.acceptorder.finishtime
							+'</div>';
					}else{
						tr_str+='<div class="J_TbcRate_ReviewContent tb-tbcr-content ">'
							+'	状态：已完成'
							+'</div>'
							+'<div class="tb-r-act-bar">'
							+'	完成时间：'+item.acceptorder.finishtime
							+'</div>';
					}
					tr_str+='</div>'
						+'</div>'
						+'</div>'
						+'</li>';
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

function click_pageNum1(pageNum){
	var url = "/server/commentlist?orderId="+orderIdStr+"&pageNum="+pageNum;
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
			var nav_str = add_nav1(currentPage,totalPage);
			console.log(data);
			if(list.length==0){
				$("#list_tbody1").text("");
				$("#list_tbody1").append('<h1 align="center">未有人抢单</h1>');
				$("#list_nav1").text("");
				$("#list_nav1").append(nav_str);
			}else{
				$("#list_tbody1").text("");
				$.each(list,function(i,item){
					var tr_str = '<li class="am-comment"><a><img class="am-comment-avatar" src="/images/hwbn40x40.jpg" /></a>'
						+'<div class="am-comment-main">'
						+'<header class="am-comment-hd"><div class="am-comment-meta">'
						+'<a class="am-comment-author">b***1 (匿名)</a> 评论于'
						+'<time datetime="">'+item.time+'</time>'
						+'</div>'
						+'</header>'
						+'<div class="am-comment-bd">'
						+'<div class="tb-rev-item " data-id="255776406962">'
						+'<div class="J_TbcRate_ReviewContent tb-tbcr-content ">'
						+item.content
						+'</div>'
						+'<div class="tb-r-act-bar">'
						+'评分：'+item.score
						+'</div></div></div></div></li>';
					$("#list_tbody1").append(tr_str);
				});
				$("#list_nav1").text("");
				$("#list_nav1").append(nav_str);
			}
		}
	});
}

function add_nav1(pageNum,totalPage){
	console.log(pageNum + " " + totalPage);
	var nav_str;
	nav_str='<ul class="am-pagination am-pagination-left">';
	if(pageNum==1||totalPage==0){
		nav_str+='<li class="am-disabled"><a>首页</a></li> <li class="am-disabled"> <a > <span >«</span> </a> </li>';
	}else{
		nav_str+='<li><a onclick="click_pageNum1(1)">首页</a></li><li> <a onclick="click_pageNum1('+(pageNum-1)+')"> <span>«</span> </a> </li>';
	}
	var k=1;
	for(;k<=totalPage;k++) {
		if(k==(pageNum-4) || k == (pageNum + 4)){
			nav_str+='<li><a>…</a></li>';
		} else if (k==pageNum){
			nav_str+='<li class="am-active"><a>'+k+'<span class="sr-only"></span></a></li>';
		} else if (k < pageNum - 4 || k > pageNum + 4){

		} else{
			nav_str+='<li> <a onclick="click_pageNum1('+k+')">'+k+'</a> </li>';
		}
	}
	if(pageNum == totalPage || totalPage == 0) {
		nav_str+='<li class="am-disabled"><a ><span >»</span></a></li><li class="am-disabled"><a>尾页</a></li>';
	}else{
		nav_str+='<li> <a onclick="click_pageNum1('+(pageNum+1)+')"> <span >»</span> </a> </li> <li> '
			+ '<a onclick="click_pageNum1('+totalPage+')">尾页</a> </li>';
	}
	nav_str+='</ul>';
	return nav_str;
}