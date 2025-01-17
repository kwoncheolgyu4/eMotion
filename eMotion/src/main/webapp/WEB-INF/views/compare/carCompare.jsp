
<%
  /* ================================================================= 
   * 작성일     : 2024. 12. 30. 
   * 작성자     : 철규
   * 상세설명  : 차량 비교
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
<title>내연차와 전기차 비교</title>

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

.card-wrapper-elec {
  display: grid;
  grid-template-columns: repeat(2, 1fr); /* 한 줄에 두 개 */
  gap: 15px; /* 카드 간격 */
  width: 100%; /* 전체 너비 */
  justify-items: center; /* 카드 가운데 정렬 */
}

.card-wrapper-gas {
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

#elecResultList {
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

#gasResultList {
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
    const elecSearchInput = document.getElementById('elecSearchInput');
    const elecResultList = document.getElementById('elecResultList');
    const modal = document.getElementById('exampleModal_elec'); // Modal ID 수정

    const elecCarImgNm = document.getElementById('elecCompareImgNm');
    const elecCarNm = document.getElementById('elecCarNm');
    const elecCarPrice = document.getElementById('elecCarPrice');
    const elecCarEff = document.getElementById('elecCarEff');
    const elecCarCo2 = document.getElementById('elecCarCo2');
    const elecCarBrand = document.getElementById('elecCarBrand');
    const elecCarCate = document.getElementById('elecCarCate');
    const elecManufacturer = document.getElementById('elecManufacturer');
    const elecCategorization = document.getElementById('elecCategorization');
    const elecFuelEfficiency = document.getElementById('elecFuelEfficiency');
    const elecCarbonFootprint = document.getElementById('elecCarbonFootprint');

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
    const gasSearchInput = document.getElementById('gasSearchInput');
    const gasResultList = document.getElementById('gasResultList');
    const modal = document.getElementById('exampleModal_gas'); // Modal ID 수정

    const gasCarImgNm = document.getElementById('gasCompareImgNm');
    const gasCarNm = document.getElementById('gasCarNm');
    const gasCarPrice = document.getElementById('gasCarPrice');
    const gasCarEff = document.getElementById('gasCarEff');
    const gasCarCo2 = document.getElementById('gasCarCo2');
    const gasCarBrand = document.getElementById('gasCarBrand');
    const gasCarCate = document.getElementById('gasCarCate');
    const gasManufacturer = document.getElementById('gasManufacturer');
    const gasCategorization = document.getElementById('gasCategorization');
    const gasFuelEfficiency = document.getElementById('gasFuelEfficiency');
    const gasCarbonFootprint = document.getElementById('gasCarbonFootprint');

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
        	gasResultList.style.display = 'none';
            return;
        }

        try {
            const response = await fetch('/gasCompareList?carName=' + encodeURIComponent(carname));
            if (!response.ok) throw new Error('요청 실패');
            const carList = await response.json();

            gasResultList.innerHTML = '';
            gasResultList.style.display = 'block';

            carList.forEach(function (car) {
                const li = document.createElement('li');
                li.className = 'list-group-item list-group-item-action d-flex align-items-center';
                li.dataset.carName = car.carName; // carName을 데이터 속성으로 저장

                // 이미지 태그 생성
                const img = document.createElement('img');
                img.src = car.carImg;
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
                    const carBrand = car.carBrand; // 클릭된 항목의 carBrand 가져오기

                    try {
                        const response = await fetch('/carCompare/gasCar', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json',
                            },
                            body: JSON.stringify({ carName , carBrand }), // JSON 형태로 서버에 carName 전달
                        });

                        if (!response.ok) throw new Error('요청 실패');

                        const carData = await response.json(); // 서버에서 반환된 JSON 데이터 파싱
						
                        console.log(carData)
                        
                        // 가져온 데이터를 HTML에 표시
                        gasCarImgNm.querySelector('img').src = carData.carImg;
                        gasCarNm.textContent = carData.carName;
                        gasCarPrice.textContent = '~' + carData.carPrice.toLocaleString() + '원';
                        gasCarEff.textContent = Math.round(parseFloat(carData.carEff) * 100) / 100 + 'km/L';
                        gasCarCo2.textContent = (Math.round(parseFloat(carData.carCo2) * 100) / 100) * 10 + 'g/km';
                        gasCarBrand.textContent = carData.carBrand;
                        gasCarCate.textContent = carData.carCateDetail;
                        gasManufacturer.textContent = '제조사';
                        gasCategorization.textContent = '차량분류';
                        gasFuelEfficiency.textContent = '연비';
                        gasCarbonFootprint.textContent = '탄소배출량';
                        
                        totalProgressPrice(null, null, Math.round(parseFloat(carData.carEff) * 100) / 100, (Math.round(parseFloat(carData.carCo2) * 100) / 100) * 10);
                        
                        // 검색 결과 리스트 숨김
                        gasResultList.style.display = 'none';

                        // 모달 닫기
                        bootstrapModal.hide();
                    } catch (error) {
                        console.error('에러 발생:', error);
                    }
                });

                gasResultList.appendChild(li);
            });
        } catch (error) {
            console.error('에러 발생:', error);
            gasResultList.style.display = 'none';
        }
    }, 300); // 300ms 지연

    // 검색 입력 이벤트 연결
    gasSearchInput.addEventListener('input', handleInput);

    // 검색창 외부 클릭 시 리스트 숨김
    gasSearchInput.addEventListener('blur', function () {
        setTimeout(function () {
        	gasResultList.style.display = 'none';
        }, 200);
    });

    // 검색창에서 다시 포커스를 얻으면 리스트 표시
    gasSearchInput.addEventListener('focus', function () {
        if (gasResultList.children.length > 0) {
        	gasResultList.style.display = 'block';
        }
    });

    // 모달 초기화 이벤트
    modal.addEventListener('hidden.bs.modal', function () {

        // 검색창 및 결과 초기화
        gasSearchInput.value = '';
        gasResultList.innerHTML = '';
        gasResultList.style.display = 'none';

        console.log('모달이 닫히고 모든 데이터가 초기화되었습니다.');
    });
});

