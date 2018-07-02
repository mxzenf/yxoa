package com.yx.sys.entity;

import java.util.List;

/**
 * Created by 杨欣 on 2018/6/6.
 */
public class Notice {
    private String id;
    private String title;
    private String sub_title;
    private String sender_id;
    private String sender_name;
    private String sender_orgid;
    private String sender_orgname;
    private String create_time;
    private String publish_time;
    private String content;
    private String to_org_id;
    private String to_org_name;
    private String if_publish;
    private List<Audience> audiences;
    private String if_sign;

    public String getIf_sign() {
        return if_sign;
    }

    public void setIf_sign(String if_sign) {
        this.if_sign = if_sign;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSub_title() {
        return sub_title;
    }

    public void setSub_title(String sub_title) {
        this.sub_title = sub_title;
    }

    public String getSender_id() {
        return sender_id;
    }

    public void setSender_id(String sender_id) {
        this.sender_id = sender_id;
    }

    public String getSender_name() {
        return sender_name;
    }

    public void setSender_name(String sender_name) {
        this.sender_name = sender_name;
    }

    public String getSender_orgid() {
        return sender_orgid;
    }

    public void setSender_orgid(String sender_orgid) {
        this.sender_orgid = sender_orgid;
    }

    public String getSender_orgname() {
        return sender_orgname;
    }

    public void setSender_orgname(String sender_orgname) {
        this.sender_orgname = sender_orgname;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public String getPublish_time() {
        return publish_time;
    }

    public void setPublish_time(String publish_time) {
        this.publish_time = publish_time;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTo_org_id() {
        return to_org_id;
    }

    public void setTo_org_id(String to_org_id) {
        this.to_org_id = to_org_id;
    }

    public String getTo_org_name() {
        return to_org_name;
    }

    public void setTo_org_name(String to_org_name) {
        this.to_org_name = to_org_name;
    }

    public String getIf_publish() {
        return if_publish;
    }

    public void setIf_publish(String if_publish) {
        this.if_publish = if_publish;
    }

    public List<Audience> getAudiences() {
        return audiences;
    }

    public void setAudiences(List<Audience> audiences) {
        this.audiences = audiences;
    }
}
