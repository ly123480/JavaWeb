package com.jxau.mapper;

import com.jxau.entity.Supplier;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface SupplierMapper {

    /**
     * 查询所有供应商
     * @return
     */
    @Select("select * from supplier")
    List<Supplier> selectAll();

    /**
     * 添加供应商
     * @param supplier
     */
    @Insert("insert into supplier values(null,#{name},#{contacts},#{tel},#{info})")
    void addSupplier(Supplier supplier);

    /**
     * 删除供应商
     * @param id
     */
    @Delete("delete from supplier where id = #{id}")
    void deleteSupplier(Integer id);

    /**
     * 修改供应商
     * @param supplier
     */
    @Update("update supplier set name=#{name},contacts=#{contacts},tel=#{tel},info=#{info} where id=#{id}")
    void updateSupplier(Supplier supplier);

    /**
     * 查询总记录数
     * @return
     * @param
     */
//    @Select("select count(*) from supplier")
    int findTotalCount(String condition);

    /**
     * 分页查询每页记录
     * 条件查询
     * @param start
     * @param rows
     * @return
     */
//    @Select("select * from supplier limit #{start},#{rows}")
    List<Supplier> findByPage(@Param("start") int start, @Param("rows") int rows,@Param("condition") String condition);
}
