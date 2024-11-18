package com.spring.mom.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mom.vo.UserVO;

@Repository
public class UserDAOMybatis {
	@Autowired
	SqlSessionTemplate mybatis;
	
	
	public UserVO getUserById(String userId) {
	    return mybatis.selectOne("UserDAO.getUserById", userId);
	}
	
	public UserVO getUser(String u_id) {
        return mybatis.selectOne("UserDAO.getUser", u_id);  
    }
	
	public int joinUser(UserVO vo) {
		return mybatis.insert("UserDAO.joinUser", vo);
	}
	
	public int checkUserId(String u_id) {
	    return mybatis.selectOne("UserDAO.checkUserId", u_id);
	}
	
	public int checkUserNn(String u_nickname) {
	    return mybatis.selectOne("UserDAO.checkUserNn", u_nickname);
	}
	
	public List<UserVO> findUserId(UserVO vo) {
	    return mybatis.selectList("UserDAO.findUserId", vo);
	}

	public List<UserVO> findUserByNameAndPhone(UserVO vo) {
        return mybatis.selectList("UserDAO.findUserByNameAndPhone", vo);
    }
    
    // 비밀번호 업데이트
    public int updatePassword(UserVO vo) {
        return mybatis.update("UserDAO.updatePassword", vo);
    }
}
