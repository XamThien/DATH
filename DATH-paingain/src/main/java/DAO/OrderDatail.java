package DAO;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import model.PgOrderDetails;

public class OrderDatail {
	@SuppressWarnings("unchecked")
	public  List<PgOrderDetails> getAllPgOrderDetails(int ORDER_ID){
		 List<PgOrderDetails> list=null;
	        try
	        {
	        	Configuration configuration =  new Configuration().configure();
	        	SessionFactory sessionFactory = configuration.buildSessionFactory();
	        	Session session = sessionFactory.openSession();
	        	
	        	//Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		        Transaction transaction = session.beginTransaction();
		        String hql ="from PgOrderDetails where ORDER_ID ="+ORDER_ID;
		        Query que = session.createQuery(hql);
		        list = que.list();
		        transaction.commit();
	        }
	        catch  (HibernateException e) {
	        	 e.printStackTrace();
	        }
	        return list;
	}
	public void insertPgOrderDetails(PgOrderDetails sp){
	 	Configuration configuration =  new Configuration().configure();
	 	SessionFactory sessionFactory = configuration.buildSessionFactory();
	 	Session session = sessionFactory.openSession();
	 	
        Transaction transaction = session.beginTransaction();
        session.save(sp);
        transaction.commit();
        session.close();
    }
}
