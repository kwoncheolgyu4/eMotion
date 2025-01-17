<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="java.util.List" %>
<%@ page import="com.eMotion.team.map.controller.mapController.StationPoint" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>충전소 및 서비스센터 길 찾기</title>
<!-- Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
<!-- TMap -->
<script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=n9pFS1xDL83iAckIvHawc1M0unL7Z3LR2LqJ1kjN"></script>
<!-- 승욱이 Key : mB52wJcd8j9z8CEwcTTS74kzvdeqBGl079FHl1CI-->
<!-- 내 Key : n9pFS1xDL83iAckIvHawc1M0unL7Z3LR2LqJ1kjN-->
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.rawgit.com/davidshimjs/qrcodejs/gh-pages/qrcode.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!-- 헤더 풋터 css -->
<link rel="stylesheet" href="/resources/css/headerFooter.css">
<!-- 헤더 풋터 css -->
</head>	
<style>

::-webkit-scrollbar { /* 게시판 css 추가 */
    display: none;
}/* 게시판 css 추가 */

.menu-icon {
	margin-top: 0.45rem;
	margin-bottom: 0.45rem;
}

.bi {
	padding: 0.40rem;
}

.logo img {
	max-height: 6vh;
	display: block;
	cursor: pointer;
}

.bot_brd {
	height: 4px;
	background: linear-gradient(to bottom, #d6edff, rgba(214, 237, 255, 0));
}

/* 게시판 컨테이너 스타일 수정 */
.board-container {
	background: white;
	border-radius: 0;
	box-shadow: none;
	padding: 2rem 1rem;
}

@media ( min-width : 768px) {
	.board-container {
		padding: 2rem;
	}
}

.page-title {
	color: #2c3e50;
	font-weight: 700;
	margin-bottom: 2rem;
	font-size: 1.5rem;
}

.board-table th {
	background-color: #f8f9fa;
	font-weight: 600;
	padding: 1rem 0.5rem;
	color: #495057;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
}

@media ( min-width : 768px) {
	.page-title {
		font-size: 2rem;
	}
}

/* 탭 네비게이션 */
.nav-tabs {
	border-bottom: 2px solid #eee;
	margin-bottom: 1.5rem;
	flex-wrap: nowrap;
	overflow-x: auto;
	-webkit-overflow-scrolling: touch;
}

.nav-tabs::-webkit-scrollbar {
	display: none;
}

.nav-tabs .nav-link {
	border: none;
	color: #6c757d;
	font-weight: 500;
	padding: 0.7rem 1rem;
	white-space: nowrap;
	border-radius: 10px 10px 0 0;
	transition: all 0.2s ease;
}

@media ( min-width : 768px) {
	.nav-tabs .nav-link {
		padding: 0.7rem 1.2rem;
	}
}

.nav-tabs .nav-link:hover {
	color: var(--primary-color);
	background-color: #f8f9fa;
}

.nav-tabs .nav-link.active {
	color: var(--primary-color);
	border-bottom: 2px solid var(--primary-color);
	font-weight: 600;
}

/* 검색바 */
.search-container {
	background: white;
	border-radius: 10px;
	padding: 0.5rem;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
	width: 100%;
	margin-bottom: 1rem;
}

.search-form {
	display: flex;
	flex-wrap: wrap;
	gap: 0.5rem;
}

@media ( max-width : 767px) {
	.search-form .form-select, .search-form .form-control, .search-form .btn
		{
		width: 100%;
	}
}

@media ( min-width : 768px) {
	.search-form {
		flex-wrap: nowrap;
	}
	.search-form .form-select {
		width: auto;
	}
	.search-form .form-control {
		min-width: 300px;
	}
}

/* 테이블 & 카드 뷰 */
.board-table {
	display: none;
}

.board-cards {
	display: block;
}

@media ( min-width : 768px) {
	.board-table {
		display: table;
		border-collapse: separate;
		border-spacing: 0;
		width: 100%;
		border-radius: 10px;
		overflow: hidden;
		margin-top: 1.5rem;
	}
	.board-cards {
		display: none;
	}
}
/* 테이블 뷰 폰트 크기 조정 */
.board-table th, .board-table td {
	font-size: 1rem; /* 폰트 크기 조정 */
	text-align: center; /* 내용 가운데 정렬 */
	vertical-align: middle; /* 세로 가운데 정렬 */
}

/* 모바일 카드 뷰 폰트 크기 및 정렬 */
.board-card .card-title {
	font-size: 1rem; /* 카드 제목 폰트 크기 */
}

.board-card .card-meta {
	font-size: 0.85rem; /* 카드 메타 정보 폰트 크기 */
	display: flex;
	justify-content: center;
	gap: 1rem; /* 각 정보 간격 */
}

.board-card .category-tag {
	font-size: 0.8rem; /* 카테고리 태그 폰트 크기 */
}

.board-table th {
	background-color: #f8f9fa;
	font-weight: 600;
	padding: 1rem;
	color: #495057;
}

.board-table td {
	padding: 1rem;
	border-top: 1px solid #f1f3f5;
	vertical-align: middle;
}

.board-table tr:hover {
	background-color: #f8f9fa;
}

/* 모바일 카드 뷰 */
.board-card {
	background: white;
	border-radius: 10px;
	padding: 1rem;
	margin-bottom: 1rem;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
}

.board-card .card-title {
	font-size: 1.1rem;
	margin-bottom: 0.5rem;
	color: #2c3e50;
}

.board-card .card-meta {
	font-size: 0.9rem;
	color: #6c757d;
	display: flex;
	justify-content: space-between;
	flex-wrap: wrap;
	gap: 0.5rem;
}

.board-card .category-tag {
	background-color: #f8f9fa;
	padding: 0.2rem;
	border-radius: 5px;
	font-size: 0.85rem;
	color: #495057;
}

/* 버튼 */
.custom-btn {
	background-color: var(--primary-color);
	border: none;
	padding: 0.5rem 1.2rem;
	font-weight: 500;
	border-radius: 8px;
	transition: all 0.2s ease;
	width: 90px;
}

.custom-btn:hover {
	background-color: var(--hover-color);
	transform: translateY(-1px);
}

/* 페이지네이션 */
.pagination {
	justify-content: center;
	gap: 0.3rem;
	margin: 2rem 0 1rem 0;
}

.pagination .page-link {
	border: none;
	padding: 0.5rem 1rem;
	color: #495057;
	font-weight: 500;
	border-radius: 8px;
}

@media ( max-width : 767px) {
	.pagination .page-link {
		padding: 0.4rem 0.8rem;
	}
}

.pagination .page-link:hover {
	background-color: #f8f9fa;
	color: var(--primary-color);
}

.pagination .page-item.active .page-link {
	background-color: var(--primary-color);
	color: white;
}

.dropdown-menu {
	border: none;
	box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
}

.dropdown-item {
	padding: 0.7rem 1.2rem;
}

.dropdown-item:hover {
	background-color: #f8f9fa;
	color: var(--primary-color);
}

/* 유틸리티 */
.actions-container {
	display: flex;
	flex-direction: column-reverse;
	gap: 1rem;
}

@media ( min-width : 768px) {
	.actions-container {
		flex-direction: row;
		justify-content: space-between;
		align-items: center;
	}
}

.write-button-container {
	bottom: 2rem;
	right: 2rem;
	z-index: 1000;
}

.write-button-container .custom-btn {
	width: auto;
	padding: 0.7rem 1.5rem;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

@media ( max-width : 767px) {
	.write-button-container {
		bottom: 2rem;
		right: 2rem;
		z-index: 1000;
	}
	.write-button-container .custom-btn {
		width: auto;
		padding: 0.7rem 1.5rem;
		box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	}
}

.badge.bg-noti.text-noti {
	font-size: 0.9rem;
	padding: 0.3rem 0.5rem;
	border-radius: 4px;
	font-weight: bold;
	background-color: #F6B426;
}

<style>
/* 화면 꽉차게 */
html, body {
	height: 100%;
	margin: 0;
	overflow-y: auto; /* 세로 스크롤 활성화 */
}
/* 메인 body 가운데 정렬 */
body {
	display: flex;
	justify-content: center;
	background-color: #f8f9fa; /* 헤더 추가한다고 변경*/
}

/* 스크롤바 제거를 위한 css */
.cont::-webkit-scrollbar {
	display: none;
}
/* main 컨텐츠 css   */
.cont {
	background-color: white;
	width: 744px; /* 헤더 추가한다고 변경*/
	height: auto; /* 콘텐츠 높이에 따라 크기 조정 */
    overflow-y: auto; /* 컨텐츠의 높이가 body를 넘으면 스크롤 */
	-ms-overflow-style: none;
	/* 인터넷 익스플로러 */
	scrollbar-width: none;
	/* 파이어폭스 */
}

/* 로그인 용 로고 */
.re_sm_logo {
	font-size: 5rem;
	/* 화면 너비에 비례한 폰트 크기 */
	font-weight: 600;
	color: #828282;
}
/* 로그인 용 로고 */

/* or 양쪽 점선 추가 */
.hr-sect {
	width: 100%;
	display: flex;
	align-items: center;
	color: #50B0FF;
}

.hr-sect::before, .hr-sect::after {
	content: "";
	flex-grow: 1;
	border-top: 2px dashed #50B0FF;
	height: 2px;
}
/* or 양쪽 점선 추가 */

/* 부트에서 정해주는 버튼들 색상 변경 */
.btn-primary {
	font-weight: 1000;
	background-color: #50B0FF;
	border: none;
}

.btn-danger {
	font-weight: 1000;
	background-color: #FF4B5D;
	border: none;
}

.btn-warning {
	font-weight: 1000;
	background-color: #FFD52D;
	border: none;
}

.btn-danger:hover {
	background-color: #fa1b31;
}

.btn-warning:hover {
	background-color: #facb0c;
}

.btn-primary:hover {
	background-color: #37a1f8;
}
/* 부트에서 정해주는 버튼들 색상 변경 */

/* 버튼 사이즈 */
.btn-size {
	border-radius: 10px;
	width: 100%;
	height: 10vh;
	min-height: 50px;
	max-height: 100px;
	font-weight: 600;
}
/* 로그인 인풋 사이즈 */
.inp_size {
	border-radius: 15px;
	height: 11vh;
	min-height: 60px;
	max-height: 80px;
}
/*카카오 버튼 사이즈*/
.kakao-btn-size {
	width: 100%; 
	background-color: #FEE500; 
	border: none; 
	cursor: pointer;
	border-radius: 10px;	
}

/* 로고 사이즈 줄이기 */
@media (max-width: 768px) {
    .re_sm_logo {
		font-size: 4rem;
		/* 화면 너비에 비례한 폰트 크기 */
		font-weight: 600;
		color: #828282;
	}
	.fs-4 {
		font-size: 1.2rem !important;
	}
}

#map_div {
	position: relative;
	width: 100%;
	height: 100%;
}
</style>

<body>
	<div class="cont">
		
		<!-- 헤더 영역 -->
		<jsp:include page="/WEB-INF/inc/headerNo.jsp"></jsp:include>
		<!-- 헤더 영역 -->

		<div class="mainhead-logo" style="width: 100%;">
			<div class="row">
				<div class="col d-flex align-items-center justify-content-center">
					<div style="cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/';">
						<div class="fs-4" style="text-align: center; font-weight: 600;">
							충전소 및 서비스센터 길 찾기
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="mainbody p-4">
	        <div id="map_div">
	            <!-- 입역 창 영역 -->
	            <div id = "input-area" 
	            	style="position: absolute;
	                top: 20px;
	                left: 50%;
	                transform: translateX(-50%);
	                background-color: rgba(255, 255, 255, 0.8);
	                padding: 10px 20px;
	                border-radius: 8px;
	                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	                z-index: 1000;
	                width: 55%; /* 화면 너비의 53% */
				    height : 20%;">
		         	<div>
		                <label><input type="checkbox" id="showChargingStations" checked> EV충전소</label>
		                <label style="margin-left: 10px;"><input type="checkbox" id="showServiceCenters" > 서비스센터</label>
				        <button style="margin-left: 45px; width: 80px; height: 30px; background-color: rgba(255, 255, 255, 0.8); 
				        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); border-radius: 8px; border: 2px solid #ccc;" onclick="toggleDiv()">커넥터</button> 
				
						<div id="popup" style="display: none; position: absolute; top: 50px; left: 50%; transform: translateX(-50%); background: rgba(255, 255, 255, 1); 
						color: black; padding: 10px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3); width: 400px; height: 280px; border: 1px solid black; z-index: 1030;">
						    <p>원하시는 충전기 타입을 선택하세요! </p>
						    
						    <label><input type="checkbox" id ="select_label" onchange="toggleLabel()"> 라벨 제거 </label><br>
						    <label><input type="checkbox" id="select_all" onchange="toggleAllCheckboxes()"> 전체 선택</label><br>
							<label><input type="checkbox" id="ac_slow" checked onchange="filterMarkersByType()"> 승용차 AC완속</label><br>
							<label><input type="checkbox" id="ac_fast" checked onchange="filterMarkersByType()"> AC급속3상</label><br>
							<label><input type="checkbox" id="dc_chademo" checked onchange="filterMarkersByType()"> DC차데모</label><br>
							<label><input type="checkbox" id="dc_chademo_ac3" checked onchange="filterMarkersByType()"> DC차데모 + AC3상</label><br>
							<label><input type="checkbox" id="dc_combo" checked onchange="filterMarkersByType()"> DC콤보</label><br>
							<label><input type="checkbox" id="dc_chademo_combo" checked onchange="filterMarkersByType()"> DC차데모 + DC콤보</label><br>
							<label><input type="checkbox" id="dc_chademo_ac3_combo" checked onchange="filterMarkersByType()"> DC차데모 + AC3상 + DC콤보</label><br>
	
						</div>				 
		            </div>
	         		    
	                <label for="distanceRange" style="margin-right: 10px;">반경 선택: </label>
	                <input
	                    type="range"
	                    id="distanceRange"
	                    min="100"
	                    max="1000"
	                    step="100"
	                    value="400"
	                />
	                <span id="distanceValue">400M</span> 
	
	                <button onclick="moveToLocation(myPlace.lat, myPlace.lon)" 
	                style="margin-left: 5px; padding: 5px; cursor: pointer; background: none; border: none; outline: none;">
	                <img src='/resources/assets/img/Car/my_place.jpeg' alt="My Place" style="width: 30px; height: 30px;">
	                </button>
	               
	                <div style="margin-top: 10px; position: relative;">
	                
	                    <input type="text" id="startPoint" placeholder="출발지를 입력하세요" style="margin-left: 25px; padding: 5px; width: 250px;" 
	                            oninput="searchPOI('startPoint'), toggleDeleteButton('startPoint', 'clearStartButton')" 
	                            onfocus="toggleResultDisplay('startPoint', true)"
	                            onblur="toggleResultDisplay('startPoint', false)">
	                    <button id="clearStartButton" onclick="clearInput('startPoint', 'clearStartButton')" 
	                            style="position: absolute; right: 70px; top: 45%; transform: translateY(-50%); 
	                                    background: none; border: none; cursor: pointer; padding: 0; display:none">
	                        <img src='/resources/assets/img/Car/delete.png' alt="delete" style="width: 13px; height: 13px;">
	                    </button>
	                    
	                    <button onclick="swapValues()" 
	                    style="margin-left: 0px; padding: 5px; cursor: pointer; 
	                           background: none; border: none; outline: none; 
	                           position: relative; top: 20px;">
	                        <img src='/resources/assets/img/Car/change_button.png' alt="My Place" style="width: 25px; height: 25px;">
	                    </button>
	                    
	                </div>
	
	                <div id="waypointContainer" style="margin-top: 10px; position: relative;">
	                
	
	                </div>
	
	                <div style="margin-top: 10px; position: relative">
	                    <input type="text" id="endPoint" placeholder="도착지를 입력하세요" style="margin-left: 25px; padding: 5px;  width: 250px;" 
	                    oninput="searchPOI('endPoint'), toggleDeleteButton('endPoint', 'clearEndButton')" 
	                    onfocus="toggleResultDisplay('endPoint', true)" 
	                    onblur="toggleResultDisplay('endPoint', false)">
	                    <button id="clearEndButton" onclick="clearInput('endPoint', 'clearEndButton')" 
	                            style="position: absolute; right: 70px; top: 48%; transform: translateY(-50%); 
	                                    background: none; border: none; cursor: pointer; padding: 0; display:none">
	                        <img src='/resources/assets/img/Car/delete.png' alt="delete" style="width: 13px; height: 13px;">
	                    </button>  
	                </div>
	
	                <!-- 출발지 전용 결과창 -->
	                <div id="start-result-list" style="margin-top: 5px; width: 300px; max-height: 150px; overflow-y: auto; border: 1px solid #ccc; display: none;"></div>
	
	                <!-- 도착지 전용 결과창 -->
	                <div id="end-result-list" style="margin-top: 5px; width: 300px; max-height: 150px; overflow-y: auto; border: 1px solid #ccc; display: none;"></div>
	        
	                </div>
	        		<button id="searchButton" onclick="searchChargingStations()" 
					        style="position: absolute; bottom: 20px; left: 50%; transform: translateX(-50%); 
					               background-color: rgba(255, 255, 255, 0.8); padding: 10px 20px; border-radius: 8px; 
					               box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); z-index: 1030; display: none;">
					    현 지도에서 검색
					</button>
	       </div>
	      </div>
	     </div>
	     
		<!-- 풋터 영역 -->
		<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
		<!-- 풋터 영역 -->
        
        <div class="modal fade" id="placeModal" tabindex="-1" aria-labelledby="placeModalLabel" aria-hidden="false">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="placeModalLabel">위치 정보</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" id="placeModalBody"></div>
                    <div class="modal-footer">
                        <button type="button" onclick = "addMarker('llStart', lat, lon, 1)" class="btn btn-primary" data-bs-dismiss="modal">출발지</button>
                        <button type="button" onclick = "addMarker('llEnd', lat, lon, 2)" class="btn btn-success" data-bs-dismiss="modal">도착지</button>
                    </div>
                </div>  
            </div>
        </div>

        <!-- 모달 -->
        <div class="modal fade" id="chagerModal" tabindex="-1" aria-labelledby="chagerModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="chagerModalLabel">충전소 정보</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" id="prechager">
                    	<div style="width: 100%; height: 300px; background-color: lightgray; text-align: center; line-height: 300px;">
					          	 임시 차트 공간
					    </div>
                    </div>
                    <div class="modal-body" id="chagerModalBody">
                        
                    </div>
                    <div class="modal-footer">
                        <button type="button" onclick="addMarker('llStart', lat, lon, 1)" class="btn btn-primary" id="setStartPoint" data-bs-dismiss="modal">출발지</button>
                        <button type="button" onclick="addMarker('llEnd', lat, lon, 2)" class="btn btn-success" id="setEndPoint" data-bs-dismiss="modal">도착지</button>
                        <button type="button" onclick="addWaypoint()" class="btn btn-warning" id="setWaypoint" style="display: none;" data-bs-dismiss="modal">경유지 설정</button>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="modal fade" id="centerModal" tabindex="-1" aria-labelledby="chagerModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="centerModalLabel">서비스센터 정보</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" id="chagerModalBody">
                        
                    </div>
                    <div class="modal-footer">
                        <button type="button" onclick="addMarker('llStart', lat, lon, 1)" class="btn btn-primary" id="setStartPoint" data-bs-dismiss="modal">출발지</button>
                        <button type="button" onclick="addMarker('llEnd', lat, lon, 2)" class="btn btn-success" id="setEndPoint" data-bs-dismiss="modal">도착지</button>
                        <button type="button" onclick="addWaypoint()" class="btn btn-warning" id="setWaypoint" style="display: none;" data-bs-dismiss="modal">경유지 설정</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="SModal" tabindex="-1" aria-labelledby="SModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="SModalLabel">출발지 정보</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" id="SModalBody"></div>
                    <div class="modal-footer">
                        <button type="button" onclick = "delMarker('llStart')" class="btn btn-danger" id="setStartPoint" data-bs-dismiss="modal">제거</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="EModal" tabindex="-1" aria-labelledby="EModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="EModalLabel">도착지 정보</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" id="EModalBody"></div>
                    <div class="modal-footer">
                        <button type="button" onclick = "delMarker('llEnd')" class="btn btn-danger" id="setStartPoint" data-bs-dismiss="modal">제거</button>
                    </div>
                </div>
            </div>
        </div>
        
        
        <script type="text/javascript">
        /* jshint esversion: 6 */
        
        console.log("PC 환경입니다!");

        
        var appKey = 'n9pFS1xDL83iAckIvHawc1M0unL7Z3LR2LqJ1kjN';
        
        /* 승욱이 Key : mB52wJcd8j9z8CEwcTTS74kzvdeqBGl079FHl1CI */
        /* 내 Key : n9pFS1xDL83iAckIvHawc1M0unL7Z3LR2LqJ1kjN */
        
        	var testline = [];
        	var allStationPoints = [];  
        
			var StationPoints = [];
        	var CenterPoints = [];
            var myPlace = { name: "미래융합교육원", lat:36.34849283284243, lon: 127.38215115731816, distance:0};
            
            var testPlace = { name : null, lat : null, lon: null, distance: 0};
            
            if (navigator.geolocation) {
                console.log("위치 정보를 가져오는 중입니다...");
                
                navigator.geolocation.getCurrentPosition(
                    async function (position) { 
                        var latitude = position.coords.latitude;
                        var longitude = position.coords.longitude;
                        
                        testPlace = { 
                            name: "현재 위치",
                            lat: latitude,
                            lon: longitude,
                            distance: 0 
                        };
                        console.log("현재 위치:", testPlace);
                        
                        try {
                            // 역지오코딩을 비동기적으로 호출
                            const buildingName = await reverseGeocode(testPlace.lat, testPlace.lon);
                            testPlace.name = buildingName || "알 수 없는 위치";
                            
                            console.log("업데이트된 위치 정보:", testPlace);
                            
                        } catch (error) {
                            console.error("역지오코딩 실패:", error);
                        }
                    },
                    function (error) {
                        console.error("위치를 가져오지 못했습니다.", error);
                    }
                );
            } else {
                console.error("이 브라우저는 Geolocation API를 지원하지 않습니다.");
            }

         		
            
            
            var initialCenter = null;
            var currentCenter = null;
            
            var isDragging = false;
            
            
			'<c:forEach var="station" items="${stationPoints}">';
			StationPoints.push({
				 name: '${station.name}',
                 lat: '${station.lat}',
                 lon: '${station.lon}',
                 distance: '${station.distance}'
			});
			'</c:forEach>';
			
			'<c:forEach var="station" items="${serviceCenterPoints}">';		
			CenterPoints.push({
				name: '${station.name}',
				place: '${station.place}',
				brand: '${station.brand}',
				tel: '${station.tel}',
				lat: '${station.lat}',
				lon: '${station.lon}',
				note: '${station.note}',
				distance: '${station.distance}'
			});
			'</c:forEach>';

			
		    StationPoints.forEach(function(station) {
		        const distance = calculateDistance(myPlace.lat, myPlace.lon, station.lat, station.lon);
		        station.distance = distance; // 거리 추가
		    });

		    StationPoints.sort(function(a, b) {
		        return a.distance - b.distance;
		    });
		    
		    CenterPoints.forEach(function(station)
		    {
		    	const distance = calculateDistance(myPlace.lat, myPlace.lon, station.lat, station.lon);
		    	station.distance = distance;
		    });
		    
		    CenterPoints.sort(function(a, b)
		    {
		    	return a.distance - b.distance;
		    });
		    
		    function onPinClick(upper, middle, lower, road, building)
		    {
		    	$.ajax({
		    		url : '/map/getStationId',
		    		type: 'POST',
		    		contentType: 'application/json',
		    		data: JSON.stringify
		    		({
		    			upper_addr_name: upper,
		    			middle_addr_name: middle,
		    			lower_addr_name: lower,
		    			road_name: road,
		    			building_no: building
		    		}),
		    		success: function(statid)
		    		{
		    		    if (statid === null || statid === "") {
		    		        console.log("statid가 null입니다.");
		    		        $('#prechager').html('<p>데이터가 부족해 차트를 제공할 수 없습니다. 죄송합니다.</p>');
		    		        return;  
		    		    }

		    		    // statid가 유효하면 차트 데이터를 요청
		    		    $.ajax({
		    		        url: '/map/chart', // 차트 생성 엔드포인트
		    		        type: 'GET',
		    		        data: { statid: statid }, // statid를 쿼리 파라미터로 전달
		    		        success: function(chartHtml)
		    		        {
		    		            // 차트 HTML을 받아서 #prechager div에 삽입
		    		            $('#prechager').html(chartHtml);
		    		            $('#prechager').append('<p>막대가 없을 경우 0이므로 매우 한적하다는 뜻입니다.</p>');
		    		        },
		    		        error: function(error)
		    		        {
		    		            console.log("차트 생성 실패");
		    		            console.log(error);
		    		        }
		    		    });
		    		},

		    		error: function(error)
		    		{
		    			console.log("ID 찾기 실패");
		    			console.log(error);
		    		}
		    	});	
		    }
     
            var StationMarkers = []; 
            var CenterMarkers = [];
            var centercopyStationPoints = []; 
            var routecopyStationPoints = [];
            var brandIcons = {};
            
			'<c:forEach var="brand" items="${brandIcons}">';
				brandIcons['${brand.key}'] = '${brand.value}';
			'</c:forEach>';
			
			var areLabelsVisible = true;
            
            function toggleLabel(){
            	
                areLabelsVisible = !areLabelsVisible; // 상태를 토글

                StationMarkers.forEach(marker => {
                    const labelElement = marker._marker_data ? marker._marker_data.labelElement : null;
                    
                    if (labelElement) {
                        labelElement._htmlElement.hidden = !areLabelsVisible;
                        console.log("라벨 상태 변경:", areLabelsVisible ? '표시' : '숨기기');
                    } else {
                        console.log("라벨이 없습니다.");
                    }
                });
            }
           
            function calculateDistance(lat1, lon1, lat2, lon2) 
            {
                const R = 6371; // 지구 반지름 (단위: 킬로미터)
                const dLat = toRad(lat2 - lat1);  // 위도 차이 (라디안)
                const dLon = toRad(lon2 - lon1);  // 경도 차이 (라디안)

                const a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
                        Math.cos(toRad(lat1)) * Math.cos(toRad(lat2)) *
                        Math.sin(dLon / 2) * Math.sin(dLon / 2);
                const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
                    
                return R * c * 1000; // 거리 (미터)
            }
            
            function wgs84ToNaverCoord(lat, lon) {
                const EARTH_RADIUS = 6378137.0; // 지구 반지름(미터)
                
                // 경도를 Web Mercator x좌표로 변환
                const x = lon * (EARTH_RADIUS * Math.PI / 180);
                
                // 위도를 Web Mercator y좌표로 변환
                var y = Math.log(Math.tan((90 + lat) * Math.PI / 360)) * EARTH_RADIUS;
                
                return {
                    x: x,
                    y: y
                };
            }
            
            async function updateStationPoints() {
            	
    		    StationPoints.forEach(function(station) {
    		        const distance = calculateDistance(myPlace.lat, myPlace.lon, station.lat, station.lon);
    		        station.distance = distance; 
    		    });

    		    StationPoints.sort(function(a, b) {
    		        return a.distance - b.distance;
    		    });

                nearestPoints = StationPoints.filter(function(station) {
                    return station.distance <= select_distance;
                });

                nearestPoints.sort(function(a, b) {
                    return a.distance - b.distance;
                });
                
                // 기존 마커 삭제
                StationMarkers.forEach(function(marker) {
                    marker.setMap(null);
                });
                StationMarkers = [];
                centercopyStationPoints = [];
                // 가까운 충전소 마커 생성
                for (const station of nearestPoints) {
                    try {
                        const chargerData = await searchChargerdata(station.lat, station.lon);
                        
                        if (!chargerData || !chargerData.evChargers || !chargerData.evChargers.evCharger || chargerData.evChargers.evCharger.length === 0) {
                            console.warn("충전소 데이터가 없거나 잘못되었습니다.", station);
                            continue; // 잘못된 데이터는 건너뜀
                        }

                        const brand = chargerData.evChargers.evCharger[0].operatorName;
                        
                        if(!brand)
                        {
                        	console.warn("브랜드 데이터가 없습니다.", chargerData);
                        	continue;
                        }

                        var chargerTypes = [];
                        for (var i = 0; i < chargerData.evChargers.evCharger.length; i++) {
                            var chargerType = getChargerType(chargerData.evChargers.evCharger[i].type);
                            if (chargerTypes.indexOf(chargerType) === -1) {
                                chargerTypes.push(chargerType);
                            }
                        }                      
                        
                        const totalChargers = chargerData.evChargers.evCharger ? chargerData.evChargers.evCharger.length : 0;

                        var availableChargers = 0;
                        if (chargerData.evChargers.evCharger) {
                            for (var i = 0; i < chargerData.evChargers.evCharger.length; i++) {
                                if (chargerData.evChargers.evCharger[i].isAvailable === 'Y') {
                                    availableChargers++;
                                }
                            }
                        }

                        var labelText = '<span style="background-color: #46414E; color: white; padding: 5px; border-radius: 5px; font-size: 15px; font-weight: bold; text-align: center; position: absolute; bottom: 50px;">' +
                            brand + ' <br> ' +
                            chargerTypes + ' <br> ' +
                            availableChargers + ' / ' +
                            totalChargers +
                            '</span>';

                        const stationmarker = new Tmapv2.Marker({
                            position: new Tmapv2.LatLng(station.lat, station.lon),
                            icon: '/resources/assets/img/Car/Chager.png',
                            iconSize: new Tmapv2.Size(50, 50),
                            map: mapInstance,
                            stationData: station,
                            label: labelText
                        });
                        
                        station.chargerTypes = chargerTypes;
                        centercopyStationPoints.push(station);

                        stationmarker.addListener("click", async function(evt) {
                       	
                        	if (marker) {
                                marker.setMap(null);
                                marker = null;
                            }
                        	
                            lat = stationmarker.getPosition().lat();
                            lon = stationmarker.getPosition().lng();
                            name = station.name;
                            
                            console.log(chargerData);
                            const upper_addr_name = chargerData.upperAddrName;
                            const middle_addr_name = chargerData.middleAddrName;
                            const lower_addr_name = chargerData.lowerAddrName;
                            const road_name = chargerData.roadName;
                            const building_no = chargerData.buildingNo1;
                            
                            
                            onPinClick(upper_addr_name, middle_addr_name, lower_addr_name, road_name, building_no);
                            
                            await handleMarkerClick(station);
                        });
                        
                        StationMarkers.push(stationmarker);

                    } catch (error) {
                        console.error("Error processing station:", station);
                        console.error("Error details:", error);
                    }
                }
            } 
            
            function toggleAllCheckboxes() {
                const isChecked = document.getElementById("select_all").checked; // 전체 선택 체크박스 상태 확인

                // 각 체크박스의 상태를 전체 선택 여부에 맞게 설정
                document.getElementById("ac_slow").checked = isChecked;
                document.getElementById("ac_fast").checked = isChecked;
                document.getElementById("dc_chademo").checked = isChecked;
                document.getElementById("dc_chademo_ac3").checked = isChecked;
                document.getElementById("dc_combo").checked = isChecked;
                document.getElementById("dc_chademo_combo").checked = isChecked;
                document.getElementById("dc_chademo_ac3_combo").checked = isChecked;

                // 필터링 함수 호출 (전체 선택/해제 시 마커 갱신)
                filterMarkersByType();
            }
            
            
            function filterMarkersByType() {
                const selectedTypes = [];
                if (document.getElementById("ac_slow").checked) selectedTypes.push("승용차 AC완속");
                if (document.getElementById("ac_fast").checked) selectedTypes.push("AC급속3상");
                if (document.getElementById("dc_chademo").checked) selectedTypes.push("DC차데모");
                if (document.getElementById("dc_chademo_ac3").checked) selectedTypes.push("DC차데모 + AC3상");
                if (document.getElementById("dc_combo").checked) selectedTypes.push("DC콤보");
                if (document.getElementById("dc_chademo_combo").checked) selectedTypes.push("DC차데모 + DC콤보");
                if (document.getElementById("dc_chademo_ac3_combo").checked) selectedTypes.push("DC차데모 + AC3상 + DC콤보");
				
                console.log("Selected Types:", selectedTypes);  // 확인 로그 추가
                
                if(!isRouteVisible)
                {
	                centercopyStationPoints.forEach(function(station) {              	
	
	                    const chargerTypes = station.chargerTypes; 
	     
	                    const hasSelectedType = chargerTypes.some(type => selectedTypes.includes(type));
	                    
	                    const matchingMarkers = StationMarkers.filter(marker => 
	                    Math.abs(marker._marker_data.options.position._lat - station.lat) < 0.0001 &&
	                    Math.abs(marker._marker_data.options.position._lng - station.lon) < 0.0001
	                );
	                    
	                    console.log(matchingMarkers);
	
	                // 마커가 선택된 타입일 경우 보여주기, 아니면 숨기기
	                matchingMarkers.forEach(function(stationMarker) {
	                    if (hasSelectedType) {
	                        stationMarker.setMap(map);  // 선택된 타입이 있을 경우 마커 표시
	                    } else {
	                        stationMarker.setMap(null); // 선택되지 않은 타입일 경우 마커 숨기기
	                    }
	                });
	            });
           		}
                
                
                else(isRouteVisible)
                {
                	routecopyStationPoints.forEach(function(station)
                	{
	                    const chargerTypes = station.chargerTypes; 
	                
	                    const hasSelectedType = chargerTypes.some(type => selectedTypes.includes(type));
	                    
	                    const matchingMarkers = StationMarkers.filter(marker => 
	                    marker._marker_data.options.position._lat == station.lat &&
	                    marker._marker_data.options.position._lng == station.lon
	                );
	                    
		                matchingMarkers.forEach(function(stationMarker) {
		                    if (hasSelectedType) {
		                        stationMarker.setMap(map);  // 선택된 타입이 있을 경우 마커 표시
		                    } else {
		                        stationMarker.setMap(null); // 선택되지 않은 타입일 경우 마커 숨기기
		                    }
		                });
		            });
                	}
                	

                }
           

            
            
            async function updateStationPointsFromLine(routePolyline) {
                // 각 선분에 대해 충전소와의 거리 계산
                
                // 기존 마커 삭제
                StationMarkers.forEach(function(marker) {
                    marker.setMap(null);
                });
                
                StationMarkers = [];
                
                routecopyStationPoints = [];
               
                StationPoints.forEach(function(point) {
                    // 선분마다 거리 계산
                    point.distance = Infinity;  // 기본값을 무한대로 설정

                    for (let i = 0; i < routePolyline.length - 1; i++) {
                        const start = routePolyline[i];
                        const end = routePolyline[i + 1];
                        
                        // 선분과 충전소 간의 최소 거리 계산
                        const distance = calculateDistanceFromLine(
                            { lat: point.lat, lon: point.lon }, 
                            { lat: start[1], lon: start[0] },  
                            { lat: end[1], lon: end[0] }
                        );
                        if (distance < point.distance) {
                            point.distance = distance;
                        }
                    }
                });

                // 거리 기준으로 정렬
                StationPoints.sort(function(a, b) {
                    return a.distance - b.distance;
                });

                // 기준 거리(select_distance) 이하의 충전소 필터링
                const nearestPoints = StationPoints.filter(function(point) {
                    return point.distance <= select_distance;
                }).sort(() => Math.random() - 0.5)  // 랜덤하게 섞기
                .slice(0, 20);

                console.log("선택한 거리 이하의 충전소 개수:", nearestPoints.length);
                console.log(nearestPoints);

                // 가까운 충전소 마커 생성
                for (const point of nearestPoints) {
                    try {
                        const chargerData = await searchChargerdata(point.lat, point.lon);

                        if (!chargerData || !chargerData.evChargers || !chargerData.evChargers.evCharger || chargerData.evChargers.evCharger.length === 0) {
                            console.warn("충전소 데이터가 없거나 잘못되었습니다.", station);
                            continue; // 잘못된 데이터는 건너뜀
                        }
                        
                        const brand = chargerData.evChargers.evCharger[0].operatorName;
                        
                        if(!brand)
                        {
                        	console.warn("브랜드 데이터가 없습니다.", chargerData);
                        	continue;
                        }

                        // 충전기 타입 및 가용 상태 계산
                        const chargerTypes = [];
                        let availableChargers = 0;
                        const totalChargers = chargerData.evChargers.evCharger?.length || 0;
                        const validStations = [];

                        if (chargerData.evChargers.evCharger) {
                            chargerData.evChargers.evCharger.forEach(function(charger) {
                                const chargerType = getChargerType(charger.type);
                                if (!chargerTypes.includes(chargerType)) {
                                    chargerTypes.push(chargerType);
                                }
                                if (charger.isAvailable === 'Y') {
                                    availableChargers++;
                                }
                            });
                        }

                        var label = '<span style="background-color: #46414E; color: white; padding: 5px; border-radius: 5px; font-size: 15px; font-weight: bold; text-align: center; position: absolute; bottom: 50px;">' +
                        brand + ' <br> ' +
                        chargerTypes.join(", ") + ' <br> ' +
                        availableChargers + ' / ' +
                        totalChargers +
                        '</span>';

                        const stationMarker = new Tmapv2.Marker({
                            position: new Tmapv2.LatLng(point.lat, point.lon),
                            icon: '/resources/assets/img/Car/Chager.png',
                            iconSize: new Tmapv2.Size(50, 50),
                            map: map,
                            stationData: point,
                            label: label
                        });
                        
                        point.chargerTypes = chargerTypes;
                        routecopyStationPoints.push(point);

                        // 마커 클릭 이벤트 추가
                        stationMarker.addListener("click", async function(evt) {
                            if (marker) {
                                marker.setMap(null);
                                marker = null;
                            }
                            lat = stationMarker.getPosition().lat();
                            lon = stationMarker.getPosition().lng();
                            name = point.name;
                            
                            const upper_addr_name = chargerData.upperAddrName;
                            const middle_addr_name = chargerData.middleAddrName;
                            const lower_addr_name = chargerData.lowerAddrName;
                            const road_name = chargerData.roadName;
                            const building_no = chargerData.buildingNo1;
                            
                            onPinClick(upper_addr_name, middle_addr_name, lower_addr_name, road_name, building_no);
                      
                            
                            
                            await handleMarkerClick(point);
                        });

                        StationMarkers.push(stationMarker);
                    } catch (error) {
                        console.error("충전소 처리 중 오류 발생:", point);
                        console.error("오류 세부정보:", error);
                    }
                }
              
            }

            
            function calculateDistanceFromLine(point, lineStart, lineEnd) {
                // 선분의 각 점과 점(point) 간 거리 계산
                const distanceToStart = calculateDistance(point.lat, point.lon, lineStart.lat, lineStart.lon);
                const distanceToEnd = calculateDistance(point.lat, point.lon, lineEnd.lat, lineEnd.lon);

                // 선분의 방향 벡터 계산
                const A = lineEnd.lat - lineStart.lat;
                const B = lineEnd.lon - lineStart.lon;

                // 선분의 크기 계산
                const segmentLength = Math.sqrt(A * A + B * B);

                // 선분이 너무 짧은 경우 (점과 시작점 또는 끝점의 거리 반환)
                if (segmentLength === 0) {
                    return distanceToStart; // 또는 distanceToEnd
                }

                // 점과 선분 사이의 수직 거리 계산
                const t = ((point.lat - lineStart.lat) * A + (point.lon - lineStart.lon) * B) / (segmentLength * segmentLength);

                let nearestLat, nearestLon;

                if (t < 0) {
                    // 점이 선분의 시작점보다 가까움
                    nearestLat = lineStart.lat;
                    nearestLon = lineStart.lon;
                } else if (t > 1) {
                    // 점이 선분의 끝점보다 가까움
                    nearestLat = lineEnd.lat;
                    nearestLon = lineEnd.lon;
                } else {
                    // 점이 선분 위에 투영됨
                    nearestLat = lineStart.lat + t * A;
                    nearestLon = lineStart.lon + t * B;
                }

                // 최근접 점(nearestLat, nearestLon)과 원래 점(point) 간 거리 반환
                return calculateDistance(point.lat, point.lon, nearestLat, nearestLon);
            }
 
            function initializeMap() {
                mapInstance = new Tmapv2.Map("map_div", {
                    center: new Tmapv2.LatLng(myPlace.lat, myPlace.lon),
                    width: "100%",
                    height: "940px",
                    zoom: 17
                });

                usermarker = new Tmapv2.Marker({
                    position: new Tmapv2.LatLng(myPlace.lat, myPlace.lon),
                    map: mapInstance,
                    icon: '/resources/assets/img/Car/map_my_place.png', 
                    iconSize: new Tmapv2.Size(50, 50)
                });
      
                updateStationPoints();

                return mapInstance;
            }


            var now = new Date();
            var year = now.getFullYear();
            var month = ("0" + (now.getMonth() + 1)).slice(-2);
            var day = ("0" + now.getDate()).slice(-2);
            var hour = ("0" + now.getHours()).slice(-2);
            var minute = ("0" + now.getMinutes()).slice(-2);

            var startTime = year + month + day + hour + minute;


            var map;
            var marker = null;  
            var usermarker = null;
            var StartMarker = null;
            var EndMarker = null;
            
            var lat = null;
            var lon = null;
            var name = null;

            var StartPoint = { name: null, lat: null, lon: null, distance: null };

            var EndPoint = { name: null, lat: null, lon: null, distance: null };

            var ViaPoint = [];

            var nearestPoints = []; // nearestPoints를 함수 외부에서 정의

            var routePolyline = []; // 경로를 저장할 변수
            var isRouteVisible = false; // 경로가 있는지 확인하는 변수

            var fitcheck = false;
            
            var select_distance = 400;  // 전역으로 선언
            var fixed_distance = 4000;

            var naverMapLink = null;
            
            var qrLink = null;
            
            async function searchChargerdata(lat, lon) {
            	var url = 'https://apis.openapi.sk.com/tmap/pois/search/around?version=1&categories=EV%EC%B6%A9%EC%A0%84%EC%86%8C&centerLon=' + lon + '&centerLat=' + lat + '&appkey=' + appKey;

                try{
                    const response = await fetch(url);

                    if (!response.ok) {
                        throw new Error(`HTTP error! status: ${response.status}`);
                    }
                    const data = await response.json()
                    const firstPoi = data.searchPoiInfo.pois.poi[0];
                    return firstPoi;

                }
                catch (error) {
                    console.error("Error fetching data: ", error); 
                }
            }

            function toRad(degrees) 
            {

                return degrees * Math.PI / 180;

            }

            async function searchChargerlocation(id)
            {
            	var url = 'https://apis.openapi.sk.com/tmap/pois/' + id + '?&appkey=' + appKey;

                try{
                    const response = await fetch(url);

                    if(!response.ok)
                        throw new Error(`Http error! status : ${response.status}`)

                    const data = await response.json()
                    return data;
                }
                catch(error)
                {
                    console.error("Error fetching data: ", error);
                }
            }

            function displayAvailableChargers(evCharger) 
            {
            	const availableCount = evCharger.filter(function (charger) {
            	    return charger.isAvailable === "Y";
            	}).length;
                const totalCount = evCharger.length;
                return `${availableCount} / ${totalCount}`; // 예: "2/3"
            }


            function getAddress(bldAddr, addressNo, addressNo2) {
                let address = bldAddr;

                if (addressNo) {
                    address += " " + addressNo;
                }

                if (addressNo2) {
                    address += " " + addressNo2;
                }

                return address;
            }

            // 충전기 타입 변환
            function getChargerType(type) {
                const typeMap = {
                    '01': 'DC차데모',
                    '02': '승용차 AC완속',
                    '03': 'DC차데모 + AC3상',
                    '04': 'DC콤보',
                    '05': 'DC차데모 + DC콤보',
                    '06': 'DC차데모 + AC3상 + DC콤보',
                    '07': 'AC급속3상'
                };

                return typeMap[type] || '알 수 없음';
            }

            function getStatus(status)
            {
                const statusMap = {
                    '0': '알 수 없음',
                    '1': '통신 이상',
                    '2': '충전 대기',
                    '3': '충전중',
                    '4': '운영 중지',
                    '5': '점검 중',
                    '6': '예약 중',
                    '9': '상태 미확인'
                }

                return statusMap[status] || '알 수 없음';
            }

            // 사용 가능 여부 처리
            function getAvailability(isAvailable) {
                return isAvailable === 'Y' ? '충전기 사용가능' : '충전기 사용불가';
            }

            function getFast(isFast)
            {
                return isFast === 'Y' ? '급속충전 가능' : '급속충전 불가';
            }

            // 추가 정보 처리
            function formatAdditionalInfo(additionalInfo) {
                return '<br>' + additionalInfo.split(';').join('<br>');
            }

            async function handleMarkerClick(station) {
                const myplacelat = myPlace.lat;
                const myplacelon = myPlace.lon;

                let lat;
                let lon;

                if (station instanceof Tmapv2.Marker) {
                    lat = station.getPosition().lat();
                    lon = station.getPosition().lng();
                } else if (station.lat && station.lon) {
                    lat = station.lat;
                    lon = station.lon;
                } else {
                    console.error("Invalid station or marker object");
                    return;
                }

                // 충전소 데이터 가져오기
                const Chargerdata = await searchChargerdata(lat, lon);
                const id = Chargerdata.id;
                const Chargerlocation = await searchChargerlocation(id);

                const availableChargers = displayAvailableChargers(Chargerdata.evChargers.evCharger);

                // 주소 처리
                const bldAddr = Chargerlocation.poiDetailInfo.bldAddr;
                const addressNo = Chargerlocation.poiDetailInfo.bldNo1;
                const addressNo2 = Chargerlocation.poiDetailInfo.bldNo2;
                const address = getAddress(bldAddr, addressNo, addressNo2);

                // 추가 정보 처리
                let additionalinfo = Chargerlocation.poiDetailInfo.additionalInfo;
                additionalinfo = formatAdditionalInfo(additionalinfo);

                const data = {
                	    name: Chargerdata.name,
                	    address: address,
                	    operatorName: Chargerlocation.poiDetailInfo.operatorName || '정보 없음',
                	    type: getChargerType(
                	        Chargerdata.evChargers &&
                	        Chargerdata.evChargers.evCharger &&
                	        Chargerdata.evChargers.evCharger[0] &&
                	        Chargerdata.evChargers.evCharger[0].type
                	            ? Chargerdata.evChargers.evCharger[0].type
                	            : ''
                	    ),
                	    fee: Chargerlocation.poiDetailInfo.fee || '정보 없음',
                	    merchantFlag: Chargerdata.merchantFlag || '제휴사 없음',
                	    radius: calculateDistance(myplacelat, myplacelon, lat, lon),
                	    isFast: Chargerdata.evChargers.evCharger.some(function (charger) {
                	        return charger.isFast;
                	    }), // 하나라도 급속인지 확인
                	    parkFlag: Chargerdata.parkFlag,
                	    chargers: Chargerdata.evChargers.evCharger.map(function (charger) {
                	        return {
                	            chargerId: charger.chargerId || '정보 없음',
                	            powerType: charger.powerType || '정보 없음',
                	            status: getStatus(charger.status || '알 수 없음'),
                	            operatorName: charger.operatorName || '정보 없음',
                	            isAvailable: getAvailability(charger.isAvailable || false),
                	            isFast: getFast(charger.isFast || false),
                	            updatetime: charger.updateDateTime,
                	            chargingDateTime: charger.chargingDateTime,
                	            routeInfo: Chargerlocation.poiDetailInfo.routeInfo || '정보 없음',
                	            additionalInfo: additionalinfo || '정보 없음',
                	        };
                	    }),
                	};
                // 모달 표시
                showChargerInfo(data);

                name = data.name;
            }

            
            function updateCenterPoints() {

               nearestPoints = CenterPoints.filter(function(point) {
                   return point.distance <= select_distance;
               }).slice(0, 10);

               CenterMarkers.forEach(function(marker) {
                   marker.setMap(null);
               });

               CenterMarkers = [];

               nearestPoints.forEach(function(center) {
            	   const iconPath = brandIcons[center.brand] || '/resources/assets/img/Car/Center.png';
                   const marker = new Tmapv2.Marker({
                       position: new Tmapv2.LatLng(center.lat, center.lon),
                       icon: iconPath,
                       iconSize: new Tmapv2.Size(50, 50),
                       map: mapInstance,
                       clickable: true,  // 클릭 가능하도록 명시
                       zIndex: 1100  // 다른 요소들보다 위에 표시되도록
                       
                   });
                   marker.addListener("click", function(evt) {
                       lat = marker.getPosition().lat();
                       lon = marker.getPosition().lng();
                       name = center.name;
                       showcenterInfo(center);
                   });
                   
                   marker.addListener("touchstart", function(evt) {
                	   
                	   evt.stopPropagation();  // 이벤트 버블링 방지
                	   evt.preventDefault();    // 기본 동작 방지
                	    
                	   console.log("touchstart");
                       lat = marker.getPosition().lat();
                       lon = marker.getPosition().lng();
                       name = center.name;
                       showcenterInfo(center);
                   });
                   
                   
                   CenterMarkers.push(marker);
                   });
               }



                function updateDistanceValue(value) {

                select_distance = parseInt(value, 10);
                document.getElementById('distanceValue').textContent = select_distance + 'M'; // 값 업데이트

                const showChargingStationsCheckbox = document.getElementById('showChargingStations');
                const showServiceCentersCheckbox = document.getElementById('showServiceCenters');

                if (!isRouteVisible) {
                        if (showChargingStationsCheckbox.checked) 
                            updateStationPoints(); 
                        
                        else {
                            
                            for(var i in StationMarkers)
                                StationMarkers[i].setMap(null);
    
                        }

                        if (showServiceCentersCheckbox.checked) 
                            updateCenterPoints();
                        
                        else {
                            
                            for(var i in CenterMarkers)
                                CenterMarkers[i].setMap(null);
                        }
                    }

                else
                    drawData(routeData)
                
                }

                const showChargingStationsCheckbox = document.getElementById('showChargingStations');
                const showServiceCentersCheckbox = document.getElementById('showServiceCenters');
                
                $('#distanceRange').on('input', function() {
                updateDistanceValue(this.value);
                });

                // 체크박스를 클릭할 때마다 drawData 함수 호출
				document.addEventListener('DOMContentLoaded', function() {
				    const showChargingStationsCheckbox = document.getElementById('showChargingStations');
				
				    if (showChargingStationsCheckbox) {
				        showChargingStationsCheckbox.addEventListener('change', function() {
				            if (!isRouteVisible) {
				                if (showChargingStationsCheckbox.checked)
				                    updateStationPoints(); 
				                else {
				                    for (var i in StationMarkers)
				                        StationMarkers[i].setMap(null);
				                }
				
				                if (showServiceCentersCheckbox.checked) 
				                    updateCenterPoints();
				                else {
				                    for (var i in CenterMarkers)
				                        CenterMarkers[i].setMap(null);
				                }
				            }
				            else
				                drawData(routeData);
				        });
				    }
				});


				document.addEventListener('DOMContentLoaded', function() {
				    const showServiceCentersCheckbox = document.getElementById('showServiceCenters');
				    
				    if (showServiceCentersCheckbox) {
				        showServiceCentersCheckbox.addEventListener('change', function() {
				            if (!isRouteVisible) {
				                if (showChargingStationsCheckbox.checked)
				                    updateStationPoints(); 
				                else {
				                    for (var i in StationMarkers)
				                        StationMarkers[i].setMap(null);
				                }

				                if (showServiceCentersCheckbox.checked) 
				                    updateCenterPoints();
				                else {
				                    for (var i in CenterMarkers)
				                        CenterMarkers[i].setMap(null);
				                }
				            } else {
				                drawData(routeData);
				            }
				        });
				    }
				});


            // 초기값 설정
                $(window).on('load', function() {
				    document.getElementById('distanceValue').textContent = select_distance + 'M';
				});
                // 1. 지도 띄우기
                    map = initializeMap();     
                    initialCenter = mapInstance.getCenter(); // 초기 중심점 저장
                    map.addListener("click", async function(evt) {
                        try {
                            const popup = document.getElementById('popup');
                            
                            if (popup.style.display === 'block') {
                                popup.style.display = 'none'; 
                                return;
                            }
                            
                            // 기존 마커가 있으면 제거
                            if (marker) {
                                marker.setMap(null);
                                marker = null; 
                                return;  
                            }

                            // 클릭한 위치의 위도, 경도 가져오기
                            lat = parseFloat(evt.latLng.lat().toFixed(6));
                            lon = parseFloat(evt.latLng.lng().toFixed(6));

                            // reverseGeocode 비동기 호출
                            name = await reverseGeocode(lat, lon);

                            // 마커 생성
                            marker = new Tmapv2.Marker({
                                position: new Tmapv2.LatLng(lat, lon),
                                map: map
                            });

                        } catch (error) {
                            // 오류 발생 시 처리
                            console.error('위치 정보 가져오는 중 오류 발생:', error);
                        }
                    });

                    mapInstance.addListener("dragend", function () {
                        currentCenter = mapInstance.getCenter();
                        
                        const showChargingStationsCheckbox = document.getElementById('showChargingStations');
                        const showServiceCentersCheckbox = document.getElementById('showServiceCenters');    
                        
                        if (initialCenter.lat() !== currentCenter.lat() || initialCenter.lng() !== currentCenter.lng()) {
                            
                        	if(!showChargingStationsCheckbox.checked && !showServiceCentersCheckbox.checked)
                        		return;
                        	else
                        		// 중심점이 변경되었을 때 버튼 표시
                        		document.getElementById("searchButton").style.display = isRouteVisible ? "none" : "block";
                        }
                    });


                        window.reverseGeocode = async function(lat, lon) {
                        	var url = "https://apis.openapi.sk.com/tmap/geo/reversegeocoding?" +
                            "version=1&lat=" + lat +
                            "&lon=" + lon +
                            "&coordType=WGS84GEO" +
                            "&addressType=A10" +
                            "&coordYn=Y" +
                            "&keyInfo=Y" +
                            "&newAddressExtend=Y" +
                            "&appKey=" + appKey;


                            try {
                                const response = await fetch(url);
                                const data = await response.json();

                                if (data.addressInfo) {
                                    var buildingName = data.addressInfo.buildingName || "건물명 없음";       
						
                                    if (buildingName === '건물명 없음') {
                                        reverseLabel(lat, lon, data); 
                                        name = `${data.addressInfo.city_do} ${data.addressInfo.gu_gun} ${data.addressInfo.legalDong} ${data.addressInfo.bunji}`;
                                        return name;
                                    }

                                        const modalBody = document.getElementById('placeModalBody');
                                        if (modalBody) {
                                            modalBody.innerHTML =
                                                '<h3>' + buildingName + '</h3>' +
                                                '<p>' + data.addressInfo.city_do + ' ' + data.addressInfo.gu_gun + ' ' + data.addressInfo.legalDong + ' ' + data.addressInfo.bunji + '</p>' +
                                                '<p>' + data.addressInfo.gu_gun + ' ' + data.addressInfo.roadName + ' ' + data.addressInfo.buildingIndex + ' ' + buildingName + '</p>';
                                        } else {
                                            console.error('placeModalBody element not found.');
                                        }

									const placeModal = new bootstrap.Modal(document.getElementById('placeModal'));
									placeModal.show();

                                    return name = buildingName;
                                } else {
                                    document.getElementById("place_info").innerHTML = "<p>주소를 찾을 수 없습니다.</p>";
                                    return null;
                                }
                            } catch (error) {
                                console.error("역지오코딩 실패:", error);
                                return null;
                            }
                        };


                
                        async function reverseLabel(lat, lon, data2) {
                            try {
                                var url = 'https://apis.openapi.sk.com/tmap/geo/reverseLabel?version=1&format=json&centerLat=' + lat + '&centerLon=' + lon + '&reqCoordType=WGS84GEO&resCoordType=WGS84GEO&reqLevel=18&callback=result&appKey=' + appKey;

                                
                                const response = await fetch(url);
                                const data = await response.json();

                                if (data.poiInfo) {

                                    var locationName = data.poiInfo.name;

                                    // 주소 정보가 없는 경우
                                    if (locationName == "") {    
                                        var addressName = data2.addressInfo.fullAddress;
                                        var locationParts = addressName.split(',');
                                    }

                                    var city_do = data2.addressInfo.city_do;
                                    var gu_gun = data2.addressInfo.gu_gun;
                                    var legalDong = data2.addressInfo.legalDong;
                                    var bunji = data2.addressInfo.bunji;

                                    var lat = data.poiInfo.poiLat;
                                    var lon = data.poiInfo.poiLon;

                                    if (lat == 0 && lon == 0) {
                                        lat = parseFloat(data2.addressInfo.adminDongCoord.lat);  
                                        lon = parseFloat(data2.addressInfo.adminDongCoord.lon);  
                                    }

                                    // 위치명이 없을 경우, 주소 정보를 이용한 표시
                                    if (locationName == "") {
                                    	name = locationParts[1];
                                        document.getElementById('placeModalBody').innerHTML = 
                                            "<h3>" + locationParts[1] + "</h3>" +
                                            "<p>" + city_do + " " + gu_gun + " " + legalDong + " " + bunji + " </p>" +
                                            "<p>위도: " + lat.toFixed(6) + ", 경도: " + lon.toFixed(6) + "</p>";
                                    } else {
                                        // 위치명이 있을 경우
                                        name = locationName;
                                        document.getElementById('placeModalBody').innerHTML = 
                                            "<h3>" + locationName + "</h3>" +
                                            "<p>" + city_do + " " + gu_gun + " " + legalDong + " " + bunji + " </p>" +
                                            "<p>위도: " + lat.toFixed(6) + ", 경도: " + lon.toFixed(6) + "</p>";
                                    }

                                    
									const placeModal = new bootstrap.Modal(document.getElementById('placeModal'));
									placeModal.show();

                                } else {
                                    // 위치 정보가 없을 경우
                                    document.getElementById("place_info").innerHTML = "<p>위치 정보를 찾을 수 없습니다.</p>";
                                }
                            } catch (error) {
                                // 오류 발생 시
                                console.error("리버스 라벨 API 호출 실패:", error);
                                document.getElementById("place_info").innerHTML = "<p>API 호출 중 오류가 발생했습니다.</p>";
                            }
                        }


                var new_Click_polyLine = [];
                var pointArray = [];
                var markerList = [];
                var StartMarkerList = [];
                var EndMarkerList = [];
                var routeData = null;
                
                function distanceToSegment(point, start, end) {
                    const A = point.lat - start.lat;
                    const B = point.lon - start.lon;
                    const C = end.lat - start.lat;
                    const D = end.lon - start.lon;

                    const dot = A * C + B * D;
                    const lenSq = C * C + D * D;
                    let param = -1;

                    if (lenSq !== 0) {
                        param = dot / lenSq;
                    }

                    let xx, yy;

                    if (param < 0) {
                        xx = start.lat;
                        yy = start.lon;
                    } else if (param > 1) {
                        xx = end.lat;
                        yy = end.lon;
                    } else {
                        xx = start.lat + param * C;
                        yy = start.lon + param * D;
                    }

                    const dx = point.lat - xx;
                    const dy = point.lon - yy;

                    const distance =  Math.sqrt(dx * dx + dy * dy) * 111000; // 미터 단위로 변환                
                    return distance;

                }

                window.showChargerInfo = function(data) {
                    // 상단 충전소 기본 정보
                    $('#chagerModalLabel').text(data.name + ' 충전소 정보');
                    
                    var modalHeader = 
                        '<div class="table-responsive">' +
                            '<table class="table">' +
                                '<tr>' +
                                    '<th>주소</th>' +
                                    '<td>' + data.address + '</td>' +
                                '</tr>' +
                                '<tr>' +
                                    '<th>업체</th>' +
                                    '<td>' + data.chargers[0].operatorName + '</td>' +
                                '</tr>' +
                                '<tr>' +
                                    '<th>충전 타입</th>' +
                                    '<td>' + data.type + '</td>' +
                                '</tr>' +
                                '<tr>' +
                                    '<th>요금</th>' +
                                    '<td>' + (data.fee || '정보 없음') + '</td>' +
                                '</tr>' +
                                '<tr>' +
                                    '<th>제휴사</th>' +
                                    '<td>' + (data.merchantFlag || '제휴사 없음') + '</td>' +
                                '</tr>' +
                                '<tr>' +
                                    '<th>직선 거리</th>' +
                                    '<td>' + 
                                        (Math.round(data.radius) < 1000 ? Math.round(data.radius) + ' 미터' : (Math.round(data.radius) / 1000).toFixed(2) + ' 킬로미터') + 
                                    '</td>' +
                                '</tr>' +
                                '<tr>' +
                                    '<th>급속 여부</th>' +
                                    '<td>' + (data.isFast === 'Y' ? '급속 충전 가능' : 'N') + '</td>' +
                                '</tr>' +
                            '</table>' +
                        '</div>';
                    
                    // 하단 충전기 리스트
                    var chargers = '';
                    for (var i = 0; i < data.chargers.length; i++) {
                        var charger = data.chargers[i];
                        var statusColor = 'gray';  // 기본값은 회색

                        if (charger.status === '충전 대기') {
                            statusColor = 'blue';  // 충전 대기 상태는 파란색
                        } else if (charger.status === '충전중') {
                            statusColor = 'red';  // 충전중 상태는 빨간색
                        }

                        chargers += 
                            '<div class="col-6 mb-3">' +
                                '<div class="card" style="border: 1px solid #ccc; border-radius: 5px; padding: 10px;">' +
                                    '<h5 class="card-title" style="font-size:16px; color:' + statusColor + ';">충전 상태: ' + charger.status + '</h5>' +
                                    '<p>추가 정보: ' + (charger.additionalInfo || '정보 없음') + '</p>' +
                                    '<p>' + charger.powerType + '</p>' +
                                    '<p>충전기 ID: ' + charger.chargerId + '</p>' +
                                '</div>' +
                            '</div>';
                    }

                    // 카드들을 2개씩 배치하기 위한 그리드 시스템
                    var modalBody = 
                        modalHeader +
                        '<hr>' +
                        '<h5>충전기 정보</h5>' +
                        '<div class="row">' +
                            chargers +
                        '</div>';
                    
                    $('#chagerModalBody').html(modalBody);
                    var chagerModal = new bootstrap.Modal(document.getElementById('chagerModal'));
                    chagerModal.show();
                };
    

                function showcenterInfo(point) {
                	console.log("showcenterInfopoint : " + point.name)
                    $('#centerModalLabel').text(point.name + ' 서비스센터 정보');
                    var modalBody = 
                        '<div class="table-responsive">' +
                            '<table class="table">' +
                                '<tr>' +
                                    '<th>위치 정보</th>' +
                                    '<td>' + point.place + '</td>' +
                                '</tr>' +
                                '<tr>' +
                                    '<th>경로까지 거리</th>' +
                                    '<td>' +
                                        (Math.round(point.distance) < 1000 ? Math.round(point.distance) + ' 미터' : (Math.round(point.distance) / 1000).toFixed(2) + ' 킬로미터') +
                                    '</td>' +
                                '</tr>' +
                                '<tr>' +
                                	'<th>브랜드</th>'+
                                	'<td>' + point.brand + '</td>'+
                                '</tr>'+
                                '<tr>'+
                                	'<th>상세내용 </th>'+
                                	'<td>' + point.note +'</td>'+
                                '</tr>'+
                                '<tr>'+
                                	'<th>전화번호</th>'+
                                	'<td>' + point.tel + '</td>'+
                                '</tr>'+
                            '</table>' +
                        '</div>';
                    $('#centerModal .modal-body').html(modalBody);
                    var centerModal = new bootstrap.Modal(document.getElementById('centerModal'));
                    centerModal.show();
                }

                function showStartMarkerInfo(point) {
                    $('#SModalLabel').text(StartPoint.name + ' 출발지');
                    
                    if (
                    	    StartPoint.name && StartPoint.lat !== null && StartPoint.lon !== null &&
                    	    (!EndPoint.name || EndPoint.lat === null || EndPoint.lon === null)
                    	) 
                    		{
                    	
	                    var modalBody = 
	                        '<div class="table-responsive">' +
	                            '<table class="table">' +
	                                '<tr>' +
	                                    '<th>도착지까지 거리</th>' +
	                                    '<td>' + 
	                                        (Math.round(EndPoint.distance) < 1000 ? Math.round(EndPoint.distance) + ' 미터' : (Math.round(EndPoint.distance) / 1000).toFixed(2) + ' 킬로미터') +
	                                    '</td>' +
	                                '</tr>' +
	                                '<tr>' +
	                                    '<th>TMAP QR</th>' +
	                                    '<td>' +
	                                        '도착지를 설정하시면 TMAP QR코드를 볼 수 있습니다!' + 
	                                    '</td>' +
	                                '</tr>' +
	                                '<tr>' +
	                                    '<th>NAVER 지도</th>' +
	                                    '<td>' +
	                                        '도착지를 설정하시면 NAVER 지도로 볼 수 있습니다!' +
	                                    '</td>' +
	                                '</tr>' +
	                                '<tr>' +
	                                    '<th>TMAP 설치 안내</th>' +
	                                    '<td>' +
	                                        'TMAP이 설치되어 있지 않다면 아래 링크를 통해 설치하실 수 있습니다!<br>' +
	                                        '<a href="https://play.google.com/store/apps/details?id=com.skt.tmap.ku" target="_blank">안드로이드용 TMAP 설치</a><br>' +
	                                        '<a href="https://apps.apple.com/kr/app/t-map-티맵-내비게이션/id431589174" target="_blank">iOS용 TMAP 설치</a>' +
	                                    '</td>' +
	                                '</tr>' +
	                            '</table>' +
	                        '</div>';
                    	
                    		}
                    
                    else if (
                    	    EndPoint.name && EndPoint.lat !== null && EndPoint.lon !== null &&
                    	    (!StartPoint.name || StartPoint.lat === null || StartPoint.lon === null)
                    		) 
                    			{
                    	
		                    var modalBody = 
		                        '<div class="table-responsive">' +
		                            '<table class="table">' +
		                                '<tr>' +
		                                    '<th>TMAP QR</th>' +
		                                    '<td>' +
		                                        '출발지를 설정하시면 TMAP QR코드를 볼 수 있습니다! ' + 
		                                    '</td>' +
		                                '</tr>' +
		                                '<tr>' +
		                                    '<th>NAVER MAP</th>' +
		                                    '<td>' +
		                                        '출발지를 설정하시면 NAVER 지도로 볼 수 있습니다!' +
		                                    '</td>' +
		                                '</tr>' +
		                                '<tr>' +
		                                    '<th>TMAP 설치 안내</th>' +
		                                    '<td>' +
		                                        'TMAP이 설치되어 있지 않다면 아래 링크를 통해 설치하실 수 있습니다!<br>' +
		                                        '<a href="https://play.google.com/store/apps/details?id=com.skt.tmap.ku" target="_blank">안드로이드용 TMAP 설치</a><br>' +
		                                        '<a href="https://apps.apple.com/kr/app/t-map-티맵-내비게이션/id431589174" target="_blank">iOS용 TMAP 설치</a>' +
		                                    '</td>' +
		                                '</tr>' +
		                            '</table>' +
		                        '</div>';
                    
                    			}
                    
                    else if (
                    	    StartPoint.name && StartPoint.lat !== null && StartPoint.lon !== null &&
                    	    EndPoint.name && EndPoint.lat !== null && EndPoint.lon !== null 
                    	    ) 
                    			{                 				
				                    var modalBody = 
				                        '<div class="table-responsive">' +
				                            '<table class="table">' +
				                                '<tr>' +
				                                    '<th>도착지 직선 거리</th>' +
				                                    '<td>' + 
				                                        (Math.round(EndPoint.distance) < 1000 ? Math.round(EndPoint.distance) + ' 미터' : (Math.round(EndPoint.distance) / 1000).toFixed(2) + ' 킬로미터') +
				                                    '</td>' +
				                                '</tr>' +
				                                '<tr>' +
				                                    '<th>TMAP QR</th>' +
				                                    '<td>' +
				                                        '<img src="' + qrLink + '" alt="QR Code">' + 
				                                    '</td>' +
				                                '</tr>' +
				                                '<tr>' +
				                                    '<th>NAVER MAP</th>' +
				                                    '<td>' +
				                                        '<a href="' + naverMapLink + '" target="_blank">경로 보기</a>' +
				                                    '</td>' +
				                                '</tr>' +
				                                '<tr>' +
				                                    '<th>TMAP 설치 안내</th>' +
				                                    '<td>' +
				                                        'TMAP이 설치되어 있지 않다면 아래 링크를 통해 설치하실 수 있습니다!<br>' +
				                                        '<a href="https://play.google.com/store/apps/details?id=com.skt.tmap.ku" target="_blank">안드로이드용 TMAP 설치</a><br>' +
				                                        '<a href="https://apps.apple.com/kr/app/t-map-티맵-내비게이션/id431589174" target="_blank">iOS용 TMAP 설치</a>' +
				                                    '</td>' +
				                                '</tr>' +
				                            '</table>' +
				                        '</div>';
                    				
                    				}
                    $('#SModalBody').html(modalBody);
                    var sModal = new bootstrap.Modal(document.getElementById('SModal'));
                    sModal.show();
                }

                function showEndMarkerInfo(point) {
                    $('#EModalLabel').text(EndPoint.name + ' 도착지');
                    
                    if (
                    	    StartPoint.name && StartPoint.lat !== null && StartPoint.lon !== null &&
                    	    (!EndPoint.name || EndPoint.lat === null || EndPoint.lon === null)
                    	) 
                    		{
                    		console.log(StartPoint);
                    		console.log(EndPoint);
                    	
	                    var modalBody = 
	                        '<div class="table-responsive">' +
	                            '<table class="table">' +
	                                '<tr>' +
	                                    '<th>도착지까지 거리</th>' +
	                                    '<td>' + 
	                                        (Math.round(EndPoint.distance) < 1000 ? Math.round(EndPoint.distance) + ' 미터' : (Math.round(EndPoint.distance) / 1000).toFixed(2) + ' 킬로미터') +
	                                    '</td>' +
	                                '</tr>' +
	                                '<tr>' +
	                                    '<th>TMAP QR</th>' +
	                                    '<td>' +
	                                        '도착지를 설정하시면 TMAP QR코드를 볼 수 있습니다!' + 
	                                    '</td>' +
	                                '</tr>' +
	                                '<tr>' +
	                                    '<th>NAVER 지도</th>' +
	                                    '<td>' +
	                                        '도착지를 설정하시면 NAVER 지도로 볼 수 있습니다!' +
	                                    '</td>' +
	                                '</tr>' +
	                                '<tr>' +
	                                    '<th>TMAP 설치 안내</th>' +
	                                    '<td>' +
	                                        'TMAP이 설치되어 있지 않다면 아래 링크를 통해 설치하실 수 있습니다!<br>' +
	                                        '<a href="https://play.google.com/store/apps/details?id=com.skt.tmap.ku" target="_blank">안드로이드용 TMAP 설치</a><br>' +
	                                        '<a href="https://apps.apple.com/kr/app/t-map-티맵-내비게이션/id431589174" target="_blank">iOS용 TMAP 설치</a>' +
	                                    '</td>' +
	                                '</tr>' +
	                            '</table>' +
	                        '</div>';
                    	
                    		}
                    
                    else if (
                    	    EndPoint.name && EndPoint.lat !== null && EndPoint.lon !== null &&
                    	    (!StartPoint.name || StartPoint.lat === null || StartPoint.lon === null)
                    		) 
                    			{
                    	
		                    var modalBody = 
		                        '<div class="table-responsive">' +
		                            '<table class="table">' +
		                                '<tr>' +
		                                    '<th>TMAP QR</th>' +
		                                    '<td>' +
		                                        '출발지를 설정하시면 TMAP QR코드를 볼 수 있습니다! ' + 
		                                    '</td>' +
		                                '</tr>' +
		                                '<tr>' +
		                                    '<th>NAVER MAP</th>' +
		                                    '<td>' +
		                                        '출발지를 설정하시면 NAVER 지도로 볼 수 있습니다!' +
		                                    '</td>' +
		                                '</tr>' +
		                                '<tr>' +
		                                    '<th>TMAP 설치 안내</th>' +
		                                    '<td>' +
		                                        'TMAP이 설치되어 있지 않다면 아래 링크를 통해 설치하실 수 있습니다!<br>' +
		                                        '<a href="https://play.google.com/store/apps/details?id=com.skt.tmap.ku" target="_blank">안드로이드용 TMAP 설치</a><br>' +
		                                        '<a href="https://apps.apple.com/kr/app/t-map-티맵-내비게이션/id431589174" target="_blank">iOS용 TMAP 설치</a>' +
		                                    '</td>' +
		                                '</tr>' +
		                            '</table>' +
		                        '</div>';
                    
                    			}
                    
                    else if (
                    	    StartPoint.name && StartPoint.lat !== null && StartPoint.lon !== null &&
                    	    EndPoint.name && EndPoint.lat !== null && EndPoint.lon !== null 
                    	    ) 
                    			{
                    var modalBody = 
                        '<div class="table-responsive">' +
                            '<table class="table">' +
                                '<tr>' +
                                    '<th>도착지 직선 거리</th>' +
                                    '<td>' + 
                                        (Math.round(EndPoint.distance) < 1000 ? Math.round(EndPoint.distance) + ' 미터' : (Math.round(EndPoint.distance) / 1000).toFixed(2) + ' 킬로미터') +
                                    '</td>' +
                                '</tr>' +
                                '<tr>' +
                                    '<th>TMAP QR</th>' +
                                    '<td>' +
                                        '<img src="' + qrLink + '" alt="QR Code">' + 
                                    '</td>' +
                                '</tr>' +
                                '<tr>' +
                                    '<th>NAVER MAP</th>' +
                                    '<td>' +
                                        '<a href="' + naverMapLink + '" target="_blank">경로 보기</a>' +
                                    '</td>' +
                                '</tr>' +
                                '<tr>' +
                                    '<th>TMAP 설치 안내</th>' +
                                    '<td>' +
                                        'TMAP이 설치되어 있지 않다면 아래 링크를 통해 설치하실 수 있습니다!<br>' +
                                        '<a href="https://play.google.com/store/apps/details?id=com.skt.tmap.ku" target="_blank">안드로이드용 TMAP 설치</a><br>' +
                                        '<a href="https://apps.apple.com/kr/app/t-map-티맵-내비게이션/id431589174" target="_blank">iOS용 TMAP 설치</a>' +
                                    '</td>' +
                                '</tr>' +
                            '</table>' +
                        '</div>';
    				
    				}

                    $('#EModalBody').html(modalBody);
                    var eModal = new bootstrap.Modal(document.getElementById('EModal'));
                    eModal.show();
                }
                
                
                function fitRouteToMap(map, routeCoordinates) {

                    var bounds = new Tmapv2.LatLngBounds();
                    routeCoordinates.forEach(function(coord) {
                        bounds.extend(new Tmapv2.LatLng(coord[1], coord[0]));
                    });

                    map.fitBounds(bounds);
                    fitcheck = true;
                }

                function drawData(data){

                    for(var i in routePolyline){
                        routePolyline[i].setMap(null);
                    }

                    routePolyline = [];

                    for(var i in StationMarkers){
                        StationMarkers[i].setMap(null);
                    }
                    for(var i in CenterMarkers)
                    {
                        CenterMarkers[i].setMap(null);
                    }

                    allMarkers = [];
                    pointArray = [];

                    
                    // 경로 그리기
                    for (var i = 0; i < data.features.length; i++) {
                        var feature = data.features[i];
                        if(feature.geometry.type == "LineString") {
                            feature.geometry.coordinates.forEach(coord => {
                                testline.push(coord);
                            });
                        }
                        if(feature.geometry.type == "LineString"){
                            var ar_line = [];
                            for (var j = 0; j < feature.geometry.coordinates.length; j++) {
                                var startPt = new Tmapv2.LatLng(feature.geometry.coordinates[j][1],feature.geometry.coordinates[j][0]);
                                ar_line.push(startPt);
                                pointArray.push(feature.geometry.coordinates[j]);
                            }
                            var polyline = new Tmapv2.Polyline({
                                path: ar_line,
                                strokeColor: "#ff0000", 
                                strokeWeight: 6,
                                map: map
                            });
                            routePolyline.push(polyline);
                            isRouteVisible = true;
                        }
                    }
                    
                    console.log("이거 밑에가 실제 경로라는데 실험하는 중입니다");
                    console.log(testline);

                    if(fitcheck == false)
                        fitRouteToMap(map, testline);

                    const showChargingStationsChecked = document.getElementById("showChargingStations").checked;
                    const showServiceCentersChecked = document.getElementById("showServiceCenters").checked;

                    if(isRouteVisible)
                    {
                        if(showChargingStationsChecked)
                        {
                        	
                        	updateStationPointsFromLine(testline);
                        
                        }
               
                        if(showServiceCentersChecked)
                        {
                            updateCenterPoints();

                            CenterPoints.forEach(function(point, index) {
                                point.distance = calculateDistanceFromLine(point, StartPoint, EndPoint);  // 거리 계산 함수 호출
                            });

                            // 거리순으로 정렬
                            CenterPoints.sort(function(a, b) {
                                return a.distance - b.distance;
                            });

                            // 기준 거리 `select_distance` 이내의 포인트들만 필터링
                            const nearestPoints = CenterPoints.filter(function(point) {
                                return point.distance <= select_distance;
                            }).slice(0, 10);

                            // 필터링된 가장 가까운 10개의 포인트들에 대해 추가 처리
                            nearestPoints.forEach(function(point) {     
                       	    const iconPath = brandIcons[point.brand] || '/resources/assets/img/Car/Center.png';
                            var marker = new Tmapv2.Marker({
                                position: new Tmapv2.LatLng(point.lat, point.lon),
                                icon: iconPath,
                                iconSize: new Tmapv2.Size(50, 50),
                                map: map,
                                clickable: true,  // 클릭 가능하도록 명시
                                zIndex: 1100  // 다른 요소들보다 위에 표시되도록
                            });

                            // 마커에 클릭 이벤트 추가
                            marker.addListener("click", function(evt) {
                                lat = marker.getPosition().lat();
                                lon = marker.getPosition().lng();
                                name = point.name;
                                console.log("clickpoint2 : " + point)
                                showcenterInfo(point);
                                
                            });
                            
                            marker.addListener("touchstart", function(evt) {
                            	
                                evt.stopPropagation();  // 이벤트 버블링 방지
                                evt.preventDefault();    // 기본 동작 방지
                                
                            	console.log("touchstart");
                                lat = marker.getPosition().lat();
                                lon = marker.getPosition().lng();
                                name = point.name;
                                console.log("touchstartpoint3 : " + point)
                                showcenterInfo(point);
                                
                            });
                            
                            CenterMarkers.push(marker);
                        });

                        }
                    }
                }    


                 // 4. 경로탐색 API 사용요청
                window.searchroute = function(startpointlon, startpointlat, endpointlon, endpointlat)
                {
                    var startX = startpointlon;
                    var startY = startpointlat;
                    var endX = endpointlon;
                    var endY = endpointlat;
                    
                    var headers = {};
                    headers["appKey"]= appKey; 
                    
                    $.ajax({
                        method:"POST", 
                        headers : headers, 
                        url : "https://apis.openapi.sk.com/tmap/routes?version=1&format=json&appKey=n9pFS1xDL83iAckIvHawc1M0unL7Z3LR2LqJ1kjN",
                        async:false,
                        data:{ 
                            startX : startX,
                            startY : startY,
                            endX : endX,
                            endY : endY,
                            reqCoordType : "WGS84GEO",
                            resCoordType : "WGS84GEO",
                            angle : "172",
                            searchOption : "0",
                            trafficInfo : "Y"
                        },
                        success:function(response){
                            routeData = response;
                            drawData(routeData);
                        },
                        error:function(request,status,error){
                            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                        }
                    });
                }
                 
                function updateModalButtons() {
                    const waypointButton = document.getElementById("setWaypoint");

                    if (routePolyline.length > 0) {
                        waypointButton.style.display = "inline-block"; 
                    } else {
                        waypointButton.style.display = "none";
                    }
                }

                // 시작, 도착 마커 추가 함수
                window.addMarker = function(status, lat, lon, tag) {

                        if(fitcheck == true)
                            fitcheck = false;
                        
                        if(marker)
                        {
                            marker.setMap(null); 
                            marker = null;  
                        }

                        if(routePolyline)
                        {
                            for (var i = 0; i < routePolyline.length; i++) {
                                routePolyline[i].setMap(null);  
                            }
                            routePolyline = []; 
                        }

                        var imgURL;

                        // 마커 이미지 설정
                        switch (status) {
                            case "llStart":
                                imgURL = '/resources/assets/img/Car/Start.png';
                                StartPoint = { name: name, lat: lat, lon: lon, distance: 0 };

                                if (EndPoint && EndPoint.lat !== null && EndPoint.lon !== null) {
                                    EndPoint.distance = calculateDistance(StartPoint.lat, StartPoint.lon, EndPoint.lat, EndPoint.lon);
                                }
                                break;

                            case "llEnd":
                                imgURL = '/resources/assets/img/Car/End.png';
                                EndPoint = { name: name, lat: lat, lon: lon, distance: undefined }; 

                                if (StartPoint && StartPoint.lat !== null && StartPoint.lon !== null) {
                                    EndPoint.distance = calculateDistance(StartPoint.lat, StartPoint.lon, EndPoint.lat, EndPoint.lon);          
                                }
                                break;

                            default:
                                break;
                        }

                        // 기존 마커 삭제 (출발지 마커, 도착지 마커 중 해당하는 것을 삭제)
                        if (status === "llStart") {
                            if (StartMarkerList.length > 0) {
                                StartMarkerList[0].setMap(null); 
                                StartMarkerList.pop();          
                            }

                            StartMarker = new Tmapv2.Marker({
                                position: new Tmapv2.LatLng(lat, lon),
                                icon: imgURL,
                                iconSize: new Tmapv2.Size(50, 50),
                                map: map
                            });

                            StartMarker.addListener("click", function(evt) {
                                showStartMarkerInfo(tag);
                            });

                            StartMarkerList.push(StartMarker); 

                        } else if (status === "llEnd") {
                            if (EndMarkerList.length > 0) {
                                EndMarkerList[0].setMap(null); 
                                EndMarkerList.pop();          
                            }

                            EndMarker = new Tmapv2.Marker({
                                position: new Tmapv2.LatLng(lat, lon),
                                icon: imgURL,
                                iconSize: new Tmapv2.Size(50, 50),
                                map: map
                        });

                        EndMarker.addListener("click", function(evt) {
                            showEndMarkerInfo(tag);
                        });

                            EndMarkerList.push(EndMarker);
                        }

                        if (status === "llStart") {
                                document.getElementById("startPoint").value = name;
                        } else if (status === "llEnd") {
                                document.getElementById("endPoint").value = name;
                            }

                        // 출발지와 도착지 마커가 모두 설정되었으면 경로 탐색
                        if (StartPoint.lat !== null && StartPoint.lon !== null && EndPoint.lat !== null && EndPoint.lon !== null) {
                            
                            naverMapLink = "http://map.naver.com/index.nhn"
                                + "?slng=" + StartPoint.lon + "&slat=" + StartPoint.lat + "&stext=" + encodeURIComponent(StartPoint.name)
                                + "&elng=" + EndPoint.lon + "&elat=" + EndPoint.lat + "&etext=" + encodeURIComponent(EndPoint.name)
                                + "&menu=route&pathType=0";


                            qrLink = "/generate-qr?startname=" + 
                            encodeURIComponent(StartPoint.name) + "&goalname=" + encodeURIComponent(EndPoint.name) + 
                            "&startx=" + StartPoint.lon + "&starty=" + StartPoint.lat + 
                            "&goalx=" + EndPoint.lon + "&goaly=" + EndPoint.lat;

                            
                            searchroute(StartPoint.lon, StartPoint.lat, EndPoint.lon, EndPoint.lat);
                            updateModalButtons();
                            
                            document.getElementById("searchButton").style.display = "none"; 
                        }

                        return marker;
                    };

                    window.delMarker = function(status) {
                    if (status === "llStart" && StartMarkerList.length > 0) {
                        StartMarkerList[0].setMap(null);  
                        StartMarkerList.pop();
                        StartPoint = { name: null, lat: null, lon: null, distance: 0 };
                        isRouteVisible = false;
                        
                        StationMarkers.forEach(function(marker) {
                            marker.setMap(null); 
                        });
                        
                        StationMarkers = [];

                        CenterMarkers.forEach(function(marker)
                        {
                            marker.setMap(null);
                        });
                        
                        document.getElementById("startPoint").value = "";
                        
                        if (showChargingStationsCheckbox.checked) {
                            updateStationPoints(); 
                        }

                        if (showServiceCentersCheckbox.checked) {
                            updateCenterPoints(); 
                        }

                        if (ViaPoint.length > 0)
                        {
                            ViaPoint.length = 0;
                            const waypointContainer = document.getElementById("waypointContainer");
                            Array.from(waypointContainer.children).forEach(function (child) {
                                child.style.display = "none";
                            });

                        }

                    } else if (status === "llEnd" && EndMarkerList.length > 0) {
                        EndMarkerList[0].setMap(null);  
                        EndMarkerList.pop();
                        EndPoint = { name: null, lat: null, lon: null, distance: 0 };  
                        isRouteVisible = false;

                        StationMarkers.forEach(function(marker) {
                            marker.setMap(null); 
                        });

                        CenterMarkers.forEach(function(marker)
                        {
                            marker.setMap(null);
                        });

                        if (ViaPoint.length > 0)
                        {
                            ViaPoint.length = 0;
                            const waypointContainer = document.getElementById("waypointContainer");
                            Array.from(waypointContainer.children).forEach(function (child) {
                                child.style.display = "none";
                            });

                        }

                        document.getElementById("endPoint").value = "";

                        if (showChargingStationsCheckbox.checked) {
                            updateStationPoints(); 
                        }

                        if (showServiceCentersCheckbox.checked) {
                            updateCenterPoints(); 
                        }
                    }

                    if (routePolyline) {
                        for (var i = 0; i < routePolyline.length; i++) {
                            routePolyline[i].setMap(null); 
                        }
                        routePolyline = []; 
                    }
            };

            function showModal(message) {

                const modal = document.createElement("div");
                modal.style.position = "fixed";
                modal.style.top = "50%";
                modal.style.left = "50%";
                modal.style.transform = "translate(-50%, -50%)";
                modal.style.padding = "20px";
                modal.style.background = "#fff";
                modal.style.border = "1px solid #ccc";
                modal.style.boxShadow = "0 2px 10px rgba(0, 0, 0, 0.2)";
                modal.style.zIndex = "1000";
                modal.textContent = message;

                const closeButton = document.createElement("button");
                closeButton.textContent = "확인";
                closeButton.style.marginTop = "10px";
                closeButton.style.padding = "5px 10px";
                closeButton.style.cursor = "pointer";
                closeButton.onclick = function () {
                    document.body.removeChild(modal);
                };

                modal.appendChild(closeButton);
                document.body.appendChild(modal);
            }
            
            function removeWaypoint(viapointname) 
            {
                const index = ViaPoint.findIndex(function(waypoint) {
                return waypoint.name === viapointname;
            });


                if (index !== -1) {
                    // 해당 경유지를 ViaPoint 배열에서 삭제
                    ViaPoint.splice(index, 1);
                    
                    // 화면에서 해당 경유지 요소도 삭제 (추가한 div 요소 삭제)
                    const waypointContainer = document.getElementById("waypointContainer");
                    const waypointDivs = waypointContainer.getElementsByTagName("div");

                    // 모든 div 요소를 순회하며 삭제하려는 경유지 이름과 일치하는 요소를 찾음
                    for (let i = 0; i < waypointDivs.length; i++) {
                        const waypointDiv = waypointDivs[i];
                        const span = waypointDiv.querySelector("span");
                        
                        // 경유지 이름이 일치하는 경우 해당 div 삭제
                        if (span && span.textContent === viapointname) {
                            waypointContainer.removeChild(waypointDiv);
                            break;  // 경유지를 찾으면 반복문 종료
                        }
                    }
                    
                    qrLink = "/generate-qr?startname=" + 
                    encodeURIComponent(StartPoint.name) + "&goalname=" + encodeURIComponent(EndPoint.name) + 
                    "&startx=" + StartPoint.lon + "&starty=" + StartPoint.lat + 
                    "&goalx=" + EndPoint.lon + "&goaly=" + EndPoint.lat;

                	// 남아있는 경유지들로 qrLink 갱신
	                ViaPoint.forEach(function(point, index) {
	                    if (point.name && point.lat && point.lon) {
	                        qrLink += "&via" + (index + 1) + "name=" + encodeURIComponent(point.name) + 
	                                  "&via" + (index + 1) + "x=" + point.lon + "&via" + (index + 1) + "y=" + point.lat;
	                    }
	                });
                	
	                if (!ViaPoint || ViaPoint.length === 0) {
	                    // 경유지가 없는 경우 - WGS84 좌표 직접 사용
	                    naverMapLink = "http://map.naver.com/index.nhn"
	                        + "?slng=" + StartPoint.lon + "&slat=" + StartPoint.lat + "&stext=" + encodeURIComponent(StartPoint.name)
	                        + "&elng=" + EndPoint.lon + "&elat=" + EndPoint.lat + "&etext=" + encodeURIComponent(EndPoint.name)
	                        + "&menu=route&pathType=0";
	                } else {
	                    // 경유지가 있는 경우 - 좌표 변환 필요
	                    naverMapLink = "https://map.naver.com/p/directions/";
	                    var startCoord = wgs84ToNaverCoord(StartPoint.lat, StartPoint.lon);
	                    var endCoord = wgs84ToNaverCoord(EndPoint.lat, EndPoint.lon);

	                    naverMapLink += startCoord.x + "," + startCoord.y + "," + encodeURIComponent(StartPoint.name) + ",,SIMPLE_POI/";
		                naverMapLink += endCoord.x + "," + endCoord.y + "," + encodeURIComponent(EndPoint.name) + ",,SIMPLE_POI/";

		                ViaPoint.forEach(function (point, index) {
		                    if (point.name && point.lat && point.lon) {
		                        var viaCoord = wgs84ToNaverCoord(point.lat, point.lon);
		                        if (index === ViaPoint.length - 1) {
		                            // 마지막 경유지 처리
		                            naverMapLink += viaCoord.x + "," + viaCoord.y + "," + encodeURIComponent(point.name) + ",PLACE_POI/";
		                        } else {
		                            // 경유지끼리는 ":"로 연결
		                            naverMapLink += viaCoord.x + "," + viaCoord.y + "," + encodeURIComponent(point.name) + ",PLACE_POI:";
		                        }
		                    }
		                });
		                naverMapLink += "car?c=13.00,0,0,0,dh";
	                }
	                
                    if(ViaPoint.length > 0)
                        calculateRoute(StartPoint, EndPoint, ViaPoint);

                    else
                        searchroute(StartPoint.lon, StartPoint.lat, EndPoint.lon, EndPoint.lat);

            }  else {
                    console.log("삭제할 경유지가 없습니다:", viapointname);
                }

            }
            


            window.addWaypoint = function()
            {
				

                const viapointname = name;

                if (ViaPoint.length >= 2) {
                    showModal("경유지는 최대 2개만 추가할 수 있습니다.");
                    return;
                }
  
                ViaPoint.push({ name: viapointname, lat: lat, lon: lon });
                
                qrLink = "/generate-qr?startname=" + 
                encodeURIComponent(StartPoint.name) + "&goalname=" + encodeURIComponent(EndPoint.name) + 
                "&startx=" + StartPoint.lon + "&starty=" + StartPoint.lat + 
                "&goalx=" + EndPoint.lon + "&goaly=" + EndPoint.lat;

	            // 경유지 추가된 부분을 qrLink에 포함
	            ViaPoint.forEach(function(point, index) {
	                if (point.name && point.lat && point.lon) {
	                    qrLink += "&via" + (index + 1) + "name=" + encodeURIComponent(point.name) + 
	                              "&via" + (index + 1) + "x=" + point.lon + "&via" + (index + 1) + "y=" + point.lat;
	                }
	            });
	            
	            
         
                var startCoord = wgs84ToNaverCoord(StartPoint.lat, StartPoint.lon);
                var endCoord = wgs84ToNaverCoord(EndPoint.lat, EndPoint.lon);
                
                naverMapLink = "https://map.naver.com/p/directions/"
                naverMapLink += startCoord.x + "," + startCoord.y + "," + encodeURIComponent(StartPoint.name) + ",,SIMPLE_POI/";
                naverMapLink += endCoord.x + "," + endCoord.y + "," + encodeURIComponent(EndPoint.name) + ",,SIMPLE_POI/";

                if (ViaPoint && ViaPoint.length) {
                    ViaPoint.forEach(function(point, index) {
                        if (point.name && point.lat && point.lon) {
                            var viaCoord = wgs84ToNaverCoord(point.lat, point.lon);
                            // 마지막 경유지 처리
                            if (index === ViaPoint.length - 1) {
                                naverMapLink += viaCoord.x + "," + viaCoord.y + "," + encodeURIComponent(point.name) + ",PLACE_POI/";
                            } else {
                                // 경유지끼리는 ":"로 연결
                                naverMapLink += viaCoord.x + "," + viaCoord.y + "," + encodeURIComponent(point.name) + ",PLACE_POI:";
                            }
                        }
                    });
                }
                naverMapLink += "car?c=13.00,0,0,0,dh";
	            
		            
                updateWaypointButtons();

                if(StartPoint === null, EndPoint == null)
                    return;
                
                else
                	if (routePolyline && routePolyline.length > 0) {
                	    for (var i = 0; i < routePolyline.length; i++) {
                	        routePolyline[i].setMap(null);  // 경로 지우기
                	    }
                	    routePolyline = [];  // 배열 초기화
                    	calculateRoute(StartPoint, EndPoint, ViaPoint); 
                	}

                toggleWaypointButton();

                const waypointContainer = document.getElementById("waypointContainer");

                const newWaypointDiv = document.createElement("div");
                newWaypointDiv.style.marginTop = "10px";
                newWaypointDiv.style.position = "relative";

                const span = document.createElement("span");
                span.style.marginLeft = "5px";
                span.style.padding = "5px";
                span.style.width = "250px";
                span.style.display = "block"; 
                span.style.background = "#f1f1f1";
                span.style.border = "1px solid #ccc";
                span.textContent = name;


                const deleteButton = document.createElement("button");
                deleteButton.style.position = "absolute";
                deleteButton.style.right = "80px";  
                deleteButton.style.top = "45%";  
                deleteButton.style.transform = "translateY(-50%)";
                deleteButton.style.background = "none";  
                deleteButton.style.border = "none";  
                deleteButton.style.cursor = "pointer";  
                deleteButton.style.padding = "0";  
                deleteButton.style.zIndex = "10";  

                const img = document.createElement("img");
                img.src = '/resources/assets/img/Car/delete.png';
                img.alt = "delete";
                img.style.width = "13px";
                img.style.height = "13px";
                deleteButton.appendChild(img);

                deleteButton.onclick = function() {
                    removeWaypoint(viapointname);  
                };
                
                newWaypointDiv.appendChild(span);
                newWaypointDiv.appendChild(deleteButton);
                waypointContainer.appendChild(newWaypointDiv);

            }   

            function updateWaypointButtons() {

                if(isRouteVisible)
                    ViaPoint.forEach(function (point, index) {

                        const deleteButton = document.createElement('button');
                        deleteButton.classList.add('btn', 'btn-danger');
                        deleteButton.textContent = `경유지 ${point.name} 삭제`;

                        deleteButton.onclick = function() {
                            ViaPoint.splice(index, 1); 

                            calculateRoute(StartPoint, EndPoint, ViaPoint);
                            toggleWaypointButton();
                            updateWaypointButtons();
                        };
                    });
                else
                    return;
            }
        


            function toggleWaypointButton() {

                const setWaypointButton = document.getElementById('setWaypoint');
                const startButton = document.getElementById('setStartPoint');
                const endButton = document.getElementById('setEndPoint');

                if (isRouteVisible) {
                    setWaypointButton.style.display = 'block';
                    startButton.style.display = 'none';
                    endButton.style.display = 'none';
                } else {
                    setWaypointButton.style.display = 'none';
                    startButton.style.display = 'block';
                    endButton.style.display = 'block';
                }
            }

            window.onload = function() {
                toggleWaypointButton(); 
                updateWaypointButtons();
            }

            window.calculateRoute = function(startPoint, endPoint, viaPoints) {
            	var url = 'https://apis.openapi.sk.com/tmap/routes/routeOptimization10?version=1&format=json&appKey=' + appKey;
                
                const requestData = {
                    startName: "출발",
                    startX: String(startPoint.lon),
                    startY: String(startPoint.lat), 
                    startTime: startTime,
                    endName: "도착",
                    endX: String(endPoint.lon), 
                    endY: String(endPoint.lat), 
                    searchOption: "0",
                    viaPoints: viaPoints.map(function(point, index) {
                        return {
                            viaPointId: 'via' + (index + 1),
                            viaPointName: '경유지' + (index + 1),
                            viaX: String(point.lon),
                            viaY: String(point.lat)
                        };
                    })
                }


                return new Promise(function(resolve, reject) {
                    $.ajax({
                        type: "POST",
                        url: url,
                        contentType: "application/json",
                        data: JSON.stringify(requestData),
                        success: function(response) {
                            resolve(response);
                            drawData(response);
                        },
                        error: function(request, status, error) {
                            reject({ code: request.status, message: error });
                            console.log("Request Data: ", JSON.stringify(requestData));
                        }
                    });
                });
            }
            var searchmarker = [];

            function swapValues() {
                    var startInput = document.getElementById("startPoint");
                    var endInput = document.getElementById("endPoint");
                    
                    var inputArea = document.getElementById('input-area');
                    
                    var imgURL = '/resources/assets/img/Car/Start.png';
                    
                    // 값 교환
                    var temp = startInput.value;
                    startInput.value = endInput.value;
                    endInput.value = temp;
                    
                    var tempName = StartPoint.name;
                    var tempLat = StartPoint.lat;
                    var tempLon = StartPoint.lon;
                    var tempDistance = StartPoint.distance;
                    
                    StartPoint.name = EndPoint.name;
                    StartPoint.lat = EndPoint.lat;
                    StartPoint.lon = EndPoint.lon;
                    StartPoint.distance = EndPoint.distance;

                    EndPoint.name = tempName;
                    EndPoint.lat = tempLat;
                    EndPoint.lon = tempLon;
                    EndPoint.distance = tempDistance;
                    
                    if (StartPoint.lat && StartPoint.lon && EndPoint.lat && EndPoint.lon) {
                        // QRLink 기본 설정 (출발지와 도착지만 있는 경우)
                        qrLink = "/generate-qr?startname=" + 
                            encodeURIComponent(StartPoint.name) + "&goalname=" + encodeURIComponent(EndPoint.name) + 
                            "&startx=" + StartPoint.lon + "&starty=" + StartPoint.lat + 
                            "&goalx=" + EndPoint.lon + "&goaly=" + EndPoint.lat;

                        // 경유지 추가
                        if (ViaPoint && ViaPoint.length) {
                            ViaPoint.forEach(function(point, index) {
                                if (point.name && point.lat && point.lon) {
                                    qrLink += "&via" + (index + 1) + "name=" + encodeURIComponent(point.name) + 
                                              "&via" + (index + 1) + "x=" + point.lon + "&via" + (index + 1) + "y=" + point.lat;
                                }
                            });
                        }

                        // Naver Map Link 기본 설정 (출발지와 도착지만 있는 경우)
                        var startCoord = wgs84ToNaverCoord(StartPoint.lat, StartPoint.lon);
                        var endCoord = wgs84ToNaverCoord(EndPoint.lat, EndPoint.lon);

                        naverMapLink = "https://map.naver.com/p/directions/";
                        naverMapLink += startCoord.x + "," + startCoord.y + "," + encodeURIComponent(StartPoint.name) + ",,SIMPLE_POI/";
                        naverMapLink += endCoord.x + "," + endCoord.y + "," + encodeURIComponent(EndPoint.name) + ",,SIMPLE_POI/";

                        // 경유지 추가
                        if (ViaPoint && ViaPoint.length) {
                            ViaPoint.forEach(function(point, index) {
                                if (point.name && point.lat && point.lon) {
                                    var viaCoord = wgs84ToNaverCoord(point.lat, point.lon);
                                    // 마지막 경유지 처리
                                    if (index === ViaPoint.length - 1) {
                                        naverMapLink += viaCoord.x + "," + viaCoord.y + "," + encodeURIComponent(point.name) + ",PLACE_POI/";
                                    } else {
                                        // 경유지끼리는 ":"로 연결
                                        naverMapLink += viaCoord.x + "," + viaCoord.y + "," + encodeURIComponent(point.name) + ",PLACE_POI:";
                                    }
                                }
                            });
                        }

                        naverMapLink += "car?c=13.00,0,0,0,dh";
                    }

                    
                    if (StartMarkerList.length > 0 && StartMarkerList[0] !== null) {
                        StartMarkerList[0].setMap(null); // 기존 마커 삭제
                        StartMarkerList = []; // 리스트에서 제거
                    }

                    // 출발지 마커 생성
                    if (StartPoint.lat && StartPoint.lon) {
                        var imgURL = '/resources/assets/img/Car/Start.png';
                        StartMarker = new Tmapv2.Marker({
                            position: new Tmapv2.LatLng(StartPoint.lat, StartPoint.lon),
                            icon: imgURL,
                            iconSize: new Tmapv2.Size(50, 50),
                            map: map
                        });
                        StartMarkerList[0] = StartMarker; // 새 마커를 리스트에 추가
                    }

                    // 도착지 마커가 존재하면 삭제 후 새로 생성
                    if (EndMarkerList.length > 0 && EndMarkerList[0] !== null) {
                        EndMarkerList[0].setMap(null); // 기존 마커 삭제
                        EndMarkerList[0] = []; // 리스트에서 제거
                    }

                    // 도착지 마커 생성
                    if (EndPoint.lat && EndPoint.lon) {
                        var imgURL = '/resources/assets/img/Car/End.png';
                        EndMarker = new Tmapv2.Marker({
                            position: new Tmapv2.LatLng(EndPoint.lat, EndPoint.lon),
                            icon: imgURL,
                            iconSize: new Tmapv2.Size(50, 50),
                            map: map
                        });
                        EndMarkerList[0] = EndMarker; // 새 마커를 리스트에 추가
                    }

                    // 마커 클릭 이벤트 처리
                    StartMarker.addListener("click", function(evt) {
                        showStartMarkerInfo(1);
                    });
                    EndMarker.addListener("click", function(evt) {
                        showEndMarkerInfo(2);
                    });
                    
                    
                    if(isRouteVisible)
                    	{
                    		document.getElementById("searchButton").style.display = "none";
                    	
                    		if(ViaPoint.length > 0)
                    			{
                    				calculateRoute(StartPoint, EndPoint, ViaPoint); 
                    			}
                    		else    	
                    			{
			                    	searchroute(StartPoint.lon, StartPoint.lat, EndPoint.lon, EndPoint.lat);                
                    			}
                        
                    	}
                }

            async function searchPOI(type) {
                try {
                    var point = document.getElementById(type).value;
                    point = encodeURIComponent(point); // 공백이나 특수문자 처리

                    const apiUrl = 'https://apis.openapi.sk.com/tmap/pois?version=1&searchKeyword=' + point + 
                    '&searchType=all&searchtypCd=A&reqCoordType=WGS84GEO&resCoordType=WGS84GEO&page=1&count=30&multiPoint=N&poiGroupYn=N&appKey=' + appKey;

                    const response = await fetch(apiUrl, {
                        method: "GET",
                        headers: {
                            "Accept": "application/json",
                            "appKey": `${appKey}`
                        }
                    });

                    const data = await response.json();
                    // 검색 결과 처리
                    if (data.searchPoiInfo.totalCount > 0) {
                        const pois = data.searchPoiInfo.pois.poi;

                        // '지역'을 제외하고 필터링
                        const filteredPois = pois.filter(function(poi) {
                            return poi.middleBizName !== '지역';
                        });

                        // 20개만 선택
                        const limitedPois = filteredPois.slice(0, 20);

                        // 결과 처리
                        displayResults(type, limitedPois);
                        displayMarkers(type, limitedPois);
                    }
                } catch (error) {
                    console.error('API 호출 오류:', error);
                }
            }

                function displayResults(type, pois) {
                    const resultListId = (type === 'startPoint') ? 'start-result-list' : 'end-result-list'; 
                    const resultList = document.getElementById(resultListId);

                    const inputArea = document.getElementById('input-area');
                    // 상대 리스트는 display none 처리
                    const oppositeResultListId = (type === 'startPoint') ? 'end-result-list' : 'start-result-list';
                    const oppositeResultList = document.getElementById(oppositeResultListId);
                    oppositeResultList.style.display = 'none'; 
                    resultList.innerHTML = ''; 

                    pois.forEach(function(poi) {
                        const div = document.createElement('div');
                        div.classList.add('result-item');
                        div.innerHTML = 
                            '<strong>' + poi.name + '</strong><br>' +
                            '주소: ' + poi.newAddressList.newAddress[0].fullAddressRoad + '<br>' +
                            '<button onclick="name = \'' + poi.name + '\'; moveToLocation(' + poi.newAddressList.newAddress[0].centerLat + ', ' + poi.newAddressList.newAddress[0].centerLon + ')">이동</button>';
                        resultList.appendChild(div);
                    });

                    resultList.style.display = 'block'; 
                    inputArea.style.height = '37%';
                }


                function displayMarkers(type, pois) {
                        pois.forEach(function(poi) {
                            const marker = new Tmapv2.Marker({
                                position: new Tmapv2.LatLng(poi.newAddressList.newAddress.centerLat, poi.newAddressList.newAddress.centerLon),
                                map: map
                            });
                            searchmarker.push(marker);
                        });
                    }

                function moveToLocation(lat, lon) {
                	
                	const inputArea = document.getElementById('input-area');
                	
                    if (marker) { 
                        marker.setMap(null);
                    } 
                    
                    currentCenter = new Tmapv2.LatLng(myPlace.lat, myPlace.lon); 
                    
                    if (isRouteVisible) {  // isRouteSet이 경로가 설정된 상태인지 확인하는 변수라고 가정
                        document.getElementById("searchButton").style.display = "none"; // 경로가 설정된 상태에서는 검색 버튼 숨기기
                    } else {
                        document.getElementById("searchButton").style.display = "block"; // 경로가 설정되지 않았을 경우에만 검색 버튼 표시
                    }
                    
                    map.setCenter(new Tmapv2.LatLng(lat, lon));
                    map.setZoom(17);
                    marker = new Tmapv2.Marker({
                            position: new Tmapv2.LatLng(lat, lon),
                            map: map
                        });
                    document.getElementById('start-result-list').style.display = 'none';
                    document.getElementById('end-result-list').style.display = 'none';
                    inputArea.style.height = '20%';
                    window.lat = lat;
                    window.lon = lon;
                    reverseGeocode(lat, lon)
                }

                function toggleResultDisplay(type, isFocus) {
                    const resultListId = (type === 'startPoint') ? 'start-result-list' : 'end-result-list';
                    const resultList = document.getElementById(resultListId);
                    
                    const inputArea = document.getElementById('input-area');

                    const inputField = document.getElementById(type);
                    if (isFocus && inputField.value.trim() !== '') {
                        resultList.style.display = 'block'; 
                        inputArea.style.height = '37%';
                    } else {
                        setTimeout(function() {
                            if (!document.activeElement.closest("#" + resultListId)) {
                                resultList.style.display = 'none'; 
                                inputArea.style.height = '20%';
                            }
                        }, 100);
                    }
                }

                function toggleDeleteButton(inputId, buttonId) {
                    const input = document.getElementById(inputId);
                    const clearButton = document.getElementById(buttonId);

                    if (input.value.trim() !== '') {
                        clearButton.style.display = 'block'; 
                    } else {
                        clearButton.style.display = 'none'; 
                    }
                }

                function clearInput(inputId, buttonId) {
                    const input = document.getElementById(inputId);
                    input.value = '';
                    if (inputId == 'startPoint')
                        delMarker('llStart');
                    else if (inputId == 'endPoint')
                        delMarker('llEnd');
                    
                    toggleDeleteButton(inputId, buttonId); 
                }
                
                function toggleDiv() {
                    const popup = document.getElementById('popup');
                    // 팝업의 표시 여부를 토글합니다.
                    if (popup.style.display === 'none') {
                        popup.style.display = 'block'; // 팝업 표시
                    } else {
                        popup.style.display = 'none'; // 팝업 숨기기
                    } 
                }
                
                function searchChargingStations()
                {
                    const showChargingStationsCheckbox = document.getElementById('showChargingStations');
                    const showServiceCentersCheckbox = document.getElementById('showServiceCenters');        

                    document.getElementById("searchButton").style.display = "none";
                    
                    if(showChargingStationsCheckbox.checked)
                    	fetchChargingStations (currentCenter.lat(), currentCenter.lng(), select_distance); 
 					
 					if(showServiceCentersCheckbox.checked)
 						updateCentercurrentPoints(currentCenter.lat(), currentCenter.lng());

                }
                
                async function fetchChargingStations(lat, lon, distance) {
                	
        			
        		    StationPoints.forEach(function(station) {
        		        const distance = calculateDistance(lat, lon, station.lat, station.lon);
        		        station.distance = distance; // 거리 추가
        		    });

        		    StationPoints.sort(function(a, b) {
        		        return a.distance - b.distance;
        		    });


                    nearestPoints = StationPoints.filter(function(station) {
                        return station.distance <= distance;
                    });

                    nearestPoints.sort(function(a, b) {
                        return a.distance - b.distance;
                    });
                    
                    console.log("선택한 거리 이하의 포인트 개수:", nearestPoints.length);
                    console.log(nearestPoints);

                    // 기존 마커 삭제
                    StationMarkers.forEach(function(marker) {
                        marker.setMap(null);
                    });
                    
                    StationMarkers = [];
                    centercopyStationPoints = [];
                    // 가까운 충전소 마커 생성
                    for (const station of nearestPoints) {
                        try {
                            const chargerData = await searchChargerdata(station.lat, station.lon);

                            const brand = chargerData.evChargers.evCharger[0].operatorName;

                            var chargerTypes = [];
                            for (var i = 0; i < chargerData.evChargers.evCharger.length; i++) {
                                var chargerType = getChargerType(chargerData.evChargers.evCharger[i].type);
                                if (chargerTypes.indexOf(chargerType) === -1) {
                                    chargerTypes.push(chargerType);
                                }
                            }                      
                            
                            const totalChargers = chargerData.evChargers.evCharger ? chargerData.evChargers.evCharger.length : 0;

                            var availableChargers = 0;
                            if (chargerData.evChargers.evCharger) {
                                for (var i = 0; i < chargerData.evChargers.evCharger.length; i++) {
                                    if (chargerData.evChargers.evCharger[i].isAvailable === 'Y') {
                                        availableChargers++;
                                    }
                                }
                            }

                            var labelText = '<span style="background-color: #46414E; color: white; padding: 5px; border-radius: 5px; font-size: 15px; font-weight: bold; text-align: center; position: absolute; bottom: 50px;">' +
                                brand + ' <br> ' +
                                chargerTypes + ' <br> ' +
                                availableChargers + ' / ' +
                                totalChargers +
                                '</span>';

                            const stationmarker = new Tmapv2.Marker({
                                position: new Tmapv2.LatLng(station.lat, station.lon),
                                icon: '/resources/assets/img/Car/Chager.png',
                                iconSize: new Tmapv2.Size(50, 50),
                                map: mapInstance,
                                stationData: station,
                                label: labelText
                            });
                            
                            station.chargerTypes = chargerTypes;
                            centercopyStationPoints.push(station);

                            stationmarker.addListener("click", async function(evt) {
                                if (marker) {
                                    marker.setMap(null);
                                    marker = null;
                                }
                                lat = stationmarker.getPosition().lat();
                                lon = stationmarker.getPosition().lng();
                                
                                const upper_addr_name = chargerData.upperAddrName;
                                const middle_addr_name = chargerData.middleAddrName;
                                const lower_addr_name = chargerData.lowerAddrName;
                                const road_name = chargerData.roadName;
                                const building_no = chargerData.buildingNo1;

                                onPinClick(upper_addr_name, middle_addr_name, lower_addr_name, road_name, building_no);
                                
                                await handleMarkerClick(station);
                            });
                            
                            
                            StationMarkers.push(stationmarker);

                        } catch (error) {
                            console.error("Error processing station:", station);
                            console.error("Error details:", error);
                        }
                    }

                } 
                
                function updateCentercurrentPoints(lat, lon) {
                	
                	CenterPoints.forEach(function(center) {
        		        const distance = calculateDistance(lat, lon, center.lat, center.lon);
        		        center.distance = distance; // 거리 추가
        		    });

                    nearestPoints = CenterPoints.filter(function(point) {
                        return point.distance <= fixed_distance;
                    }).slice(0, 10);

                    CenterMarkers.forEach(function(marker) {
                        marker.setMap(null);
                    });

                    CenterMarkers = [];

                    nearestPoints.forEach(function(center) {
                    	
                 	   const iconPath = brandIcons[center.brand] || '/resources/assets/img/Car/Center.png';
                        const marker = new Tmapv2.Marker({
                            position: new Tmapv2.LatLng(center.lat, center.lon),
                            icon: iconPath,
                            iconSize: new Tmapv2.Size(50, 50),
                            map: mapInstance,
                            zIndex: 1100  // 다른 요소들보다 위에 표시되도록
                        });
                        marker.addListener("click", function(evt) {
                            lat = marker.getPosition().lat();
                            lon = marker.getPosition().lng();
                            name = center.name;
                            console.log("center : " + center)
                            showcenterInfo(center);
                        });
                        
                        marker.addListener("touchstart", function(evt) {
                        	
                            evt.stopPropagation();  // 이벤트 버블링 방지
                            evt.preventDefault();    // 기본 동작 방지
                            
                        	console.log("touchstart");
                            lat = marker.getPosition().lat();
                            lon = marker.getPosition().lng();
                            name = center.name;
                            console.log("center : " + center)
                            showcenterInfo(center);
                        });
                        
                        CenterMarkers.push(marker);
                        });
                    }
                
        </script>
    </body>
    
</html>