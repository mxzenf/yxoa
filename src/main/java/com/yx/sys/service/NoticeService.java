package com.yx.sys.service;

import com.yx.sys.entity.Notice;
import com.yx.sys.persistence.OaDaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 杨欣 on 2018/6/11.
 */
@Service("noticeService")
public class NoticeService {
    @Resource(name = "dao")
    private OaDaoSupport dao;
    private final java.util.Base64.Decoder decoder = java.util.Base64.getDecoder();
    private final java.util.Base64.Encoder encoder = java.util.Base64.getEncoder();

    public String encode(String content) {
        return encoder.encodeToString(content.getBytes(Charset.forName("utf-8")));
    }

    public String decode(String content) {
        try {
            return new String(decoder.decode(content), "utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void publish(String id) {
        dao.update("sys.updateNotice", id);
    }

    public List<Notice> getAllNotice(Map param) {
        return (List<Notice>) dao.queryList("sys.getNotice", param);
    }

    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public void save(Notice notice) {
        notice.setContent(encode(notice.getContent()));
        String id = notice.getId();
        if (null == id || 0 == id.length()) {
            dao.insert("sys.insertNotice", notice);
        } else {
            dao.update("sys.updateNoticeContent", notice);
        }
    }
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public void noticeUser(Notice notice){
        final List<String> orgs = Arrays.asList(notice.getSender_orgid().split(","));
        final String notice_id = notice.getId();
        dao.insert("sys.insertNoticeUser", new HashMap() {
            {
                put("notice_id", notice_id);
                put("orgs", orgs);
            }
        });
    }

    public Notice getNoticeById(String id) {
        Map param = new HashMap();
        param.put("start", 0);
        param.put("end", 1);
        param.put("id", id);
        return getAllNotice(param).get(0);
    }
    public List<Notice> getNoticeByUser(String user_id){
        return (List<Notice>)dao.queryList("sys.getNoticeUser", user_id);
    }
    public void sign(Map<String, String> m){
        m.put("notice_id", m.get("id"));
        dao.update("sys.signNotice", m);
    }
}
