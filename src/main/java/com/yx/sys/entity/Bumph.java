package com.yx.sys.entity;

/**
 * Created by 杨欣 on 2018/6/2.
 */
public class Bumph {
    private String id;
    private String title;
    private String sender_id;
    private String ender_name;
    private String sender_orgid;
    private String sender_orgname;
    private String doc_type;
    private String doc_num;
    private String doc_num_source;
    private String doc_num_year;
    private Integer doc_num_n;
    private String content;
    private String if_submit;
    private String if_send;
    private String if_complete;
    private String proc_ins_id;
    private String first_leader_audit;
    private String second_leader_audit;
    private String create_time;
    private String send_time;

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

    public String getSender_id() {
        return sender_id;
    }

    public void setSender_id(String sender_id) {
        this.sender_id = sender_id;
    }

    public String getEnder_name() {
        return ender_name;
    }

    public void setEnder_name(String ender_name) {
        this.ender_name = ender_name;
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

    public String getDoc_type() {
        return doc_type;
    }

    public void setDoc_type(String doc_type) {
        this.doc_type = doc_type;
    }

    public String getDoc_num() {
        return doc_num;
    }

    public void setDoc_num(String doc_num) {
        this.doc_num = doc_num;
    }

    public String getDoc_num_source() {
        return doc_num_source;
    }

    public void setDoc_num_source(String doc_num_source) {
        this.doc_num_source = doc_num_source;
    }

    public String getDoc_num_year() {
        return doc_num_year;
    }

    public void setDoc_num_year(String doc_num_year) {
        this.doc_num_year = doc_num_year;
    }

    public Integer getDoc_num_n() {
        return doc_num_n;
    }

    public void setDoc_num_n(Integer doc_num_n) {
        this.doc_num_n = doc_num_n;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getIf_submit() {
        return if_submit;
    }

    public void setIf_submit(String if_submit) {
        this.if_submit = if_submit;
    }

    public String getIf_send() {
        return if_send;
    }

    public void setIf_send(String if_send) {
        this.if_send = if_send;
    }

    public String getIf_complete() {
        return if_complete;
    }

    public void setIf_complete(String if_complete) {
        this.if_complete = if_complete;
    }

    public String getProc_ins_id() {
        return proc_ins_id;
    }

    public void setProc_ins_id(String proc_ins_id) {
        this.proc_ins_id = proc_ins_id;
    }

    public String getFirst_leader_audit() {
        return first_leader_audit;
    }

    public void setFirst_leader_audit(String first_leader_audit) {
        this.first_leader_audit = first_leader_audit;
    }

    public String getSecond_leader_audit() {
        return second_leader_audit;
    }

    public void setSecond_leader_audit(String second_leader_audit) {
        this.second_leader_audit = second_leader_audit;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public String getSend_time() {
        return send_time;
    }

    public void setSend_time(String send_time) {
        this.send_time = send_time;
    }
}
