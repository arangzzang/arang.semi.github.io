<%@page import="sun.invoke.empty.Empty"%>
<%@page import="com.en.product.model.vo.ProductComment"%>
<%@page import="com.en.product.model.vo.ProductReview"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.en.product.model.vo.Product,java.util.List,java.text.DecimalFormat"%>


<%@include file="/view/common/header.jsp"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/productDetail.css">

<!-- Swiper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/js/swiper.min.js"></script>
<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.min.css">
<%
	DecimalFormat formatter=new DecimalFormat("###,###");//숫자 3자리마다 ,표시해주는 클래스
	
	Product p = (Product) request.getAttribute("selectProduct");//서블렛에 있는 키값으로 불러와야함.
	
	String pages =(String) request.getParameter("cPage");
	
	List<Product> list = (List) request.getAttribute("relateProduct");
	//상품리뷰 리스트
	List<ProductReview> reviewList = (List) request.getAttribute("reviewList");
	
	int productRef = 0;
	
	String msg = request.getParameter("msg");
	
	if (msg != null) {
		productRef = Integer.parseInt(request.getParameter("productRef"));
	} ;
	//페이징바
	String pageBar = (String) request.getAttribute("pageBar");
	//댓글 리스트
	List<ProductComment> commentList = (List) request.getAttribute("commentList");
	
	int totalData=(int)request.getAttribute("totalData");
	
	String product_number = request.getParameter("product_number");
