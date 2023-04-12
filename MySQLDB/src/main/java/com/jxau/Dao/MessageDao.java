package com.jxau.Dao;

import com.jxau.pojo.Message;

import java.util.List;

public interface MessageDao {
    List selectAll();
    int addMessage(Message message);
}
