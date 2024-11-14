<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../view/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>채팅방 목록</title>
    <style>
        .chat-room-list {
            max-width: 800px;
            margin: 20px auto;
        }
        .chat-room-item {
            border: 1px solid #ddd;
            padding: 15px;
            margin-bottom: 10px;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.2s ease;
        }
        
            .chat-room-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 8px;
    }

    .delete-button {
        background: none;
        border: none;
        color: #dc3545;
        cursor: pointer;
        padding: 5px;
        font-size: 1.1em;
        opacity: 0.7;
        transition: opacity 0.2s;
    }

    .delete-button:hover {
        opacity: 1;
    }

    .chat-content {
        cursor: pointer;
    }
        .chat-room-item:hover {
            background-color: #f8f9fa;
            transform: translateY(-2px);
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .product-name {
            font-weight: bold;
            color: #333;
            margin-bottom: 8px;
        }
        .chat-info {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 8px;
        }
        .user-info {
            color: #555;
            font-size: 0.9em;
        }
        .last-message {
            color: #666;
            font-size: 0.9em;
            margin-top: 5px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        .chat-time {
            color: #999;
            font-size: 0.8em;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid #eee;
            margin-top:70px;
        }
        .back-button {
            padding: 8px 15px;
            background-color: #6c757d;
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 0.9em;
        }
        .back-button:hover {
            background-color: #5a6268;
        }
        .no-rooms {
            text-align: center;
            padding: 30px;
            color: #666;
            background: #f8f9fa;
            border-radius: 5px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
	<%@ include file="../view/menu.jsp"%>
       <div class="chat-room-list">
        <div class="header">
            <h2>채팅방 목록</h2>
            <a href="${pageContext.request.contextPath}/trade.do" class="back-button">거래목록</a>
        </div>

        <c:choose>
            <c:when test="${empty rooms}">
                <div class="no-rooms">
                    <p>참여중인 채팅방이 없습니다.</p>
                </div>
            </c:when>
            <c:otherwise>
                <c:forEach items="${rooms}" var="room">
                    <%-- onclick 이벤트 수정 --%>
                   
<div class="chat-room-item">
    <div class="chat-room-header">
        <div class="product-name">${room.productName}</div>
        <button class="delete-button" onclick="deleteChatRoom(event, ${room.roomId})">
            <i class="fas fa-times"></i>
        </button>
    </div>
    <div class="chat-content" onclick="enterChatRoom(${room.roomId})">
        <div class="chat-info">
            <div class="user-info">
                판매자: ${room.sellerNickname} / 
                구매자: ${room.buyerNickname}
            </div>
            <div class="chat-time" data-timestamp="${room.createdAt}"></div>
        </div>
        <div class="last-message">${empty room.lastMessage ? '새로운 채팅방이 생성되었습니다.' : room.lastMessage}</div>
    </div>
</div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>

    <script>
    
    function enterChatRoom(roomId) {
        console.log("채팅방 입장:", roomId);
        location.href = '${pageContext.request.contextPath}/chat/room.do?roomId=' + roomId;
    }
    
    
        // 시간 표시 포맷팅
        function formatTime(timestamp) {
            const date = new Date(timestamp);
            const now = new Date();
            const diffInHours = Math.floor((now - date) / (1000 * 60 * 60));
            
            if (diffInHours < 24) {
                return date.toLocaleTimeString('ko-KR', { hour: '2-digit', minute: '2-digit' });
            } else if (diffInHours < 48) {
                return '어제';
            } else {
                return date.toLocaleDateString('ko-KR', { 
                    month: 'long', 
                    day: 'numeric'
                });
            }
        }

        // 페이지 로드 시 시간 포맷팅 적용
        document.addEventListener('DOMContentLoaded', function() {
            const timeElements = document.querySelectorAll('.chat-time');
            timeElements.forEach(element => {
                const timestamp = element.getAttribute('data-timestamp');
                if (timestamp) {
                    element.textContent = formatTime(timestamp);
                }
            });
        });
    
    
    function deleteChatRoom(event, roomId) {
        event.stopPropagation(); // 채팅방 입장 이벤트 방지
        
        if (confirm('채팅방을 나가시겠습니까?')) {
            fetch('${pageContext.request.contextPath}/chat/deleteRoom.do', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    roomId: roomId,
                    userId: '${userId}' // 현재 로그인한 사용자 ID
                })
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    // 화면에서 해당 채팅방 요소 제거
                    const chatRoom = event.target.closest('.chat-room-item');
                    chatRoom.remove();
                    
                    // 채팅방이 모두 삭제되었을 경우 "참여중인 채팅방이 없습니다" 메시지 표시
                    const remainingRooms = document.querySelectorAll('.chat-room-item');
                    if (remainingRooms.length === 0) {
                        const noRoomsDiv = document.createElement('div');
                        noRoomsDiv.className = 'no-rooms';
                        noRoomsDiv.innerHTML = '<p>참여중인 채팅방이 없습니다.</p>';
                        document.querySelector('.chat-room-list').appendChild(noRoomsDiv);
                    }
                } else {
                    alert('채팅방 나가기에 실패했습니다.');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('채팅방 나가기 중 오류가 발생했습니다.');
            });
        }
    }
</script>
</body>
</html>