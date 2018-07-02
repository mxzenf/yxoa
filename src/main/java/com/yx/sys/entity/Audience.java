package com.yx.sys.entity;

/**
 * Created by 杨欣 on 2018/6/7.
 */
public class Audience {
    private String id;
    private String user_id;
    private String user_name;
    private String notice_id;
    private String if_sign;
    private String sign_time;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getNotice_id() {
        return notice_id;
    }

    public void setNotice_id(String notice_id) {
        this.notice_id = notice_id;
    }

    public String getIf_sign() {
        return if_sign;
    }

    public void setIf_sign(String if_sign) {
        this.if_sign = if_sign;
    }

    public String getSign_time() {
        return sign_time;
    }

    public void setSign_time(String sign_time) {
        this.sign_time = sign_time;
    }
}
