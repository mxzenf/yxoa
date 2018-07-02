package com.yx.sys.persistence;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import java.util.List;
import java.util.Map;

/**
 * 自定义实现dao
 */
public class OaDaoSupport extends SqlSessionDaoSupport {

    public Object queryObject(String sql, Map param) {
        return getSqlSession().selectOne(sql, param);
    }
    public Object queryObject(String sql, String param) {
        return getSqlSession().selectOne(sql, param);
    }
    public List<?> queryList(String sql, String param) {
        return getSqlSession().selectList(sql, param);
    }
    public List<?> queryList(String sql, Map<?,?> param) {
        return getSqlSession().selectList(sql, param);
    }
    public List<?> queryList(String sql) {
        return getSqlSession().selectList(sql);
    }
    public int update(String sql, Object param){
        return getSqlSession().update(sql, param);
    }
    public int delete(String sql, Object param){
        return getSqlSession().delete(sql, param);
    }
    public int insert(String sql, Object param){
        return getSqlSession().insert(sql, param);
    }
}
