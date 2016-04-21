/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.order;

import dao.SingleDBConnection;
import entity.order.CardPoint;
import entity.person.customer.Customer;
import entity.person.customer.CustomerNotMember;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import tool.MyTool;

/**
 *
 * @author zOzDarKzOz
 */
public class CardPointDAO {

    private Connection conn = null;

    public CardPointDAO() {
        this.conn = SingleDBConnection.getMyDBConnection().getConnection();
    }

    public boolean findCustomerMemberCardPoint(Customer cus, String code) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sqlSelect = "SELECT COUNT(tblCardPoint.idCardPoint) "
                + "FROM tblCardPoint WHERE tblCardPoint.cardCode = ? "
                + "AND tblCardPoint.idCustomer = ?;";
        try {
            ps = this.conn.prepareStatement(sqlSelect);
            ps.setString(1, code);
            ps.setInt(2, cus.getIdCustomer());

            rs = ps.executeQuery();
            if (rs.next()) {
                return (rs.getInt(1) == 1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public CardPoint getCustomerCardPointByCode(String code) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sqlSelect = "SELECT tblCardPoint.idCardPoint, "
                + "tblCardPoint.cardCode, tblCardPoint.points,"
                + "tblCardPoint.idCustomer, tblCustomer.phoneNum,"
                + "tblCustomer.email "
                + "FROM tblCardPoint JOIN tblCustomer ON "
                + "tblCardPoint.idCustomer = tblCustomer.idCustomer "
                + "WHERE tblCardPoint.cardCode = ?;";
        try {
            ps = this.conn.prepareStatement(sqlSelect);
            ps.setString(1, code);

            rs = ps.executeQuery();
            if (rs.next()) {
                Customer cus = new CustomerNotMember();
                cus.setIdCustomer(rs.getInt(4));
                cus.setPhoneNum(rs.getString(5));
                cus.setEmail(rs.getString(6));
                return new CardPoint(rs.getInt(1), rs.getString(2), rs.getInt(3), cus);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    public CardPoint getCustomerCardPointByEmail(String email) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sqlSelect = "SELECT tblCardPoint.idCardPoint, "
                + "tblCardPoint.cardCode, tblCardPoint.points,"
                + "tblCardPoint.idCustomer, tblCustomer.phoneNum,"
                + "tblCustomer.email "
                + "FROM tblCardPoint JOIN tblCustomer ON "
                + "tblCardPoint.idCustomer = tblCustomer.idCustomer "
                + "WHERE tblCustomer.email = ?;";
        try {
            ps = this.conn.prepareStatement(sqlSelect);
            ps.setString(1, email);

            rs = ps.executeQuery();
            if (rs.next()) {
                Customer cus = new CustomerNotMember();
                cus.setIdCustomer(rs.getInt(4));
                cus.setPhoneNum(rs.getString(5));
                cus.setEmail(rs.getString(6));
                return new CardPoint(rs.getInt(1), rs.getString(2), rs.getInt(3), cus);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    public CardPoint getCustomerMemberCardPoint(Customer cus) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sqlSelect = "SELECT tblCardPoint.idCardPoint, "
                + "tblCardPoint.cardCode, tblCardPoint.points "
                + "FROM tblCardPoint WHERE tblCardPoint.idCustomer = ?;";
        try {
            ps = this.conn.prepareStatement(sqlSelect);
            ps.setInt(1, cus.getIdCustomer());

            rs = ps.executeQuery();
            if (rs.next()) {
                return new CardPoint(rs.getInt(1), rs.getString(2), rs.getInt(3), cus);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    public boolean updatePointById(int idCp, int points) {
        PreparedStatement ps = null;
        String sqlUpdate = "UPDATE tblCardPoint SET tblCardPoint.points = ?"
                + " WHERE tblCardPoint.idCardPoint = ?;";
        try {
            ps = this.conn.prepareStatement(sqlUpdate);
            ps.setInt(1, points);
            ps.setInt(2, idCp);

            int num = ps.executeUpdate();
            return (num == 1);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public CardPoint newCardPoint(int idCustomer, int points) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sqlInsert = "INSERT INTO tblCardPoint(tblCardPoint.cardCode, "
                + "tblCardPoint.points, tblCardPoint.idCustomer) "
                + "VALUES(?, ?, ?);";
        String sqlSelect = "SELECT tblCardPoint.cardCode FROM "
                + "tblCardPoint;";
        try {
            ps = this.conn.prepareStatement(sqlSelect);
            rs = ps.executeQuery();
            String code = MyTool.randomString(6);
            while(rs.next()){
                if(rs.getString(1).equals(code)){
                    rs.beforeFirst();
                    code = MyTool.randomString(6);
                }
            }
            ps = this.conn.prepareStatement(sqlInsert);
            ps.setString(1, code);
            ps.setInt(2, points);
            ps.setInt(3, idCustomer);
            
            int num = ps.executeUpdate();
            if (num == 1) {
                ps = conn.prepareStatement("SELECT LAST_INSERT_ID()");
                rs = ps.executeQuery();
                if (rs.next()) {
                    return new CardPoint(rs.getInt(1), code, points, new CustomerNotMember(idCustomer));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }
}
