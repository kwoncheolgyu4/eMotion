
<%
  /* ================================================================= 
   * 작성일     : 2024. 12. 30. 
   * 작성자     : 철규
   * 상세설명  : 전기차 비교
   * 화면ID : 
   * ================================================================= 
   * 수정일         작성자             내용      
   * ----------------------------------------------------------------------- 
   * 
   * ================================================================= 
   */
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>전기차와 전기차 비교</title>

<!-- 프레임 워크 jquery and bootStrap-->
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"	crossorigin="anonymous">
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

<!-- 헤더 풋터 css -->
<link rel="stylesheet" href="/resources/css/headerFooter.css">
<!-- 헤더 풋터 css -->
</head>
<style>

.btn-primary {
    background-color: #50B0FF;
    border: none;
}

.btn-primary:hover {
    background-color: #37a1f8;
}
.btn.responsive-text {
    font-size: calc(0.8rem + 0.4vw);
    font-weight: 600;
}

.responsive-text {
    font-size: calc(1rem + 0.5vw);
    /* 화면 너비에 비례한 폰트 크기 */
}
.responsive-subtext {
    font-size: calc(1rem + 0.5vw);
    font-weight: 600;
    color: #604616;
    /* 화면 너비에 비례한 폰트 크기 */
}
.responsive-tabletext{
    font-size: calc(0.6rem + 0.5vw);
}

.responsive-input {
    font-size: calc(1rem + 0.5vw);
    height: 7vh;
    /* 화면 너비에 비례한 폰트 크기 */
}

.re_logo {
    font-size: calc(2.5rem + 0.5vw);
    /* 화면 너비에 비례한 폰트 크기 */
    font-weight: 1000;

}

.re_sm_logo {
    font-size: calc(1rem + 0.5vw);
    /* 화면 너비에 비례한 폰트 크기 */
    font-weight: 600;
    color: #828282;
}

.re_sm {
    font-size: calc(0.5rem + 0.5vw);
    /* 화면 너비에 비례한 폰트 크기 */
    font-weight: 600;
    color: #828282;
}

.re_exp {
    font-size: calc(1rem + 0.5vw);
    /* 화면 너비에 비례한 폰트 크기 */
    font-weight: 1000;
    text-align: center;
}

.brd {
    border-radius: 15px;
    box-shadow: 0 5px 8px rgba(57, 57, 57, 0.16), 0 5px 8px rgba(57, 57, 57, 0.16);
}

.container-sm{
    height: 100%;
    
}

::-webkit-scrollbar {
    display: none;
}
.hidden{
    overflow:hidden;
    text-overflow:ellipsis;
    white-space:nowrap;
}
    
/* maingrid 설정 */
.maingrid {
  display: flex;
  flex-direction: column;
  height: 100%; /* 부모 높이에 맞추기 */
  max-height: 100vh; /* 화면 전체 높이를 넘어가지 않도록 제한 */
  overflow: hidden; /* 자식 콘텐츠가 넘치지 않도록 제한 */
  position: relative;
  background-color: white;
  border-radius: 15px;
  box-shadow: 0 5px 8px rgba(57, 57, 57, 0.16);
}

/* 테이블 컨테이너에 스크롤 추가 */
.table-wrapper {
  padding: 10px;
  box-sizing: border-box; /* 패딩 포함 높이 계산 */
}
   
.like-icon {
    bottom: 1.5vh;
    right: 0.8vw;
    width: 24px;
    height: 24px;
    position: absolute;
    z-index: 1;
    cursor: pointer;
    transition: fill 0.3s;
}

.like-icon:hover {
    fill: #FFA500; /* 호버 시 주황색 강조 */
}

.like-icon.active {
    fill: #FFD700; /* 활성화된 상태는 금색 */
}

.card-wrapper-elec-first {
  display: grid;
  grid-template-columns: repeat(2, 1fr); /* 한 줄에 두 개 */
  gap: 15px; /* 카드 간격 */
  width: 100%; /* 전체 너비 */
  justify-items: center; /* 카드 가운데 정렬 */
}

.card-wrapper-elec-second {
  display: grid;
  grid-template-columns: repeat(2, 1fr); /* 한 줄에 두 개 */
  gap: 15px; /* 카드 간격 */
  width: 100%; /* 전체 너비 */
  justify-items: center; /* 카드 가운데 정렬 */
}

.card.carbottom {
  background: #fff;
  border: 1px solid #ddd;
  border-radius: 8px;
  overflow: hidden; /* 이미지가 영역을 벗어나지 않도록 */
  box-sizing: border-box;
  display: flex;
  flex-direction: column; /* 세로 배치 */
  align-items: center; /* 내용 중앙 정렬 */
  padding: 15px;
}

.card.img {
  width: 100%;
  height: 150px; /* 이미지 높이 고정 */
  overflow: hidden; /* 이미지가 높이를 초과하면 잘림 */
}

.card.img img {
  width: 100%;
  height: 100%;
  object-fit: cover; /* 이미지가 카드 영역에 맞게 조정 */
  border-radius: 10px;
}

/* 반응형 설정 */
@media (max-width: 768px) {
  .card-wrapper {
    grid-template-columns: repeat(2, 1fr); /* 작은 화면에서 두 개 */
  }

  .card.carbottom {
    width: 90%; /* 카드 너비 조정 */
  }
}

@media (max-width: 480px) {
  .card-wrapper {
    grid-template-columns: repeat(1, 1fr); /* 더 작은 화면에서는 한 줄에 하나 */
  }

  .card.img {
    height: 120px; /* 더 작은 화면에서 이미지 높이 축소 */
  }
}

#elecFirstResultList {
    max-height: 200px; /* 최대 높이 설정 */
    overflow-y: auto; /* 스크롤 추가 */
    background-color: white; /* 리스트 배경색 */
    position: absolute; /* 위치 고정 */
    top: 100%; /* 인풋창 바로 아래에 표시 */
    left: 0; /* 부모의 왼쪽에 맞춤 */
    width: 100%; /* 부모의 너비에 맞춤 */
    border: 1px solid #ccc; /* 테두리 추가 */
    z-index: 1050; /* 다른 요소 위에 표시 */
    border-radius: 0.25rem; /* 둥근 테두리 */
    display: none; /* 기본적으로 숨김 */
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
}      

#elecSecondResultList {
    max-height: 200px; /* 최대 높이 설정 */
    overflow-y: auto; /* 스크롤 추가 */
    background-color: white; /* 리스트 배경색 */
    position: absolute; /* 위치 고정 */
    top: 100%; /* 인풋창 바로 아래에 표시 */
    left: 0; /* 부모의 왼쪽에 맞춤 */
    width: 100%; /* 부모의 너비에 맞춤 */
    border: 1px solid #ccc; /* 테두리 추가 */
    z-index: 1050; /* 다른 요소 위에 표시 */
    border-radius: 0.25rem; /* 둥근 테두리 */
    display: none; /* 기본적으로 숨김 */
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
}      

#elecCompareImg, #gasCompareImg {
    width: 100%; /* 부모 요소 너비에 맞춤 */
    height: 100%; /* 부모 요소 높이에 맞춤 */
    object-fit: cover; /* 비율을 유지하며 영역을 채움 */
    border-radius: inherit; /* 부모의 border-radius와 동일하게 */
    cursor: pointer; /* 클릭 가능한 버튼처럼 표시 */
}

.progress-container {
	display: flex;
	width: 100%;
	min-height: 10px;
	height: 1.2vh;
	max-height: 12px;
	background-color: #D1D1D1;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
	border-radius: 50px;
	position: relative;
	margin-bottom: 20px;
}

.progress-bar {
	height: 100%;
	border-radius: 50px;
	transition: width 0.5s ease-in-out;
}

.progress-bar:hover {
	opacity: 80%;
}

.progress-bar.left-progress {
	background-color: #83C4FF;
}

.progress-bar.right-progress {
	background-color: #F46C46;
}

.tips {
	position: absolute;
	background-color: #fff;
	padding: 5px 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
	display: none;
	pointer-events: none;
	z-index: 10;
}

.headfont {
	color: #695B40;
	font-weight: 1000;
}

.headfont.center {
	font-weight: 1000;
	color: #372504;
}
.minus-font{
	color:#976200;
}
.minus-font.before{
	color:#83C4FF;
}
.minus-font.after{
	color:#F46C46;
}


 .btn-othCompare {
      background-color: rgba(209, 209, 209, 1);
      color: white;
      border: none;
      padding: 5px 5px;
      font-size: 16px;
      border-radius: 5px;
      cursor: pointer;
      transition: all 0.3s ease; /* 애니메이션 효과 */
    }

 .btn-othCompare:hover {
      background-color: rgba(0, 128, 255, 0.6); /* 흐린 파란색 */
      outline: none; /* 기본 outline 제거 */
      transform: scale(1.05); /* 약간 확대 효과 */
    }

 .btn-othCompare:hover::after {
      content: " 비교하기"; /* 텍스트 변경 */
      font-size: 16px;
    }
</style>

<style>
.mainbody {
	background-color: #ffffff;
}

.btn_log {
	border-radius: 10px;
	padding: 12px 15px;
	width: 100%;
	height: 100px;
}

.log {
	height: 100px;
	margin-bottom: 10px;
	border-radius: 20px
}

.log_last {
	height: 100px;
	border-radius: 20px
}

.btn-primary {
	background-color: #50B0FF;
	border: none;
}

