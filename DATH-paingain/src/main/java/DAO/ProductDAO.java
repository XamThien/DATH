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
import model.PgUsers;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author dangt
 */
public class ProductDAO {
    // phuong thức để hiển thị list sp trên trang client
    public List<PgProducts> getProductforHome(){
        List<PgProducts> productses = new ArrayList<>();
        Session session = Hibernate.getSessionFactory().openSession();
        session.beginTransaction();
        Criteria criteria = session.createCriteria(PgProducts.class)
                .addOrder(Order.desc("isNew"))
                .addOrder(Order.desc("isHot"))
                .setMaxResults(9);
        productses =  criteria.list();
        return productses;
    }
    // phương thức do Huy viết để get sp theo thẻ loại
    @SuppressWarnings("unchecked")
	public  List<PgProducts> getAllPgProducts(int CATEGORY_ID){
		 List<PgProducts> list=null;
	        try
	        {
	        	Configuration configuration =  new Configuration().configure();
	        	SessionFactory sessionFactory = configuration.buildSessionFactory();
	        	Session session = sessionFactory.openSession();
	        	
	        	//Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		        Transaction transaction = session.beginTransaction();
		        String hql ="from PgProducts where CATEGORY_ID ="+CATEGORY_ID+" and productStatus=1";
		        Query que = session.createQuery(hql);
		        list = que.list();
		        transaction.commit();
		        session.close();
	        }
	        catch  (HibernateException e) {
	        	 e.printStackTrace();
	        }
	        return list;
	}
    public PgProducts getPgProductsByID(int id) {
    	PgProducts cl = null;
	       try
	       {
	    	    Configuration configuration =  new Configuration().configure();
	        	SessionFactory sessionFactory = configuration.buildSessionFactory();
	        	Session session = sessionFactory.openSession();
	        	
	        	//Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		        Transaction transaction = session.beginTransaction();
		        String hql ="from PgProducts where productId="+id;
		        Query que = session.createQuery(hql);
		        cl = (PgProducts) que.uniqueResult();
		        transaction.commit();

	       }
	       catch  (HibernateException e) {
	    	   e.printStackTrace();
	        }
	        return cl;
	    }
	 
	 public void insertPgProduct(PgProducts sp){
		 	Configuration configuration =  new Configuration().configure();
		 	SessionFactory sessionFactory = configuration.buildSessionFactory();
		 	Session session = sessionFactory.openSession();
	        Transaction transaction = session.beginTransaction();
	        session.save(sp);
	        transaction.commit();
	        session.close();
	    }
	
	 public void updatePgProduct(PgProducts sp){
		 	Configuration configuration =  new Configuration().configure();
	     	SessionFactory sessionFactory = configuration.buildSessionFactory();
	     	Session session = sessionFactory.openSession();
	        Transaction transaction = session.beginTransaction();
	        session.update(sp);
	        transaction.commit();
	        session.close();
	    }
}
