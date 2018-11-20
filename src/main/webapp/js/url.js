function doUrl(logUrl,tocurl,id) {
		$.ajax({
			url : logUrl,
			type : 'POST',
			dataType : 'json',
			data : {
				goodid :id			},
			complete : function(xhr, textStatus) {
				// called when complete
				location.href =tocurl;
			}
		});
}
(function() {
	$('.am-slider').flexslider();
});
$(document).ready(
		function() {
			$("li").hover(
					function() {
						$(".category-content .category-list li.first .menu-in")
								.css("display", "none");
						$(".category-content .category-list li.first")
								.removeClass("hover");
						$(this).addClass("hover");
						$(this).children("div.menu-in").css("display", "block")
					}, function() {
						$(this).removeClass("hover")
						$(this).children("div.menu-in").css("display", "none")
					});
		});

if ($(window).width() < 640) {
	function autoScroll(obj) {
		$(obj).find("ul").animate({
			marginTop : "-39px"
		}, 500, function() {
			$(this).css({
				marginTop : "0px"
			}).find("li:first").appendTo(this);
		})
	}
	$(function() {
		setInterval('autoScroll(".demo")', 3000);
	})
}

$(function() {
	var delay = 5000;
	var list=$('#box li');
	var index=0;
	var length=list.length;
	setInterval(() => {
		for (var i = 0; i < length; i++) {
			if(i!=index){
				$(list[i]).css('display','none');
			}else {
				$(list[i]).css('display','block');
			}
		}
		if(index==(length-1)){
			index=0;
		}else{
			index++;
		}
	}, delay);
});