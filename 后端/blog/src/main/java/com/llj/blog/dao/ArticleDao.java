package com.llj.blog.dao;

import com.llj.blog.bean.Article;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Repository
public interface ArticleDao {

    @Select("select * from articles")
    public List<Article> getArticles();

    @Select("select * from articles where article_id=#{id}")
    public Article getArticle(@Param("id") String id);

    @Insert("insert into articles(user_id, article_title, article_content) values(#{user_id},#{article_title},#{article_content})")
    public Integer writeArticle(
            @Param("user_id") int user_id,
            @Param("article_title") String article_title,
            @Param("article_content") String article_content);

    @Select("select * from articles where user_id=#{id}")
    public List<Article> getMyArticle(@Param("id") String id);

    @Delete("delete from articles where article_id=#{id}")
    public Integer deleteArticle(@Param("id") String id);

    @Select("select * from articles where article_title like '%${keyword}%' or article_content like '%${keyword}%'")
    public List<Article> search(@Param("keyword") String keyword);

}
