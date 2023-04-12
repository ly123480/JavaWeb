package com.jxau.service.impl;

import com.jxau.entity.PageBean;;
import com.jxau.entity.Sale;
import com.jxau.mapper.SaleMapper;
import com.jxau.service.SaleService;
import com.jxau.utils.SqlSessionFactoryUtils;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class SaleServiceImpl implements SaleService {
    SqlSessionFactory factory = SqlSessionFactoryUtils.getSqlSessionFactory();

    public void addSale(Sale sale) {
        SqlSession sqlSession = factory.openSession();
        SaleMapper mapper = sqlSession.getMapper(SaleMapper.class);
        mapper.addSale(sale);
        sqlSession.commit();
        sqlSession.close();
    }

    public PageBean<Sale> findSaleByPage(String _currentPage, String _rows, String condition) {
        SqlSession sqlSession = factory.openSession();
        SaleMapper mapper = sqlSession.getMapper(SaleMapper.class);
        int currentPage = Integer.parseInt(_currentPage);
        int rows = Integer.parseInt(_rows);
        //创建新的PageBean对象
        PageBean<Sale> pb = new PageBean<Sale>();
        //设置参数
        pb.setCurrentPage(currentPage);
        pb.setRows(rows);


        //调用mapper查询总记录数
        int totalCount = mapper.findTotalCount(condition);
        pb.setTotalCount(totalCount);
        //调用mapper查询list集合，计算开始的记录索引
        int start = (currentPage-1)*rows;
        List<Sale> list = mapper.findByPage(start,rows,condition);
        pb.setList(list);

        //计算总页码
        int totalPage = (totalCount % rows) ==0? totalCount/rows : (totalCount/rows)+1;
        pb.setTotalPage(totalPage);

        sqlSession.close();
        return pb;
    }
}
