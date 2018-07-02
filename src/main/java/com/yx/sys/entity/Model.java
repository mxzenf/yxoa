package com.yx.sys.entity;

/**
 * Created by 杨欣 on 2018/5/1.
 */
public class Model {
    private String id_;
    private String key_;
    private String name_;
    private String version_;
    private String create_time_;
    private String last_update_time_;

    public String getId_() {
        return id_;
    }

    public void setId_(String id_) {
        this.id_ = id_;
    }

    public String getKey_() {
        return key_;
    }

    public void setKey_(String key_) {
        this.key_ = key_;
    }

    public String getName_() {
        return name_;
    }

    public void setName_(String name_) {
        this.name_ = name_;
    }

    public String getVersion_() {
        return version_;
    }

    public void setVersion_(String version_) {
        this.version_ = version_;
    }

    public String getCreate_time_() {
        return create_time_;
    }

    public void setCreate_time_(String create_time_) {
        this.create_time_ = create_time_;
    }

    public String getLast_update_time_() {
        return last_update_time_;
    }

    public void setLast_update_time_(String last_update_time_) {
        this.last_update_time_ = last_update_time_;
    }
}
