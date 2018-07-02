package com.yx.utils;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

/**
 * 实现springAware接口获取上下文
 */
public class BeanUtil implements ApplicationContextAware {
    private static ApplicationContext context ;  
    @Override
    public void setApplicationContext(ApplicationContext applicationContext)
            throws BeansException {
        context = applicationContext;
    }
    public static Object getBean(String beanName){
        return context.getBean(beanName);
    }
    public static Map objectToMap(Object obj) {
        if(obj == null){
            return null;
        }
        Map map = new HashMap();
        try {
            Field[] declaredFields = obj.getClass().getDeclaredFields();
            for (Field field : declaredFields) {
                field.setAccessible(true);
                map.put(field.getName(), field.get(obj));
            }
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        }


        return map;
    }
}
