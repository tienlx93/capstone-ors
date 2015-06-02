package dao;

import entity.Category;

/**
 * Created by ASUS on 6/2/2015.
 */
public class CategoryDAO extends BaseDAO<Category, Integer> {
    public CategoryDAO() {
        super(Category.class);
    }
}
