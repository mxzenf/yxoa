package com.yx.sys.service;

import com.yx.sys.comm.Constant;
import com.yx.sys.entity.Menu;
import com.yx.sys.entity.TreeNode;
import com.yx.sys.persistence.OaDaoSupport;
import com.yx.utils.BeanUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 杨欣 on 2018/4/10.
 * 为什么突然换了个风格,因为在userservice开发的时候按了老套路
 * 本来想沿用,但是总觉得太啰嗦就试了试注解风格,用起还挺方便
 */
@Service("menuService")
public class MenuService {
    @Resource(name = "dao")
    private OaDaoSupport dao;
    /**
     * 菜单根节点
     */
    private final static String ROOT = "0";
    public List<Menu> getChildren(final String loginid, final String p) {
        List<Menu> menus = (List<Menu>)dao.queryList("sys.getMenus", new HashMap(){
            {
                put("parent_id", p);
                put("loginid", loginid);
            }
        });
        return menus;
    }
    public List<Menu> getRoot() {
        return (List<Menu>)dao.queryList("sys.getRoot", new HashMap(){
            {
                put("root", ROOT);
            }
        });
    }
    public List<TreeNode<Menu>> getAllMenus(){
        List<TreeNode<Menu>>  menus = new ArrayList<TreeNode<Menu>>();
        for (Menu m : getRoot()) {
            TreeNode<Menu> tn = new TreeNode<Menu>(m);
            tn.setChildren(getChildMenus(tn));
            menus.add(tn);
        }
        return menus;
    }

    public List<TreeNode<Menu>> createUserMenu(final String loginid){
        List<TreeNode<Menu>>  menus = new ArrayList<TreeNode<Menu>>();
        for (Menu m : getRoot()) {
            TreeNode<Menu> tn = new TreeNode<Menu>(m);
            tn.setChildren(getChildMenus(tn, loginid));
            menus.add(tn);
        }
        return menus;
    }

    public List<TreeNode<Menu>> getChildMenus(TreeNode<Menu> root){
        List<TreeNode<Menu>> children = null;
        Menu m = root.getNode();
        if (Constant.ISPARENT.equals(m.getIsparent())){
            children = new ArrayList<TreeNode<Menu>>();
            List<Menu> l = (List<Menu>)dao.queryList("sys.getChildren", new HashMap(){
                {
                    put("parent_id", m.getId());
                }
            });
            if (null!=l && l.size()>0) {
                for (Menu m2 : l){
                    TreeNode<Menu> t1 = new TreeNode<Menu>(m2);
                    t1.setChildren(getChildMenus(t1));
                    children.add(t1);
                }
            }
        }
        return children;
    }

    public List<Map<String, String>> treeNodeToList(TreeNode<Menu> tn, final List<Map<String, String>> l, String ifshow) {
        if (null==ifshow && Constant.IS_SHOW.equals(String.valueOf(tn.getNode().getIf_show()))) {
            l.add(BeanUtil.objectToMap(tn.getNode()));
            if (tn.getChildren() != null) {
                tn.getChildren().stream().forEach(m -> {
                    treeNodeToList(m, l, ifshow);
                });
            }
        } else {
            l.add(BeanUtil.objectToMap(tn.getNode()));
            if (tn.getChildren() != null) {
                tn.getChildren().stream().forEach(m -> {
                    treeNodeToList(m, l, ifshow);
                });
            }
        }
        return l;
    }

    public List<TreeNode<Menu>> getChildMenus(TreeNode<Menu> root, final String loginid){
        List<TreeNode<Menu>> children = null;
        Menu m = root.getNode();
        if (Constant.ISPARENT.equals(m.getIsparent())){
             children = new ArrayList<TreeNode<Menu>>();
             List<Menu> l = (List<Menu>)dao.queryList("sys.getMenus", new HashMap(){
                {
                    put("parent_id", m.getId());
                    put("loginid", loginid);
                }
            });
            if (null!=l && l.size()>0) {
                for (Menu m2 : l){
                    TreeNode<Menu> t1 = new TreeNode<Menu>(m2);
                    t1.setChildren(getChildMenus(t1, loginid));
                    children.add(t1);
                }
            }
        }
        return children;
    }
    public Menu getMenuById(String id) {
        return (Menu)dao.queryObject("sys.getMenuById", id);
    }
    @Transactional(propagation = Propagation.REQUIRED,rollbackFor=Exception.class)
    public int modifyMenu(Menu m){
        return dao.update("sys.updateMenu", m);
    }
    @Transactional(propagation = Propagation.REQUIRED,rollbackFor=Exception.class)
    public int createMenu(Menu menu) throws Exception {
        return dao.insert("sys.insertMenu", menu);
    }

}
