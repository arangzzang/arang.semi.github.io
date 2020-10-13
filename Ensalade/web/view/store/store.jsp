<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8273712ffb7f83fc95f2870e4fd08cf5&libraries=services"></script>

	<style>
		#wrapper{
			display:flex;
		}
	</style>

    <%@include file="/view/common/header.jsp"%>
    <div id="wrapper">
    <div id="map" style="width:700px;height:600px;"></div>
    
    <div>
    <input style="margin-top:20px" type="text" name="address" id="sample6_postcode" placeholder="우편번호" class="text_" required readonly>
				<input type="button" id="search" name="address_" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn_1"><br>
				<input type="text" name="address" id="sample6_address" placeholder="주소" class="text_" required><br>
				<input type="text" name="address" id="sample6_detailAddress" placeholder="상세주소" class="text_" required>
				<button id="btn_1">찾기</button>
    </div>
    </div>
    <script>
    var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
    var options = { //지도를 생성할 때 필요한 기본 옵션
    	center: new kakao.maps.LatLng(37.566535,126.9779692), //지도의 중심좌표.
    	level: 3 //지도의 레벨(확대, 축소 정도)
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
          content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
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
          
       </script>
    
    <%@include file="/view/common/footer2.jsp"%>