//모달이 열릴 때 기본적으로 보유 전기차 데이터를 로드
document.addEventListener("DOMContentLoaded", () => {
    const saveECarButton = document.getElementById("saveECar");
    loadSaveECarData(); // 보유 전기차 데이터 로드
    saveECarButton.classList.add("active"); // 버튼 활성화
    
    document.getElementById("saveECar").addEventListener("click", () => {
        loadSaveECarData();
        toggleActiveButton("saveECar");
    });

    document.getElementById("likeECar").addEventListener("click", () => {
        loadLikeECarData();
        toggleActiveButton("likeECar");
    });

    // 버튼 활성화/비활성화 처리
    function toggleActiveButton(activeButtonId) {
        document.getElementById("saveECar").classList.remove("active");
        document.getElementById("likeECar").classList.remove("active");
        document.getElementById(activeButtonId).classList.add("active");
    }

    function loadSaveECarData() {
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

    function loadLikeECarData() {
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
        const cardWrapper = document.querySelector(".card-wrapper-elec");
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
            document.getElementById('elecCompareImgNm').querySelector('img').src = '/assets/img/elec_car_img/' + carData.imgUrl;
            document.getElementById('elecCarNm').textContent = carData.carName;
            document.getElementById('elecCarPrice').textContent = '~' + carData.carPrice.toLocaleString() + '원';
            document.getElementById('elecCarEff').textContent = Math.round(parseFloat(carData.carEff) * 100) / 100 + 'km/L';
            document.getElementById('elecCarCo2').textContent = (Math.round(parseFloat(carData.carCo2) * 100) / 100) * 10 + 'g/km';
            document.getElementById('elecCarBrand').textContent = carData.carBrand;
            document.getElementById('elecCarCate').textContent = carData.carCateDetail;
            document.getElementById('elecManufacturer').textContent = '제조사';
            document.getElementById('elecCategorization').textContent = '차량분류';
            document.getElementById('elecFuelEfficiency').textContent = '연비';
            document.getElementById('elecCarbonFootprint').textContent = '탄소배출량';
            
            totalProgressPrice(Math.round(parseFloat(carData.carEff) * 100) / 100, (Math.round(parseFloat(carData.carCo2) * 100) / 100) * 10, null, null);
            
            console.log('차량 데이터 업데이트 완료:', carData);

            // Bootstrap 모달 닫기
            const modal = document.getElementById('exampleModal_elec'); // 모달 ID
            const bootstrapModal = bootstrap.Modal.getInstance(modal); // Bootstrap 모달 인스턴스 가져오기
            bootstrapModal.hide(); // 모달 닫기
        } catch (error) {
            console.error('에러 발생:', error);
        }
    }
    
});