.btn-primary:hover {
	background-color: #37a1f8;
}

.btn-primary:active {
	background-color: #50B0FF;
}

a {
	color: #37a1f8;
}
</style>
<style>
/* 화면 꽉차게 */
html, body {
    height: 100%;
}

body {
    display: flex;
    justify-content: center;
    background-color: #f8f9fa;
}

.cont::-webkit-scrollbar {
    display: none;
}

.cont {
    background-color: white;
    width: 744px;
    height: 100%;
    -ms-overflow-style: none;
    scrollbar-width: none;
}


.re_sm_logo_modal {
    font-size: 2rem;
    font-weight: 600;
    color: #828282;
}

.re_sm_logo {
    font-size: 5rem;
    font-weight: 600;
    color: #828282;
}

.inp_size {
    border-radius: 15px;
    height: 11vh;
    min-height: 60px;
    max-height: 80px;
}


.btn-primary {
    font-weight: 1000;
    background-color: #50B0FF;
    border: none;
}

.btn-primary:hover {
    background-color: #37a1f8;
}

.btn-size {
    border-radius: 10px;
    width: 100%;
    height: 10vh;
    min-height: 50px;
    max-height: 100px;
    font-weight: 600;
}

.input-group {
    height: 4rem;
    margin-bottom: 0.5rem;
}

.error-message {
    color: #dc3545;
    font-weight: 600;
    margin-left: 0.25rem;
}

/* 로고 사이즈 줄이기 */
@media (max-width: 768px) {
    .re_sm_logo {
		font-size: 4rem;
		/* 화면 너비에 비례한 폰트 크기 */
		font-weight: 600;
		color: #828282;
	}
	.fs-3 {
		font-size: 1.2rem !important;
	}
	.fs-4 {
		font-size: 1.2rem !important;
	}
	.fs-5 {
		font-size: 1.2rem !important;
	}
	.fs-4 m-2 {
		font-size: 1.0rem !important;
	}
	.log {
		height: 80px;
		margin-bottom: 10px;
		border-radius: 20px
	}
	
	.log_last {
		height: 80px;
		border-radius: 20px
	}
	.btn_log {
		border-radius: 10px;
		padding: 12px 15px;
		width: 100%;
		height: 80px;
	}
	
}

@media (max-width: 576px) {
    .re_sm_logo {
		font-size: 3rem;
		/* 화면 너비에 비례한 폰트 크기 */
		font-weight: 600;
		color: #828282;
	}
	.fs-3 {
		font-size: 1.0rem !important;
	}
	.fs-4 {
		font-size: 1.0rem !important;
	}
	.fs-5 {
		font-size: 1.0rem !important;
	}
	.fs-4 m-2 {
		font-size: 0.8rem !important;
	}
	.log {
		height: 60px;
		margin-bottom: 10px;
		border-radius: 20px
	}
	
	.log_last {
		height: 60px;
		border-radius: 20px
	}
	.btn_log {
		border-radius: 10px;
		padding: 12px 15px;
		width: 100%;
		height: 60px;
	}
}
</style>

<script type="text/javascript">

document.addEventListener('DOMContentLoaded', () => {
    const elecSearchInput = document.getElementById('elecFirstSearchInput');
    const elecResultList = document.getElementById('elecFirstResultList');
    const modal = document.getElementById('exampleModal_elec_first'); // Modal ID 수정

    const elecCarImgNm = document.getElementById('elecFirstCompareImgNm');
    const elecCarNm = document.getElementById('elecFirstCarNm');
    const elecCarPrice = document.getElementById('elecFirstCarPrice');
    const elecCarEff = document.getElementById('elecFirstCarEff');
    const elecCarCo2 = document.getElementById('elecFirstCarCo2');
    const elecCarBrand = document.getElementById('elecFirstCarBrand');
    const elecCarCate = document.getElementById('elecFirstCarCate');
    const elecManufacturer = document.getElementById('elecFirstManufacturer');
    const elecCategorization = document.getElementById('elecFirstCategorization');
    const elecFuelEfficiency = document.getElementById('elecFirstFuelEfficiency');
    const elecCarbonFootprint = document.getElementById('elecFirstCarbonFootprint');
    const elecBatTypeNm = document.getElementById('elecFirstBatTypeNm');
    const elecBatType = document.getElementById('elecFirstBatType');
    const elecbatVolNm = document.getElementById('elecFirstbatVolNm');
    const elecbatVol = document.getElementById('elecFirstbatVol');
    
    const elecSingle = document.getElementById('elecFirstSingle');
    const elecWarm = document.getElementById('elecFirstWarm');
    const elecCold = document.getElementById('elecFirstCold');
    

    // Bootstrap Modal 객체 생성
    const bootstrapModal = new bootstrap.Modal(modal);

    // Debounce 함수 정의
    function debounce(func, delay) {
        let timer;
        return function (...args) {
            clearTimeout(timer);
            timer = setTimeout(() => func.apply(this, args), delay);
        };
    }

    // 검색 입력 이벤트 핸들러
    const handleInput = debounce(async function (event) {
        const carname = event.target.value.trim();

        if (carname.length === 0) {
        	elecResultList.style.display = 'none';
            return;
        }

        try {
            const response = await fetch('/elecCompareList?carName=' + encodeURIComponent(carname));
            if (!response.ok) throw new Error('요청 실패');
            const carList = await response.json();

            elecResultList.innerHTML = '';
            elecResultList.style.display = 'block';

            carList.forEach(function (car) {
                const li = document.createElement('li');
                li.className = 'list-group-item list-group-item-action d-flex align-items-center';
                li.dataset.carName = car.carName; // carName을 데이터 속성으로 저장

                // 이미지 태그 생성
                const img = document.createElement('img');
                img.src = '/assets/img/elec_car_img/' + encodeURIComponent(car.imgUrl);
                img.alt = car.carName;
                img.className = 'me-2'; // 이미지와 텍스트 간격 조절
                img.style.width = '50px'; // 이미지 크기 조절
                img.style.height = '50px';
                img.style.objectFit = 'cover';

                // 텍스트 추가
                const text = document.createElement('span');
                text.textContent = car.carName;

                // 이미지와 텍스트를 리스트 아이템에 추가
                li.appendChild(img);
                li.appendChild(text);

                // 리스트 항목 클릭 이벤트 추가
                li.addEventListener('click', async function () {
                    const carName = car.carName; // 클릭된 항목의 carName 가져오기

                    try {
                        const response = await fetch('/carCompare/elecCar', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json',
                            },
                            body: JSON.stringify({ carName }), // JSON 형태로 서버에 carName 전달
                        });

                        if (!response.ok) throw new Error('요청 실패');

                        const carData = await response.json(); // 서버에서 반환된 JSON 데이터 파싱

                        // 가져온 데이터를 HTML에 표시
                        elecCarImgNm.querySelector('img').src = '/assets/img/elec_car_img/' + carData.imgUrl;
                        elecCarNm.textContent = carData.carName;
                        elecCarPrice.textContent = '~' + carData.carPrice.toLocaleString() + '원';
                        elecCarEff.textContent = Math.round(parseFloat(carData.carEff) * 100) / 100 + 'km/L';
                        elecCarCo2.textContent = (Math.round(parseFloat(carData.carCo2) * 100) / 100) * 10 + 'g/km';
                        elecCarBrand.textContent = carData.carBrand;
                        elecCarCate.textContent = carData.carCateDetail;
                        elecManufacturer.textContent = '제조사';
                        elecCategorization.textContent = '차량분류';
                        elecFuelEfficiency.textContent = '연빈';
                        elecCarbonFootprint.textContent = '탄소배출량';
                        elecBatTypeNm.textContent = '배터리타입';
                        elecBatType.textContent = carData.batType;
                        elecbatVolNm.textContent = '배터리용량';
                        elecbatVol.textContent = carData.batVol;
                        elecSingle.textContent = '1회 완충 주행거리';
                        elecWarm.innerHTML = 
                        	
                        	'<svg xmlns="http://www.w3.org/2000/svg" fill="#DC143C" viewBox="0 0 24 24" stroke-width="1.5" stroke="#DC143C" class="size-6" style="width:18px; height:18px">' + 
                        		'<path stroke-linecap="round" stroke-linejoin="round" d="M12 3v2.25m6.364.386-1.591 1.591M21 12h-2.25m-.386 6.364-1.591-1.591M12 18.75V21m-4.773-4.227-1.591 1.591M5.25 12H3m4.227-4.773L5.636 5.636M15.75 12a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0Z" />' + 
                    		'</svg>' + 
                        	'<div>' + Math.round(parseFloat(carData.singleWarm) * 100) / 100 + 'km' + 
                        	'</div>';
                        	
                        elecCold.innerHTML = 
                        	'<svg xmlns="http://www.w3.org/2000/svg" fill="#ADD8E6" viewBox="0 0 24 24" stroke-width="1.5" stroke="#ADD8E6" class="size-6" style="width:18px; height:18px">' + 
	                        	'<path stroke-linecap="round" stroke-linejoin="round" d="M10.343 3.94c.09-.542.56-.94 1.11-.94h1.093c.55 0 1.02.398 1.11.94l.149.894c.07.424.384.764.78.93.398.164.855.142 1.205-.108l.737-.527a1.125 1.125 0 0 1 1.45.12l.773.774c.39.389.44 1.002.12 1.45l-.527.737c-.25.35-.272.806-.107 1.204.165.397.505.71.93.78l.893.15c.543.09.94.559.94 1.109v1.094c0 .55-.397 1.02-.94 1.11l-.894.149c-.424.07-.764.383-.929.78-.165.398-.143.854.107 1.204l.527.738c.32.447.269 1.06-.12 1.45l-.774.773a1.125 1.125 0 0 1-1.449.12l-.738-.527c-.35-.25-.806-.272-1.203-.107-.398.165-.71.505-.781.929l-.149.894c-.09.542-.56.94-1.11.94h-1.094c-.55 0-1.019-.398-1.11-.94l-.148-.894c-.071-.424-.384-.764-.781-.93-.398-.164-.854-.142-1.204.108l-.738.527c-.447.32-1.06.269-1.45-.12l-.773-.774a1.125 1.125 0 0 1-.12-1.45l.527-.737c.25-.35.272-.806.108-1.204-.165-.397-.506-.71-.93-.78l-.894-.15c-.542-.09-.94-.56-.94-1.109v-1.094c0-.55.398-1.02.94-1.11l.894-.149c.424-.07.765-.383.93-.78.165-.398.143-.854-.108-1.204l-.526-.738a1.125 1.125 0 0 1 .12-1.45l.773-.773a1.125 1.125 0 0 1 1.45-.12l.737.527c.35.25.807.272 1.204.107.397-.165.71-.505.78-.929l.15-.894Z" />' + 
	                        	'<path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />' +
		                    '</svg>' +
                      		'<div>' + Math.round(parseFloat(carData.singleCold) * 100) / 100 + 'km' + 
                        	'</div>';
                        	
                        totalProgressPrice(Math.round(parseFloat(carData.carEff) * 100) / 100, (Math.round(parseFloat(carData.carCo2) * 100) / 100) * 10, null, null);

                        // 검색 결과 리스트 숨김
                        elecResultList.style.display = 'none';

                        // 모달 닫기
                        bootstrapModal.hide();
                    } catch (error) {
                        console.error('에러 발생:', error);
                    }
                });

                elecResultList.appendChild(li);
            });
        } catch (error) {
            console.error('에러 발생:', error);
            elecResultList.style.display = 'none';
        }
    }, 300); // 300ms 지연

    // 검색 입력 이벤트 연결
    elecSearchInput.addEventListener('input', handleInput);

    // 검색창 외부 클릭 시 리스트 숨김
    elecSearchInput.addEventListener('blur', function () {
        setTimeout(function () {
        	elecResultList.style.display = 'none';
        }, 200);
    });

    // 검색창에서 다시 포커스를 얻으면 리스트 표시
    elecSearchInput.addEventListener('focus', function () {
        if (elecResultList.children.length > 0) {
        	elecResultList.style.display = 'block';
        }
    });

    // 모달 초기화 이벤트
    modal.addEventListener('hidden.bs.modal', function () {

        // 검색창 및 결과 초기화
        elecSearchInput.value = '';
        elecResultList.innerHTML = '';
        elecResultList.style.display = 'none';

        console.log('모달이 닫히고 모든 데이터가 초기화되었습니다.');
    });
});

