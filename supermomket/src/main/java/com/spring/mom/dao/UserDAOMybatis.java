package com.spring.mom.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mom.vo.UserVO;

@Repository
public class UserDAOMybatis {
	@Autowired
	SqlSessionTemplate mybatis;
	
	public UserVO getUser(UserVO vo) {
		return (UserVO) mybatis.selectOne("UserDAO.getUser", vo);
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
}
