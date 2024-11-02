package com.spring.mom.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mom.vo.UserService;
import com.spring.mom.vo.UserVO;

@Service("userService")
public class UserServeImpl implements UserService{
	@Autowired
	private UserDAOMybatis userDAO;

	@Override
	public UserVO getUser(UserVO vo) {
		return userDAO.getUser(vo);
	}

	@Override
	public int joinUser(UserVO vo) {
		return userDAO.joinUser(vo);
	}
	
	@Override
	public int checkUserId(String u_id) {
	    return userDAO.checkUserId(u_id);
	}
	
	@Override
	public int checkUserNn(String u_nickname) {
	    return userDAO.checkUserNn(u_nickname);
	}
}
