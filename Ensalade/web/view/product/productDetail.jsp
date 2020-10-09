<%@page import="com.en.product.model.vo.ProductComment"%>
<%@page import="com.en.product.model.vo.ProductReview"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.en.product.model.vo.Product,java.util.List,java.text.DecimalFormat"%>


<%@include file="/view/common/header.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/productDetail.css">
<%
	DecimalFormat formatter=new DecimalFormat("###,###");//숫자 3자리마다 ,표시해주는 클래스
	Product p = (Product) request.getAttribute("selectProduct");//서블렛에 있는 키값으로 불러와야함.
	
	String pages =(String) request.getParameter("cPage");
	System.out.println(pages);
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

	
	


%>
<!-- Swiper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/js/swiper.min.js"></script>
<!-- Link Swiper's CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/productDetail.css">


<section class="thisproduct">
	<!-- 상품 썸네일 이미지/ 상품 정보 부모창-->
	<div class="infromation-parent">
		<!-- 상품 썸네일 이미지/ 상품정보 자식창  -->
		<div class="information">
			<!-- 상품 썸네일 이미지 -->
			<div class="img">
				<img src="" alt="">

			</div>
			<!-- 상품 정보 -->
			<div class="productinformation">
				<div class="productintro">
					<div class="content">
						<h2><%=p.getProductName() %></h2>
						<p><%=p.getProductContent() %></p>
					</div>
					<div class="su-form">
						<form class="count" name="form" method="get">
							<p id="price">
								상품금액:
								<%=formatter.format(p.getProductPrice())%>원
							</p>
							수량 : <input type="text" id="amount" value="1" size="3" name="su">
							<button class="su1" type="button" onclick="del();">-</button>
							<button class="su2" type="button" onclick="add();">+</button>
							<br> 금액 : <label id=sum></label>원
						</form>
					</div>
				</div>
				<div class="btn">
					<hr>
					<button class="jangbtn" onclick="movecart()">장바구니 담기</button>
					<button class="orderbtn" onclick="moveorder()">주문하기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 관련상품 -->
	<div class="relate">
        <div class="a-swiper-container">
            <div class="a-swiper-wrapper">
               <%for(int i=0;i < Math.ceil((double)list.size()/4);i++){%>
              <div class="a-swiper-slide">
                <ul>
                 <%for(int j=i*4;j<(i+1)*4;j++){%> 
                 
                   <li>    
	                  <a href="<%=request.getContextPath()%>/product/detailProduct?productNo=<%=p.getProductNo()%>">
		                  <img alt="" src="<%=list.get(j).getProductThumbnail() %>" class="product-img">
		                  <p><%=list.get(j).getProductName() %></p>
		                  <p><%=formatter.format(list.get(j).getProductPrice()) %></p> 
	                  </a>
	               </li>
	                  <% if(list.size()-1==j){ 
	                	  break;}%>
            	<%} %>
	            </ul>
	          </div>
	            <%} %>
            </div>
			<!-- Add Pagination -->
			<div class="a-swiper-pagination"></div>
			<!-- Add Arrows -->
			<div class="a-swiper-button-next"></div>
			<div class="a-swiper-button-prev"></div>
		</div>
	</div>
	<!-- 상품 상세 이미지 -->
	<div id="infobtns">
		<div id="infobtns-ch">
			<!--     		<div class="infos-ch2"> -->
			<button onclick="move('1')" class="infobtn">상품 정보</button>
			<!-- 	    	</div> -->
			<!-- 	    	<div class="infos-ch2"> -->
			<button onclick="move('2')" class="infobtn">후기 보기</button>
			<!-- 		    </div> -->
			<!-- 		    <div class="infos-ch2"> -->
			<button onclick="move('3')" class="infobtn">사진 모아 보기</button>
			<!-- 		    </div> -->
		</div>
		<div class="detail-product-img">
			<div id="infobtn1">
				<!-- 이동 1 -->
				<img alt=""
					src="<%=request.getContextPath()%>/image/product/common/common.jpg">
				<img alt=""
					src="<%=request.getContextPath()%>/image/product/common/common1.jpg">
				<img alt=""
					src="<%=request.getContextPath()%>/image/product/common/common2.jpg">
				<img alt=""
					src="<%=request.getContextPath()%>/image/product/common/common3.jpg">
				<img alt=""
					src="<%=request.getContextPath()%>/image/product/common/common4.jpg">
			</div>
		</div>
		<div class="review-go">
			<div id="infobtn2">
				<!-- 이동 2 -->
				<span>후기를 작성해보세요!</span>
				<button type="button"
					onclick="location.assign('<%=request.getContextPath()%><%=loginMember != null
					? "/view/product/productWrite.jsp?productNo=" + p.getProductNo()
					: "/view/login.jsp"%>')">후기
					쓰러가기</button>
			</div>
		</div>
		<h3>사진 모아보기</h3>
		<div class="review-img">
			<div id="infobtn3">
				<!-- 이동 3 -->
				<img src="<%=request.getContextPath() %>/image/product/salad1.jpg">
				<img src="<%=request.getContextPath() %>/image/product/salad1.jpg">
				<hr>
			</div>
		</div>







		<!-- 클래스명은 변경하면 안 됨 -->
		<div class="b-swiper-container">
			<div class="b-swiper-wrapper">
				<%for(ProductReview prs:reviewList ){ %>
				<div class="b-swiper-slide">
					<img
						style="background-image: url('<%=request.getContextPath() %><%=prs.getFilepath() %>')">
				</div>
				<%} %>

			</div>
			<!-- Add Pagination -->
			<div class="b-swiper-pagination"></div>
			<!-- Add Arrows -->
			<div class="b-swiper-button-next"></div>
			<div class="b-swiper-button-prev"></div>
		</div>

		<!-- Swiper JS -->
		<script src="../package/swiper-bundle.min.js"></script>

		<!-- Initialize Swiper -->


	</div>
	<%
		for (ProductReview pr : reviewList) {
	%>
	<div>
		<div id="puoduct_list">
			<div class="puoduct_slide">
				<table id="tavle_Table">

					<tbody id="tavle_Puoduct" class="puoduct_slidew2">

						<tr>
							<td class="tableTd"><%=pr.getReviewtNo()%></td>

							<td class="tableTd_2"><%=pr.getReviewWriter()%></td>
							<td class="tableTd_3"><%=pr.getReviewTitle()%> <img
								class="puduct_size"
								src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_attach2.gif">
								<span class="img_span"
								style="position: absolute; display: none;"> <img
									src="<%=request.getContextPath()%><%=pr.getFilepath()%>"
									height="80">
							</span></td>
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
						role="img" xmlns="http://www.w3.org/2000/svg"
						viewBox="0 0 512 512">
						
						<path fill="currentColor"
							d="M458.4 64.3C400.6 15.7 311.3 23 256 79.3 200.7 23 111.4 15.6 53.6 64.3-21.6 127.6-10.6 230.8 43 285.5l175.4 178.7c10 10.2 23.4 15.9 37.6 15.9 14.3 0 27.6-5.6 37.6-15.8L469 285.6c53.5-54.7 64.7-157.9-10.6-221.3zm-23.6 187.5L259.4 430.5c-2.4 2.4-4.4 2.4-6.8 0L77.2 251.8c-36.5-37.2-43.9-107.6 7.3-150.7 38.9-32.7 98.9-27.8 136.5 10.5l35 35.7 35-35.7c37.8-38.5 97.8-43.2 136.5-10.6 51.1 43.1 43.5 113.9 7.3 150.8z"></path></svg></span>
				<p class="m1"><%=pr.getReviewViews()%></p>

				<p><%=pr.getReviewContent()%></p>
				<img src="<%=request.getContextPath()%><%=pr.getFilepath()%>">
				<div id="comment-container">
					<div class="comment-editor">
						<%
						 if(loginMember!=null && loginMember.getMemberId().equals("admin")) { 
						%>
						<form action="<%=request.getContextPath()%>/product/productReview"
							method="post" id="form1">
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
						<%
							}
						%>
					</div>
				</div>

				<table id="tbl-comment">
					<%
						for (ProductComment pc : commentList) {
								if (pc.getProductCommentLevel() == 1 && pc.getProductRef() == pr.getReviewtNo()) {
					%>
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
							<%-- <button class="btn-reply" value="<%=bc.getBoardCommentNo()%>">답글</button> --%>
						</td>
					</tr>

					<%
						}
					%>
					<%
						}
					%>
				</table>

			</div>
			<%
				}
			%>


			<div id="pagebar"><%=pageBar%></div>
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
  				location.assign('<%=request.getContextPath()%>/order/productOrder?productNo=<%=p.getProductNo()%>&amount='+su);
  		<%}%>
  		}
  		//장바구니이동
  		function movecart(){
  			var su=$("#amount").val();
  			location.assign('<%=request.getContextPath()%>/basket/inBasket?productNo=<%=p.getProductNo()%>&su='+su);
  		}
        // 수량/가격 기능 script 구문
        var price = <%=p.getProductPrice()%>;
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
        	}else if(hm.value==0||hm.value.chatAt(0)==0){
        		alert("0이상의 숫자만 입력해주세요.")
        		hm.value=1;
        	}
        });
        //수량 값을 0을 보낼수 없음
        $("#amount").keyup(e=>{
            let a=$(e.target).val();
            var sum = document.getElementById("sum");
            if(a==0){
               $("#amount").val(1);
            }
         });
