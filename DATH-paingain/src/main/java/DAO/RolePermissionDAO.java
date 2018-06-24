package DAO;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import database.Hibernate;
import model.PgRolePermission;
import util.HibernateUtils;;

public class RolePermissionDAO {
	@SuppressWarnings("unchecked")
	public  List<PgRolePermission> getAllPgRolePermission(){
		 List<PgRolePermission> list=null;
	        try
	        {
	        	Session session = Hibernate.getSessionFactory().openSession();
	        	
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
	        	Session session = Hibernate.getSessionFactory().openSession();
	        	
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
	        	Session session = Hibernate.getSessionFactory().openSession();
	        	
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
	public  List<PgRolePermission> getPgRolePermissionByModuleID(){
		 List<PgRolePermission> list=null;
	        try
	        {
	        	Session session = Hibernate.getSessionFactory().openSession();
	        	
		        Transaction transaction = session.beginTransaction();
		        String hql ="from PgRolePermission where MODULE_ID=1";
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
	       try
	       {
	    	   Session session = Hibernate.getSessionFactory().openSession();
	        	
		        Transaction transaction = session.beginTransaction();
		        String hql ="from PgRolePermission where permissionId="+id;
		        Query que = session.createQuery(hql);
		        cl = (PgRolePermission) que.uniqueResult();
		        transaction.commit();
	       }
	       catch  (HibernateException e) {
	    	   e.printStackTrace();
	        }
	        return cl;
	    }


	 public boolean insertPgRolePermission(PgRolePermission sp){
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
	
	 public void updatePgRolePermission(PgRolePermission sp){
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

		 PgRolePermission rolep = new RolePermissionDAO().getPgRolePermissionByID(1);
		 System.out.println(rolep.getDescription());
		 
	}
}
