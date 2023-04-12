package com.jxau.mapper;

import com.jxau.entity.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface UserMapper {
    /**
     * 根据用户名和密码查询用户对象
     * @param username
     * @param password
     * @return
     */
    @Select("select * from user where loginname = #{username} and pwd = #{password}")
    public User selectUser(@Param("username") String username, @Param("password")  String password);
}
