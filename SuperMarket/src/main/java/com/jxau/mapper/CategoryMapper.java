package com.jxau.mapper;

import com.jxau.entity.Category;
import org.apache.ibatis.annotations.*;
import java.util.List;

public interface CategoryMapper {

    /**
     * 添加分类
     * @param category
     */
    @Insert("insert into category values(null,#{name},#{description})")
    void addCategory(Category category);

    /**
     * 删除分类
     * @param id
     */
    @Delete("delete from category where id = #{id}")
    void deleteCategory(Integer id);

    /**
     * 修改分类
     * @param category
     */
    @Update("update category set name=#{name},description=#{description} where id=#{id}")
    void updateCategory(Category category);

    /**
     * 查询总记录数
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
    List<Category> findByPage(@Param("start") int start, @Param("rows") int rows, @Param("condition") String condition);
}
