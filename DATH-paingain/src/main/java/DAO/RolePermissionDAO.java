package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import model.PgModules;
import model.PgRolePermission;
import model.PgRoles;

public class RolePermissionDAO {
	@SuppressWarnings("unchecked")
	public  List<PgRolePermission> getAllPgRolePermission(){
		 List<PgRolePermission> list=null;
	        try
	        {
	        	Configuration configuration =  new Configuration().configure();
	        	SessionFactory sessionFactory = configuration.buildSessionFactory();
	        	Session session = sessionFactory.openSession();
		        Transaction transaction = session.beginTransaction();
		        String hql ="from PgRolePermission";
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
	public  List<PgRolePermission> getActivePgRolePermission(){
		 List<PgRolePermission> list=null;
	        try
	        {
	        	Configuration configuration =  new Configuration().configure();
	        	SessionFactory sessionFactory = configuration.buildSessionFactory();
	        	Session session = sessionFactory.openSession();
		        Transaction transaction = session.beginTransaction();
		        String hql ="from PgRolePermission where perStatus=1";
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
	public  List<PgRolePermission> getPgRolePermissionByRoleID(int id){
		 List<PgRolePermission> list=null;
	        try
	        {
	        	Configuration configuration =  new Configuration().configure();
	        	SessionFactory sessionFactory = configuration.buildSessionFactory();
	        	Session session = sessionFactory.openSession();
		        Transaction transaction = session.beginTransaction();
		        String hql ="from PgRolePermission where ROLE_ID="+id;
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
	public  List<PgRolePermission> getPgRolePermissionByRoleIDModuleID(int idrole, int idmol){
		List<PgRolePermission> list=null;
	        try
	        {
	        	Configuration configuration =  new Configuration().configure();
	        	SessionFactory sessionFactory = configuration.buildSessionFactory();
	        	Session session = sessionFactory.openSession();
		        Transaction transaction = session.beginTransaction();
		        String hql ="from PgRolePermission where ROLE_ID="+idrole+" AND MODULE_ID="+idmol;
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
	public  List<PgRolePermission> getPgRolePermissionByModuleID(int id){
		 List<PgRolePermission> list=null;
	        try
	        {
	        	Configuration configuration =  new Configuration().configure();
	        	SessionFactory sessionFactory = configuration.buildSessionFactory();
	        	Session session = sessionFactory.openSession();
		        Transaction transaction = session.beginTransaction();
		        String hql ="from PgRolePermission where MODULE_ID=" +id;
		        Query que = session.createQuery(hql);
		        list = que.list();
		        transaction.commit();
	        }
	        catch  (HibernateException e) {
	        	 e.printStackTrace();
	        }
	        return list;
	}
	 public PgRolePermission getPgRolePermissionByID(int id) {
		 PgRolePermission cl = null;
		 Configuration configuration =  new Configuration().configure();
     	SessionFactory sessionFactory = configuration.buildSessionFactory();
     	Session session = sessionFactory.openSession();
	       try
	       {
	    	   
		        Transaction transaction = session.beginTransaction();
		        String hql ="from PgRolePermission where permissionId="+id;
		        Query que = session.createQuery(hql);
		        cl = (PgRolePermission) que.uniqueResult();
		        transaction.commit();
	       }
	       catch  (HibernateException e) {
	    	   e.printStackTrace();
	        }finally {
	            if (session.isOpen()){
	                session.close();
	            }
	        }
	        return cl;
	    }


	 public boolean insertPgRolePermission(PgRolePermission sp){
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
	
	 public void updatePgRolePermission(PgRolePermission sp){
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

		 PgModules mol = new RolePermissionDAO().getPgRolePermissionByID(3).getPgModules();
		 PgRoles rol = new  RolePermissionDAO().getPgRolePermissionByID(3).getPgRoles();
	
			 PgRolePermission sup = new PgRolePermission(3,mol,rol,false,true,true,0,"");
			 
			 new RolePermissionDAO().updatePgRolePermission(sup);
		 
		 
	}
}
