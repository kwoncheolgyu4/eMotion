<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쪽지 관리</title>
<!-- 부트스트랩 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>

<!-- 풋터 css -->
<link rel="stylesheet" href="/resources/css/footer.css">
<!-- 풋터 css -->

<style>
:root { 
	--primary-color: #50B0FF; 
	--hover-color: #37a1f8;
	--background-color: #f8f9fa;
	--card-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
}

/* 화면 꽉차게 */
html, body { /* 게시판 css 추가 */
    height: 100%; 
    margin: 0;
    display: flex;
    flex-direction: column;
} /* 게시판 css 추가 */

body {
	background-color: var(--background-color);
	font-family: 'Pretendard', -apple-system, BlinkMacSystemFont, system-ui,
		Roboto, sans-serif;
}

.container {
	max-width: 768px;
	margin: 0 auto;
	flex: 1 0 auto; /* 콘텐츠가 늘어날 수 있도록 설정 */ /* 게시판 css 추가 */
	background-color: white; /* 원하는 배경색 */
    background-clip: content-box; /* 배경색을 콘텐츠 영역으로 제한 */
}

@media ( max-width : 768px) {/* 게시판 css 추가 */
	.container {
		padding-right: 0px;
		padding-left: 0px;
	}
}

/* 헤더 스타일 */
.page-header {
	margin-bottom: 2rem;
}

.page-title {
	color: #2c3e50;
	font-weight: 700;
	font-size: 1.5rem;
	margin-bottom: 1rem;
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
	padding: 0.7rem 1.2rem;
	white-space: nowrap;
	border-radius: 10px 10px 0 0;
	transition: all 0.2s ease;
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
/* 테이블 헤더 및 셀 가운데 정렬 */
.message-table th, .message-table td {
	text-align: center !important; /* 강제로 가운데 정렬 */
	vertical-align: middle; /* 수직 가운데 정렬 */
}
/* 테이블 텍스트 스타일 */
.message-table td a {
	display: inline-block; /* 블록 요소로 변경 */
	max-width: 150px; /* 최대 너비 설정 */
	overflow: hidden; /* 넘치는 텍스트 숨기기 */
	white-space: nowrap; /* 텍스트 줄바꿈 방지 */
	text-overflow: ellipsis; /* 넘치는 텍스트에 ... 표시 */
	text-decoration: none; /* 밑줄 제거 */
	color: inherit; /* 기존 색상 유지 */
}
/* 메시지 카드 & 테이블 */
.messages-container {
	background: white;
	border-radius: 10px;
	box-shadow: var(--card-shadow);
	padding: 1.5rem;
	margin-bottom: 2rem;
}

.message-stats {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 1rem;
	padding: 0.5rem 0;
	border-bottom: 1px solid #eee;
}

/* 테이블 스타일 */
.message-table {
	display: none;
}

@media ( min-width : 768px) {
	.message-table {
		display: table;
		width: 100%;
	}
	.message-table th {
		background-color: #f8f9fa;
		font-weight: 600;
		padding: 1rem;
		color: #495057;
		text-align: center;
	}
	.message-table td {
		padding: 1rem;
		vertical-align: middle;
		text-align: center;
		border-bottom: 1px solid #eee;
	}
	.message-cards {
		display: none;
	}
}

/* 모바일 카드 뷰 */
.message-card {
	background: white;
	border-radius: 10px;
	padding: 1rem;
	margin-bottom: 1rem;
	box-shadow: var(--card-shadow);
}

.message-card .card-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 0.5rem;
}

.message-card .card-content {
	margin: 0.5rem 0;
}

.message-card .card-footer {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-top: 0.5rem;
	color: #6c757d;
	font-size: 0.9rem;
}

/* 버튼 스타일 */
.custom-btn {
	background-color: var(--primary-color);
	border: none;
	padding: 0.5rem 1.2rem;
	font-weight: 500;
	border-radius: 8px;
	transition: all 0.2s ease;
}

.custom-btn:hover {
	background-color: var(--hover-color);
	transform: translateY(-1px);
}

.btn-group {
	display: flex;
	gap: 0.5rem;
	margin-top: 1rem;
}

/* 읽음/안읽음 상태 */
.unread {
	background-color: #f8f9fa;
}

.unread td {
	font-weight: 500;
}

