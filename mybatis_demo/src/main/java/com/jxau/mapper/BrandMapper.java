package com.jxau.mapper;


import com.jxau.pojo.Brand;

import java.util.List;

public interface BrandMapper {

/**
 * 查询所有
 */
     List<Brand> selectAll();

     /**
      * 查看详情：根据Idchaxun
      */
     Brand selectById(int id);

}
