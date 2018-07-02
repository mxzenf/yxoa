package com.yx.code;

import org.junit.Test;

import java.nio.charset.Charset;

/**
 * Created by mac on 2018/6/11.
 */
public class Base64 {
    private final java.util.Base64.Decoder decoder = java.util.Base64.getDecoder();
    private final java.util.Base64.Encoder encoder = java.util.Base64.getEncoder();
    @Test
    public void test_base64(){
        String text = "<h1>杨欣</h1>";
        String key = encoder.encodeToString(text.getBytes(Charset.forName("UTF-8")));
        System.out.println(key);
        System.out.print(new String(decoder.decode(key)));

    }
}
