package com.yx.sys.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.yx.sys.entity.Org;
import com.yx.sys.entity.User;

public interface UserService extends BaseService {

    User getUser(String loginid);
    Set<String> findPermissions(String loginid);
    Set<String> findRoles(String loginid);
    List<User> getUsersByOrgId(Map param);
    void createUser(User user);
    Org getUserOrg(User user);
    void updateUser(User user);
    int changeRoleAuth(Map param);
}
