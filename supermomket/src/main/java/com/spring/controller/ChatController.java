package com.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.TextMessage;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.config.ChatHandler;
import com.spring.mom.vo.ChatMessageVO;
import com.spring.mom.vo.ChatRoomVO;
import com.spring.mom.vo.ChatService;

@Controller
@RequestMapping("/chat")
public class ChatController {
    
    @Autowired
    private ChatService chatService;
    
    @Autowired
    private ChatHandler chatHandler; 
    
    @PostMapping("/deleteRoom.do")
    @ResponseBody
    public Map<String, Boolean> deleteChatRoom(@RequestBody Map<String, Object> params, HttpSession session) {
        int roomId = Integer.parseInt(params.get("roomId").toString());
        String userId = params.get("userId").toString();
        
    
        ChatRoomVO room = chatService.getChatRoom(roomId);
        String nickname = userId.equals(room.getSellerId()) ? room.getSellerNickname() : room.getBuyerNickname();
        
        // WebSocket을 통해 퇴장 메시지 전송
        ChatMessageVO leaveMessage = new ChatMessageVO();
        leaveMessage.setType("LEAVE");
        leaveMessage.setRoomId(roomId);
        leaveMessage.setSenderId(userId);
        leaveMessage.setSenderNickname(nickname);
        leaveMessage.setMessage(nickname + "님이 채팅방을 나갔습니다.");
        leaveMessage.setSentAt(new java.sql.Timestamp(System.currentTimeMillis()));
        
        // WebSocket 핸들러를 통해 메시지 전송
        try {
            String messageJson = new ObjectMapper().writeValueAsString(leaveMessage);
            chatHandler.broadcastToRoom(String.valueOf(roomId), new TextMessage(messageJson));  // webSocketHandler를 chatHandler로 변경
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        // 채팅방 삭제 처리
        boolean success = chatService.markRoomAsDeleted(roomId, userId);
        
        Map<String, Boolean> response = new HashMap<>();
        response.put("success", success);
        return response;
    }
    
    
    // 채팅방 목록
    @GetMapping("/rooms.do")
    public String chatRooms(Model model, HttpSession session) {
        String userId = (String) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/login.do";
        }
        
        try {
            List<ChatRoomVO> rooms = chatService.getChatRoomList(userId);
            model.addAttribute("rooms", rooms);
            return "chat/chatRooms";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", "채팅방 목록을 불러오는데 실패했습니다.");
            return "error/errorPage";
        }
    }
    
    @RequestMapping(value = "/createRoom.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String createRoom(
            @RequestParam("sellerId") String sellerId,
            @RequestParam("buyerId") String buyerId,
            @RequestParam("tNo") int tNo,
            Model model,
            HttpSession session) {
        
        try {
            // 세션에서 userId 확인
            String sessionUserId = (String) session.getAttribute("userId");
            
            // 디버깅
            System.out.println("세션 userId: " + sessionUserId);
            System.out.println("요청된 buyerId: " + buyerId);
            
            // 로그인 체크
            if (sessionUserId == null || sessionUserId.trim().isEmpty()) {
                return "redirect:/login.do";
            }
            
            // 세션 사용자와 요청된 구매자가 일치하는지 확인
            if (!sessionUserId.equals(buyerId)) {
                model.addAttribute("errorMessage", "잘못된 접근입니다.");
                return "redirect:/trade_detail.do?t_no=" + tNo;
            }
            
            // 채팅방 생성
            ChatRoomVO room = chatService.createChatRoom(sellerId, buyerId, tNo);
            
            if (room != null) {
                return "redirect:/chat/room.do?roomId=" + room.getRoomId();
            } else {
                model.addAttribute("errorMessage", "채팅방 생성에 실패했습니다.");
                return "redirect:/trade_detail.do?t_no=" + tNo;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", "채팅방 생성 중 오류가 발생했습니다.");
            return "redirect:/trade_detail.do?t_no=" + tNo;
        }
    }


    @GetMapping("/room.do")
    public String chatRoom(@RequestParam("roomId") int roomId, Model model, HttpSession session) {
        String userId = (String) session.getAttribute("userId");
        
        if (userId == null) {
            return "redirect:/login.do";
        }
        
        try {
            ChatRoomVO room = chatService.getChatRoom(roomId);
            if (room == null) {
                return "redirect:/chat/rooms.do";
            }
            
            // 삭제된 채팅방 체크
            boolean isSeller = userId.equals(room.getSellerId());
            boolean isBuyer = userId.equals(room.getBuyerId());
            
            if ((isSeller && room.isDeletedSeller()) || 
                (isBuyer && room.isDeletedBuyer()) || 
                (!isSeller && !isBuyer)) {
                return "redirect:/chat/rooms.do";
            }
            
            List<ChatMessageVO> messages = chatService.getChatMessages(roomId);
            
            model.addAttribute("room", room);
            model.addAttribute("messages", messages);
            model.addAttribute("roomId", roomId);
            model.addAttribute("userId", userId);
            session.setAttribute("roomId", roomId);
            session.setAttribute("userId", userId);
            
            return "chat/chatRoom";
            
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", "채팅방을 불러오는데 실패했습니다.");
            return "error/errorPage";
        }
    }
    
    @PostMapping("/createDirectRoom.do")
    @ResponseBody
    public Map<String, Object> createDirectRoom(@RequestBody Map<String, Object> params, HttpSession session) {
        Map<String, Object> result = new HashMap<>();
        String userId = (String) session.getAttribute("userId");
        
        if (userId == null) {
            result.put("success", false);
            result.put("message", "로그인이 필요합니다.");
            return result;
        }
        
        try {
            String sellerId = (String) params.get("sellerId");
            Integer tNo = Integer.parseInt(params.get("tNo").toString());
            
            // 기존 채팅방 확인
            ChatRoomVO existingRoom = chatService.findExistingRoom(sellerId, userId, tNo);
            
            if (existingRoom != null) {
                // 기존 채팅방이 있으면 해당 방 번호 반환
                result.put("roomId", existingRoom.getRoomId());
            } else {
                // 새 채팅방 생성
                ChatRoomVO newRoom = chatService.createChatRoom(sellerId, userId, tNo);
                result.put("roomId", newRoom.getRoomId());
            }
            
            result.put("success", true);
            
        } catch (Exception e) {
            e.printStackTrace();
            result.put("success", false);
            result.put("message", "채팅방 생성 중 오류가 발생했습니다.");
        }
        
        return result;
    }
    
    // 채팅 메시지 저장
    @PostMapping("/message.do")
    @ResponseBody
    public Map<String, Object> saveMessage(@RequestBody ChatMessageVO message, HttpSession session) {
        Map<String, Object> result = new HashMap<>();
        String userId = (String) session.getAttribute("userId");
        
        if (userId == null) {
            result.put("success", false);
            result.put("message", "로그인이 필요합니다.");
            return result;
        }
        
        try {
            message.setSenderId(userId);
            chatService.saveMessage(message);
            result.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("success", false);
            result.put("message", "메시지 저장에 실패했습니다.");
        }
        
        return result;
    }
}