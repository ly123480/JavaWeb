package com.jxau.test;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import redis.clients.jedis.Jedis;

public class JedisTest {
    private Jedis jedis;

    @BeforeEach
    void setUp(){
        //1. 建立连接
        jedis = new Jedis("192.168.157.128",6379);
        //2. 设置密码
        jedis.auth("123456");
        //3.选择库
        jedis.select(0);

    }



    @Test
    void testString(){
        //存入数据
        String result = jedis.set("name","乔丹");
        System.out.println(result);

        //获取数据
        String name = jedis.get("name");
        System.out.println(name);
    }

    @AfterEach
    void tearDown() {
        if(jedis!=null){
            //关闭连接
            jedis.close();
        }
    }
}
