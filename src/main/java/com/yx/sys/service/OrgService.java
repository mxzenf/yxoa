package com.yx.sys.service;

import com.yx.sys.entity.Menu;
import com.yx.sys.entity.Org;
import com.yx.sys.persistence.OaDaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.*;

/**
 * Created by 杨欣 on 2018/5/13.
 */
@Service("orgService")
public class OrgService {
    private final static Org root;
    @Resource(name = "dao")
    private OaDaoSupport dao;
    static {
        root = new Org();
        root.setId("0");
        root.setDescription("公司部门组织机构");
        root.setName("公司部门组织机构");
        root.setIsparent("1");
    }
    public Org getRoot(){

        return root;
    }

    public List<Org> getOrgByPid(Map param){
        List<Org> orgs = new ArrayList<Org>();
        orgs.addAll((List<Org>)dao.queryList("sys.getOrgById", param));
        return orgs;
    }

    public List<Org> getAllOrgs(){
        List<Org> orgs = new ArrayList<Org>();
        orgs.addAll((List<Org>)dao.queryList("sys.getOrgById", Collections.EMPTY_MAP));
        orgs.add(root);
        return orgs;
    }
    @Transactional(propagation = Propagation.REQUIRED,rollbackFor=Exception.class)
    public int createOrg(Org org) {
        return dao.insert("sys.insertOrg", org);
    }
    @Transactional(propagation = Propagation.REQUIRED,rollbackFor=Exception.class)
    public int modifyOrg(Org o){
        return dao.update("sys.updateOrg", o);
    }
}
