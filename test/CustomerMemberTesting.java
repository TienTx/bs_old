/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.mysql.jdbc.Connection;
import dao.person.customer.CustomerMemberDAO;
import entity.person.PersonAbstractFactory;
import entity.person.PersonFactoryProducer;
import entity.person.address.Address;
import entity.person.customer.Customer;
import entity.person.customer.CustomerMember;
import entity.person.fullname.FullName;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.junit.Assert;
import org.junit.Test;

/**
 *
 * @author DuongPham
 */
public class CustomerMemberTesting {

    private Connection con;
    private static final String DRIVER_CLASSNAME = "com.mysql.jdbc.Driver";
    private static final String CONNECT_NSTRING = "jdbc:mysql://localhost:3306/dbBS2?user=root&password=";

    public CustomerMemberTesting() {
        try {
            Class.forName(DRIVER_CLASSNAME);
            con = (Connection) DriverManager.getConnection(CONNECT_NSTRING);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(CustomerMemberTesting.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /*Testcase: Login; Insert username and password(both corrcet); 
     Expect: return object equals with object defined before  */
    @Test
    public void getMemberReturnValidOutput() {
        CustomerMemberDAO c = new CustomerMemberDAO();
        CustomerMember cm = new CustomerMember();
        cm.setUsername("tien123");
        cm.setPassword("123456");
        CustomerMember cc = c.getMemberByUsernameAndPassword("tien123", "123456");
        Assert.assertEquals(cm.getUsername(), cc.getUsername());
        Assert.assertEquals(cm.getPassword(), cc.getPassword());
    }

    /*Testcase: Login; Insert username and password(password incorrect); 
     Expect: return null  */
    @Test
    public void getMemberReturnInValidOuput() {
        CustomerMemberDAO c = new CustomerMemberDAO();
        CustomerMember cm = new CustomerMember();
        Assert.assertEquals(null, c.getMemberByUsernameAndPassword("tien123", "123"));
    }

    /*Testcase: Register; Insert address, fullname, email, phonenum; 
     Expect: return true  */
    @Test
    public void registerMemberValid() {
        Address add = new Address("a", "a", "a", "a", "a", "a", "a");
        FullName fn = new FullName("Duong", "Hoang", "Pham");
        PersonAbstractFactory customerFactory = PersonFactoryProducer.getFactory("customer");
        Customer cus = customerFactory.getCustomer("customerMember");
        cus.setAddress(add);
        cus.setEmail("duongph@gmail.com");
        cus.setFullName(fn);
        cus.setPhoneNum("123456789");
        
        CustomerMemberDAO c = new CustomerMemberDAO();
        Assert.assertEquals(true, c.addCustomerMember(cus));

    }
    
//     @Test
//    public void registerMemberInValid() {
//        Address add = new Address("a", "a", "a", "a", "a", "a", "a");
//        FullName fn = new FullName("Duong", "Hoang", "Pham");
//        PersonAbstractFactory customerFactory = PersonFactoryProducer.getFactory("customer");
//        Customer cus = customerFactory.getCustomer("customerMember");
//        cus.setAddress(add);
//        cus.setEmail("duongph@gmail.com");
//        cus.setFullName(fn);
//        cus.setPhoneNum("123456789");
//        
//        CustomerMemberDAO c = new CustomerMemberDAO(con);
//        Assert.assertEquals(true, c.addCustomerMember(cus));
//
//    }

}
