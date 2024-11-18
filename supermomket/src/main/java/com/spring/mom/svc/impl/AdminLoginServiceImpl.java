package com.spring.mom.svc.impl;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mom.dao.AdminLoginDAO;
import com.spring.mom.svc.AdminLoginService;
import com.spring.mom.vo.UserVO;

@Service("adminLoginService")
public class AdminLoginServiceImpl implements AdminLoginService {
	@Autowired
	private AdminLoginDAO adminLoginDAO;
	
	@Override
	public UserVO getUser(UserVO vo) {
		return adminLoginDAO.getUser(vo.getU_id());
	}
	
	public boolean authenticateUser(String u_id, String password) {
        UserVO user = adminLoginDAO.getUser(u_id);
        if (user == null) {
            return false; 
        }

        return BCrypt.checkpw(password, user.getU_pw());
    }
}
