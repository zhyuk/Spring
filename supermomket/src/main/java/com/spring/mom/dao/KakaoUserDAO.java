package com.spring.mom.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mom.vo.UserVO;

@Repository
public class KakaoUserDAO {

    @Autowired
    private SqlSession sqlSession;

    // 사용자 ID로 사용자 조회
    public UserVO getUserById(Long userId) {
        return sqlSession.selectOne("KakaoUserMapper.getUserById", userId);
    }

    // 신규 사용자 추가
    public void insertUser(UserVO user) {
        sqlSession.insert("KakaoUserMapper.insertUser", user);
    }
}
