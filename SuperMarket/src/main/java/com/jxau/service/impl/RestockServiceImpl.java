package com.jxau.service.impl;

import com.jxau.entity.PageBean;
import com.jxau.entity.Restock;
import com.jxau.mapper.RestockMapper;
import com.jxau.service.RestockService;
import com.jxau.utils.SqlSessionFactoryUtils;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;
import java.util.Map;

public class RestockServiceImpl implements RestockService {
    SqlSessionFactory factory = SqlSessionFactoryUtils.getSqlSessionFactory();

    public void addGoods(Restock restock) {
        SqlSession sqlSession = factory.openSession();
        RestockMapper mapper = sqlSession.getMapper(RestockMapper.class);
        mapper.addRestock(restock);
        sqlSession.commit();
        sqlSession.close();
    }

    public PageBean<Restock> findRestockByPage(String _currentPage, String _rows, String condition,String condition2) {
        SqlSession sqlSession = factory.openSession();
        RestockMapper mapper = sqlSession.getMapper(RestockMapper.class);
        int currentPage = Integer.parseInt(_currentPage);
        int rows = Integer.parseInt(_rows);
        //创建新的PageBean对象
        PageBean<Restock> pb = new PageBean<Restock>();
        //设置参数
        pb.setCurrentPage(currentPage);
        pb.setRows(rows);


        //调用mapper查询总记录数
        int totalCount = mapper.findTotalCount(condition,condition2);
        pb.setTotalCount(totalCount);
        //调用mapper查询list集合，计算开始的记录索引
        int start = (currentPage-1)*rows;
        List<Restock> list = mapper.findByPage(start,rows,condition,condition2);
        pb.setList(list);

        //计算总页码
        int totalPage = (totalCount % rows) ==0? totalCount/rows : (totalCount/rows)+1;
        pb.setTotalPage(totalPage);

        sqlSession.close();
        return pb;
    }
}
