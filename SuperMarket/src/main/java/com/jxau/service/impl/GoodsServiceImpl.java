package com.jxau.service.impl;

import com.jxau.entity.Goods;
import com.jxau.entity.PageBean;
import com.jxau.mapper.GoodsMapper;
import com.jxau.service.GoodsService;
import com.jxau.utils.SqlSessionFactoryUtils;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class GoodsServiceImpl implements GoodsService {
    SqlSessionFactory factory = SqlSessionFactoryUtils.getSqlSessionFactory();

    public void addGoods(Goods goods) {
        SqlSession sqlSession = factory.openSession();
        GoodsMapper mapper = sqlSession.getMapper(GoodsMapper.class);
        mapper.addGoods(goods);
        sqlSession.commit();
        sqlSession.close();
    }

    public void deleteGoods(Integer id) {
        SqlSession sqlSession = factory.openSession();
        GoodsMapper mapper = sqlSession.getMapper(GoodsMapper.class);
        mapper.deleteGoods(id);
        sqlSession.commit();
        sqlSession.close();
    }

    public void updateGoods(Goods goods) {
        SqlSession sqlSession = factory.openSession();
        GoodsMapper mapper = sqlSession.getMapper(GoodsMapper.class);
        mapper.updateGoods(goods);
        sqlSession.commit();
        sqlSession.close();
    }

    public PageBean<Goods> findGoodsByPage(String _currentPage, String _rows, String condition) {
        SqlSession sqlSession = factory.openSession();
        GoodsMapper mapper = sqlSession.getMapper(GoodsMapper.class);
        int currentPage = Integer.parseInt(_currentPage);
        int rows = Integer.parseInt(_rows);
        //创建新的PageBean对象
        PageBean<Goods> pb = new PageBean<Goods>();
        //设置参数
        pb.setCurrentPage(currentPage);
        pb.setRows(rows);


        //调用mapper查询总记录数
        int totalCount = mapper.findTotalCount(condition);
        pb.setTotalCount(totalCount);
        //调用mapper查询list集合，计算开始的记录索引
        int start = (currentPage-1)*rows;
        List<Goods> list = mapper.findByPage(start,rows,condition);
        pb.setList(list);

        //计算总页码
        int totalPage = (totalCount % rows) ==0? totalCount/rows : (totalCount/rows)+1;
        pb.setTotalPage(totalPage);

        sqlSession.close();
        return pb;
    }
}
