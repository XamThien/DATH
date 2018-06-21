package DAO;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import database.Hibernate;
import model.PgRoles;

public class RoleDAO {
	@SuppressWarnings("unchecked")
	public  List<PgRoles> getAllPgRoles(){
		 List<PgRoles> list=null;
	        try
	        {
	        	Session session = Hibernate.getSessionFactory().openSession();
	        	
		        Transaction transaction = session.beginTransaction();
		        String hql ="from PgRoles";
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
	
	 public PgRoles getPgRolesByID(int id) {
		 PgRoles cl = null;
	       try
	       {
	    	   Session session = Hibernate.getSessionFactory().openSession();
	        	
		        Transaction transaction = session.beginTransaction();
		        String hql ="from PgRoles where roleId="+id;
		        Query que = session.createQuery(hql);
		        cl = (PgRoles) que.uniqueResult();
		        transaction.commit();
		        session.close();
	       }
	       catch  (HibernateException e) {
	    	   e.printStackTrace();
	        }
	        return cl;
	    }


	 public void insertPgRoles(PgRoles sp){
		 Session session = Hibernate.getSessionFactory().openSession();
	        Transaction transaction = session.beginTransaction();
	        session.save(sp);
	        transaction.commit();
	        session.close();
	    }
	
	 public void updatePgRoles(PgRoles sp){
		 Session session = Hibernate.getSessionFactory().openSession();
	        Transaction transaction = session.beginTransaction();
	        session.update(sp);
	        transaction.commit();
	        session.close();
	    }
	 
	 public static void main(String[] args) {

		 PgRoles role = new RoleDAO().getPgRolesByID(1);
		 System.out.println(role.getRoleName());
		 
	}
}
