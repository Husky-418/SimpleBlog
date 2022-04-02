package com.llj.blog.controller;

import com.alibaba.fastjson.JSON;
import com.llj.blog.bean.Article;
import com.llj.blog.bean.User;
import com.llj.blog.dao.ArticleDao;
import com.llj.blog.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.xml.crypto.Data;
import java.util.HashMap;
import java.util.List;


@CrossOrigin("http://localhost:8080")
@RestController
public class UserController {

    @Autowired
    UserDao userDao;

    @RequestMapping("individual")
    public String individual(String id)
    {
        System.out.println("访问成功！");
        User user = userDao.getUser(id);
        System.out.println(user);
        HashMap<String, Object> data3 = new HashMap<>();
        if(user!=null)
        {
            data3.put("user",user);
            data3.put("flag","success");
        }else
        {
            data3.put("flag","error");
        }
        String s = JSON.toJSONString(data3);
        return s;
    }

    @RequestMapping("update")
    public String update(@RequestBody User user)
    {
        HashMap<String, Object> data4 = new HashMap<>();
        User us = userDao.getUserByUsername(user.getUser_name());
        System.out.println("us"+us);
        if(us==null)//全部修改
        {
            Integer flag = userDao.updateUser(
                    user.getUser_id(),
                    user.getUser_name(),
                    user.getUser_password(),
                    user.getUser_email());
            System.out.println(flag);
            data4.put("flag",flag!=null||flag!=0?"success":"error");
        }else if(us!=null&&us.getUser_id()==user.getUser_id())//不修改用户名
        {
//            System.out.println("11111111111");
            Integer flag = userDao.updateUser(
                    user.getUser_id(),
                    user.getUser_name(),
                    user.getUser_password(),
                    user.getUser_email());
            System.out.println(flag);
            data4.put("flag",flag!=null||flag!=0?"success":"error");
        }
        else{
            data4.put("flag","error");
        }
        String s = JSON.toJSONString(data4);
        return s;
    }

    @RequestMapping("showUsers")
    public String showUsers()
    {
        HashMap<String, Object> data5 = new HashMap<>();
        List<User> users=userDao.getAllUsers();
        data5.put("users",users);
        String s=JSON.toJSONString(data5);
        return s;
    }

}