document.addEventListener('DOMContentLoaded', () => {
    const elecSearchInput = document.getElementById('elecSecondSearchInput');
    const elecResultList = document.getElementById('elecSecondResultList');
    const modal = document.getElementById('exampleModal_elec_second'); // Modal ID 수정

    const elecCarImgNm = document.getElementById('elecSecondCompareImgNm');
    const elecCarNm = document.getElementById('elecSecondCarNm');
    const elecCarPrice = document.getElementById('elecSecondCarPrice');
    const elecCarEff = document.getElementById('elecSecondCarEff');
    const elecCarCo2 = document.getElementById('elecSecondCarCo2');
    const elecCarBrand = document.getElementById('elecSecondCarBrand');
    const elecCarCate = document.getElementById('elecSecondCarCate');
    const elecManufacturer = document.getElementById('elecSecondManufacturer');
    const elecCategorization = document.getElementById('elecSecondCategorization');
    const elecFuelEfficiency = document.getElementById('elecSecondFuelEfficiency');
    const elecCarbonFootprint = document.getElementById('elecSecondCarbonFootprint');
    const elecBatTypeNm = document.getElementById('elecSecondBatTypeNm');
    const elecBatType = document.getElementById('elecSecondBatType');
    const elecbatVolNm = document.getElementById('elecSecondbatVolNm');
    const elecbatVol = document.getElementById('elecSecondbatVol');
    const elecSingle = document.getElementById('elecSecondSingle');
    const elecWarm = document.getElementById('elecSecondWarm');
    const elecCold = document.getElementById('elecSecondCold');

    

    // Bootstrap Modal 객체 생성
    const bootstrapModal = new bootstrap.Modal(modal);

    // Debounce 함수 정의
    function debounce(func, delay) {
        let timer;
        return function (...args) {
            clearTimeout(timer);
            timer = setTimeout(() => func.apply(this, args), delay);
        };
    }

    // 검색 입력 이벤트 핸들러
    const handleInput = debounce(async function (event) {
        const carname = event.target.value.trim();

        if (carname.length === 0) {
        	elecResultList.style.display = 'none';
            return;
        }

        try {
            const response = await fetch('/elecCompareList?carName=' + encodeURIComponent(carname));
            if (!response.ok) throw new Error('요청 실패');
            const carList = await response.json();

            elecResultList.innerHTML = '';
            elecResultList.style.display = 'block';

            carList.forEach(function (car) {
                const li = document.createElement('li');
                li.className = 'list-group-item list-group-item-action d-flex align-items-center';
                li.dataset.carName = car.carName; // carName을 데이터 속성으로 저장

                // 이미지 태그 생성
                const img = document.createElement('img');
                img.src = '/assets/img/elec_car_img/' + encodeURIComponent(car.imgUrl);
                img.alt = car.carName;
                img.className = 'me-2'; // 이미지와 텍스트 간격 조절
                img.style.width = '50px'; // 이미지 크기 조절
                img.style.height = '50px';
                img.style.objectFit = 'cover';

                // 텍스트 추가
                const text = document.createElement('span');
                text.textContent = car.carName;

                // 이미지와 텍스트를 리스트 아이템에 추가
                li.appendChild(img);
                li.appendChild(text);

                // 리스트 항목 클릭 이벤트 추가
                li.addEventListener('click', async function () {
                    const carName = car.carName; // 클릭된 항목의 carName 가져오기

                    try {
                        const response = await fetch('/carCompare/elecCar', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json',
                            },
                            body: JSON.stringify({ carName }), // JSON 형태로 서버에 carName 전달
                        });

                        if (!response.ok) throw new Error('요청 실패');

                        const carData = await response.json(); // 서버에서 반환된 JSON 데이터 파싱

                        // 가져온 데이터를 HTML에 표시
                        elecCarImgNm.querySelector('img').src = '/assets/img/elec_car_img/' + carData.imgUrl;
                        elecCarNm.textContent = carData.carName;
                        elecCarPrice.textContent = '~' + carData.carPrice.toLocaleString() + '원';
                        elecCarEff.textContent = Math.round(parseFloat(carData.carEff) * 100) / 100 + 'km/L';
                        elecCarCo2.textContent = (Math.round(parseFloat(carData.carCo2) * 100) / 100) * 10 + 'g/km';
                        elecCarBrand.textContent = carData.carBrand;
                        elecCarCate.textContent = carData.carCateDetail;
                        elecManufacturer.textContent = '제조사';
                        elecCategorization.textContent = '차량분류';
                        elecFuelEfficiency.textContent = '연빈';
                        elecCarbonFootprint.textContent = '탄소배출량';
                        elecBatTypeNm.textContent = '배터리타입';
                        elecBatType.textContent = carData.batType;
                        elecbatVolNm.textContent = '배터리용량';
                        elecbatVol.textContent = carData.batVol;
                        elecSingle.textContent = '1회 완충 주행거리';
						elecWarm.innerHTML = 
                        	'<svg xmlns="http://www.w3.org/2000/svg" fill="#DC143C" viewBox="0 0 24 24" stroke-width="1.5" stroke="#DC143C" class="size-6" style="width:18px; height:18px">' + 
                        		'<path stroke-linecap="round" stroke-linejoin="round" d="M12 3v2.25m6.364.386-1.591 1.591M21 12h-2.25m-.386 6.364-1.591-1.591M12 18.75V21m-4.773-4.227-1.591 1.591M5.25 12H3m4.227-4.773L5.636 5.636M15.75 12a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0Z" />' + 
                    		'</svg>' + 
                        	'<div>' + Math.round(parseFloat(carData.singleWarm) * 100) / 100 + 'km' + 
                        	'</div>';
                        	
                        elecCold.innerHTML = 
                        	'<svg xmlns="http://www.w3.org/2000/svg" fill="#ADD8E6" viewBox="0 0 24 24" stroke-width="1.5" stroke="#ADD8E6" class="size-6" style="width:18px; height:18px">' + 
	                        	'<path stroke-linecap="round" stroke-linejoin="round" d="M10.343 3.94c.09-.542.56-.94 1.11-.94h1.093c.55 0 1.02.398 1.11.94l.149.894c.07.424.384.764.78.93.398.164.855.142 1.205-.108l.737-.527a1.125 1.125 0 0 1 1.45.12l.773.774c.39.389.44 1.002.12 1.45l-.527.737c-.25.35-.272.806-.107 1.204.165.397.505.71.93.78l.893.15c.543.09.94.559.94 1.109v1.094c0 .55-.397 1.02-.94 1.11l-.894.149c-.424.07-.764.383-.929.78-.165.398-.143.854.107 1.204l.527.738c.32.447.269 1.06-.12 1.45l-.774.773a1.125 1.125 0 0 1-1.449.12l-.738-.527c-.35-.25-.806-.272-1.203-.107-.398.165-.71.505-.781.929l-.149.894c-.09.542-.56.94-1.11.94h-1.094c-.55 0-1.019-.398-1.11-.94l-.148-.894c-.071-.424-.384-.764-.781-.93-.398-.164-.854-.142-1.204.108l-.738.527c-.447.32-1.06.269-1.45-.12l-.773-.774a1.125 1.125 0 0 1-.12-1.45l.527-.737c.25-.35.272-.806.108-1.204-.165-.397-.506-.71-.93-.78l-.894-.15c-.542-.09-.94-.56-.94-1.109v-1.094c0-.55.398-1.02.94-1.11l.894-.149c.424-.07.765-.383.93-.78.165-.398.143-.854-.108-1.204l-.526-.738a1.125 1.125 0 0 1 .12-1.45l.773-.773a1.125 1.125 0 0 1 1.45-.12l.737.527c.35.25.807.272 1.204.107.397-.165.71-.505.78-.929l.15-.894Z" />' + 
	                        	'<path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />' +
		                    '</svg>' +
	                  		'<div>' + Math.round(parseFloat(carData.singleCold) * 100) / 100 + 'km' + 
	                    	'</div>';
                        
                        totalProgressPrice(null, null, Math.round(parseFloat(carData.carEff) * 100) / 100, (Math.round(parseFloat(carData.carCo2) * 100) / 100) * 10);

                        // 검색 결과 리스트 숨김
                        elecResultList.style.display = 'none';

                        // 모달 닫기
                        bootstrapModal.hide();
                    } catch (error) {
                        console.error('에러 발생:', error);
                    }
                });

                elecResultList.appendChild(li);
            });
        } catch (error) {
            console.error('에러 발생:', error);
            elecResultList.style.display = 'none';
        }
    }, 300); // 300ms 지연

    // 검색 입력 이벤트 연결
    elecSearchInput.addEventListener('input', handleInput);

    // 검색창 외부 클릭 시 리스트 숨김
    elecSearchInput.addEventListener('blur', function () {
        setTimeout(function () {
        	elecResultList.style.display = 'none';
        }, 200);
    });

    // 검색창에서 다시 포커스를 얻으면 리스트 표시
    elecSearchInput.addEventListener('focus', function () {
        if (elecResultList.children.length > 0) {
        	elecResultList.style.display = 'block';
        }
    });

    // 모달 초기화 이벤트
    modal.addEventListener('hidden.bs.modal', function () {

        // 검색창 및 결과 초기화
        elecSearchInput.value = '';
        elecResultList.innerHTML = '';
        elecResultList.style.display = 'none';

        console.log('모달이 닫히고 모든 데이터가 초기화되었습니다.');
    });
});


