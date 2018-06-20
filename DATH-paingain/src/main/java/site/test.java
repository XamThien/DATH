package site;


import DAO.ProductDAO;
import database.Hibernate;
import java.util.List;
import org.hibernate.Session;
import model.*;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author dangt
 */
public class test {
    public static void main(String[] args) {
        List<PgProducts> products = new ProductDAO().getProductforHome();
        for(PgProducts p:products){
            System.out.println(p.getProductName()+" | "+ p.getProductId());
            for(PgProductPictures pp: p.getPgProductPictureses()){
                System.out.println(pp.getPath());
            }
        }
    }
}
