/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import database.Hibernate;
import java.util.ArrayList;
import java.util.List;
import model.PgCategories;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author dangt
 */
public class CategoryDAO {

    public List<PgCategories> getCategories() {
        List<PgCategories> categories = new ArrayList<>();
        Session session = Hibernate.getSessionFactory().openSession();
        session.beginTransaction();
        categories = session.createCriteria(PgCategories.class)
                .add(Restrictions.eq("categoryStatus", 1))
                .list();

        return categories;
    }

    public PgCategories getCategory(int id) {
        Session session = Hibernate.getSessionFactory().openSession();
        session.beginTransaction();
        PgCategories category = (PgCategories) session.get(PgCategories.class, id);
        session.getTransaction().commit();

        return category;
    }
}