//모달이 열릴 때 기본적으로 보유 전기차 데이터를 로드
document.addEventListener("DOMContentLoaded", () => {
    const saveEFirstCarButton = document.getElementById("saveEFirstCar");
    loadSaveEFirstCarData(); // 보유 전기차 데이터 로드
    saveEFirstCarButton.classList.add("active"); // 버튼 활성화
    
    document.getElementById("saveEFirstCar").addEventListener("click", () => {
        loadSaveEFirstCarData();
        toggleActiveButton("saveEFirstCar");
    });

    document.getElementById("likeEFirstCar").addEventListener("click", () => {
        loadLikeEFirstCarData();
        toggleActiveButton("likeEFirstCar");
    });

    // 버튼 활성화/비활성화 처리
    function toggleActiveButton(activeButtonId) {
        document.getElementById("saveEFirstCar").classList.remove("active");
        document.getElementById("likeEFirstCar").classList.remove("active");
        document.getElementById(activeButtonId).classList.add("active");
    }

    function loadSaveEFirstCarData() {
        fetch("/carCompare/saveECar", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
        })
        .then((response) => response.json())
        .then((data) => {
            renderCarCardsElec(data); // 데이터를 카드 형식으로 렌더링
        })
        .catch((error) => {
            console.error("Error fetching saveECar data:", error);
        });
    }

    function loadLikeEFirstCarData() {
        // 찜한 전기차 데이터 로드 로직
    	fetch("/carCompare/likeECar", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
        })
        .then((response) => response.json())
        .then((data) => {
        	renderCarCardsElec(data); // 데이터를 카드 형식으로 렌더링
        })
        .catch((error) => {
            console.error("Error fetching saveECar data:", error);
        });
    }

    function renderCarCardsElec(data) {
        const cardWrapper = document.querySelector(".card-wrapper-elec-first");
        cardWrapper.innerHTML = ""; // 기존 카드 초기화

        data.forEach(function(car) {
            const cardHTML =
                '<div class="card carbottom">' +
                    '<div class="card img">' +
                        '<img src="/assets/img/elec_car_img/' + car.imgUrl + '" class="card-img-top" alt="' + car.carName + '">' +
                    '</div>' +
                    '<div class="card-body">' +
                        '<p class="card-text">' + car.carName + '</p>' +
                    '</div>' +
                    '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6 like-icon" data-car-name="' + car.carName + '">' +
                        '<path stroke-linecap="round" stroke-linejoin="round" d="M12 9v6m3-3H9m12 0a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z" />' +
                    '</svg>' +
                '</div>';
                
            cardWrapper.innerHTML += cardHTML;
        });

        // SVG 클릭 이벤트 위임 추가
        cardWrapper.addEventListener("click", async function(event) {
            if (event.target.closest("svg.like-icon")) {
                const carName = event.target.closest("svg.like-icon").dataset.carName; // carName 데이터 속성 가져오기
                await fetchCarDetails(carName); // 클릭된 carName으로 서버 데이터 요청
            }
        });
    }
    
    async function fetchCarDetails(carName) {
        try {
            const response = await fetch('/carCompare/elecCar', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ carName }), // JSON 형태로 서버에 carName 전달
            });

            if (!response.ok) throw new Error('요청 실패');

            const carData = await response.json(); // 서버에서 반환된 JSON 데이터 파싱

            // 가져온 데이터를 HTML에 표시
            document.getElementById('elecFirstCompareImgNm').querySelector('img').src = '/assets/img/elec_car_img/' + carData.imgUrl;
            document.getElementById('elecFirstCarNm').textContent = carData.carName;
            document.getElementById('elecFirstCarPrice').textContent = '~' + carData.carPrice.toLocaleString() + '원';
            document.getElementById('elecFirstCarEff').textContent = Math.round(parseFloat(carData.carEff) * 100) / 100 + 'km/L';
            document.getElementById('elecFirstCarCo2').textContent = (Math.round(parseFloat(carData.carCo2) * 100) / 100) * 10 + 'g/km';
            document.getElementById('elecFirstCarBrand').textContent = carData.carBrand;
            document.getElementById('elecFirstCarCate').textContent = carData.carCateDetail;
            document.getElementById('elecFirstManufacturer').textContent = '제조사';
            document.getElementById('elecFirstCategorization').textContent = '차량분류';
            document.getElementById('elecFirstFuelEfficiency').textContent = '연비';
            document.getElementById('elecFirstCarbonFootprint').textContent = '탄소배출량';
            document.getElementById('elecFirstBatTypeNm').textContent = '배터리타입';
            document.getElementById('elecFirstBatType').textContent = carData.batType;
            document.getElementById('elecFirstbatVolNm').textContent = '배터리용량';
            document.getElementById('elecFirstbatVol').textContent = carData.batVol;
            
            document.getElementById('elecFirstSingle').textContent = '1회 완충 주행거리';
            document.getElementById('elecFirstWarm').innerHTML = 
            	'<svg xmlns="http://www.w3.org/2000/svg" fill="#DC143C" viewBox="0 0 24 24" stroke-width="1.5" stroke="#DC143C" class="size-6" style="width:18px; height:18px">' + 
            		'<path stroke-linecap="round" stroke-linejoin="round" d="M12 3v2.25m6.364.386-1.591 1.591M21 12h-2.25m-.386 6.364-1.591-1.591M12 18.75V21m-4.773-4.227-1.591 1.591M5.25 12H3m4.227-4.773L5.636 5.636M15.75 12a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0Z" />' + 
        		'</svg>' + 
            	'<div>' + Math.round(parseFloat(carData.singleWarm) * 100) / 100 + 'km' + 
            	'</div>';
            
           	document.getElementById('elecFirstCold').innerHTML = 
           		'<svg xmlns="http://www.w3.org/2000/svg" fill="#ADD8E6" viewBox="0 0 24 24" stroke-width="1.5" stroke="#ADD8E6" class="size-6" style="width:18px; height:18px">' + 
	            	'<path stroke-linecap="round" stroke-linejoin="round" d="M10.343 3.94c.09-.542.56-.94 1.11-.94h1.093c.55 0 1.02.398 1.11.94l.149.894c.07.424.384.764.78.93.398.164.855.142 1.205-.108l.737-.527a1.125 1.125 0 0 1 1.45.12l.773.774c.39.389.44 1.002.12 1.45l-.527.737c-.25.35-.272.806-.107 1.204.165.397.505.71.93.78l.893.15c.543.09.94.559.94 1.109v1.094c0 .55-.397 1.02-.94 1.11l-.894.149c-.424.07-.764.383-.929.78-.165.398-.143.854.107 1.204l.527.738c.32.447.269 1.06-.12 1.45l-.774.773a1.125 1.125 0 0 1-1.449.12l-.738-.527c-.35-.25-.806-.272-1.203-.107-.398.165-.71.505-.781.929l-.149.894c-.09.542-.56.94-1.11.94h-1.094c-.55 0-1.019-.398-1.11-.94l-.148-.894c-.071-.424-.384-.764-.781-.93-.398-.164-.854-.142-1.204.108l-.738.527c-.447.32-1.06.269-1.45-.12l-.773-.774a1.125 1.125 0 0 1-.12-1.45l.527-.737c.25-.35.272-.806.108-1.204-.165-.397-.506-.71-.93-.78l-.894-.15c-.542-.09-.94-.56-.94-1.109v-1.094c0-.55.398-1.02.94-1.11l.894-.149c.424-.07.765-.383.93-.78.165-.398.143-.854-.108-1.204l-.526-.738a1.125 1.125 0 0 1 .12-1.45l.773-.773a1.125 1.125 0 0 1 1.45-.12l.737.527c.35.25.807.272 1.204.107.397-.165.71-.505.78-.929l.15-.894Z" />' + 
	            	'<path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />' +
	            '</svg>' +
	      		'<div>' + Math.round(parseFloat(carData.singleCold) * 100) / 100 + 'km' + 
	        	'</div>';
            
            totalProgressPrice(Math.round(parseFloat(carData.carEff) * 100) / 100, (Math.round(parseFloat(carData.carCo2) * 100) / 100) * 10, null, null);
            
            console.log('차량 데이터 업데이트 완료:', carData);

            // Bootstrap 모달 닫기
            const modal = document.getElementById('exampleModal_elec_first'); // 모달 ID
            const bootstrapModal = bootstrap.Modal.getInstance(modal); // Bootstrap 모달 인스턴스 가져오기
            bootstrapModal.hide(); // 모달 닫기
        } catch (error) {
            console.error('에러 발생:', error);
        }
    }
    
});

