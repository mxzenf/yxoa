package com.yx.shiro;

import org.junit.Assert;
import org.junit.Test;

import com.yx.support.shiro.PasswordHelper;
import com.yx.sys.entity.User;

public class TestEncrypt {

    private static PasswordHelper ph = new PasswordHelper();
    
    @Test
    public void testHashEncrypt(){
        String pw   = "1";
        String id   = "guest";
        User user = new User();
        user.setLoginid(id);
        user.setPassword(pw);
        ph.encryptPassword(user);
        System.out.print(user.getPassword());
        Assert.assertEquals("e180a25583473cf34e8d6e1122bf2e0c", user.getPassword());
    }
    
}
