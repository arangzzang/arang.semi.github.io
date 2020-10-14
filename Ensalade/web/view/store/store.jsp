<%@page import="com.en.admin.model.service.AdminService"%>
<%@page import="com.en.admin.model.vo.Store"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8273712ffb7f83fc95f2870e4fd08cf5&libraries=services"></script>

	<%
		List<Store> list=new AdminService().storeList();
	%>


	<style>
#wrapper {
	display: flex;
	margin-top: 60px;
	margin-left: 100px;
	margin-bottom: 30px;
}

.text_ {
	margin-bottom: 15px;
	border-radius: 5px;
	height: 50px;
	border-color: #ddd;
	font-size: 13px;
	display: block;
	padding: 0 15px;
	width: 100%;
	height: 43px;
	box-sizing: border-box;
	border: 1px solid #e7e7e7;
	box-shadow: 0 0 0;
	background: #fff;
	font-size: 15px;
	line-height: normal;
	font-weight: 300;
	color: #3d3d3d;
	-webkit-tap-highlight-color: transparent;
	transition: box-shadow .24s ease-out;
	-webkit-appearance: none;
	-moz-appearance: none;
	outline-color: rgb(120, 228, 106);
	/* outline-style: inherit; */
	outline-width: thin;
}
.btn_1{
    border-radius: 5px;
    border: 1px solid #fff;
    color: honeydew;
    background-color: #27b06e;
    cursor: pointer;
    height: 43px;
    width:30%;
}
tr>td{
	height:130px;
}
tr{
	border:1px solid black;
}
.search{
	cursor:pointer;
}
</style>

    <%@include file="/view/common/header.jsp"%>
    <h1 style="text-align:center;margin-top:30px">매장 찾기</h1>
    <div id="wrapper">
    <div id="map" style="width:750px;height:827px;margin-right:50px"></div>
    
    <div>
    	<div>
    	<div style="display:flex">
    		<input type="text" name="address" id="sample6_postcode" placeholder="우편번호" class="text_" required readonly>
				<input type="button" id="search" name="address_" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn_1"><br>
				</div>
				<input type="text" name="address" id="sample6_address" placeholder="주소" class="text_" required>
				<div style="display:flex">
				<input type="text" name="address" id="sample6_detailAddress" placeholder="상세주소" class="text_" required>
				<button id="btn_1" class="btn_1">찾기</button>
				</div>
		</div>
    <div style="width:400px;height:650px;border:1px solid darkgray;border-radius:5px;overflow-y:scroll;overflow-x:hidden;">
    	<div style="width:400px;height:50px;border: 1px solid #27b06e;color: honeydew;background-color: #27b06e;padding: 12px 0px 0px;text-align:center;
    	border-top-left-radius: 5px;border-top-right-radius: 5px;">매장 찾기</div>
    	<div>
    	<%for(Store s:list){%>
    		<table style="width:100%;text-align:center;">
    			<tr>
    				<td style="width:35%;"><img class="search" style="width:100%;height:100%" src="<%=request.getContextPath() %>/image/store/<%=s.getStoreImg()%>">
    				<input type="hidden" value="<%=s.getStoreAddress()%>">
    				<input type="hidden" value="<%=s.getStoreAddress2()%>"></td>
    				<td colspan="2"><p style="font-weight: 700;"><%=s.getStorAdr()%></p>
    				<p><%=s.getStorePhone() %></p></td>
    			</tr>
    			</table>
    			<hr>
    	<%} %>
    	</div>
    </div>
    </div>
    </div>
    <script>
    var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
    var options = { //지도를 생성할 때 필요한 기본 옵션
    	center: new kakao.maps.LatLng(37.537329, 127.078951), //지도의 중심좌표.
    	level: 8 //지도의 레벨(확대, 축소 정도)
    };
    var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
    
    var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667);

 // 마커를 생성합니다
 var marker = new kakao.maps.Marker({
     position: markerPosition
 });

 // 마커가 지도 위에 표시되도록 설정합니다
 marker.setMap(map);
 
