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
						+'<c:choose>'
						+'<c:when test="${nowUser.userid==orderUserDto.order.senderid}">'
						+'<a href="/server/'+item.acceptorder.accepterid+'/userinfo">'
						+'<img class="am-comment-avatar" src="/resources/img/'+item.acceptUserIcon+'" /> </a>'
						+'</c:when>'
						+'<c:otherwise>'
						+'<a><img class="am-comment-avatar" src="/resources/img/'+item.acceptUserIcon+'" /></a>'
						+'	</c:otherwise>'
						+'</c:choose>'
						+'<div class="am-comment-main">'
						+'	<header class="am-comment-hd">'
						+'	<div class="am-comment-meta">'
						+'	<a class="am-comment-author">b***1 (匿名)</a>'
						+'	抢单于<time datetime="">'+item.acceptorder.accepttime+'</time>'
						+'	&nbsp;&nbsp;信誉分<b style="color: #ff4d2d">'+item.acceptUserCredit+'</b>'
						+'	</div>'
						+'	</header>'
						+'	<div class="am-comment-bd">'
						+'	<div class="tb-rev-item " data-id="255776406962">'
						+'	<c:choose>'
						+'<c:when test="'+item.acceptorder.acceptstate==1+'">'
						+'	<div class="J_TbcRate_ReviewContent tb-tbcr-content ">'
						+'	状态：抢单中'
						+'</div>'
						+'</c:when>'
						+'<c:when test="'+item.acceptorder.acceptstate==2+'">'
						+'	<div class="J_TbcRate_ReviewContent tb-tbcr-content ">'
						+'	状态：资源租用中'
						+'</div>'
						+'<div class="tb-r-act-bar">'
						+'	开始租用时间：'+item.acceptorder.suretime+''
						+'</div>'
						+'</c:when>'
						+'<c:when test="'+item.acceptorder.acceptstate==3+'">'
						+'	<div class="J_TbcRate_ReviewContent tb-tbcr-content ">'
						+'	状态：已完成'
						+'</div>'
						+'<div class="tb-r-act-bar">'
						+'	开始租用时间：'+item.acceptorder.suretime+'&nbsp;&nbsp;完成时间：'+item.acceptorder.finishtime
						+'</div>'
						+'</c:when>'
						+'<c:otherwise>'
						+'<div class="J_TbcRate_ReviewContent tb-tbcr-content ">'
						+'	状态：已取消'
						+'</div>'
						+'<div class="tb-r-act-bar">'
						+'	取消时间：'+item.acceptorder.backTime
						+'</div>'
						+'</c:otherwise>'
						+'</c:choose>'
						+'</div>'
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