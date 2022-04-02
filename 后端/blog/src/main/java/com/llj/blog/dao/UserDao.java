package com.llj.blog.dao;

import com.llj.blog.bean.Article;
import com.llj.blog.bean.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Repository
public interface UserDao {

    @Select("select * from users where user_name=#{user_name} and user_password=#{user_password}")
    public User getUserByMessage(@Param("user_name") String user_name,@Param("user_password") String user_password);

    @Select("select * from users where user_name = #{user_name}")
    public User getUserByUsername(@Param("user_name") String user_name);

    @Insert("INSERT INTO users (user_name, user_password, user_email) VALUES (#{user_name},#{user_password},#{user_email})")
    public Integer Register(
            @Param("user_name") String user_name,
            @Param("user_password") String user_password,
            @Param("user_email") String user_email
     );

    @Select("select * from users where user_id=#{user_id}")
    public User getUser(@Param("user_id") String id);

    @Select("select * from users where user_name like '%${keyword}%'")
    public List<User> search(@RequestParam("keyword")String keyword);

    @Update("update users set user_id=#{user_id},user_name=#{user_name},user_password=#{user_password},user_email=#{user_email} where user_id = #{user_id}")
    public Integer updateUser(
            @Param("user_id") int id,
            @Param("user_name") String name,
            @Param("user_password") String password,
            @Param("user_email") String email);

    @Select("select * from users")
    public List<User> getAllUsers();
}