//         if(hm.value==0||hm.value.chatAt(0)==0){
//     		alert("0이상의 숫자만 입력해주세요.")
// 			hm.value=1;        		
//     	}
//     	else{
//     		sum.textContent = parseInt(hm.value)*price+"원";
//     	}
        //수량 버튼 클릭시 태그 색변경
        $("#amount").focus(e=>{
        	$(e.target).css("outline-color","#27b06e");
    	})
      //수량추가 하는 함수
        function add() {
            hm = document.getElementById("amount");
            sum = document.getElementById("sum");
            hm.value++;
        
            sum.textContent = (parseInt(hm.value) * price).toLocaleString();;
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
        //상품 정보,배송 정보, 상품 후기
        function move(seq){
        	var offset = $("#infobtn" + seq).offset();
            $('html, body').animate({scrollTop : offset.top}, 400);
        }
        //버튼 클릭시 색상 변경하고 다른 버튼들은 원래 색상
        var infosch2 = document.getElementsByClassName("infos-ch2");

        for (var i = 0; i < infosch2.length; i++) {
        	infosch2[i].addEventListener('click', function(){
            for (var j = 0; j < infosch2.length; j++) {
            	infosch2[j].style.color = "black";
            }
            this.style.color = "gold";
          })
        }
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
        
       

       
        $(".puduct_size").hover(e=> {
    		$(e.target).next().css("display","inline-block");
    		}, function(){
    		  $(".img_span").not(this).css("display","none");
    		}); 
        //스와이퍼
        var swiper = new Swiper('.a-swiper-container', {
	    spaceBetween: 30,
	    centeredSlides: true,
	    autoplay: {
       	delay: 2500,
       	disableOnInteraction: false,
     	},
     	agination: {
       	el: '.a-swiper-pagination',
       	clickable: true,
     	},
     	navigation: {
       	nextEl: '.a-swiper-button-next',
       	prevEl: '.a-swiper-button-prev',
	   		},		
	   	});

	 $(function() {
     	$(".puoduct_slide").click(function() {
     		$(".puoduct_list_content2").css("display","none");
     		$(this).next().slideToggle(500);
     		
     	});
     	
     });

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
    		
    		
    		/* var location= $("#scroll").offset(); */
    		console.log(location);
    		window.scrollTo({left: 85.3046875 , top: 4339.59375, behavior:'auto'});
    		
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
   		              console.log($(e.target).parent().parent().prev().children().children().children().children().first().text());
   	})
    	 	  //설진호 스와이퍼
     var swiper = new Swiper('.b-swiper-container', {
      slidesPerView: 5,
      spaceBetween: 3,
      slidesPerGroup: 5,
      direction: getDirection(),
      navigation: {
        nextEl: '.b-swiper-button-next',
        prevEl: '.b-swiper-button-prev',
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