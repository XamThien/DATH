package DAO;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import database.Hibernate;
import model.PgModules;;

public class ModuleDAO {

	@SuppressWarnings("unchecked")
	public  List<PgModules> getAllPgModules(){
		 List<PgModules> list=null;
	        try
	        {
	        	Session session = Hibernate.getSessionFactory().openSession();
	        	
		        Transaction transaction = session.beginTransaction();
		        String hql ="from PgModules";
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
	@SuppressWarnings("unchecked")
	public  List<PgModules> getActivePgModules(){
		 List<PgModules> list=null;
	        try
	        {
	        	Session session = Hibernate.getSessionFactory().openSession();
	        	
		        Transaction transaction = session.beginTransaction();
		        String hql ="from PgModules where moduleStatus=1";
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
	 public PgModules getPgModulesByID(int id) {
		 PgModules cl = null;
	       try
	       {
	    	   Session session = Hibernate.getSessionFactory().openSession();
	        	
		        Transaction transaction = session.beginTransaction();
		        String hql ="from PgModules where moduleId="+id;
		        Query que = session.createQuery(hql);
		        cl = (PgModules) que.uniqueResult();
		        transaction.commit();
		        session.close();
	       }
	       catch  (HibernateException e) {
	    	   e.printStackTrace();
	        }
	        return cl;
	    }


	 public void insertPgModules(PgModules sp){
		 Session session = Hibernate.getSessionFactory().openSession();
	        Transaction transaction = session.beginTransaction();
	        session.save(sp);
	        transaction.commit();
	        session.close();
	    }
	
	 public void updatePgModules(PgModules sp){
		 Session session = Hibernate.getSessionFactory().openSession();
	        Transaction transaction = session.beginTransaction();
	        session.update(sp);
	        transaction.commit();
	        session.close();
	    }
	 
	 public static void main(String[] args) {

		 PgModules module = new ModuleDAO().getPgModulesByID(1);
		 System.out.println(module.getModuleName());
		 
	}
}