//모달이 열릴 때 기본적으로 보유 전기차 데이터를 로드
document.addEventListener("DOMContentLoaded", () => {
    const saveESecondCarButton = document.getElementById("saveESecondCar");
    loadSaveESecondCarData(); // 보유 전기차 데이터 로드
    saveESecondCarButton.classList.add("active"); // 버튼 활성화
    
    document.getElementById("saveESecondCar").addEventListener("click", () => {
        loadSaveESecondCarData();
        toggleActiveButton("saveESecondCar");
    });

    document.getElementById("likeESecondCar").addEventListener("click", () => {
        loadLikeESecondCarData();
        toggleActiveButton("likeESecondCar");
    });

    // 버튼 활성화/비활성화 처리
    function toggleActiveButton(activeButtonId) {
        document.getElementById("saveESecondCar").classList.remove("active");
        document.getElementById("likeESecondCar").classList.remove("active");
        document.getElementById(activeButtonId).classList.add("active");
    }

    function loadSaveESecondCarData() {
        fetch("/carCompare/saveECar", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
        })
        .then((response) => response.json())
        .then((data) => {
            renderCarCardsElec(data); // 데이터를 카드 형식으로 렌더링
        })
        .catch((error) => {
            console.error("Error fetching saveECar data:", error);
        });
    }

    function loadLikeESecondCarData() {
        // 찜한 전기차 데이터 로드 로직
    	fetch("/carCompare/likeECar", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
        })
        .then((response) => response.json())
        .then((data) => {
        	renderCarCardsElec(data); // 데이터를 카드 형식으로 렌더링
        })
        .catch((error) => {
            console.error("Error fetching saveECar data:", error);
        });
    }

    function renderCarCardsElec(data) {
        const cardWrapper = document.querySelector(".card-wrapper-elec-second");
        cardWrapper.innerHTML = ""; // 기존 카드 초기화

        data.forEach(function(car) {
            const cardHTML =
                '<div class="card carbottom">' +
                    '<div class="card img">' +
                        '<img src="/assets/img/elec_car_img/' + car.imgUrl + '" class="card-img-top" alt="' + car.carName + '">' +
                    '</div>' +
                    '<div class="card-body">' +
                        '<p class="card-text">' + car.carName + '</p>' +
                    '</div>' +
                    '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6 like-icon" data-car-name="' + car.carName + '">' +
                        '<path stroke-linecap="round" stroke-linejoin="round" d="M12 9v6m3-3H9m12 0a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z" />' +
                    '</svg>' +
                '</div>';
                
            cardWrapper.innerHTML += cardHTML;
        });

        // SVG 클릭 이벤트 위임 추가
        cardWrapper.addEventListener("click", async function(event) {
            if (event.target.closest("svg.like-icon")) {
                const carName = event.target.closest("svg.like-icon").dataset.carName; // carName 데이터 속성 가져오기
                await fetchCarDetails(carName); // 클릭된 carName으로 서버 데이터 요청
            }
        });
    }
    
    async function fetchCarDetails(carName) {
        try {
            const response = await fetch('/carCompare/elecCar', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ carName }), // JSON 형태로 서버에 carName 전달
            });

            if (!response.ok) throw new Error('요청 실패');

            const carData = await response.json(); // 서버에서 반환된 JSON 데이터 파싱

            // 가져온 데이터를 HTML에 표시
            document.getElementById('elecSecondCompareImgNm').querySelector('img').src = '/assets/img/elec_car_img/' + carData.imgUrl;
            document.getElementById('elecSecondCarNm').textContent = carData.carName;
            document.getElementById('elecSecondCarPrice').textContent = '~' + carData.carPrice.toLocaleString() + '원';
            document.getElementById('elecSecondCarEff').textContent = Math.round(parseFloat(carData.carEff) * 100) / 100 + 'km/L';
            document.getElementById('elecSecondCarCo2').textContent = (Math.round(parseFloat(carData.carCo2) * 100) / 100) * 10 + 'g/km';
            document.getElementById('elecSecondCarBrand').textContent = carData.carBrand;
            document.getElementById('elecSecondCarCate').textContent = carData.carCateDetail;
            document.getElementById('elecSecondManufacturer').textContent = '제조사';
            document.getElementById('elecSecondCategorization').textContent = '차량분류';
            document.getElementById('elecSecondFuelEfficiency').textContent = '연비';
            document.getElementById('elecSecondCarbonFootprint').textContent = '탄소배출량';
            document.getElementById('elecSecondBatTypeNm').textContent = '배터리타입';
            document.getElementById('elecSecondBatType').textContent = carData.batType;
            document.getElementById('elecSecondbatVolNm').textContent = '배터리용량';
            document.getElementById('elecSecondbatVol').textContent = carData.batVol;
            document.getElementById('elecSecondSingle').textContent = '1회 완충 주행거리';
            document.getElementById('elecSecondWarm').innerHTML = 
            	'<svg xmlns="http://www.w3.org/2000/svg" fill="#DC143C" viewBox="0 0 24 24" stroke-width="1.5" stroke="#DC143C" class="size-6" style="width:18px; height:18px">' + 
            		'<path stroke-linecap="round" stroke-linejoin="round" d="M12 3v2.25m6.364.386-1.591 1.591M21 12h-2.25m-.386 6.364-1.591-1.591M12 18.75V21m-4.773-4.227-1.591 1.591M5.25 12H3m4.227-4.773L5.636 5.636M15.75 12a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0Z" />' + 
        		'</svg>' + 
            	'<div>' + Math.round(parseFloat(carData.singleWarm) * 100) / 100 + 'km' + 
            	'</div>';
           	document.getElementById('elecSecondCold').innerHTML = 
           		'<svg xmlns="http://www.w3.org/2000/svg" fill="#ADD8E6" viewBox="0 0 24 24" stroke-width="1.5" stroke="#ADD8E6" class="size-6" style="width:18px; height:18px">' + 
	            	'<path stroke-linecap="round" stroke-linejoin="round" d="M10.343 3.94c.09-.542.56-.94 1.11-.94h1.093c.55 0 1.02.398 1.11.94l.149.894c.07.424.384.764.78.93.398.164.855.142 1.205-.108l.737-.527a1.125 1.125 0 0 1 1.45.12l.773.774c.39.389.44 1.002.12 1.45l-.527.737c-.25.35-.272.806-.107 1.204.165.397.505.71.93.78l.893.15c.543.09.94.559.94 1.109v1.094c0 .55-.397 1.02-.94 1.11l-.894.149c-.424.07-.764.383-.929.78-.165.398-.143.854.107 1.204l.527.738c.32.447.269 1.06-.12 1.45l-.774.773a1.125 1.125 0 0 1-1.449.12l-.738-.527c-.35-.25-.806-.272-1.203-.107-.398.165-.71.505-.781.929l-.149.894c-.09.542-.56.94-1.11.94h-1.094c-.55 0-1.019-.398-1.11-.94l-.148-.894c-.071-.424-.384-.764-.781-.93-.398-.164-.854-.142-1.204.108l-.738.527c-.447.32-1.06.269-1.45-.12l-.773-.774a1.125 1.125 0 0 1-.12-1.45l.527-.737c.25-.35.272-.806.108-1.204-.165-.397-.506-.71-.93-.78l-.894-.15c-.542-.09-.94-.56-.94-1.109v-1.094c0-.55.398-1.02.94-1.11l.894-.149c.424-.07.765-.383.93-.78.165-.398.143-.854-.108-1.204l-.526-.738a1.125 1.125 0 0 1 .12-1.45l.773-.773a1.125 1.125 0 0 1 1.45-.12l.737.527c.35.25.807.272 1.204.107.397-.165.71-.505.78-.929l.15-.894Z" />' + 
	            	'<path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />' +
	            '</svg>' +
	      		'<div>' + Math.round(parseFloat(carData.singleCold) * 100) / 100 + 'km' + 
	        	'</div>';
            
            totalProgressPrice(null, null, Math.round(parseFloat(carData.carEff) * 100) / 100, (Math.round(parseFloat(carData.carCo2) * 100) / 100) * 10);
            
            console.log('차량 데이터 업데이트 완료:', carData);

            // Bootstrap 모달 닫기
            const modal = document.getElementById('exampleModal_elec_second'); // 모달 ID
            const bootstrapModal = bootstrap.Modal.getInstance(modal); // Bootstrap 모달 인스턴스 가져오기
            bootstrapModal.hide(); // 모달 닫기
        } catch (error) {
            console.error('에러 발생:', error);
        }
    }
    
});

