package com.jxau.service.impl;

import com.jxau.entity.PageBean;
import com.jxau.entity.Supplier;
import com.jxau.mapper.SupplierMapper;
import com.jxau.service.SupplierService;
import com.jxau.utils.SqlSessionFactoryUtils;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import java.util.List;

public class SupplierServiceImpl implements SupplierService {

    SqlSessionFactory factory = SqlSessionFactoryUtils.getSqlSessionFactory();

    public List<Supplier> selectAll() {
        SqlSession sqlSession = factory.openSession();
        SupplierMapper mapper = sqlSession.getMapper(SupplierMapper.class);
        List<Supplier> suppliers = mapper.selectAll();

        sqlSession.close();

        return suppliers;
    }

    public void addSupplier(Supplier supplier) {
        SqlSession sqlSession = factory.openSession();
        SupplierMapper mapper = sqlSession.getMapper(SupplierMapper.class);
        mapper.addSupplier(supplier);
        sqlSession.commit();
        sqlSession.close();
    }

    public void deleteSupplier(Integer id) {
        SqlSession sqlSession = factory.openSession();
        SupplierMapper mapper = sqlSession.getMapper(SupplierMapper.class);
        mapper.deleteSupplier(id);
        sqlSession.commit();
        sqlSession.close();
    }

    public void updateSupplier(Supplier supplier) {
        SqlSession sqlSession = factory.openSession();
        SupplierMapper mapper = sqlSession.getMapper(SupplierMapper.class);
        mapper.updateSupplier(supplier);
        sqlSession.commit();
        sqlSession.close();
    }


    /**
     * 分页条件查询
     * @param _currentPage
     * @param _rows
     * @return
     */
    public PageBean<Supplier> findSupplierByPage(String _currentPage, String _rows,String condition) {
        SqlSession sqlSession = factory.openSession();
        SupplierMapper mapper = sqlSession.getMapper(SupplierMapper.class);

        int currentPage = Integer.parseInt(_currentPage);
        int rows = Integer.parseInt(_rows);
        //创建新的PageBean对象
        PageBean<Supplier> pb = new PageBean<Supplier>();
        //设置参数
        pb.setCurrentPage(currentPage);
        pb.setRows(rows);


        //调用mapper查询总记录数
        int totalCount = mapper.findTotalCount(condition);
        pb.setTotalCount(totalCount);
        //调用mapper查询list集合，计算开始的记录索引
        int start = (currentPage-1)*rows;
        List<Supplier> list = mapper.findByPage(start,rows,condition);
        pb.setList(list);

        //计算总页码
        int totalPage = (totalCount % rows) ==0? totalCount/rows : (totalCount/rows)+1;
        pb.setTotalPage(totalPage);

        sqlSession.close();
        return pb;

    }

}
