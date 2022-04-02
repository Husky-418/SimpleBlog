package com.llj.blog.controller;

import com.alibaba.fastjson.JSON;
import com.llj.blog.bean.Comment;
import com.llj.blog.dao.CommentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;

@CrossOrigin("http://localhost:8080")
@RestController
public class CommentController {

    @Autowired
    CommentDao commentDao;

    @RequestMapping("comment")
    public String Comment(String comment_content,int user_id,int article_id)
    {
        HashMap<String, Object> res = new HashMap<>();
        Integer flag = commentDao.writeComment(comment_content,user_id,article_id);
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
