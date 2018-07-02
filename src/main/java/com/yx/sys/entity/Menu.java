package com.yx.sys.entity;

/**
 * Created by 杨欣 on 2018/4/10.
 * 菜单实体类
 */
public class Menu {
    private String id;
    private String name;
    private String parent_id;
    private String isparent;
    private int sort;
    private String icon;
    private String description;
    private String if_show;
    private String permission;
    private String url;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIsparent() {
        return isparent;
    }

    public void setIsparent(String isparent) {
        this.isparent = isparent;
    }

    public int getSort() {
        return sort;
    }

    public void setSort(int sort) {
        this.sort = sort;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getIf_show() {
        return if_show;
    }

    public void setIf_show(String if_show) {
        this.if_show = if_show;
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getParent_id() {
        return parent_id;
    }

    public void setParent_id(String parent_id) {
        this.parent_id = parent_id;
    }

    @Override
    public String toString() {
        return "Menu{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", parent_id='" + parent_id + '\'' +
                ", isparent='" + isparent + '\'' +
                ", sort=" + sort +
                ", icon='" + icon + '\'' +
                ", description='" + description + '\'' +
                ", if_show='" + if_show + '\'' +
                ", permission='" + permission + '\'' +
                ", url='" + url + '\'' +
                '}';
    }
}
