package com.yx.sys.service;

import java.util.List;
import java.util.Map;

public interface BaseService {

    int insertBatch(String sql,List<Map<String,Object>> data);
    Object getService(String svName);
    
}