/* 모달 스타일 */
.modal-content {
	border-radius: 10px;
	border: none;
	box-shadow: var(--card-shadow);
}

.modal-header {
	border-bottom: 2px solid #eee;
	padding: 1.5rem;
}

.modal-body {
	padding: 1.5rem;
}

.modal-footer {
	border-top: 2px solid #eee;
	padding: 1.5rem;
}

/* checkbox 컨테이너 td 스타일 */
.message-table td:first-child {
	vertical-align: middle;
	text-align: center;
}

/* checkbox 자체 스타일 */
.custom-checkbox {
	width: 1.2rem;
	height: 1.2rem;
	cursor: pointer;
	vertical-align: middle;
	margin: 0;
}
/* 기존 custom-btn 스타일은 유지하고, 삭제 버튼용 스타일 추가 */
.btn-delete {
	background-color: #dc3545; /* 빨간색 계열 */
	color: white;
	border: none;
	padding: 0.5rem 1.2rem;
	font-weight: 500;
	border-radius: 8px;
	transition: all 0.2s ease;
}

.btn-delete:hover {
	background-color: #c82333;
	color: white;
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

/* 헤더 스타일 */
.mainhead {
    background: white;
    padding: 2vh 0;
}

.logo img {
    max-height: 6vh;
    display: block;
    margin: 0 auto;
    cursor: pointer;
}

.menu-icon {
    font-size: 6vh;
    cursor: pointer;
    visibility: hidden;
}
.bot_brd {
	height: 4px;
	background: linear-gradient(to bottom, #d6edff, rgba(214, 237, 255, 0));
}


</style>
</head>
<body>
	<div class="container">
	
		<!-- 헤더 영역 -->
        <div class="mainhead">
            <div class="row mx-3 align-items-center">
                <div class="col d-flex align-items-center justify-content-between">
                    <!-- 로고 -->
                    <div class="logo" onclick="location.href='/';">
                        <img src="../../resources/assets/icon/logo.png" alt="Logo" class="img-fluid">
                    </div>
                    <!-- 메뉴 아이콘 -->
                    <i class="bi bi-list menu-icon" id="toggleOffcanvas"></i>
                </div>
            </div>
            <div class="bot_brd mt-3 mb-4" style="width: 100% !important;"></div>   
        </div>
	
		<div class="page-header mt-3 mx-4">
			<h1 class="page-title">쪽지 관리</h1>
		</div>

		<!-- 탭 네비게이션 -->
		<ul class="nav nav-tabs mb-4 mx-4">
			<li class="nav-item"><a
				class="nav-link ${tab == 'received' ? 'active' : ''}"
				href="/messagesViewDo?receiverEmail=${sessionScope.login.email}&tab=received">
					받은 쪽지 </a></li>
			<li class="nav-item"><a
				class="nav-link ${tab == 'sent' ? 'active' : ''}"
				href="/sentMessagesViewDo?senderEmail=${sessionScope.login.email}&tab=sent">
					보낸 쪽지 </a></li>
		</ul>

		<!-- 메시지 컨테이너 -->
		<div class="messages-container">
			<!-- 정렬 & 통계 -->
			<div class="message-stats">
				<c:if test="${tab == 'received'}">
					<span>전체: ${totalMessages}개 <span class="text-primary">
							(안 읽은 쪽지: ${unreadMessages}개)</span></span>
					<div class="dropdown">
						<button class="btn btn-outline-secondary btn-sm dropdown-toggle"
							type="button" data-bs-toggle="dropdown" aria-expanded="false">
							정렬:
							<c:choose>
								<c:when test="${sort == 'recent'}">최근 순</c:when>
								<c:when test="${sort == 'oldest'}">오래된 순</c:when>
								<c:when test="${sort == 'unread'}">안 읽은 순</c:when>
								<c:otherwise>정렬 선택</c:otherwise>
							</c:choose>
						</button>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item"
								href="/messagesViewDo?receiverEmail=${sessionScope.login.email}&page=${currentPage}&sort=recent">최근
									순</a></li>
							<li><a class="dropdown-item"
								href="/messagesViewDo?receiverEmail=${sessionScope.login.email}&page=${currentPage}&sort=oldest">오래된
									순</a></li>
							<li><a class="dropdown-item"
								href="/messagesViewDo?receiverEmail=${sessionScope.login.email}&page=${currentPage}&sort=unread">안
									읽은 순</a></li>
						</ul>
					</div>
				</c:if>
				<c:if test="${tab == 'sent'}">
					<span>전체: ${totalMessages}개</span>
				</c:if>
			</div>

			<!-- PC 테이블 뷰 -->
			<table class="message-table">
				<thead>
					<tr>
						<th style="width: 5%"><input type="checkbox" id="selectAll"
							class="custom-checkbox" /></th>
						<th style="width: 10%">상태</th>
						<th style="width: 25%">${tab == 'received' ? '보내는 사람' : '받는 사람'}</th>
						<th style="width: 40%">내용</th>
						<th style="width: 20%">날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="message"
						items="${tab == 'received' ? messages : sentMessages}">
						<tr class="${message.msgRead == 'Y' ? '' : 'unread'}"
							data-message-id="${message.msgNo}">
							<td><input type="checkbox"
								class="message-checkbox custom-checkbox" /></td>
							<td><i
								class="bi ${message.msgRead == 'Y' ? 'bi-envelope-open text-secondary' : 'bi-envelope-fill text-primary'}"></i>
							</td>
							<td>${tab == 'received' ? message.senderNickname : message.receiverNickname}<br>
								(${tab == 'received' ? message.senderEmail : message.receiverEmail})
							</td>
							<td><a href="#"
								class="text-decoration-none text-dark message-link"
								data-bs-toggle="modal" data-bs-target="#messageModal"
								data-tab="${tab}" data-sender-email="${message.senderEmail}"
								data-receiver-email="${message.receiverEmail}"
								data-nickname="${tab == 'received' ? message.senderNickname : message.receiverNickname}"
								data-message-content="${message.msgContent}"
								data-send-date="<fmt:formatDate value='${message.msgSendDate}' pattern='yyyy-MM-dd HH:mm' />"
								data-message-id="${message.msgNo}"> ${message.msgContent} </a></td>
							<td><fmt:formatDate value="${message.msgSendDate}"
									pattern="yyyy-MM-dd HH:mm" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<!-- 모바일 카드 뷰 -->
			<div class="message-cards">
				<c:forEach var="message"
					items="${tab == 'received' ? messages : sentMessages}">
					<div class="message-card ${message.msgRead == 'Y' ? '' : 'unread'}"
						data-message-id="${message.msgNo}">
						<div class="card-header">
							<span> <i
								class="bi ${message.msgRead == 'Y' ? 'bi-envelope-open text-secondary' : 'bi-envelope-fill text-primary'}"></i>
								${tab == 'received' ? message.senderNickname : message.receiverNickname}
							</span> <input type="checkbox" class="message-checkbox custom-checkbox" />
						</div>
						<div class="card-content">
							<a href="#" class="text-decoration-none text-dark message-link"
								data-bs-toggle="modal" data-bs-target="#messageModal"
								data-tab="${tab}" data-sender-email="${message.senderEmail}"
								data-receiver-email="${message.receiverEmail}"
								data-nickname="${tab == 'received' ? message.senderNickname : message.receiverNickname}"
								data-message-content="${message.msgContent}"
								data-send-date="<fmt:formatDate value='${message.msgSendDate}' pattern='yyyy-MM-dd HH:mm' />">
								${message.msgContent} </a>
						</div>
						<div class="card-footer">
							<span>${tab == 'received' ? message.senderEmail : message.receiverEmail}</span>
							<span><fmt:formatDate value="${message.msgSendDate}"
									pattern="yyyy-MM-dd HH:mm" /></span>
						</div>
					</div>
				</c:forEach>
			</div>

			<!-- 페이지네이션 -->
			<nav aria-label="Page navigation" class="mt-4">
				<ul class="pagination justify-content-center">
					<c:forEach begin="1" end="${totalPages}" var="i">
						<li class="page-item ${i == currentPage ? 'active' : ''}"><a
							class="page-link"
							href="${tab == 'received' ? '/messagesViewDo' : '/sentMessagesViewDo'}?${tab == 'received' ? 'receiverEmail' : 'senderEmail'}=${sessionScope.login.email}&page=${i}">
								${i} </a></li>
					</c:forEach>
				</ul>
			</nav>

			<!-- 액션 버튼 -->
			<div class="d-flex justify-content-end gap-2 mt-3">
				<button class="btn btn-success custom-btn" data-bs-toggle="modal"
					data-bs-target="#newMessageModal">
					<i class="bi bi-pencil"></i> 새 쪽지
				</button>
				<c:if test="${tab == 'received'}">
					<button class="btn btn-danger"
						onclick="deleteSelectedMessages('receiver')">
						<i class="bi bi-trash"></i> 삭제
					</button>
				</c:if>
				<c:if test="${tab == 'sent'}">
					<button class="btn btn-danger"
						onclick="deleteSelectedMessages('sender')">
						<i class="bi bi-trash"></i> 삭제
					</button>
				</c:if>

			</div>
		</div>
		
		<!-- 풋터 영역 -->
		<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
		<!-- 풋터 영역 -->
		
	</div>

	<!-- 상세 보기 모달 -->
	<div class="modal fade" id="messageModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">쪽지 내용</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">
					<p id="senderInfo" style="display: none;">
						<strong>보내는 사람:</strong> <span id="messageSenderNickname"></span>
						(<span id="messageSender"></span>)
					</p>
					<p id="receiverInfo" style="display: none;">
						<strong>받는 사람:</strong> <span id="messageReceiverNickname"></span>
						(<span id="messageReceiver"></span>)
					</p>
					<p>
						<strong>보낸 날짜:</strong> <span id="messageDate"></span>
					</p>
					<hr>
					<p id="messageContent"></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary custom-btn"
						id="actionButton"></button>
				</div>
			</div>
		</div>
	</div>

	<!-- 쪽지 보내기 모달 -->
	<div class="modal fade" id="newMessageModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">쪽지 보내기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">
					<form action="${pageContext.request.contextPath}/sendMessageDo"
						method="post">
						<div class="mb-3">
							<label for="receiverEmail" class="form-label">받는 사람</label> <input
								type="email" class="form-control" id="receiverEmail"
								name="receiverEmail" required>
						</div>
						<div class="mb-3">
							<label for="msgContent" class="form-label">내용</label>
							<textarea class="form-control" id="msgContent" name="msgContent"
								rows="3" required></textarea>
						</div>
						<button type="submit" class="btn btn-primary custom-btn">보내기</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- 부트스트랩 JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
//전체 선택 기능
document.getElementById("selectAll").addEventListener("change", function () {
    const isChecked = this.checked;
    document.querySelectorAll(".message-checkbox").forEach(checkbox => {
        checkbox.checked = isChecked;
    });
});


function deleteSelectedMessages(userType) {
    // PC 테이블 뷰와 모바일 카드 뷰 모두에서 체크된 메시지 수집
    const selectedMessages = [
        ...Array.from(document.querySelectorAll(".message-table .message-checkbox:checked"))
            .map(el => el.closest("tr").dataset.messageId),
        ...Array.from(document.querySelectorAll(".message-cards .message-checkbox:checked"))
            .map(el => el.closest(".message-card").dataset.messageId)
    ].filter(id => id); // undefined나 null 제거
    
    if (selectedMessages.length === 0) {
        alert("삭제할 쪽지를 선택하세요.");
        return;
    }

    const isConfirmed = confirm("선택한 쪽지를 삭제하시겠습니까?");
    if (!isConfirmed) return;

    const loginEmail = sessionStorage.getItem("loginEmail") || "${sessionScope.login.email}";
    
    $.ajax({
        url: '/deleteMessageDo',
        type: 'POST',
        traditional: true,
        data: { msgNos: selectedMessages, userType: userType },
        success: function (response) {
            if(response === 'login') {
                alert("로그인이 필요합니다.");
                return;
            } else {
                alert("선택한 쪽지가 삭제되었습니다.");
                if(response === 'receiver') {
                    location.href = '/messagesViewDo?receiverEmail=' + loginEmail;
                } else if(response === 'sender') {
                    location.href = '/sentMessagesViewDo?senderEmail=' + loginEmail;
                }
            }
        },
        error: function (xhr) {
            if (xhr.responseJSON && xhr.responseJSON.error) {
                alert(xhr.responseJSON.error);
            } else {
                alert("쪽지 삭제 중 오류가 발생했습니다.");
            }
        }
    });
}

// 전체 선택 기능 수정
document.getElementById("selectAll").addEventListener("change", function() {
    const isChecked = this.checked;
    // PC 테이블 뷰의 체크박스 선택
    document.querySelectorAll(".message-table .message-checkbox").forEach(checkbox => {
        checkbox.checked = isChecked;
    });
    // 모바일 카드 뷰의 체크박스 선택
    document.querySelectorAll(".message-cards .message-checkbox").forEach(checkbox => {
        checkbox.checked = isChecked;
    });
});

    // 모달에서 데이터를 채우는 부분
$('#messageModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget); // 클릭된 버튼
    var tab = button.data('tab'); // 받은 편지함인지 보낸 편지함인지 구분
    var senderEmail = button.data('sender-email'); // 보내는 사람 이메일
    var receiverEmail = button.data('receiver-email'); // 받는 사람 이메일
    var nickname = button.data('nickname'); // 닉네임
    var messageContent = button.data('message-content'); // 쪽지 내용
    var sendDate = button.data('send-date'); // 보낸 날짜

    var modal = $(this);

    // 초기화
    modal.find('#senderInfo').hide();
    modal.find('#receiverInfo').hide();
    modal.find('#actionButton').text(''); // 버튼 텍스트 초기화

    // 받은 편지함
    if (tab === 'received') {
        modal.find('#senderInfo').show();
        modal.find('#messageSender').text(senderEmail || '-');
        modal.find('#messageSenderNickname').text(nickname || '-');
        modal.find('#actionButton').text('답장').data('action', 'reply').data('target-email', senderEmail);
    }
    // 보낸 편지함
    else if (tab === 'sent') {
        modal.find('#receiverInfo').show();
        modal.find('#messageReceiver').text(receiverEmail || '-');
        modal.find('#messageReceiverNickname').text(nickname || '-');
        modal.find('#actionButton').text('전달').data('action', 'forward').data('target-email', receiverEmail);
    }

    // 공통 설정
    modal.find('#messageContent').text(messageContent || '-');
    modal.find('#messageDate').text(sendDate || '-');
});

//버튼 클릭 이벤트
// 답장/전달 버튼 클릭 이벤트
$('#actionButton').on('click', function () {
    var action = $(this).data('action');
    var targetEmail = $(this).data('target-email');

    $('#messageModal').modal('hide');
    
    // 새 메시지 모달 표시
    setTimeout(function() {
        $('#newMessageModal').modal('show');
        $('#receiverEmail').val(targetEmail);
    }, 500);
});
// 모달이 열릴 때 새로 입력 폼 초기화
$('#newMessageModal').on('show.bs.modal', function (event) {
  // 이 모달 내부의 form 태그를 reset
  // (form 안에 들어있는 input, textarea 등을 초기화)
  $(this).find('form')[0].reset();
});
    // 답장하기 버튼 클릭 시, 해당 이메일로 답장 폼 열기
$('#replyButton').on('click', function () {
    var receiverEmail = $(this).data('receiver-email'); // 모달에서 receiverEmail 가져오기
    $('#newMessageModal').find('#receiverEmail').val(receiverEmail); // 답장 폼에 이메일 설정
});
$('.message-link').on('click', function () {
    var tab = $(this).data('tab'); // 현재 탭 정보 ('received' 또는 'sent')
    var messageId = $(this).data('message-id'); // 메시지 ID 가져오기
    var row = $(this).closest('tr'); // 현재 행

    // 받은 쪽지에서만 읽음 상태 업데이트
    if (tab === 'received') {
        // AJAX 요청으로 읽음 상태 업데이트
        $.ajax({
            url: '/updateMessageReadStatus', // 서버에서 읽음 상태를 업데이트하는 URL
            type: 'POST',
            data: { messageId: messageId },
            success: function () {
                // 읽음 상태 UI 업데이트
                row.removeClass('unread').addClass('read'); // 배경색 변경
                row.find('i').removeClass('bi-envelope-fill text-primary')
                             .addClass('bi-envelope-open text-secondary'); // 아이콘 변경
            },
            error: function () {
                alert('메시지 읽음 상태를 업데이트하는 데 실패했습니다.');
            }
        });
    }
});
</script>

</body>
</html>