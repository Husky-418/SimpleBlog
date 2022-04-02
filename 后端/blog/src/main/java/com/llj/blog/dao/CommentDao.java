package com.llj.blog.dao;

import com.llj.blog.bean.Comment;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentDao {

    @Select("select * from comments where article_id=#{article_id}")
    public List<Comment> getComment(@Param("article_id") String id);

    @Insert("insert into comments(user_id,article_id,comment_content) values(#{user_id},#{article_id},#{comment_content})")
    public Integer writeComment(@Param("comment_content") String comment_content,
                               @Param("user_id") int user_id,
                               @Param("article_id") int article_id);
}
