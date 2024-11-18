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
    max-width: 420px;
    margin: 20px auto;
    border: none;
    border-radius: 12px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    background: #fff;
    position: relative;
}

.chat-header {
    padding: 15px;
    background: #fff;
    border-bottom: 1px solid #eee;
    border-radius: 12px 12px 0 0;
    margin-top: 100px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.chat-header h2 {
    font-size: 1.2rem;
    color: #333;
    margin: 0;
    font-weight: 600;
}

.back-button {
    padding: 6px 12px;
    background: #4a90e2;
    color: white;
    border: none;
    border-radius: 6px;
    font-size: 0.85em;
    transition: all 0.2s ease;
}

.chat-messages {
    height: calc(100vh - 300px);
    min-height: 400px;
    overflow-y: auto;
    padding: 15px;
    background: #f8f9fa;
}

.message {
    margin-bottom: 10px;
    padding: 10px 12px;
    border-radius: 12px;
    max-width: 75%;
    word-break: break-word;
}

.message.mine {
    background: #4a90e2;
    color: white;
    margin-left: auto;
    border-bottom-right-radius: 4px;
}

.message.other {
    background: white;
    color: #333;
    margin-right: auto;
    border-bottom-left-radius: 4px;
    box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
}

.chat-input {
    display: flex;
    padding: 12px;
    background: #fff;
    border-top: 1px solid #eee;
    position: sticky;
    bottom: 0;
}

.chat-input input {
    flex: 1;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 20px;
    margin-right: 8px;
    font-size: 0.9em;
}

.chat-input button {
    padding: 8px 16px;
    background: #4a90e2;
    color: white;
    border: none;
    border-radius: 20px;
    font-size: 0.9em;
}

.system-message {
    background-color: rgba(0, 0, 0, 0.05);
    padding: 6px 12px;
    border-radius: 15px;
    font-size: 0.8em;
    color: #666;
    margin: 8px auto;
    text-align: center;
}

.sender-name {

	color : #4A90E2;
	font-weight:800;

}

@media (max-width: 425px) {
    .chat-container {
        margin: 0;
        height: 100vh;
        border-radius: 0;
    }
    
    .chat-header {
        margin-top: 0;
        border-radius: 0;
        padding: 12px;
    }
    
    .chat-messages {
        height: calc(100vh - 130px);
        min-height: auto;
    }
    
    .message {
        max-width: 85%;
        font-size: 0.95em;
    }
    
    .chat-input {
        padding: 8px;
    }
    
    .chat-input input {
        padding: 8px;
    }
    
    .chat-input button {
        padding: 8px 12px;
    }
}


.chat-messages::-webkit-scrollbar {
    width: 4px;
}

.chat-messages::-webkit-scrollbar-track {
    background: transparent;
}

.chat-messages::-webkit-scrollbar-thumb {
    background: #ddd;
    border-radius: 2px;
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
                     
                        const messageDiv = document.createElement('div');
                        messageDiv.className = message.senderId === userId ? 'message mine' : 'message other';
                        
                        const contentDiv = document.createElement('div');
                        contentDiv.className = 'message-content';
                        
                        
                        if (message.senderId !== userId && message.senderNickname) {
                            const nicknameDiv = document.createElement('div');
                            nicknameDiv.className = 'sender-name';
                            nicknameDiv.textContent = message.senderNickname;
                            contentDiv.appendChild(nicknameDiv);
                        }
                        
                     
                        const textDiv = document.createElement('div');
                        textDiv.className = 'text';
                        textDiv.textContent = message.message;
                        contentDiv.appendChild(textDiv);
                        
                      
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
                    appendLocalMessage(message);
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
        $('link[href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"]').remove();
        $('link[href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"]').remove();
        $('script[src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"]').remove();
        
    </script>
    <%@ include file="../view/footer.jsp" %>
</body>
</html>