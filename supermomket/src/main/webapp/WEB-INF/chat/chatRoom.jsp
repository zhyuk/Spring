<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../view/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>채팅방</title>
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <style>
        .chat-container {
            max-width: 800px;
            margin: 20px auto;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

      
.chat-messages {
    height: 400px;
    overflow-y: auto;
    padding: 20px;
    background: #f8f9fa;
    display: flex;
    flex-direction: column;
}

     .message {
    margin-bottom: 10px;
    padding: 10px;
    border-radius: 5px;
    max-width: 70%;
    word-break: break-word;
    clear: both;
    position: relative;
    display: flex;
    flex-direction: column;
}

     
.message.mine {
    background: #007bff;
    color: white;
    margin-left: auto !important;
    margin-right: 10px !important;
    align-self: flex-end;
}

  .message.other {
    background: white;
    margin-right: auto !important;
    margin-left: 10px !important;
    align-self: flex-start;
    border: 1px solid #ddd;
}
        .chat-input {
            display: flex;
            padding: 20px;
            border-top: 1px solid #ddd;
        }

        .chat-input input {
            flex: 1;
            padding: 10px;
            margin-right: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .chat-input button {
            padding: 10px 20px;
            background: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .sender-name {
            font-size: 0.8em;
            margin-bottom: 5px;
            color: #666;
        }

        .message-time {
            font-size: 0.7em;
            color: #888;
            margin-left: 8px;
        }

        .message.mine .message-time {
            color: rgba(255, 255, 255, 0.7);
        }

        .chat-header {
            padding: 15px;
            background: #f8f9fa;
            border-bottom: 1px solid #ddd;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top:150px;
        }

        .back-button {
            padding: 5px 10px;
            background: #6c757d;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            font-size: 0.9em;
        }

         .message.system {
        text-align: center;
        max-width: 100%;
        margin: 10px 0;
        padding: 5px;
    }
       .system-message {
        display: inline-block;
        background-color: rgba(0, 0, 0, 0.05);
        padding: 5px 15px;
        border-radius: 15px;
        font-size: 0.9em;
        color: #666;
    }

        /* 반응형 디자인 */
        @media (max-width: 768px) {
            .chat-container {
                margin: 10px;
                max-width: 100%;
            }
            .message {
                max-width: 85%;
            }
        }
    </style>
</head>
<body>
	<%@ include file="../view/menu.jsp"%>
    <div class="chat-container">
        <div class="chat-header">
            <h2>채팅방</h2>
            <a href="${pageContext.request.contextPath}/chat/rooms.do" class="back-button">목록으로</a>
        </div>
        <div class="chat-messages" id="messageArea">
            <c:if test="${not empty messages}">
    <c:forEach var="message" items="${messages}">
        <div class="message ${message.senderId eq userId ? 'mine' : 'other'}">
            <div class="message-content">
                <c:if test="${message.senderId ne userId}">
                    <div class="sender-name">${message.senderNickname}</div>
                </c:if>
                <div class="text">${message.message}</div>
                <div class="message-time">
                    <fmt:formatDate value="${message.sentAt}" pattern="HH:mm"/>
                </div>
            </div>
        </div>
    </c:forEach>
</c:if>

        </div>
        <div class="chat-input">
            <input type="text" id="messageInput" placeholder="메시지를 입력하세요...">
            <button onclick="sendMessage()">전송</button>
        </div>
    </div>

    <script>
        const roomId = '${roomId}';
        const userId = '${userId}';
        const userNickname = '${userNickname}';
        let ws;
        let isConnected = false;
        let messageQueue = [];

        function connectWebSocket() {
            try {
            	const sock = new SockJS('${pageContext.request.contextPath}/ws/chat?roomId=' + parseInt(roomId) + '&userId=' + encodeURIComponent(userId));
                ws = sock;
                
                ws.onopen = function() {
                    console.log('웹소켓 연결 성공');
                    isConnected = true;
                    
                   
                    while(messageQueue.length > 0) {
                        const msg = messageQueue.shift();
                        ws.send(JSON.stringify(msg));
                    }
             
                };
                ws.onmessage = function(event) {
                    const message = JSON.parse(event.data);
                    const messageArea = document.getElementById('messageArea');
                    
                    if (message.type === 'CHAT') {
                        // 일반 채팅 메시지
                        const messageDiv = document.createElement('div');
                        messageDiv.className = message.senderId === userId ? 'message mine' : 'message other';
                        
                        const contentDiv = document.createElement('div');
                        contentDiv.className = 'message-content';
                        
                        // 발신자 닉네임 표시 (자신의 메시지가 아닐 경우에만)
                        if (message.senderId !== userId && message.senderNickname) {
                            const nicknameDiv = document.createElement('div');
                            nicknameDiv.className = 'sender-name';
                            nicknameDiv.textContent = message.senderNickname;
                            contentDiv.appendChild(nicknameDiv);
                        }
                        
                        // 메시지 내용
                        const textDiv = document.createElement('div');
                        textDiv.className = 'text';
                        textDiv.textContent = message.message;
                        contentDiv.appendChild(textDiv);
                        
                        // 시간 표시
                        const timeDiv = document.createElement('div');
                        timeDiv.className = 'message-time';
                        timeDiv.textContent = new Date(message.sentAt).toLocaleTimeString('ko-KR', {
                            hour: '2-digit',
                            minute: '2-digit'
                        });
                        contentDiv.appendChild(timeDiv);
                        
                        messageDiv.appendChild(contentDiv);
                        messageArea.appendChild(messageDiv);
                    } else if (message.type === 'LEAVE' && message.message.includes('채팅방을 나갔습니다')) {
                        // 채팅방 나가기 메시지
                        const systemDiv = document.createElement('div');
                        systemDiv.className = 'message system';
                        
                        const contentDiv = document.createElement('div');
                        contentDiv.className = 'system-message';
                        contentDiv.textContent = message.message;
                        
                        systemDiv.appendChild(contentDiv);
                        messageArea.appendChild(systemDiv);
                    }
                    
                    scrollToBottom();
                };
                
                ws.onclose = function() {
                    console.log('웹소켓 연결 종료');
                    isConnected = false;
                    setTimeout(connectWebSocket, 1000);
                };

                ws.onerror = function(error) {
                    console.error('웹소켓 에러:', error);
                    isConnected = false;
                };
                
            } catch (error) {
                console.error('WebSocket 연결 실패:', error);
                setTimeout(connectWebSocket, 1000);
            }
        }
        
        window.onbeforeunload = function() {
            if (ws && isConnected) {
                const leaveMessage = {
                    type: 'LEAVE',
                    roomId: roomId,
                    senderId: userId,
                    senderNickname: userNickname
                };
                ws.send(JSON.stringify(leaveMessage));
                ws.close();
            }
        };

        function appendSystemMessage(message) {
            const messageArea = document.getElementById('messageArea');
            const messageDiv = document.createElement('div');
            messageDiv.className = 'message system';
            
            const systemDiv = document.createElement('div');
            systemDiv.className = 'system-message';
            systemDiv.textContent = message.message;
            
            messageDiv.appendChild(systemDiv);
            messageArea.appendChild(messageDiv);
            scrollToBottom();
        }

        function appendLocalMessage(messageText) {
            const messageArea = document.getElementById('messageArea');
            const messageDiv = document.createElement('div');
            
            // 내 메시지이므로 항상 'mine' 클래스 사용
            messageDiv.className = 'message mine';
            
            const contentDiv = document.createElement('div');
            contentDiv.className = 'message-content';
            
            const textDiv = document.createElement('div');
            textDiv.className = 'text';
            textDiv.textContent = messageText;
            
            const timeDiv = document.createElement('div');
            timeDiv.className = 'message-time';
            timeDiv.textContent = new Date().toLocaleTimeString('ko-KR', {
                hour: '2-digit',
                minute: '2-digit'
            });
            
            contentDiv.appendChild(textDiv);
            contentDiv.appendChild(timeDiv);
            messageDiv.appendChild(contentDiv);
            messageArea.appendChild(messageDiv);
            scrollToBottom();
        }

        function sendMessage() {
            const messageInput = document.getElementById('messageInput');
            const message = messageInput.value.trim();
            
            if (!message) return;
            
            console.log('메시지 전송 시도:', message);
            console.log('웹소켓 상태:', ws.readyState);
            
            const chatMessage = {
                type: 'CHAT',
                roomId: parseInt(roomId),
                senderId: userId,
                senderNickname: userNickname,
                message: message,
                sentAt: new Date().toISOString()
            };
            
            try {
                if (isConnected && ws.readyState === WebSocket.OPEN) {
                    // 메시지를 먼저 화면에 표시
                    appendLocalMessage(message);
                    // 그 다음 서버로 전송
                    ws.send(JSON.stringify(chatMessage));
                    messageInput.value = '';
                } else {
                    messageQueue.push(chatMessage);
                    if (!isConnected) {
                        connectWebSocket();
                    }
                }
            } catch(e) {
                console.error('메시지 전송 실패:', e);
            }
        }

        function scrollToBottom() {
            const messageArea = document.getElementById('messageArea');
            messageArea.scrollTop = messageArea.scrollHeight;
        }

        document.getElementById('messageInput').addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                sendMessage();
            }
        });

        window.addEventListener('load', function() {
            if (!roomId || !userId) {
                console.error('방 정보 또는 사용자 정보가 없습니다.');
                alert('채팅방 접속에 필요한 정보가 부족합니다.');
                window.location.href = '${pageContext.request.contextPath}/chat/rooms.do';
                return;
            }
            
            connectWebSocket();
            scrollToBottom();
        });

        window.onbeforeunload = function() {
            if (ws && isConnected) {
                const leaveMessage = {
                    type: 'LEAVE',
                    roomId: roomId,
                    senderId: userId,
                    senderNickname: userNickname,
                    message: '퇴장했습니다.'
                };
                ws.send(JSON.stringify(leaveMessage));
                ws.close();
            }
        };
    </script>
</body>
</html>