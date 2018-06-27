/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import database.Hibernate;
import model.PgUsers;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author dangt
 */
public class UserAuthentication {
    
    private PgUsers users;

    public PgUsers getUsers() {
        return users;
    }
    
    public PgUsers getCurrentUsers() {
        return users;
    }

    public void setUsers(PgUsers users) {
        this.users = users;
    }
    
    public boolean login(String username, String password) {
        Session session = Hibernate.getSessionFactory().openSession();
        this.users = (PgUsers) session.createCriteria(PgUsers.class)
                .createAlias("pgRoles", "role")
                .add(Restrictions.and(
                        Restrictions.or(Restrictions.eq("userId", username), Restrictions.eq("email", username)),
                        Restrictions.eq("userPassword", password)
                ))
                .add(Restrictions.eq("role.roleId", 3))
                .uniqueResult();
        if (users == null) {
            return false;
        }
        return true;
    }
}