const carComparisonState = {
	    elecEff: null,
	    elecCo2: null,
	    gasEff: null,
	    gasCo2: null,
	};

function totalProgressPrice(elecEff, elecCo2, gasEff, gasCo2) {
    // 전기차 데이터가 null이 아닐 때만 업데이트
    if (elecEff !== null) carComparisonState.elecEff = elecEff;
    if (elecCo2 !== null) carComparisonState.elecCo2 = elecCo2;

    // 가스차 데이터가 null이 아닐 때만 업데이트
    if (gasEff !== null) carComparisonState.gasEff = gasEff;
    if (gasCo2 !== null) carComparisonState.gasCo2 = gasCo2;

    console.log("Updated State:", carComparisonState);

    // 두 데이터 중 하나라도 존재하면 비교 계산 실행
    calculateComparison();
}

function calculateComparison() {
    const { elecEff, elecCo2, gasEff, gasCo2 } = carComparisonState;

    // 기본값 설정 (값이 없으면 0 사용)
    const effectiveElecEff = elecEff || 0;
    const effectiveElecCo2 = elecCo2 || 0;
    const effectiveGasEff = gasEff || 0;
    const effectiveGasCo2 = gasCo2 || 0;

    // 충전 / 주유비 하드코딩
    const oilprice = 650;
    const chargeprice = 650;
    const mileage = 100;
    
    // 주유비 금액
    if (effectiveGasEff == 0 && effectiveElecEff > 0) {
	    var gasOilPrice = effectiveGasEff;
	    var elecChargePrice = Math.round(parseFloat((mileage / effectiveElecEff) * chargeprice));
	    var totalprice = gasOilPrice + elecChargePrice;
	} else if (effectiveGasEff > 0 && effectiveElecEff == 0){
		var gasOilPrice = Math.round(parseFloat((mileage / effectiveGasEff) * oilprice));
	    var elecChargePrice = effectiveElecEff;
	    var totalprice = gasOilPrice + elecChargePrice;
	} else if (effectiveGasEff == 0 && effectiveElecEff == 0){
		var gasOilPrice = effectiveGasEff;
	    var elecChargePrice = effectiveElecEff;
	    var totalprice = gasOilPrice + elecChargePrice;
	} else {
		var gasOilPrice = Math.round(parseFloat((mileage / effectiveGasEff) * oilprice));
	    var elecChargePrice = Math.round(parseFloat((mileage / effectiveElecEff) * chargeprice));
	    var totalprice = gasOilPrice + elecChargePrice;
	}
    
    var totaleffectiveElecCo2 = Math.round(parseFloat(effectiveElecCo2 * 100));
    var totaleffectiveGasCo2 = Math.round(parseFloat(effectiveGasCo2 * 100));
    var totalCo2 = totaleffectiveElecCo2 + totaleffectiveGasCo2;
    
    var totalcount3 = document.getElementById('total-price');	
    totalcount3.innerHTML = 
    '<div class="row" style="color:#372504">' +
    '<div class="col">' + '<p> ' + elecChargePrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + '원 </p>' + '</div>' +
    '<div class="col minus-font">' + '<span class=" minus-font before"> (+) </span> <span>' + (Math.round(Math.abs(gasOilPrice-elecChargePrice) * 100) / 100).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + '</span> <span class="minus-font after"> (-) </span> '+ '</div>' +
    '<div class="col">' + '<p> ' + gasOilPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + '원</p>' + '</div>' +
 	'</div>';
 	
 	var totalcount2 = document.getElementById('total-co2');
    totalcount2.innerHTML = 
    '<div class="row" style="color:#372504">' + 
    '<div class="col">' + '<p>' + totaleffectiveElecCo2 + 'g/km </p>' + '</div>' +
    '<div class="col minus-font">' + '<span class=" minus-font before"> (+) </span> <span>' + Math.round(Math.abs(totaleffectiveElecCo2-totaleffectiveGasCo2) * 100) / 100 + '</span> <span class="minus-font after"> (-) </span>' + '</div>' +
    '<div class="col">' + '<p>' + totaleffectiveGasCo2 + 'g/km</p>' + '</div>' +
    '</div>';
    
    // 전기차 데이터만 있을 경우에도 프로그래스 바 생성
    if (elecEff !== null || gasEff !== null) {
        createProgressBar(
        	containerId = "progress-chart-charge",
        	LMax = totalprice, // 최대값 계산
        	RMax = totalprice,
        	leftValue = elecChargePrice,
        	rightValue = gasOilPrice,
        	text = "충전비"
        );
    }

    if (elecCo2 !== null || gasCo2 !== null) {
        createProgressBar(
        	containerId = "progress-chart-co2",
        	LMax = totalCo2, // 최대값 계산
        	RMax = totalCo2,
        	leftValue = totaleffectiveElecCo2,
        	rightValue = totaleffectiveGasCo2,
        	text = "탄소배출량"
        );
    }
}

function createProgressBar(containerId, LMax, RMax, leftValue, rightValue, text) {
	
	var progressMain = document.getElementById(containerId);
	
	progressMain.innerHTML = '<div class="d-flex justify-content-center">' +
	                          '<h5 class="headfont center">'+ text +'</h5>' +
	                          '</div>' +
	                          '<div class="row">' +
	                          '<div class="col">' +
	                          '<div class="progress-container justify-content-end" id="left-container'+containerId+'">' +
	                          '</div>' +
	                          '</div>' +
	                          '<div class="col">' +
	                          '<div class="progress-container justify-content-start" id="right-container'+containerId+'">' +
	                          '</div>' +
	                          '</div>' +
	                          '</div>';
	
	var leftContainer = document.getElementById("left-container" + containerId);
	var rightContainer = document.getElementById("right-container" + containerId);
	
	// 좌측, 우측 프로그래스 바 추가
	leftContainer.innerHTML += '<div class="progress-bar left-progress" id="left-progress' + containerId + '" data-value="' + leftValue + '"></div><div class="tips" id="tips-left' + containerId + '"></div>';
	rightContainer.innerHTML += '<div class="progress-bar right-progress" id="right-progress' + containerId + '" data-value="' + rightValue + '"></div><div class="tips" id="tips-right' + containerId + '"></div>';
	
	// 새로 추가된 요소 가져오기
	var leftProgressBar = document.getElementById("left-progress" + containerId);
	var rightProgressBar = document.getElementById("right-progress" + containerId);
	
	// 프로그래스 바의 너비 설정
	leftProgressBar.style.width = (leftValue / LMax) * 100 + "%";
	rightProgressBar.style.width = (rightValue / RMax) * 100 + "%";
	
	var tipsLeft = document.getElementById("tips-left" + containerId);
	var tipsRight = document.getElementById("tips-right" + containerId);
	
	// 툴팁 표시 함수
	function showTooltip(event, tips, value, isReversed = false) {
	  var containerRect = event.target.parentElement.getBoundingClientRect();
	  tips.style.display = "block";
	  tips.textContent = value;
	
	  // 위치 계산
	  var tooltipX = isReversed
	    ? containerRect.right - event.clientX // 오른쪽부터 채워지는 경우
	    : event.clientX - containerRect.left;
	
	  tips.style.left = tooltipX + "px";
	  tips.style.top = "-40px";
	}
	
	// 툴팁 숨기기 함수
	function hideTooltip(tips) {
	  tips.style.display = "none";
	}
	
	// 좌측 프로그래스 바 이벤트
	leftProgressBar.addEventListener("mousemove", function (event) {
	  showTooltip(event, tipsLeft, leftProgressBar.getAttribute("data-value"));
	});
	
	leftProgressBar.addEventListener("mouseleave", function () {
	  hideTooltip(tipsLeft);
	});
	
	// 우측 프로그래스 바 이벤트
	rightProgressBar.addEventListener("mousemove", function (event) {
	  showTooltip(event, tipsRight, rightProgressBar.getAttribute("data-value"));
	});
	
	rightProgressBar.addEventListener("mouseleave", function () {
	  hideTooltip(tipsRight);
	});
}


</script>