%>
<section class="thisproduct">
	<!-- 상품 썸네일 이미지/ 상품 정보 부모창-->
	<div class="infromation-parent">
		<!-- 상품 썸네일 이미지/ 상품정보 자식창  -->
		<div class="information">
			<!-- 상품 썸네일 이미지 -->
			<div >
				<img class="img-style" src="<%=request.getContextPath()%><%=p.getProductThumbnail()%>"alt="">
			</div>
			<!-- 상품 정보 -->
			<div class="productinformation">
				<div class="productintro">
					<div class="content">
						<h2 class="salade-name"><%=p.getProductName() %></h2>
						<hr class="hr2">
						<p class="salade-content"><%=p.getProductContent() %></p>
					</div>
					<div class="su-form">
						<form class="count" name="form" method="get">
							<div id="price">
								<!-- 할인 적용 로직  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
								 <%if(p.getSalePer()!=0){ %>
							
								<p><strong class="price-strong">판매가격</strong>
									<s class="won-color"><%=p.getProductPrice() %>원</s>
								</p>
								<strong class="prive-strongs">할인판매가격</strong>
								<p class="won-color-to won-color-wer" >  
									<%=formatter.format(p.getProductPrice()-(p.getProductPrice()*p.getSalePer()/100)) %>
								</p>원
									<% }else {%>
								<p><strong class="price-strong">판매가격</strong>
									<%=p.getProductPrice() %>원
								</p>
								<%} %>	
							</div>
							<div class="product-cout">
							 <strong>수량</strong> 
							 <input type="text" id="amount" value="1" size="3" name="su">
							<button class="su1" type="button" onclick="del();">
							<i class="far fa-minus-square fa-2x"></i>
							</button>
							<button class="su2" type="button" onclick="add();">
							<i class="far fa-plus-square fa-2x"></i>
							</button>
							</div>
							<strong class="money">총 상품금액</strong>
							<label id=sum></label>원
							<p class="product-delivery">
							※ 평일 오전 11시 이전에 주문 결제 완료하시면 다음날 받아 보실 수 있습니다.
							<br>
   							&nbsp;&nbsp;&nbsp;단, 하루 제작량이 정해져 있어 주문량이 많은 날에는 배송 지연이 발생할 수
   							<br>
   							&nbsp;&nbsp;&nbsp;있습니다. 이점 양해 부탁드리며, 배송 메세지에 희망 수령일을 기재해주시면
   							<br>
   							&nbsp;&nbsp;&nbsp;최대한 반영해 드리고 있습니다.
							</p>
						</form>
					</div>
				</div>
				<div class="btn">
					<hr>
					<button class="jangbtn" onclick="movecart()"><p class="jangbtn-movecart">장바구니 담기</p></button>
					<button class="orderbtn" onclick="moveorder()"><p class="jangbtn-movecart">주문하기</p></button>
				</div>
			</div>
		</div>
	</div>
	<!-- 관련상품 -->
	<div class="relate">
        <div class="swiper-container a-container">
            <div class="swiper-wrapper a-wrapper">
               <%for(int i=0;i < Math.ceil((double)list.size()/4);i++){%>
              <div class="swiper-slide a-slide">
                <ul>
                 <%for(int j=i*4;j<(i+1)*4;j++){%> 
                   <li>    
	                  <a class=" pridse" href="<%=request.getContextPath()%>/product/detailProduct?productNo=<%=list.get(j).getProductNo()%>">
		                  <img alt="" src="<%=list.get(j).getProductThumbnail() %>" class="product-img">
		                  <p class="prids"><%=list.get(j).getProductName() %></p>
		                  <p class="prids"><%=list.get(j).getSalePer()!=0?formatter.format(list.get(j).getProductPrice()-(list.get(j).getProductPrice()*list.get(j).getSalePer()/100)) : formatter.format(list.get(j).getProductPrice())   %>원</p> 
	                  	<%System.out.println(list.get(j).getSalePer());
	                  	System.out.println(formatter.format(list.get(j).getProductPrice()-(list.get(j).getProductPrice()*list.get(j).getSalePer()/100))); %>
	                  </a><!-- p.getProductPrice()-(p.getProductPrice()*p.getSalePer()/100) -->
	               </li>
	                  <% if(list.size()-1==j){ 
 	                	  break;}%>
            	<%} %>
	            </ul>
	          </div>
	            <%} %>
            </div>
			<!-- Add Pagination -->
			<div class="swiper-pagination a-pagination"></div>
			<!-- Add Arrows -->
			<div class="swiper-button-next a-button-next"></div>
			<div class="swiper-button-prev a-button-prev"></div>
		</div>
	</div>
	<!-- 상품 상세 이미지 -->
	<div id="infobtns">
		<div id="infobtns-ch">
			<ul id="infobtns-ch22">
				<li class="infobtns-ch3">
				<a class="infos-ch2" onclick="move('1')">
				<span class="infos-ch33">상품정보</span>
				<span ></span>
				</a>
				</li >
				<li class="infobtns-ch3">
				<a class="infos-ch2" onclick="move('2')">
				<span class="infos-ch33">후기보기</span>
				<span ></span>
				</a>
				</li>
				<li class="infobtns-ch3">
				<a class="infos-ch2" onclick="move('3')">
				<span class="infos-ch33">배송안내</span>
				<span ></span>
				</a>
				</li>	
			</ul>
			 <!--     		<div class="infos-ch2"> 
			<button class="infos-ch2" onclick="move('1')" class="infobtn">상품 정보</button>
				    	</div>
				    	<div class="infos-ch2">
			<button class="infos-ch2" onclick="move('2')" class="infobtn">후기 보기</button>
					    </div>
					    <div class="infos-ch2">
			<button class="infos-ch2" onclick="move('3')" class="infobtn">사진 모아 보기</button>
					    </div> -->
		</div>
		<div class="detail-product-img">
			<div id="infobtn1">
				<!-- 이동 1 -->
				<img alt=""
					src="<%=request.getContextPath()%><%=p.getProductSubimg() %>">
				
				<img alt=""
					src="<%=request.getContextPath()%><%=p.getProductImg1() %>">
				<%if(p.getProductImg2()!=null) {%>
				<img alt=""
					src="<%=request.getContextPath()%><%=p.getProductImg2() %>">
					<%} %>
				<%if(p.getProductImg3()!=null) {%>
				<img alt=""
					src="<%=request.getContextPath()%><%=p.getProductImg3() %>">
					<%} %>
				<%if(p.getProductImg4()!=null) {%>
				<img alt="" 
					src="<%=request.getContextPath()%><%=p.getProductImg4() %>">
					<%} %>
				<%if(p.getProductImg5()!=null) {%>
				<img alt="" 
					src="<%=request.getContextPath()%><%=p.getProductImg5() %>">	
					<%} %>
				<%if(p.getProductImg6()!=null) {%>
				<img alt="" 
					src="<%=request.getContextPath()%><%=p.getProductImg6() %>">	
					<%} %>
				<img id="infobtn3" alt="" 
					src="<%=request.getContextPath()%>/image/product/common/02_delivery_bn_2007.jpg">
				<img alt="" 
					src="<%=request.getContextPath()%>/image/product/common/03_check_bn_2007.jpg">	
			</div>
		</div>
		<div id="review-go">
			<div id="infobtn2">
				<!-- 이동 2 -->
				<span id="icon">
				<i class="far fa-comments fa-2x"></i>
				</span>
				<span id="font-color">지금, 후기를 작성해보세요!</span>
				<button id="button-color"type="button"
					onclick="location.assign('<%=request.getContextPath()%><%=loginMember != null
					? "/view/product/productWrite.jsp?productNo=" + p.getProductNo()
					: "/view/login.jsp"%>')"><span id="bold">후기
					쓰러가기</span></button>
			</div>
		</div>
		<!-- 클래스명은 변경하면 안 됨 스와이퍼 -->
		<h1 id="swiper-view">사진 모아보기</h1>
		<div class="swiper-container b-container">
			<div class="swiper-wrapper b-wrapper">
					<%for(ProductReview prs:reviewList ){ %>
					<%if(!prs.getFilepath().contains("null")){ %>
				<div class="swiper-slide b-slide">
					<img
						style="background-image: url('<%=request.getContextPath() %><%=prs.getFilepath() %>')">
				</div>
				<%}} %>
			</div>
			<!-- Add Pagination -->
			<div class="swiper-pagination b-pagination"></div>
			<!-- Add Arrows -->
			<div class="swiper-button-next b-button-next"></div>
			<div class="swiper-button-prev b-button-prev"></div>
		</div>
	</div>
	<span id="scroll"></span>
	<h1 id="views-list">등록된  리뷰</h1><p id="tatal-Data"><%=totalData%></p>
	<%for (ProductReview pr : reviewList) {%>
	<div id="review-list">
		<div id="puoduct_list">
			<div class="puoduct_slide">
				<table id="tavle_Table">
					<tbody id="tavle_Puoduct" class="puoduct_slidew2">
						<tr>
							<td class="tableTd"><%=pr.getReviewtNo()%></td>
							<td class="tableTd_2"><%=pr.getReviewWriter()%></td>
							<td class="tableTd_3"><%=pr.getReviewTitle()%> 
							<%if(!pr.getFilepath().contains("null")){ %>
							<img class="puduct_size" src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_attach2.gif">
								<span class="img_span"
								style="position: absolute; display: none;"> <img
									src="<%=request.getContextPath()%><%=pr.getFilepath()%>"
									height="80">
							</span><%} %></td>
							<td class="tableTd_4"><%=pr.getReviewWriteDate()%></td>
							<td id="tableTD_5" class="tableTd_5"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="puoduct_list_content" class="puoduct_list_content2">
				<span class="like"> <input type="hidden"
					value="<%=pr.getReviewtNo()%>"> <svg class="a3"
						aria-hidden="true" focusable="false" data-prefix="far"
						data-icon="heart" class="svg-inline--fa fa-heart fa-w-16"
						role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
						<path fill="currentColor"
							d="M458.4 64.3C400.6 15.7 311.3 23 256 79.3 200.7 23 111.4 15.6 53.6 64.3-21.6 127.6-10.6 230.8 43 285.5l175.4 178.7c10 10.2 23.4 15.9 37.6 15.9 14.3 0 27.6-5.6 37.6-15.8L469 285.6c53.5-54.7 64.7-157.9-10.6-221.3zm-23.6 187.5L259.4 430.5c-2.4 2.4-4.4 2.4-6.8 0L77.2 251.8c-36.5-37.2-43.9-107.6 7.3-150.7 38.9-32.7 98.9-27.8 136.5 10.5l35 35.7 35-35.7c37.8-38.5 97.8-43.2 136.5-10.6 51.1 43.1 43.5 113.9 7.3 150.8z"></path></svg></span>
				<p class="m2"><%=pr.getReviewViews()%></p>
				<div class="review-content">
				<p><%=pr.getReviewContent()%></p>
				<%if(!pr.getFilepath().contains("null")){ %>
				<img class=" img-list" src="<%=request.getContextPath()%><%=pr.getFilepath()%>">
				<%} %>
				</div>
				<%if(loginMember!=null && loginMember.getMemberId().equals("admin")) { %>
				<div class="comment-container">
					<div class="comment-editor">
						<form action="<%=request.getContextPath()%>/product/productReview"
							method="post" class="form1">
							<input type="hidden" name="productCommentLevel" value="1">
							<input type="hidden" name="productCommentWriter"
								value="<%=loginMember != null ? loginMember.getMemberId() : ""%>">
							<input type="hidden" name="productRef"
								value="<%=pr.getReviewtNo()%>"> <input type="hidden"
								name="productNo" value="<%=p.getProductNo()%>"> <input
								type="hidden" name="productCommentRef" value="0">
							<textarea name="productCommentContent" cols="55" rows="3"></textarea>
							<input type="submit" value="등록">
						</form>
					</div>
				</div>
					<%}%>
				<%for (ProductComment pc : commentList) {
					if (pc.getProductCommentLevel() == 1 && pc.getProductRef() == pr.getReviewtNo()) {%>
				<div class="review-item">
					<div class="wirter-color"><%=pc.getProductCommentWriter()%> </div>
					<div><p><%=pc.getProductCommentContent()%></p></div>
					<div><%=pc.getProductCommentDate()%></div>
				</div>	
				<%-- <table id="tbl-comment">
					<tr class="level1">
						<td><sub class="comment-writer"><%=pc.getProductCommentWriter()%></sub>
							<sub class="comment-date"><%=pc.getProductCommentDate()%></sub> <br>
							<%=pc.getProductCommentContent()%></td>
						<td>
							<button class="btn-reply" id="<%=pr.getReviewtNo()%>"
								value="<%=pc.getProductCommentNo()%>">답글</button>
						</td>
					</tr>
					<%
						} else if (pc.getProductCommentLevel() == 2 && pc.getProductRef() == pr.getReviewtNo()) {
					%>
					<tr class="level2">
						<td><sub><%=pc.getProductCommentWriter()%></sub> <sub><%=pc.getProductCommentDate()%></sub>
							<br> <%=pc.getProductCommentContent()%></td>
						<td> 
							<button class="btn-reply" value="<%=bc.getBoardCommentNo()%>">답글</button>
						</td>
					</tr>
					</table> --%>
						<%}%>
					<%}%>
			</div>
			<%}%>
			<%if(!reviewList.isEmpty()){ %>
			<div id="pagebar"><%=pageBar%></div>
			<%} %>
		</div>
	</div>
	</div>
