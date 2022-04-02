package com.llj.blog.controller;


import com.alibaba.fastjson.JSON;
import com.llj.blog.bean.User;
import com.llj.blog.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;

@CrossOrigin("http://localhost:8080")
@RestController
public class LoginController {

    @Autowired
    UserDao userDao;

    @RequestMapping("login")
    public String login(@RequestBody User user){
        User us = userDao.getUserByMessage(user.getUser_name(), user.getUser_password());
        HashMap<String, Object> res = new HashMap<>();
        res.put("flag",us!=null?"success":"error");
        res.put("user",us);

        System.out.println(us);
        String res_json = JSON.toJSONString(res);
        return res_json;
    }
}