//모달이 열릴 때 기본적으로 보유 내연기관차 데이터를 로드
document.addEventListener("DOMContentLoaded", () => {
    const saveGCarButton = document.getElementById("saveGCar");
    loadsaveGCarData(); // 보유 전기차 데이터 로드
    saveGCarButton.classList.add("active"); // 버튼 활성화
    
    function loadsaveGCarData() {
        fetch("/carCompare/saveGCar", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
        })
        .then((response) => response.json())
        .then((data) => {
            renderCarCardsGas(data); // 데이터를 카드 형식으로 렌더링
        })
        .catch((error) => {
            console.error("Error fetching saveECar data:", error);
        });
    }

    function renderCarCardsGas(data) {
        const cardWrapper = document.querySelector(".card-wrapper-gas");
        cardWrapper.innerHTML = ""; // 기존 카드 초기화
    		
        data.forEach(function(car) {
            const cardHTML =
                '<div class="card carbottom">' +
                    '<div class="card img">' +
                        '<img src="' + car.carImg + '" class="card-img-top" alt="' + car.carName + '">' +
                    '</div>' +
                    '<div class="card-body">' +
                        '<p class="card-text">' + car.carName + '</p>' +
                    '</div>' +
                    '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6 like-icon" data-car-name="' + car.carName + '" data-car-brand="' + car.carBrand + '">' +
                        '<path stroke-linecap="round" stroke-linejoin="round" d="M12 9v6m3-3H9m12 0a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z" />' +
                    '</svg>' +
                '</div>';
                    
            cardWrapper.innerHTML += cardHTML;
        });

        // SVG 클릭 이벤트 위임 추가
        cardWrapper.addEventListener("click", async function(event) {
            if (event.target.closest("svg.like-icon")) {
                const svgElement = event.target.closest("svg.like-icon");
                const carName = svgElement.dataset.carName; // carName 데이터 속성 가져오기
                const carBrand = svgElement.dataset.carBrand; // carBrand 데이터 속성 가져오기
                await fetchCarDetails(carName, carBrand); // carName과 carBrand로 서버 요청
            }
        });
    }
    
    async function fetchCarDetails(carName, carBrand) {
        try {
            const response = await fetch('/carCompare/gasCar', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ carName, carBrand }), // JSON 형태로 서버에 carName과 carBrand 전달
            });

            if (!response.ok) throw new Error('요청 실패');

            const carData = await response.json(); // 서버에서 반환된 JSON 데이터 파싱

            // 가져온 데이터를 HTML에 표시
            document.getElementById('gasCompareImgNm').querySelector('img').src = carData.carImg;
            document.getElementById('gasCarNm').textContent = carData.carName;
            document.getElementById('gasCarPrice').textContent = '~' + carData.carPrice.toLocaleString() + '원';
            document.getElementById('gasCarEff').textContent = Math.round(parseFloat(carData.carEff) * 100) / 100 + 'km/L';
            document.getElementById('gasCarCo2').textContent = (Math.round(parseFloat(carData.carCo2) * 100) / 100) * 10 + 'g/km';
            document.getElementById('gasCarBrand').textContent = carData.carBrand;
            document.getElementById('gasCarCate').textContent = carData.carCateDetail;
            document.getElementById('gasManufacturer').textContent = '제조사';
            document.getElementById('gasCategorization').textContent = '차량분류';
            document.getElementById('gasFuelEfficiency').textContent = '연비';
            document.getElementById('gasCarbonFootprint').textContent = '탄소배출량';
            
            totalProgressPrice(null, null, Math.round(parseFloat(carData.carEff) * 100) / 100, (Math.round(parseFloat(carData.carCo2) * 100) / 100) * 10);
            
            console.log('차량 데이터 업데이트 완료:', carData);

            // Bootstrap 모달 닫기
            const modal = document.getElementById('exampleModal_gas'); // 모달 ID
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
    const oilprice = 1650;
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
    
    var treeCost = Math.round(((Math.abs(totaleffectiveElecCo2-totaleffectiveGasCo2) * 100) / 100) / 6600)
    
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
    
    var treeCount = document.getElementById('progress-chart-tree');
    treeCount.innerHTML = 
    '<div class="d-flex justify-content-between">' +
	'<h4 class="headfont"></h4>' +
    '<h4 class="headfont center">소나무 심은 효과 ' + treeCost + '그루</h4>' +
    '<h4 class="headfont"></h4>' +
	'</div>';
    
    
    // 전기차 데이터만 있을 경우에도 프로그래스 바 생성
    if (elecEff !== null || gasEff !== null) {
        createProgressBar(
        	containerId = "progress-chart-charge",
        	LMax = totalprice, // 최대값 계산
        	RMax = totalprice,
        	leftValue = elecChargePrice,
        	rightValue = gasOilPrice,
        	text = "충전비 　 유류비"
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
	
	progressMain.innerHTML =  '<div class="d-flex justify-content-center">' +
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
    
              <div class="responsive-subtext p-2 gap-3 d-flex">전기차 - 내연기관차 비교
              	<button class="btn-othCompare align-items-center" onclick="location.href='/carElecCompare'">전기차 - 전기차</button>
              </div>

              <div class="table-wrapper">
                <!-- 비교 -->
                <hr class="m-0 p-0">
                <div class="hstack col">
                  <div class="row-6 text-center" style="width: 50%;">전기차</div>
                  <div class="vr" style="height: 30px;"></div>
                  <div class="row-6 text-center" style="width: 50%;">내연기관차</div>
                </div>
                <hr class="m-0 p-0">

                <div class="hstack col">
				    <div class="row-6 text-center d-flex justify-content-center align-items-center" style="width: 50%; height: 10vh;">
				        <div class="border rounded align-content-center" id="elecCompareImgNm" style="width: 90%; height: 8vh; cursor: pointer;">
				            <img id="elecCompareImg" src="/assets/img/modelselect.png" alt="사진 선택" data-bs-toggle="modal" data-bs-target="#exampleModal_elec">
				        </div>
				    </div>
				    <div class="vr" style="height: 10vh;"></div>
				    <div class="row-6 text-center d-flex justify-content-center align-items-center" style="width: 50%; height: 10vh;">
				        <div class="border rounded align-content-center" id="gasCompareImgNm" style="width: 90%; height: 8vh; cursor: pointer;">
				            <img id="gasCompareImg" src="/assets/img/modelselect.png" alt="사진 선택" data-bs-toggle="modal" data-bs-target="#exampleModal_gas">
				        </div>
				    </div>
				</div>
				
                <div class="hstack col">
                  <div class="row-6 text-center d-flex justify-content-start align-items-end px-4" id="elecCarNm" style="width: 50%; height: 4vh; font-size: 24px; color: #A52A2A; font-weight: 700;">
                    	
                  </div>
                  <div class="vr" style="height: 4vh;"></div>
                  <div class="row-6 text-center d-flex justify-content-start align-items-end px-4" id="gasCarNm" style="width: 50%; height: 4vh; font-size: 24px; color: #A52A2A; font-weight: 700;">
                    	
                  </div>
                </div>
                <div class="hstack col">
                  <div class="row-6 text-center d-flex justify-content-start align-items-start px-4" id="elecCarPrice" style="width: 50%; height: 4vh; font-size: 20px; color: #F4A460; font-weight: 600;">
                    	
                  </div>
                  <div class="vr" style="height: 4vh;"></div>
                  <div class="row-6 text-center d-flex justify-content-start align-items-start px-4" id="gasCarPrice" style="width: 50%; height: 4vh; font-size: 20px; color: #F4A460; font-weight: 600;">
                    	
                  </div>
                </div>
                <div class="hstack col">
                  <div class="row-6 text-center d-flex justify-content-start align-items-end px-4" id="elecManufacturer" style="width: 50%; height: 4vh; font-size: 16px; color: #A52A2A; font-weight: 600;">
                    	
                  </div>
                  <div class="vr" style="height: 4vh;"></div>
                  <div class="row-6 text-center d-flex justify-content-start align-items-end px-4" id="gasManufacturer" style="width: 50%; height: 4vh; font-size: 16px; color: #A52A2A; font-weight: 600;">
                    	
                  </div>
                </div>
                <div class="hstack col">
                  <div class="row-6 text-center d-flex justify-content-start align-items-start px-4" id="elecCarBrand" style="width: 50%; height: 4vh; font-size: 20px; font-weight: 600;">
                    	
                  </div>
                  <div class="vr" style="height: 4vh;"></div>
                  <div class="row-6 text-center d-flex justify-content-start align-items-start px-4" id="gasCarBrand" style="width: 50%; height: 4vh; font-size: 20px; font-weight: 600;">
                    	
                  </div>
                </div>
                <div class="hstack col">
                  <div class="row-6 text-center d-flex justify-content-start align-items-end px-4" id="elecCategorization" style="width: 50%; height: 4vh; font-size: 16px; color: #A52A2A; font-weight: 600;">
                    	
                  </div>
                  <div class="vr" style="height: 4vh;"></div>
                  <div class="row-6 text-center d-flex justify-content-start align-items-end px-4" id="gasCategorization" style="width: 50%; height: 4vh; font-size: 16px; color: #A52A2A; font-weight: 600;">
                    	
                  </div>
                </div>
                <div class="hstack col">
                  <div class="row-6 text-center d-flex justify-content-start align-items-start px-4" id="elecCarCate" style="width: 50%; height: 4vh; font-size: 20px; font-weight: 600;">
                    	
                  </div>
                  <div class="vr" style="height: 4vh;"></div>
                  <div class="row-6 text-center d-flex justify-content-start align-items-start px-4" id="gasCarCate" style="width: 50%; height: 4vh; font-size: 20px; font-weight: 600;">
                    	
                  </div>
                </div>
                <div class="hstack col">
                  <div class="row-6 text-center d-flex justify-content-start align-items-end px-4" id="elecFuelEfficiency" style="width: 50%; height: 4vh; font-size: 16px; color: #A52A2A; font-weight: 600;">
                    	
                  </div>
                  <div class="vr" style="height: 4vh;"></div>
                  <div class="row-6 text-center d-flex justify-content-start align-items-end px-4" id="gasFuelEfficiency" style="width: 50%; height: 4vh; font-size: 16px; color: #A52A2A; font-weight: 600;">
                    
                  </div>
                </div>
                <div class="hstack col">
                  <div class="row-6 text-center d-flex justify-content-start align-items-start px-4" id="elecCarEff" style="width: 50%; height: 4vh; font-size: 20px; font-weight: 600;">
                    	
                  </div>
                  <div class="vr" style="height: 4vh;"></div>
                  <div class="row-6 text-center d-flex justify-content-start align-items-start px-4" id="gasCarEff" style="width: 50%; height: 4vh; font-size: 20px; font-weight: 600;">
                    	
                  </div>
                </div>
                <div class="hstack col">
                  <div class="row-6 text-center d-flex justify-content-start align-items-end px-4" id="elecCarbonFootprint" style="width: 50%; height: 4vh; font-size: 16px; color: #A52A2A; font-weight: 600;">
                    	
                  </div>
                  <div class="vr" style="height: 4vh;"></div>
                  <div class="row-6 text-center d-flex justify-content-start align-items-end px-4" id="gasCarbonFootprint" style="width: 50%; height: 4vh; font-size: 16px; color: #A52A2A; font-weight: 600;">
                    	
                  </div>
                </div>
                <div class="hstack col pb-2">
                  <div class="row-6 text-center d-flex justify-content-start align-items-start px-4" id="elecCarCo2" style="width: 50%; height: 4vh; font-size: 20px; font-weight: 600;;">
                    	
                  </div>
                  <div class="vr" style="height: 4vh;"></div>
                  <div class="row-6 text-center d-flex justify-content-start align-items-start px-4" id="gasCarCo2" style="width: 50%; height: 4vh; font-size: 20px; font-weight: 600;">
                    	
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
			            <h4 class="headfont" id="elecCharge"></h4>
			            <h4 class="headfont center">충전비 　 유류비</h4>
			            <h4 class="headfont" id="gasCharge"></h4>
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
			            <h4 class="headfont" id="eleccharge"></h4>
			            <h4 class="headfont center">Co2 배출량</h4>
			            <h4 class="headfont" id="gascharge"></h4>
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
              
              <div id="progress-chart-tree">
				<div class="d-flex justify-content-between">
					<h4 class="headfont"></h4>
		            <h4 class="headfont center">소나무 심은 효과</h4>
			        <h4 class="headfont"></h4>
	            </div>
			  </div>
            </div>
        </div>

		<!-- 풋터 영역 -->
		<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
		<!-- 풋터 영역 -->

        <!-- 전기차 조회 Modal -->
        <div class="modal fade" id="exampleModal_elec" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
						        <input type="text" class="form-control responsive-input" id="elecSearchInput" name="carName" placeholder="차량 모델명을 입력하세요">
						        <!-- 검색 결과 드롭다운 -->
						        <ul id="elecResultList" class="list-group"></ul>
					    	</div>
                        </div>
                        
                        <div class="modal-body d-flex align-items-center justify-content-end">
                          <div class="re_sm me-auto">내 전기차</div>
                        </div>
                        <div class="modal-body d-flex align-items-center justify-content-start gap-2">
                          <button type="button" id="saveECar" class="btn btn-outline-primary">보유 전기차</button>
                          <button type="button" id="likeECar" class="btn btn-outline-primary">찜 전기차</button>
                        </div>

                        <!-- 나의 보유 차량 -->
                        <div class="modal-body">
                          <div class="card-wrapper-elec">

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
        <!-- 전기차 조회 Modal -->

        <!-- 내연기관차 조회 Modal -->
        <div class="modal fade" id="exampleModal_gas" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-md">
              <div class="modal-content p-4">
                  <form id="carForm" method="POST" action="#">
                      
                      <div class="modal-body d-flex align-items-center justify-content-end">
                          <span class="re_sm_logo_modal me-auto" id="exampleModalLabel">내연기관차 모델 비교</span>
                          <button type="button" class="btn-close align-self-center" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      
                      <div class="modal-body d-flex align-items-center justify-content-start">
							<div class="re_sm me-auto">내연기관차 모델 검색</div>
                      </div>
                        
                        <div class="modal-body d-flex align-items-center justify-content-start">
                        	<div class="input-group mb-3 mt-2 position-relative">
						        <input type="text" class="form-control responsive-input" id="gasSearchInput" name="carName" placeholder="차량 모델명을 입력하세요">
						        <!-- 검색 결과 드롭다운 -->
						        <ul id="gasResultList" class="list-group"></ul>
					    	</div>
                        </div>
                      
                      <div class="modal-body d-flex align-items-center justify-content-end">
                        <div class="re_sm me-auto">나의 내연기관차</div>
                      </div>
                      
                      <div class="modal-body d-flex align-items-center justify-content-start">
                        <button type="button" id="saveGCar" class="btn btn-outline-primary">보유 내연기관차</button>
                      </div>

                      <!-- 나의 보유 차량 -->
                      <div class="modal-body">
                        <div class="card-wrapper-gas">

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
      <!-- 내연기관차 조회 Modal -->


    </div>

</body>
</html>