/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import database.Hibernate;
import java.util.ArrayList;
import java.util.List;
import model.PgProducts;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author dangt
 */
public class ProductDAO {
    
    public List<PgProducts> getProductforHome(){
        List<PgProducts> productses = new ArrayList<>();
        Session session = Hibernate.getSessionFactory().openSession();
        session.beginTransaction();
        Criteria criteria = session.createCriteria(PgProducts.class)
                .addOrder(Order.desc("isNew"))
                .addOrder(Order.desc("isHot"))
                .setMaxResults(9);
        productses =  criteria.list();
        session.close();
        return productses;
    }
}
