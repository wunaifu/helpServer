(function() {
	$.extend({
		removeModa: function() {
			$('.myModa').fadeOut(300);
			setTimeout(function() { $('.myModa').remove() }, 300)
		},
		myAlert: function(options) {
			var option = { title: "提示", message: "提示信息", callback: function() {} };
			if(typeof(options) == "string") { option.message = options } else { option = $.extend(option, options) }
			var top = $(window).height() * 0.3;
			$('body').append('<div class="myModa"><div class="myAlertBox"  style="margin-top:' + top + 'px"><h6>' + option.title + '</h6><p>' + option.message + '</p><div class="btn sure">确定</div></div></div>');
			$('body').css('overflow-y', 'hidden');
			$('.btn.sure').click(function() {
				$.removeModa();
				$('body').css('overflow-y', 'scroll');
				option.callback()
			})
		},

		myToast: function(message) {
			var top = $(window).height() * 0.3;
			$('body').append('<div class="myToast">' + message + '</div>');
			var top = ($(window).height() - $('.myToast').height()) / 2;
			var left = ($('body').width() - $('.myToast').width()) / 2;
			$('.myToast').css({ 'top': top + 'px', 'left': left + 'px' });
			setTimeout(function() {
				$('.myToast').fadeOut(300);
				setTimeout(function() { $('.myToast').remove() }, 300)
			}, 1000)
		},
		
	})
})(jQuery);