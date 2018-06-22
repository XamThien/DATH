
package DAO;
import database.Hibernate;
import org.hibernate.Criteria;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import model.PgCategories;
import util.HibernateUtils;


public class CategoryDAO {
	@SuppressWarnings("unchecked")
	public  List<PgCategories> getAllPgCategories(){
		 List<PgCategories> list=null;
	        try
	        {
	        	Session session = HibernateUtils.getSessionFactory().openSession();
				Transaction transaction = session.beginTransaction();
				 String hql ="from PgCategories";
		        Query que = session.createQuery(hql);
		        list = que.list();
		        transaction.commit();
	        }
	        catch  (HibernateException e) {
	        	 e.printStackTrace();
	        }
	        return list;
	}
	@SuppressWarnings("unchecked")
	public  List<PgCategories> getActivePgCategories(){
		 List<PgCategories> list=null;
	        try
	        {
	        	Session session = HibernateUtils.getSessionFactory().openSession();
				Transaction transaction = session.beginTransaction();
				String hql ="from PgCategories where categoryStatus=1";
		        Query que = session.createQuery(hql);
		        list = que.list();
		        transaction.commit();
	        }
	        catch  (HibernateException e) {
	        	 e.printStackTrace();
	        }
	        return list;
	}
	 public PgCategories getPgCategoriesByID(int id) {
		 PgCategories cl = null;
	       try
	       {
	    	   Session session = HibernateUtils.getSessionFactory().openSession();
				Transaction transaction = session.beginTransaction();
				String hql ="from PgCategories where categoryId="+id;
		        Query que = session.createQuery(hql);
		        cl = (PgCategories) que.uniqueResult();
		        transaction.commit();
	       }
	       catch  (HibernateException e) {
	    	   e.printStackTrace();
	        }
	        return cl;
	    }


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
	        //Session session = Hibernate.getSessionFactory().openSession();
	        Session session ;
		 	if(Hibernate.getSessionFactory().getCurrentSession() != null)
		 	{
		 		session = Hibernate.getSessionFactory().getCurrentSession();
		 	}
		 	else
		 	{
		 		session = Hibernate.getSessionFactory().openSession();
		 	}
	        session.beginTransaction();
	        PgCategories category = (PgCategories) session.get(PgCategories.class, id);
	        session.getTransaction().commit();

	        return category;
	    }
	 public boolean insertPgCategories(PgCategories sp){
		 Session session = HibernateUtils.getSessionFactory().openSession();
	        try {
				Transaction transaction = session.beginTransaction();
				session.save(sp);
				transaction.commit();
				return true;
			}catch (HibernateException e) {
				e.printStackTrace();
				return false;
			}finally {
				if(session.isOpen()) {
					session.close();
				}			
			}
	    }
	
	 public void updatePgCategories(PgCategories sp){
		 Session session = HibernateUtils.getSessionFactory().openSession();
			try {
				Transaction transaction = session.beginTransaction();
				session.update(sp);
				transaction.commit();
			}catch (HibernateException e) {
				e.printStackTrace();
			} finally {
				if(session.isOpen()) {
					session.close();
				}
			}
	    }
	 
	 public static void main(String[] args) {

		 PgCategories loaisp = new CategoryDAO().getPgCategoriesByID(1);
		 System.out.println(loaisp.getCategoryName());
		 
	}
}
//=======
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 
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
>>>>>>> abc8a07bd7f9c11ac25dc07f22cf426de7aebdf8
}
*/