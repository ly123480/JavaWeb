package com.jxau.mapper;

import com.jxau.entity.Sale;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SaleMapper {
    /**
     * 添加进货记录
     * @param sale
     */
    @Insert("insert into sale values(#{id},#{tradetime})")
    void addSale(Sale sale);


    /**
     * 查询进货记录
     * @return
     * @param
     */
    int findTotalCount(String condition);

    /**
     * 分页查询每页记录
     * 条件查询
     * @param start
     * @param rows
     * @return
     */
    List<Sale> findByPage(@Param("start") int start, @Param("rows") int rows, @Param("condition") String condition);
}
