package com.jxau;

import com.jxau.Dao.MessageDao;
import com.jxau.Dao.impl.MessageDaoImpl;
import com.jxau.pojo.Message;

import java.util.Date;
import java.util.Scanner;

public class TestApp {

    public static void main(String[] args) {
        System.out.println("-----欢迎登录留言板系统-----");
        login();
    }

    public static void login(){
        System.out.println("-----主菜单-----");
        System.out.println("   1.查询留言");
        System.out.println("   2.添加留言");
        System.out.println("   3.退出系统");
        System.out.println("请选择");
        Scanner input = new Scanner(System.in);
        int num = input.nextInt();
        MessageDao messageDao = new MessageDaoImpl();

        if (num==1){
            messageDao.selectAll();
        }
        if (num==2){
            Scanner scanner = new Scanner(System.in);
            System.out.println("请输入留言人姓名：");
            String userName = scanner.next();
            System.out.println("请输入留言标题：");
            String title = scanner.next();
            System.out.println("请输入留言内容：");
            String contents = scanner.next();
            Date date = new Date();
            String a = date.toString();
            Message message = new Message();
            message.setUserName(userName);
            message.setTitle(title);
            message.setContents(contents);
            message.setCreateTime(a);
            messageDao.addMessage(message);
        }
        if (num==3){
            System.out.println("谢谢使用，再见！");
        }
    }
}
