package com.llj.blog.bean;

import java.util.Date;

public class User {

    private int user_id;
    private String user_ip;
    private String user_name;
    private String user_password;
    private String user_email;
    private  String user_profile_photo;
    private Date user_registration_time;
    private Date user_birthday;
    private int user_age;
    private int user_telephone_number;
    private String user_nickname;

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUser_ip() {
        return user_ip;
    }

    public void setUser_ip(String user_ip) {
        this.user_ip = user_ip;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_password() {
        return user_password;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public String getUser_profile_photo() {
        return user_profile_photo;
    }

    public void setUser_profile_photo(String user_profile_photo) {
        this.user_profile_photo = user_profile_photo;
    }

    public Date getUser_registration_time() {
        return user_registration_time;
    }

    public void setUser_registration_time(Date user_registration_time) {
        this.user_registration_time = user_registration_time;
    }

    public Date getUser_birthday() {
        return user_birthday;
    }

    public void setUser_birthday(Date user_birthday) {
        this.user_birthday = user_birthday;
    }

    public int getUser_age() {
        return user_age;
    }

    public void setUser_age(int user_age) {
        this.user_age = user_age;
    }

    public int getUser_telephone_number() {
        return user_telephone_number;
    }

    public void setUser_telephone_number(int user_telephone_number) {
        this.user_telephone_number = user_telephone_number;
    }

    public String getUser_nickname() {
        return user_nickname;
    }

    public void setUser_nickname(String user_nickname) {
        this.user_nickname = user_nickname;
    }

    @Override
    public String toString() {
        return "User{" +
                "user_id=" + user_id +
                ", user_ip='" + user_ip + '\'' +
                ", user_name='" + user_name + '\'' +
                ", user_password='" + user_password + '\'' +
                ", user_email='" + user_email + '\'' +
                ", user_profile_photo='" + user_profile_photo + '\'' +
                ", user_registration_time=" + user_registration_time +
                ", user_birthday=" + user_birthday +
                ", user_age=" + user_age +
                ", user_telephone_number=" + user_telephone_number +
                ", user_nickname='" + user_nickname + '\'' +
                '}';
    }
}
