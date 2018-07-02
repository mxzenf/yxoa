package com.yx.sys.service.impl;

import java.util.List;
import java.util.Map;

import com.yx.sys.persistence.OaDaoSupport;
import com.yx.sys.service.BaseService;
import com.yx.utils.BeanUtil;

public class BaseServiceImpl implements BaseService {

    protected OaDaoSupport dao;

    public OaDaoSupport getDao() {
        return dao;
    }

    public void setDao(OaDaoSupport dao) {
        this.dao = dao;
    }

    @Override
    public int insertBatch(String sql, List<Map<String, Object>> data) {
        int i = 0;
        for(Map<String, Object> m : data){
            i+=dao.getSqlSession().insert(sql, m);
        }
        return i;
    }

    @Override
    public Object getService(String svName) {
        return BeanUtil.getBean(svName);
    }

    
}