$("#btn_1").click(e=>{
	let a=$("#sample6_address").val();
	console.log(a);
 var geocoder = new kakao.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch(a, function(result, status) {

  // 정상적으로 검색이 완료됐으면 
   if (status === kakao.maps.services.Status.OK) {

      var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

      // 결과값으로 받은 위치를 마커로 표시합니다
      var marker = new kakao.maps.Marker({
          map: map,
          position: coords
      });

      // 인포윈도우로 장소에 대한 설명을 표시합니다
      var infowindow = new kakao.maps.InfoWindow({
          content: '<div style="width:150px;text-align:center;padding:6px 0;">검색 위치</div>'
      });
      infowindow.open(map, marker);

      // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
      map.setCenter(coords);
  } 
}); 
})
    </script>
    
     <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
         <script>
        	//api
           function sample6_execDaumPostcode() {
               new daum.Postcode({
                   oncomplete: function(data) {
                       // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                       // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                       // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                       var addr = ''; // 주소 변수
                       var extraAddr = ''; // 참고항목 변수

                       //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                       if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                           addr = data.roadAddress;
                       } else { // 사용자가 지번 주소를 선택했을 경우(J)
                           addr = data.jibunAddress;
                       }
                       // 우편번호와 주소 정보를 해당 필드에 넣는다.
                       document.getElementById('sample6_postcode').value = data.zonecode;
                       document.getElementById("sample6_address").value = addr;
                       // 커서를 상세주소 필드로 이동한다.
                       document.getElementById("sample6_detailAddress").focus();
                   }
               }).open();
           }
           $(".text_").focus(e=>{
          	 $(e.target).css("outline-color","#27b06e");
           })
           
           var positions = [
    {
        title: 'ensalad 역삼점', 
        content:'<div style=display:flex><img src=<%=request.getContextPath()%>/image/store/store.jpg style="width:50px;height:50px;"><p style=padding:5px 0px 0px>ensalad 역삼점</p></div>',
        latlng: new kakao.maps.LatLng(37.500357, 127.036308)
    },
    {
        title: 'ensalad 잠실점',
        content:'<div style=display:flex><img src=<%=request.getContextPath()%>/image/store/store2.jpg style="width:50px;height:50px;"><p style=padding:5px 0px 0px>ensalad 잠실점</p></div>',
        latlng: new kakao.maps.LatLng(37.512146, 127.098478)
    },
    {
        title: 'ensalad 구의점',
        content:'<div style=display:flex><img src=<%=request.getContextPath()%>/image/store/store3.jpg style="width:50px;height:50px;"><p style=padding:5px 0px 0px>ensalad 구의점</p></div>',
        latlng: new kakao.maps.LatLng(37.536894, 127.084232)
    },
    {
        title: 'ensalad 천호점',
        content:'<div style=display:flex><img src=<%=request.getContextPath()%>/image/store/store4.jpg style="width:50px;height:50px;"><p style=padding:5px 0px 0px>ensalad 천호점</p></div>',
        latlng: new kakao.maps.LatLng(37.539201, 127.123210)
    },
    {
        title: 'ensalad 장한평점',
        content:'<div style=display:flex><img src=<%=request.getContextPath()%>/image/store/store5.jpg style="width:50px;height:50px;"><p style=padding:5px 0px 0px>ensalad 장한평점</p></div>',
        latlng: new kakao.maps.LatLng(37.561180, 127.063778)
    }
];

// 마커 이미지의 이미지 주소입니다
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
        
        
    });
    
    var infowindow = new kakao.maps.InfoWindow({
        content: positions[i].content // 인포윈도우에 표시할 내용
    });

    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));


// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}
}
$(".search").click(e=>{
	let a=$(e.target).next().val();
	let b=$(e.target).next().next().val();
	panTo();
	function panTo(){
		    // 이동할 위도 경도 위치를 생성합니다 
		    var moveLatLon = new kakao.maps.LatLng(a,b);
		    // 지도 중심을 부드럽게 이동시킵니다
		    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
		    var level = map.getLevel(); 
    
    		// 지도를 1레벨 내립니다 (지도가 확대됩니다)
  			  map.setLevel(level - 3);
  
		    map.panTo(moveLatLon); 
		}        
})
          
       </script>
    
    <%@include file="/view/common/footer2.jsp"%>