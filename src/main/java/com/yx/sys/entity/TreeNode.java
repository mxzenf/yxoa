package com.yx.sys.entity;

import java.util.List;

/**
 * Created by 杨欣 on 2018/4/11.
 * 树形菜单
 */
public class TreeNode<T> {
    private T node;
    private List<TreeNode<T>> children;

    public TreeNode(){

    }

    public TreeNode(T node){
        this.node = node;
    }

    public T getNode() {
        return node;
    }

    public void setNode(T node) {
        this.node = node;
    }

    public List<TreeNode<T>> getChildren() {
        return children;
    }

    public void setChildren(List<TreeNode<T>> children) {
        this.children = children;
    }

    @Override
    public String toString() {
        return "TreeNode{" +
                "node=" + node +
                ", children=" + children +
                '}';
    }
}
