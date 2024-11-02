package com.spring.mom.vo;

public interface UserService {

	UserVO getUser(UserVO vo);
	int joinUser(UserVO vo);
	int checkUserId(String u_id);
	int checkUserNn(String u_nickname);
}