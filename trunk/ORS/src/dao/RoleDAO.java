package dao;

import entity.Role;

/**
 * Created by ASUS on 6/1/2015.
 */
public class RoleDAO extends BaseDAO<Role, Integer> {
    public RoleDAO() {
        super(Role.class);
    }
}
