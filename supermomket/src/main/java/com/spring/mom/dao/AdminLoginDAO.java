package com.spring.mom.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mom.vo.UserVO;

@Repository
public class AdminLoginDAO {
	@Autowired
	SqlSessionTemplate mybatis;
	
	public UserVO getUser(String u_id) {
        return mybatis.selectOne("AdminLoginDAO.getUser", u_id);  
    }
}
