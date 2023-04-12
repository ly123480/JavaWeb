package com.jxau.mapper;

import com.jxau.entity.Restock;
import org.apache.ibatis.annotations.*;
import java.util.List;
import java.util.Map;

public interface RestockMapper {
    /**
     * 添加进货记录
     * @param restock
     */
    @Insert("insert into restock values(null,#{goodsname},null,#{price},#{stock},#{tradedate} )")
    void addRestock(Restock restock);


    /**
     * 查询进货记录
     * @return
     * @param
     */
    int findTotalCount(@Param("condition") String condition,@Param("condition2") String condition2);

    /**
     * 分页查询每页记录
     * 条件查询
     * @param start
     * @param rows
     * @return
     */
    List<Restock> findByPage(@Param("start") int start, @Param("rows") int rows, @Param("condition") String condition,@Param("condition2") String condition2);
}
