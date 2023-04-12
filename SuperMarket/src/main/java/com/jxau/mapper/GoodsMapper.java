package com.jxau.mapper;

import com.jxau.entity.Goods;
import org.apache.ibatis.annotations.*;
import java.util.List;

public interface GoodsMapper {


    /**
     * 添加商品
     * @param goods
     */
    @ResultMap("goodsMapper")
    @Insert("insert into goods values(null,#{name},#{specs},#{sn},#{price},#{stock},#{stock})")
    void addGoods(Goods goods);

    /**
     * 删除商品
     * @param id
     */
    @Delete("delete from goods where id = #{id}")
    void deleteGoods(Integer id);

    /**
     * 修改商品
     * @param goods
     */
    @Update("update goods set name=#{name},specs=#{specs},sn=#{sn},price=#{price},stock=#{stock} where id=#{id}")
    void updateGoods(Goods goods);

    /**
     * 查询商品
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
    List<Goods> findByPage(@Param("start") int start, @Param("rows") int rows, @Param("condition") String condition);
}