</section>


<script type="text/javascript">
  		//주문하기이동
  		function moveorder(){
  			var su=$("#amount").val();

  			<%if(loginMember==null){
  				String loc="/order/productOrder";%>

  				location.assign('<%=request.getContextPath()%>/view/login.jsp?productNo=<%=p.getProductNo()%>&loc=<%=loc%>&su='+su);
  			<%} else {%>
  				location.assign('<%=request.getContextPath()%>/order/productOrder?productNo=<%=p.getProductNo()%>&product_number=<%=product_number%>&amount='+su);
  		<%}%>
  		}
  		//장바구니이동
  		function movecart(){
  			var su=$("#amount").val();
  			location.assign('<%=request.getContextPath()%>/basket/inBasket?productNo=<%=p.getProductNo()%>&su='+su);
  		}
        // 수량/가격 기능 script 구문
    	 
          <%if(p.getSalePer()!=0){ %>
        var price = parseInt($(".won-color-wer").text().replace(/,/g, ""));
       <%}else{%>
       var price = <%=p.getProductPrice()%>
        
       <%}%>
       
        var amount;
        onload=function(){
   			document.getElementById("sum").textContent = price.toLocaleString();
   		}
        //사용자가 수량 직접 입력시 -> 문자입력 X 경고창 첫글자 0X
            $("#amount").keyup(function(){
        	var sum = document.getElementById("sum");
        	var hm = document.getElementById("amount");
        	
        	 if(hm.value=this.value.replace(/[^0-9]/g, '')){
        		sum.textContent = (parseInt(hm.value)*price).toLocaleString();
        	 /* }else if(hm.value==0||hm.value.chatAt(0)==0){
        		alert("1이상의 숫자만 입력해주세요.");
        		hm.value=1;*/
        	} 
        });   	 
        //수량 값을 0을 보낼수 없음
      /*   $("#amount").keyup(e=>{
            let a=$(e.target).val();
            
            var sum = document.getElementById("sum");
            if(a==0){
               $("#amount").val(1);
            }
         }); */
