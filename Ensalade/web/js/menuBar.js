<!-- Menubar -->
	$("#loginjoin>ul>li").on("hover", (e) => {
		$(e.target).css("backgroundColor", "red");
	});    
	
	//메인메뉴에서 슬라이더가 내려가면 메뉴바 백그라운드가 생김
	/*$(function () {
	    $(".swiper-slide").each(function (i, v) {
	        if (i == 0) {
	            $(v).on("mouseenter", e => {
	                $("#headcap").css("background-color", "rgba(255,255,255,0)");
	            });
	        }
	        if (i == 1) {
	            $(v).on("mouseenter", e => {
	                $("#headcap").css("background-color", "rgba(255,255,255,1)");
	            });
	        }
	    });
	});*/