package com.yx.persistence;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.yx.sys.persistence.OaDaoSupport;
import com.yx.sys.service.BaseService;

public class TestDao {

    private static ApplicationContext context;
    private static OaDaoSupport dao;
    /**
     * 初始化context
     */
    @BeforeClass
    public static void init() {
        context = new ClassPathXmlApplicationContext(new String[] {"classpath:appcontext.xml"});
        dao = (OaDaoSupport)context.getBean("dao");
    }
    /**
     * 测试dao配置
     */
    @Test
    public void testDaoisNotNull(){
        Assert.assertNotNull(dao);
    }
    @Test
    public void testInsert(){
        BaseService bs = (BaseService)context.getBean("baseService");
        Assert.assertNotNull(bs);
        List<Map<String, Object>> data = new ArrayList<Map<String, Object>>();
        Map<String,Object> m1 = new HashMap<String,Object>(){
            {
                put("score",60.1);
            }
        };
        /**
         * 测试事务
         */
//        Map<String,Object> m2 = new HashMap<String,Object>(){
//            {
//                put("score",55.7);
//            }
//        };
        Map<String,Object> m2 = new HashMap<String,Object>(){
            {
                put("score","aaa");
            }
        };
        data.add(m1);
        data.add(m2);
        int count = bs.insertBatch("sys.insertMark", data);
        Assert.assertEquals(2, count);
    }
}
