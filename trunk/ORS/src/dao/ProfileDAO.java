package dao;

import entity.Profile;

/**
 * Created by Thành on 02/07/2015.
 */
public class ProfileDAO extends BaseDAO<Profile, Integer> {

    public ProfileDAO() {
        super(Profile.class);
    }
}