<body>
	<div class="cont overflow-y-auto">

		<!-- 헤더 영역 -->
		<jsp:include page="/WEB-INF/inc/headerNo.jsp"></jsp:include>
		<!-- 헤더 영역 -->

        <div class="maincss px-2">
            <div class="maincss p-2">
    
              <div class="responsive-subtext p-2 gap-3 d-flex">전기차 - 전기차 비교
              	<button class="btn-othCompare" onclick="location.href='/carCompare'">전기차 - 내연기관차</button>              
              </div>

              <div class="table-wrapper">
                <!-- 비교 -->
                <hr class="m-0 p-0">
                <div class="hstack col">
                  <div class="row-6 text-center" style="width: 50%;">전기차</div>
                  <div class="vr" style="height: 30px;"></div>
                  <div class="row-6 text-center" style="width: 50%;">전기차</div>
                </div>
                <hr class="m-0 p-0">

                <div class="hstack col">
				    <div class="row-6 text-center d-flex justify-content-center align-items-center" style="width: 50%; height: 10vh;">
				        <div class="border rounded align-content-center" id="elecFirstCompareImgNm" style="width: 90%; height: 8vh; cursor: pointer;">
				            <img id="elecCompareImg" src="/assets/img/modelselect.png" alt="사진 선택" data-bs-toggle="modal" data-bs-target="#exampleModal_elec_first">
				        </div>
				    </div>
				    <div class="vr" style="height: 10vh;"></div>
				    <div class="row-6 text-center d-flex justify-content-center align-items-center" style="width: 50%; height: 10vh;">
				        <div class="border rounded align-content-center" id="elecSecondCompareImgNm" style="width: 90%; height: 8vh; cursor: pointer;">
				            <img id="gasCompareImg" src="/assets/img/modelselect.png" alt="사진 선택" data-bs-toggle="modal" data-bs-target="#exampleModal_elec_second">
				        </div>
				    </div>
				</div>
				
                <div class="hstack col">
                  <div class="row-6 text-center d-flex justify-content-start align-items-end px-4" id="elecFirstCarNm" style="width: 50%; height: 4vh; font-size: 24px; color: #A52A2A; font-weight: 700;">
                    	
                  </div>
                  <div class="vr" style="height: 4vh;"></div>
                  <div class="row-6 text-center d-flex justify-content-start align-items-end px-4" id="elecSecondCarNm" style="width: 50%; height: 4vh; font-size: 24px; color: #A52A2A; font-weight: 700;">
                    	
                  </div>
                </div>
                <div class="hstack col">
                  <div class="row-6 text-center d-flex justify-content-start align-items-start px-4" id="elecFirstCarPrice" style="width: 50%; height: 4vh; font-size: 20px; color: #F4A460; font-weight: 600;">
                    	
                  </div>
                  <div class="vr" style="height: 4vh;"></div>
                  <div class="row-6 text-center d-flex justify-content-start align-items-start px-4" id="elecSecondCarPrice" style="width: 50%; height: 4vh; font-size: 20px; color: #F4A460; font-weight: 600;">
                    	
                  </div>
                </div>
                <div class="hstack col">
                  <div class="row-6 text-center d-flex justify-content-start align-items-end px-4" id="elecFirstManufacturer" style="width: 50%; height: 4vh; font-size: 16px; color: #A52A2A; font-weight: 600;">
                    	
                  </div>
                  <div class="vr" style="height: 4vh;"></div>
                  <div class="row-6 text-center d-flex justify-content-start align-items-end px-4" id="elecSecondManufacturer" style="width: 50%; height: 4vh; font-size: 16px; color: #A52A2A; font-weight: 600;">
                    	
                  </div>
                </div>
                <div class="hstack col">
                  <div class="row-6 text-center d-flex justify-content-start align-items-start px-4" id="elecFirstCarBrand" style="width: 50%; height: 4vh; font-size: 20px; font-weight: 600;">
                    	
                  </div>
                  <div class="vr" style="height: 4vh;"></div>
                  <div class="row-6 text-center d-flex justify-content-start align-items-start px-4" id="elecSecondCarBrand" style="width: 50%; height: 4vh; font-size: 20px; font-weight: 600;">
                    	
                  </div>
                </div>
                <div class="hstack col">
                  <div class="row-6 text-center d-flex justify-content-start align-items-end px-4" id="elecFirstCategorization" style="width: 50%; height: 4vh; font-size: 16px; color: #A52A2A; font-weight: 600;">
                    	
                  </div>
                  <div class="vr" style="height: 4vh;"></div>
                  <div class="row-6 text-center d-flex justify-content-start align-items-end px-4" id="elecSecondCategorization" style="width: 50%; height: 4vh; font-size: 16px; color: #A52A2A; font-weight: 600;">
                    	
                  </div>
                </div>
                <div class="hstack col">
                  <div class="row-6 text-center d-flex justify-content-start align-items-start px-4" id="elecFirstCarCate" style="width: 50%; height: 4vh; font-size: 20px; font-weight: 600;">
                    	
                  </div>
                  <div class="vr" style="height: 4vh;"></div>
                  <div class="row-6 text-center d-flex justify-content-start align-items-start px-4" id="elecSecondCarCate" style="width: 50%; height: 4vh; font-size: 20px; font-weight: 600;">
                    	
                  </div>
                </div>
                <div class="hstack col">
                  <div class="row-6 text-center d-flex justify-content-start align-items-end px-4" id="elecFirstFuelEfficiency" style="width: 50%; height: 4vh; font-size: 16px; color: #A52A2A; font-weight: 600;">
                    	
                  </div>
                  <div class="vr" style="height: 4vh;"></div>
                  <div class="row-6 text-center d-flex justify-content-start align-items-end px-4" id="elecSecondFuelEfficiency" style="width: 50%; height: 4vh; font-size: 16px; color: #A52A2A; font-weight: 600;">
                    
                  </div>
                </div>
                <div class="hstack col">
                  <div class="row-6 text-center d-flex justify-content-start align-items-start px-4" id="elecFirstCarEff" style="width: 50%; height: 4vh; font-size: 20px; font-weight: 600;">
                    	
                  </div>
                  <div class="vr" style="height: 4vh;"></div>
                  <div class="row-6 text-center d-flex justify-content-start align-items-start px-4" id="elecSecondCarEff" style="width: 50%; height: 4vh; font-size: 20px; font-weight: 600;">
                    	
                  </div>
                </div>
                <div class="hstack col">
                  <div class="row-6 text-center d-flex justify-content-start align-items-end px-4" id="elecFirstCarbonFootprint" style="width: 50%; height: 4vh; font-size: 16px; color: #A52A2A; font-weight: 600;">
                    	
                  </div>
                  <div class="vr" style="height: 4vh;"></div>
                  <div class="row-6 text-center d-flex justify-content-start align-items-end px-4" id="elecSecondCarbonFootprint" style="width: 50%; height: 4vh; font-size: 16px; color: #A52A2A; font-weight: 600;">
                    	
                  </div>
                </div>
                <div class="hstack col">
                  <div class="row-6 text-center d-flex justify-content-start align-items-start px-4" id="elecFirstCarCo2" style="width: 50%; height: 4vh; font-size: 20px; font-weight: 600;">
                    	
                  </div>
                  <div class="vr" style="height: 4vh;"></div>
                  <div class="row-6 text-center d-flex justify-content-start align-items-start px-4" id="elecSecondCarCo2" style="width: 50%; height: 4vh; font-size: 20px; font-weight: 600;">
                    	
                  </div>
                </div>
                
                <div class="hstack col">
                  <div class="row-6 text-center d-flex justify-content-start align-items-end px-4" id="elecFirstBatTypeNm" style="width: 50%; height: 4vh; font-size: 16px; color: #A52A2A; font-weight: 600;">
                    	
                  </div>
                  <div class="vr" style="height: 4vh;"></div>
                  <div class="row-6 text-center d-flex justify-content-start align-items-end px-4" id="elecSecondBatTypeNm" style="width: 50%; height: 4vh; font-size: 16px; color: #A52A2A; font-weight: 600;">
                    	
                  </div>
                </div>
                <div class="hstack col">
                  <div class="row-6 text-center d-flex justify-content-start align-items-start px-4" id="elecFirstBatType" style="width: 50%; height: 4vh; font-size: 20px; font-weight: 600;">
                    	
                  </div>
                  <div class="vr" style="height: 4vh;"></div>
                  <div class="row-6 text-center d-flex justify-content-start align-items-start px-4" id="elecSecondBatType" style="width: 50%; height: 4vh; font-size: 20px; font-weight: 600;">
                    	
                  </div>
                </div>
                
                <div class="hstack col">
                  <div class="row-6 text-center d-flex justify-content-start align-items-end px-4" id="elecFirstbatVolNm" style="width: 50%; height: 4vh; font-size: 16px; color: #A52A2A; font-weight: 600;">
                    	
                  </div>
                  <div class="vr" style="height: 4vh;"></div>
                  <div class="row-6 text-center d-flex justify-content-start align-items-end px-4" id="elecSecondbatVolNm" style="width: 50%; height: 4vh; font-size: 16px; color: #A52A2A; font-weight: 600;">
                    	
                  </div>
                </div>
                <div class="hstack col">
                  <div class="row-6 text-center d-flex justify-content-start align-items-start px-4" id="elecFirstbatVol" style="width: 50%; height: 4vh; font-size: 20px; font-weight: 600;">
                    	
                  </div>
                  <div class="vr" style="height: 4vh;"></div>
                  <div class="row-6 text-center d-flex justify-content-start align-items-start px-4" id="elecSecondbatVol" style="width: 50%; height: 4vh; font-size: 20px; font-weight: 600;">
                    	
                  </div>
                </div>
                
                <div class="hstack col">
                  <div class="row-6 text-center d-flex justify-content-start align-items-end px-4" id="elecFirstSingle" style="width: 50%; height: 4vh; font-size: 16px; color: #A52A2A; font-weight: 600;">
                    	
                  </div>
                  <div class="vr" style="height: 4vh;"></div>
                  <div class="row-6 text-center d-flex justify-content-start align-items-end px-4" id="elecSecondSingle" style="width: 50%; height: 4vh; font-size: 16px; color: #A52A2A; font-weight: 600;">
                    	
                  </div>
                </div>
                <div class="hstack col">
                  <div class="row-6 text-center d-flex justify-content-start align-items-center px-4" id="elecFirstWarm" style="width: 50%; height: 4vh; font-size: 20px; font-weight: 600;">

                  </div>
                  <div class="vr" style="height: 4vh;"></div>
                  <div class="row-6 text-center d-flex justify-content-start align-items-center px-4" id="elecSecondWarm" style="width: 50%; height: 4vh; font-size: 20px; font-weight: 600;">
                    	
                  </div>
                </div>
                <div class="hstack col">
                  <div class="row-6 text-center d-flex justify-content-start align-items-start px-4" id="elecFirstCold" style="width: 50%; height: 4vh; font-size: 20px; font-weight: 600;">
                    	
                  </div>
                  <div class="vr" style="height: 4vh;"></div>
                  <div class="row-6 text-center d-flex justify-content-start align-items-start px-4" id="elecSecondCold" style="width: 50%; height: 4vh; font-size: 20px; font-weight: 600;">
                    	
                  </div>
                </div>
                
                
                
                <hr class="m-0 p-0">
              </div>

              <div class="d-flex justify-content-center m-2">
                <button class="btn btn-sm btn-outline-danger" type="button" disabled>100km 기준 비교</button>
              </div>

			  <div class="row">
			  
			  	<div id="progress-chart-charge">
			  	
					<div class="d-flex justify-content-between">
			            <h4 class="headfont">0</h4>
			            <h4 class="headfont center">충전비</h4>
			            <h4 class="headfont">0</h4>
		            </div>
	                <div class="row">
	                	<div class="col">
	                		<div class="progress-container justify-content-end" id="left-container">
	                			<div class="progress-bar left-progress" id="left-progress-charge" data-value="100" style="width: 0%"></div>
	                			<div class="tips" id="tips-left-charge" style="display: none; left: 172.5px; top: -40px">0</div>
	                		</div>
	                	</div>
	                	<div class="col">
	                		<div class="progress-container justify-content-start" id="right-container">
	                			<div class="progress-bar right-progress" id="right-progress-charge" data-value="100" style="width: 0%"></div>
	                			<div class="tips" id="tips-right-charge" style="display: none; left: 172.5px; top: -40px">0</div>
	                		</div>
	                	</div>
	                </div>
				
				</div>
				
				<div style="color:#976200; text-align: center; font-weight:1000" id="total-price">
					
					<div class="row" style="color:#372504">
	                    <div class="col">
	                    	<p>0원</p>
	                    </div>
	                    <div class="col minus-font">
	                    	<span class=" minus-font before"> (-) </span> 
	                    	<span>0</span>
	                    	<span class="minus-font after"> (+) </span>
	                    </div>
	                    <div class="col">
	                    	<p>0원</p>
	                    </div>
                    </div>
				
				</div>
			  
				<div id="progress-chart-co2">
				
					<div class="d-flex justify-content-between">
			            <h4 class="headfont" id="eleccharge">0</h4>
			            <h4 class="headfont center">Co2 배출량</h4>
			            <h4 class="headfont" id="gascharge">0</h4>
		            </div>
	                <div class="row">
	                	<div class="col">
	                		<div class="progress-container justify-content-end" id="left-container">
	                			<div class="progress-bar left-progress" id="left-progress" data-value="100" style="width: 0%"></div>
	                			<div class="tips" id="tips-left" style="display: none; left: 172.5px; top: -40px">0</div>
	                		</div>
	                	</div>
	                	<div class="col">
	                		<div class="progress-container justify-content-start" id="right-container">
	                			<div class="progress-bar right-progress" id="right-progress" data-value="100" style="width: 0%"></div>
	                			<div class="tips" id="tips-right" style="display: none; left: 172.5px; top: -40px">0</div>
	                		</div>
	                	</div>
	                </div>
					
				</div>
				
				<div style="color:#976200; text-align: center; font-weight:1000" id="total-co2">
					
					<div class="row" style="color:#372504">
	                    <div class="col">
	                    	<p>0</p>
	                    </div>
	                    <div class="col minus-font">
	                    	<span class=" minus-font before"> (-) </span> 
	                    	<span>0</span>
	                    	<span class="minus-font after"> (+) </span>
	                    </div>
	                    <div class="col">
	                    	<p>0</p>
	                    </div>
                    </div>
				</div>
			  </div>
            </div>
        </div>
		
		<!-- 풋터 영역 -->
		<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
		<!-- 풋터 영역 -->

        <!-- 전기차 조회 첫번째 Modal -->
        <div class="modal fade" id="exampleModal_elec_first" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-md">
                <div class="modal-content p-4">
                    <form id="elecCarForm" method="POST" action="#">
                        
                        <div class="modal-body d-flex align-items-center justify-content-end">
                            <span class="re_sm_logo_modal me-auto" id="exampleModalLabel">전기차 모델 비교</span>
                            <button type="button" class="btn-close align-self-center" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body d-flex align-items-center justify-content-start">
							<div class="re_sm me-auto">전기차 모델 검색</div>
                        </div>
                        
                        <div class="modal-body d-flex align-items-center justify-content-start">
                        	<div class="input-group mb-3 mt-2 position-relative">
						        <input type="text" class="form-control responsive-input" id="elecFirstSearchInput" name="carName" placeholder="차량 모델명을 입력하세요">
						        <!-- 검색 결과 드롭다운 -->
						        <ul id="elecFirstResultList" class="list-group"></ul>
					    	</div>
                        </div>
                        
                        <div class="modal-body d-flex align-items-center justify-content-end">
                          <div class="re_sm me-auto">내 전기차</div>
                        </div>
                        <div class="modal-body d-flex align-items-center justify-content-start gap-2">
                          <button type="button" id="saveEFirstCar" class="btn btn-outline-primary">보유 전기차</button>
                          <button type="button" id="likeEFirstCar" class="btn btn-outline-primary">찜 전기차</button>
                        </div>

                        <!-- 나의 보유 차량 -->
                        <div class="modal-body">
                          <div class="card-wrapper-elec-first">

                            <!-- 나의 보유 차량 정보 -->
                            <div class="card carbottom">
                              <div class="card img">
                                <img src="/assets/img/modelselect.png" class="card-img-top" alt="...">
                              </div>
                              <div class="card-body">
                                <p class="card-text">Some quick</p>
                              </div>
                              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6 like-icon">
								  <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v6m3-3H9m12 0a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z" />
							  </svg>
                            </div>
                            
                            <!-- 나의 보유 차량 정보 -->
                          </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
        <!-- 전기차 조회 첫번째 Modal -->

        <!-- 전기차 조회 두번째 Modal -->
        <div class="modal fade" id="exampleModal_elec_second" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-md">
                <div class="modal-content p-4">
                    <form id="elecCarForm" method="POST" action="#">
                        
                        <div class="modal-body d-flex align-items-center justify-content-end">
                            <span class="re_sm_logo_modal me-auto" id="exampleModalLabel">전기차 모델 비교</span>
                            <button type="button" class="btn-close align-self-center" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body d-flex align-items-center justify-content-start">
							<div class="re_sm me-auto">전기차 모델 검색</div>
                        </div>
                        
                        <div class="modal-body d-flex align-items-center justify-content-start">
                        	<div class="input-group mb-3 mt-2 position-relative">
						        <input type="text" class="form-control responsive-input" id="elecSecondSearchInput" name="carName" placeholder="차량 모델명을 입력하세요">
						        <!-- 검색 결과 드롭다운 -->
						        <ul id="elecSecondResultList" class="list-group"></ul>
					    	</div>
                        </div>
                        
                        <div class="modal-body d-flex align-items-center justify-content-end">
                          <div class="re_sm me-auto">내 전기차</div>
                        </div>
                        <div class="modal-body d-flex align-items-center justify-content-start gap-2">
                          <button type="button" id="saveESecondCar" class="btn btn-outline-primary">보유 전기차</button>
                          <button type="button" id="likeESecondCar" class="btn btn-outline-primary">찜 전기차</button>
                        </div>

                        <!-- 나의 보유 차량 -->
                        <div class="modal-body">
                          <div class="card-wrapper-elec-second">

                            <!-- 나의 보유 차량 정보 -->
                            <div class="card carbottom">
                              <div class="card img">
                                <img src="/assets/img/modelselect.png" class="card-img-top" alt="...">
                              </div>
                              <div class="card-body">
                                <p class="card-text">Some quick</p>
                              </div>
                              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6 like-icon">
								  <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v6m3-3H9m12 0a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z" />
							  </svg>
                            </div>
                            
                            <!-- 나의 보유 차량 정보 -->
                          </div>
                        </div>

                    </form>
                </div>
            </div>
      </div>
      <!-- 전기차 조회 두번째 Modal -->


    </div>

</body>
</html>