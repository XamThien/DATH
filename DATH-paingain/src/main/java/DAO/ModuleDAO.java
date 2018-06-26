package DAO;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import model.PgModules;

public class ModuleDAO {

	@SuppressWarnings("unchecked")
	public  List<PgModules> getAllPgModules(){
		 List<PgModules> list=null;
	        try
	        {
	        	Configuration configuration =  new Configuration().configure();
	        	SessionFactory sessionFactory = configuration.buildSessionFactory();
	        	Session session = sessionFactory.openSession();
		        Transaction transaction = session.beginTransaction();
		        String hql ="from PgModules";
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
	public  List<PgModules> getActivePgModules(){
		 List<PgModules> list=null;
	        try
	        {
	        	Configuration configuration =  new Configuration().configure();
	        	SessionFactory sessionFactory = configuration.buildSessionFactory();
	        	Session session = sessionFactory.openSession();
		        Transaction transaction = session.beginTransaction();
		        String hql ="from PgModules where moduleStatus=1";
		        Query que = session.createQuery(hql);
		        list = que.list();
		        transaction.commit();
	        }
	        catch  (HibernateException e) {
	        	 e.printStackTrace();
	        }
	        return list;
	}
	 public PgModules getPgModulesByID(int id) {
		 PgModules cl = null;
	       try
	       {
	    	   Configuration configuration =  new Configuration().configure();
	        	SessionFactory sessionFactory = configuration.buildSessionFactory();
	        	Session session = sessionFactory.openSession();
		        Transaction transaction = session.beginTransaction();
		        String hql ="from PgModules where moduleId="+id;
		        Query que = session.createQuery(hql);
		        cl = (PgModules) que.uniqueResult();
		        transaction.commit();
	       }
	       catch  (HibernateException e) {
	    	   e.printStackTrace();
	        }
	        return cl;
	    }


	 public boolean insertPgModules(PgModules sp){
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
	
	 public void updatePgModules(PgModules sp){
		 Configuration configuration =  new Configuration().configure();
     	SessionFactory sessionFactory = configuration.buildSessionFactory();
     	Session session = sessionFactory.openSession();
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

		 PgModules module = new ModuleDAO().getPgModulesByID(1);
		 System.out.println(module.getModuleName());
		 
	}
}
