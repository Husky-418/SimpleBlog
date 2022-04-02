package com.llj.blog.controller;

import com.alibaba.fastjson.JSON;
import com.llj.blog.bean.User;
import com.llj.blog.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;

@CrossOrigin("http://localhost:8080")
@RestController
public class RegisterController {
    
    @Autowired
    UserDao userDao;

    @RequestMapping("register")
    public String register(@RequestBody User user){

        HashMap<String, Object> res = new HashMap<>();
        User us = userDao.getUserByUsername(user.getUser_name());
        if(us==null)
        {
            Integer flag = userDao.Register(user.getUser_name(),
                    user.getUser_password(),
                    user.getUser_email()
            );
            System.out.println(flag);
            res.put("flag",flag!=null?"success":"error");
        }else{
            res.put("flag","error");
        }
        String res_json = JSON.toJSONString(res);
        return res_json;
    }
}
