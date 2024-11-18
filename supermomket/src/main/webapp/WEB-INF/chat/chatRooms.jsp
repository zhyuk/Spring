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
        
        .chat-room-content {
    display: flex;
    align-items: center;
    gap: 20px;
}
      .chat-room-item {
    padding: 15px;
    border-bottom: 1px solid #eee;
    cursor: pointer;
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


.product-image {
    flex-shrink: 0;
    width: 100px;
    height: 100px;
    object-fit: cover;
    border-radius: 8px;
}


    .delete-button:hover {
        opacity: 1;
    }


.chat-info-wrapper {
    flex: 1;
    min-width: 0;
}

   
.chat-content {
    color: #666;
}
        .chat-room-item:hover {
            background-color: #f8f9fa;
            transform: translateY(-2px);
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .product-name {
    font-weight: bold;
    font-size: 16px;
}

      
.chat-info {
    display: flex;
    justify-content: space-between;
    margin-bottom: 4px;
    font-size: 14px;
}
        .user-info {
            color: #555;
            font-size: 0.9em;
        }
      .last-message {
    color: #888;
    font-size: 14px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
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
        
        

@media screen and (max-width: 425px) {
    .chat-room-list {
        max-width: 100%;
        margin: 12px;
    }

    .header {
        margin-top: 20px;
        margin-bottom: 16px;
        padding-bottom: 8px;
    }

    .header h2 {
        font-size: 18px;
    }

    .back-button {
        padding: 6px 12px;
        font-size: 12px;
    }

    .chat-room-item {
        padding: 12px;
    }

    .chat-room-content {
        gap: 12px;
    }

    .product-image {
        width: 70px;
        height: 70px;
        border-radius: 6px;
    }

    .chat-info-wrapper {
        flex: 1;
    }

    .product-name {
        font-size: 14px;
        max-width: 180px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }

    .chat-room-header {
        margin-bottom: 4px;
    }

    .delete-button {
        padding: 4px;
        font-size: 1em;
    }

    .chat-info {
        flex-direction: column;
        gap: 2px;
        margin-bottom: 2px;
    }

    .user-info {
        font-size: 12px;
        max-width: 100%;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }

    .chat-time {
        font-size: 11px;
    }

    .last-message {
        font-size: 12px;
        max-width: 200px;
    }

    .no-rooms {
        padding: 20px;
        margin-top: 16px;
        font-size: 14px;
    }

    .chat-room-item:hover {
        transform: none;
        box-shadow: none;
    }
}
        
    </style>
</head>
<body>
	<%@ include file="../view/menu.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
              <div class="chat-room-item" onclick="enterChatRoom(${room.roomId})">
    <div class="chat-room-content">
        <c:set var="firstImage" value="${fn:split(room.productImage, ',')[0]}" />
        <img src="${pageContext.request.contextPath}/resources/img/trade/${firstImage}" 
             alt="${room.productName}" 
             class="product-image" 
             style="width: 100px; height: 100px; object-fit: cover;" />
        
        <div class="chat-info-wrapper">
            <div class="chat-room-header">
                <div class="product-name">${room.productName}</div>
                <button class="delete-button" onclick="deleteChatRoom(event, ${room.roomId})">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            <div class="chat-content">
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
        event.stopPropagation(); 
        
        if (confirm('채팅방을 나가시겠습니까?')) {
            fetch('${pageContext.request.contextPath}/chat/deleteRoom.do', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    roomId: roomId,
                    userId: '${userId}' 
                })
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                  
                    const chatRoom = event.target.closest('.chat-room-item');
                    chatRoom.remove();
                    
                    
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
    
    $('link[href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"]').remove();
    $('link[href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"]').remove();
    $('script[src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"]').remove();
</script>
  <%@ include file="../view/footer.jsp" %>
</body>
</html>