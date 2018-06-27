package DAO;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import model.PgLog;

public class LogDAO {
	@SuppressWarnings("unchecked")
	public  List<PgLog> getAllPgLog(){
		 List<PgLog> list=null;
	        try
	        {
	        	Configuration configuration =  new Configuration().configure();
	        	SessionFactory sessionFactory = configuration.buildSessionFactory();
	        	Session session = sessionFactory.openSession();
		        Transaction transaction = session.beginTransaction();
		        String hql ="from PgLog";
		        Query que = session.createQuery(hql);
		        list = que.list();
		        transaction.commit();
	        }
	        catch  (HibernateException e) {
	        	 e.printStackTrace();
	        }
	        return list;
	}
	 public boolean insertPgLog(PgLog sp){
		 Configuration configuration =  new Configuration().configure();
     	SessionFactory sessionFactory = configuration.buildSessionFactory();
     	Session session = sessionFactory.openSession();
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
}
