/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.mycart.dao;
 import com.mycompany.mycart.entities.Users;
//import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class UserDao {
    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }
    public Users getUserByEmailAndPassword(String email, String password)
    {
        Users user= null;
        try{
            String query="from Users where userEmail=: e and userPassword=: p";
            Session session=this.factory.openSession();
            //Session session=this.factory.openSession();
            Query q= session.createQuery(query);
            q.setParameter("e",email);
            q.setParameter("p",password);
            user= (Users)q.uniqueResult();
            
            
            session.close();
        }catch(Exception e)
        {
            e.printStackTrace();
            
        }
        
        
        
        return user;
        
    }
    
}