//         if(hm.value==0||hm.value.chatAt(0)==0){
//     		alert("0이상의 숫자만 입력해주세요.")
// 			hm.value=1;        		
//     	}
//     	else{
//     		sum.textContent = parseInt(hm.value)*price+"원";
//     	}
         
          $("#amount").blur(e=>{
        	 if($(e.target).val()==0){
        		 $(e.target).val(1);
        		 sum.textContent=($(e.target).val()*price).toLocaleString();
        	 }
        	 
         }); 
        //수량 버튼 클릭시 태그 색변경
        $("#amount").focus(e=>{
        	$(e.target).css("outline-color","#27b06e");
    	});
      //수량추가 하는 함수
        function add() {
            hm = document.getElementById("amount");
            sum = document.getElementById("sum");
            
            hm.value++;
            
            sum.textContent = (parseInt(hm.value) * price).toLocaleString();
           
        }
      //수량감소 하는 함수
        function del() {
            hm = document.getElementById("amount");
            sum = document.getElementById("sum");
            if (hm.value > 1) {
                hm.value--;
                sum.textContent = (parseInt(hm.value) * price).toLocaleString();;
            }
        }
        //상품 정보,배송 정보, 상품 후기 클릭시 이동
        function move(seq){
        	var offset = $("#infobtn" + seq).offset();
            $('html, body').animate({scrollTop : offset.top}, 400);
        }
        //버튼 클릭시 색상 변경하고 다른 버튼들은 원래 색상
       $(".infos-ch2").click(e=>{
    	   $(".infos-ch2").children().removeClass();
    	  $(e.target).next().addClass("bars");
    	 
       })
        //스크롤 내릴시 css(sticky) 설정
