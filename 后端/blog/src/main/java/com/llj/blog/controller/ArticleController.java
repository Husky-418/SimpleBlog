package com.llj.blog.controller;

import com.alibaba.fastjson.JSON;
import com.llj.blog.bean.Article;
import com.llj.blog.bean.Comment;
import com.llj.blog.bean.User;
import com.llj.blog.dao.ArticleDao;
import com.llj.blog.dao.CommentDao;
import com.llj.blog.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@CrossOrigin("http://localhost:8080")
@RestController
public class ArticleController {
    @Autowired
    ArticleDao articleDao;
    @Autowired
    UserDao userDao;
    @Autowired
    CommentDao commentDao;

    @RequestMapping("articles")
    public String content()
    {
        //System.out.println("访问成功！");
        HashMap<String, Object> data = new HashMap<>();
        List<Article> articles = articleDao.getArticles();
//        System.out.println(articles);
        List<User> users=new ArrayList<>();
        for(Article article:articles)
        {
            User user=userDao.getUser(String.valueOf(article.getUser_id()));
            users.add(user);
        }

        if(articles!=null)
        {
            data.put("articles",articles);
            data.put("flag","success");
            data.put("users",users);
        }else
        {
            data.put("flag","error");
        }
        String s = JSON.toJSONString(data);
        return s;
    }

    @RequestMapping("blogger")
    public String blogger(@RequestBody String id)
    {
        //System.out.println("访问成功！");
        Article article = articleDao.getArticle(id);
        User user=userDao.getUser(String.valueOf(article.getUser_id()));
        List<Comment> comments = commentDao.getComment(String.valueOf(article.getArticle_id()));
        List<User> users=new ArrayList<>();//评论信息
        for(Comment comment:comments)
        {
            User u=userDao.getUser(String.valueOf(comment.getUser_id()));
            users.add(u);
        }
//        System.out.println(article);
//        System.out.println(user);
//        System.out.println(comments);
        HashMap<String, Object> data2 = new HashMap<>();
        if(article!=null)
        {
            data2.put("article",article);
            data2.put("user",user);
            data2.put("u",users);//评论信息
            data2.put("comments",comments);
            data2.put("flag","success");
        }else
        {
            data2.put("flag","error");
        }
        String s = JSON.toJSONString(data2);
        return s;
    }

    @RequestMapping("work")
    public String Work(@RequestBody Article article){
        HashMap<String, Object> res = new HashMap<>();
        Integer flag = articleDao.writeArticle(
                article.getUser_id(),
                article.getArticle_title(),
                article.getArticle_content()
        );
        System.out.println(flag);
        if(flag!=null)
        {
            res.put("flag","success");
        }else{
            res.put("flag","error");
        }
        String res_json = JSON.toJSONString(res);
        return res_json;
    }

    @RequestMapping("myarticle")
    public String Mine(@RequestBody String id){
        System.out.println("访问成功");
        HashMap<String, Object> data = new HashMap<>();
        List<Article> myarticles = articleDao.getMyArticle(id);
        System.out.println(myarticles);
        if(myarticles!=null)
        {
            data.put("myarticles",myarticles);
            data.put("flag","success");
        }else
        {
            data.put("flag","error");
        }
        String s = JSON.toJSONString(data);
        return s;
    }

    @RequestMapping("delete")
    public String Delete(@RequestBody String id){
        HashMap<String, Object> res = new HashMap<>();
        Integer flag = articleDao.deleteArticle(id);
        System.out.println(flag);
        if(flag!=null)
        {
            res.put("flag","success");
        }else{
            res.put("flag","error");
        }
        String res_json = JSON.toJSONString(res);
        return res_json;
    }
}
