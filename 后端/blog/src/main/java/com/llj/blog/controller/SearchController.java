package com.llj.blog.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.llj.blog.bean.Article;
import com.llj.blog.bean.User;
import com.llj.blog.dao.ArticleDao;
import com.llj.blog.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

@CrossOrigin("http://localhost:8080")
@RestController
public class SearchController {

    @Autowired
    UserDao userDao;

    @Autowired
    ArticleDao articleDao;

    @RequestMapping("search")
    public String search( String keyword)
    {
        System.out.println(keyword);
        HashMap<String, Object> data = new HashMap<>();
        List<User> users = userDao.search(keyword);
        List<Article> articles = articleDao.search(keyword);
        if(!users.isEmpty()||!articles.isEmpty())
        {
            data.put("flag","success");
            data.put("userList",users);
            data.put("articleList",articles);
        }else
        {
            data.put("flag","error");
        }
        System.out.println(data);
        String s = JSON.toJSONString(data);
        return s;
    }
}