//         window.onscroll = function(){scrollsticky()};
//         let infobtns = doucument.getElementById("infobtns-ch");
//         let sticbar = infobtns.offsetTop;
// 		function scrollsticky(){
// 			if (window.pageYOffset >= sticbar) {
// 				infobtns.classList.add("sticbar")
// 			  } else {
// 				  infobtns.classList.remove("sticbar");
// 			  }
// 		}
		//리뷰
        $(".puduct_size").hover(e=> {
    		$(e.target).next().css("display","inline-block");
    		}, function(){
    		  $(".img_span").not(this).css("display","none");
    		}); 

        $(function() {
   		 console.log($(".tableTd").length);
        	$(".puoduct_slide").click(function() {

        		$(".puoduct_list_content2").not($(this).next()).css("display","none");
        	
        		$(this).next().slideToggle(500);
        	});
        });
        //댓글,대댓글 스크립트구문
    	$(".btn-reply").click(e=>{
    		<%if (loginMember != null) {%>
    		let tr=$("<tr>");
    		let form=$("#form1").clone();
    		form.find("textarea").attr("rows","1");
    		form.find("[name=productCommentLevel]").val("2");
    		form.find("[name=productCommentRef]").val(e.target.value);
    		form.find("[name=productRef]").val(e.target.id);
    		form.find("[type=submit]").addClass("btn-insert2");
    		let td=$("<td>").attr("colspan","2");
    		console.log(form);
    		td.append(form);
    		tr.append(td);
    		tr.find("td").css("display","none");
    		$(e.target).parents("tr").after(tr.children("td").slideDown(800));
    		$(e.target).off("click");//클릭이벤트제거하기
    		<%}%>
    	});
    	
    	$(function(){
    		<%if (productRef != 0||pages!=null) {%>
    		var location = document.querySelector("#scroll").offsetTop;
    		console.log(location);
    		window.scrollTo({ top:location , behavior:'auto'});
    		for(var i=0;i<$(".tableTd").length;i++){
    			if(<%=productRef%>==$(".tableTd")[i].textContent){
    			$(".puoduct_slide")[i].click();
    			};};
    			<%}%>
    		});
    	
    	$(".like").click(e=>{
   		 $.ajax({
   			url:"<%=request.getContextPath()%>/Produnt/ProduntLikeCountServlet",
   			data:{"like_count":$(e.target).parent().parent().prev().children().children().children().children().first().text(),"userId":"<%=loginMember != null ? loginMember.getMemberId() : ""%>"},
   			dataType:"html",
   			type:"post",
   			success:data=>{
   				$(e.target).parent().next().html(data);
   			}
   		})
   	})
        //스와이퍼
        var swiper = new Swiper('.a-container', {
	      spaceBetween: 30,
	      centeredSlides: true,
	      autoplay: {
	        delay: 2500,
	        disableOnInteraction: false,
	      },
	      pagination: {
	        el: '.swiper-pagination',
	        clickable: true,
	      },
	      navigation: {
	        nextEl: '.swiper-button-next ',
	        prevEl: '.swiper-button-prev',
	      },
	    });
        
    	 	  //설진호 스와이퍼
     var swiper = new Swiper('.b-container', {
   
    	 slidesPerView: 5,
      /*  centeredSlides: true,  */
      spaceBetween: 3,
      slidesPerGroup: 5,
      direction: getDirection(),
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
      on: {
        resize: function () {
          swiper.changeDirection(getDirection());
        }
      }
    });

    function getDirection() {
      var windowWidth = window.innerWidth;
      var direction = window.innerWidth <= 760 ? 'vertical' : 'horizontal';
      return direction;
    } 
  
       
        </script>

 <%@include file="/view/common/footer.jsp"%> 

