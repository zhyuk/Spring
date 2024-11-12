package com.spring.mom.svc.impl;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mom.dao.UserDAOMybatis;
import com.spring.mom.svc.UserService;
import com.spring.mom.vo.UserVO;

@Service("userService")
public class UserServeImpl implements UserService{
	@Autowired
	private UserDAOMybatis userDAO;

	
	@Override
	public UserVO getUserById(String userId) {
	    return userDAO.getUserById(userId);
	}
	
	@Override
	public UserVO getUser(UserVO vo) {
		return userDAO.getUser(vo.getU_id());
	}

	@Override
	public int joinUser(UserVO vo) {
		String hashedPassword = BCrypt.hashpw(vo.getU_pw(), BCrypt.gensalt());
        vo.setU_pw(hashedPassword);
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

	public boolean authenticateUser(String u_id, String password) {
        UserVO user = userDAO.getUser(u_id);
        if (user == null) {
            return false; 
        }

        return BCrypt.checkpw(password, user.getU_pw());
    }
}
