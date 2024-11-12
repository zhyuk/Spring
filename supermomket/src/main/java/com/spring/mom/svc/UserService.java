package com.spring.mom.svc;

import com.spring.mom.vo.UserVO;

public interface UserService {

	UserVO getUser(UserVO vo);
	int joinUser(UserVO vo);
	int checkUserId(String u_id);
	int checkUserNn(String u_nickname);
	UserVO getUserById(String userId);
	boolean authenticateUser(String u_id, String password);
}