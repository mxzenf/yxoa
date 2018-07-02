package com.yx.support.shiro;

import groovy.transform.ASTTest;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

import com.yx.sys.entity.User;

/**
 * 密码助手,应该写成bean的,参考京东开涛shiro教程完成
 */
public class PasswordHelper {
    private String algorithmName = "md5";
    private int hashIterations = 2;
    private String salt = "yangxin";


    public void setAlgorithmName(String algorithmName) {
        this.algorithmName = algorithmName;
    }

    public void setHashIterations(int hashIterations) {
        this.hashIterations = hashIterations;
    }

    public void encryptPassword(User user) {
        String newPassword = new SimpleHash(algorithmName, user.getPassword(),
                ByteSource.Util.bytes(user.getLoginid()+this.salt),
                hashIterations).toHex();

        user.setPassword(newPassword);
    }
    
    public String getUserSalt(User user){
        return null==user?"":user.getLoginid()+this.salt;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public String getAlgorithmName() {
        return algorithmName;
    }

    public int getHashIterations() {
        return hashIterations;
    }

    public static void main(String[] args){
        User u = new User();
        u.setPassword("1");
        u.setLoginid("admin");
        new PasswordHelper().encryptPassword(u);
        System.out.print(u.getPassword());
    }
}
