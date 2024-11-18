package com.spring.mom.svc;

import com.spring.mom.vo.UserVO;

public interface AdminLoginService {
	UserVO getUser(UserVO vo);
	boolean authenticateUser(String u_id, String password);
}
