package com.jxau.Dao.impl;

import com.jxau.Dao.MessageDao;
import com.jxau.Utils.DBUtils;
import com.jxau.pojo.Message;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import static com.jxau.TestApp.login;

public class MessageDaoImpl implements MessageDao {

    /**
     * 查询所有留言
     */
    public List selectAll() {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Message> list = new ArrayList<Message>();
        String sql = "select * from message";

        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String userName = rs.getString("userName");
                String title = rs.getString("title");
                String contents = rs.getString("contents");
                String createTime = rs.getString("createTime");
                //将数据封装进message
                Message message = new Message();
                message.setId(id);
                message.setUserName(userName);
                message.setTitle(title);
                message.setContents(contents);
                message.setCreateTime(createTime);
                //3.集合处理
                list.add(message);
            }
            for (int i = 0; i < list.size(); i++) {
                Message message = list.get(i);
                System.out.println("留言人：" + message.getUserName() + "        " + "留言时间" + message.getCreateTime());
                System.out.println("留言标题：" + message.getTitle());
                System.out.println("留言内容：" + message.getContents());
                System.out.println("");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtils.closeAll(conn,ps,rs);
        }
        login();
        return list;
    }


    /**
     * 添加留言
     */
    public int addMessage(Message message) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int row=0;
        String sql = "insert into message(userName,title,contents,createTime) values (?,?,?,?)";

        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1,message.getUserName());
            ps.setString(2,message.getTitle());
            ps.setString(3,message.getContents());
            ps.setString(4,message.getCreateTime());
            row = ps.executeUpdate();
            if (row>0){
                System.out.println("留言成功！");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtils.closeAll(conn,ps,rs);
        }
        login();
        return row;
    }
}
