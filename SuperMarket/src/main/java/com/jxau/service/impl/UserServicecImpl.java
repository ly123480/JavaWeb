package com.jxau.service.impl;

import com.jxau.entity.User;
import com.jxau.mapper.UserMapper;
import com.jxau.service.UserService;
import com.jxau.utils.SqlSessionFactoryUtils;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class UserServicecImpl implements UserService {
    SqlSessionFactory factory = SqlSessionFactoryUtils.getSqlSessionFactory();
    public User findUser(String username, String password) {
        SqlSession sqlSession = factory.openSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        //调用方法
        User user = mapper.selectUser(username,password);
        //释放资源
        sqlSession.close();

        return user;
    }
}


