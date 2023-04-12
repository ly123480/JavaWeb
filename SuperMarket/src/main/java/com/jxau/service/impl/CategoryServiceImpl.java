package com.jxau.service.impl;

import com.jxau.entity.Category;
import com.jxau.entity.PageBean;
import com.jxau.mapper.CategoryMapper;
import com.jxau.service.CategoryService;
import com.jxau.utils.SqlSessionFactoryUtils;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class CategoryServiceImpl implements CategoryService {
    SqlSessionFactory factory = SqlSessionFactoryUtils.getSqlSessionFactory();

    public void addCategory(Category category) {
        SqlSession sqlSession = factory.openSession();
        CategoryMapper mapper = sqlSession.getMapper(CategoryMapper.class);
        mapper.addCategory(category);
        sqlSession.commit();
        sqlSession.close();
    }

    public void deleteCategory(Integer id) {
        SqlSession sqlSession = factory.openSession();
        CategoryMapper mapper = sqlSession.getMapper(CategoryMapper.class);
        mapper.deleteCategory(id);
        sqlSession.commit();
        sqlSession.close();
    }

    public void updateCategory(Category category) {
        SqlSession sqlSession = factory.openSession();
        CategoryMapper mapper = sqlSession.getMapper(CategoryMapper.class);
        mapper.updateCategory(category);
        sqlSession.commit();
        sqlSession.close();
    }

    public PageBean<Category> findCategoryByPage(String _currentPage, String _rows,String condition) {
        SqlSession sqlSession = factory.openSession();
        CategoryMapper mapper = sqlSession.getMapper(CategoryMapper.class);

        int currentPage = Integer.parseInt(_currentPage);
        int rows = Integer.parseInt(_rows);
        //创建新的PageBean对象
        PageBean<Category> pb = new PageBean<Category>();
        //设置参数
        pb.setCurrentPage(currentPage);
        pb.setRows(rows);


        //调用mapper查询总记录数
        int totalCount = mapper.findTotalCount(condition);
        pb.setTotalCount(totalCount);
        //调用mapper查询list集合，计算开始的记录索引
        int start = (currentPage-1)*rows;
        List<Category> list = mapper.findByPage(start,rows,condition);
        pb.setList(list);

        //计算总页码
        int totalPage = (totalCount % rows) ==0? totalCount/rows : (totalCount/rows)+1;
        pb.setTotalPage(totalPage);

        sqlSession.close();
        return pb;
    }
}
