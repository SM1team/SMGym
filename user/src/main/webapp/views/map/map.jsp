<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
  #map {
    width: 500px;
    height: 400px;
    border: 2px solid darkred;
  }
  #ms {
    width: 200px;
    height: 400px;
    border: 2px solid darkred;
    overflow: auto;
  }
</style>
<script>
  let map3 = {
    init:function(){
      this.makemap(37.554472, 126.980841, '남산', 's1.jpg', 100);

      $('#sbtn').click(()=>{ this.makemap(37.554472, 126.980841, '남산', 's1.jpg', 100); });
      $('#bbtn').click(()=>{ this.makemap(35.175109, 129.175474, '해운대', 's2.jpg', 200); });
      $('#jbtn').click(()=>{ this.makemap(33.254564, 126.560944, '서귀포', 's3.jpg', 300); });
    },
    makemap:function(lat, lng, title, img, target){
      // 기존의 지도를 생성하고 마커를 추가하는 코드
      let mapContainer = document.getElementById('map');
      let mapOptions = {
        center: new kakao.maps.LatLng(lat, lng),
        level: 3
      };
      let map = new kakao.maps.Map(mapContainer, mapOptions);

      // 마커 생성
      let marker = new kakao.maps.Marker({
        position: new kakao.maps.LatLng(lat, lng),
        title: title
      });
      marker.setMap(map);

      // 이미지를 추가하는 방법 (예: 정보창)
      let content = '<div style="padding:5px;">' + title + '<br><img src="/assets/img/' + img + '" width="100px"></div>';
      let infowindow = new kakao.maps.InfoWindow({
        content: content
      });
      infowindow.open(map, marker);

      this.markers(target, map);
    },
    markers:function(target, map){
      // 마커를 표시하는 추가적인 코드
      let content = '<div style="padding:5px;">Marker Info</div>';
      let markerPosition = new kakao.maps.LatLng(37.554472, 126.980841);
      let marker = new kakao.maps.Marker({
        position: markerPosition
      });
      marker.setMap(map);

      let infowindow = new kakao.maps.InfoWindow({
        content: content
      });
      infowindow.open(map, marker);
    }
  };

  $(function(){
    map3.init();
  });
</script>
<div class="col-sm-10">
  <h2>Map3 Page</h2>
  <button id="sbtn">Seoul</button>
  <button id="bbtn">Busan</button>
  <button id="jbtn">Jeju</button>
  <div class="row">
    <div class="col-sm-7">
      <div id="map"></div>
    </div>
    <div class="col-sm-5">
      <div id="ms"></div>
    </div>
  </div>
</div>
