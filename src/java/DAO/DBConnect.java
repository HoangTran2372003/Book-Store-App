/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author tranh
 */
public class DBConnect {

    //Connection quan ly ket noi den DB
    public Connection connect = null;
    private String URL = "jdbc:sqlserver://localhost:1433;databaseName=BookStore;encrypt=true;trustServerCertificate=true";
    private String username = "sa";
    private String password = "123";

    public DBConnect(String URL, String userName, String password) {
        try {
            //Call Driver
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connect = DriverManager.getConnection(URL, userName, password);
            System.out.println("Connected");
        } catch (ClassNotFoundException ex) {
            //Another way for handling error
            ex.printStackTrace();
            //Logger.getLogger(DBConnect.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DBConnect.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public DBConnect() {
        //Truyen thang gia tri bien vao thay vi dung tham so (Dunno why tho)
        this("jdbc:sqlserver://localhost:1433;databaseName=BookStore", "sa", "123");
    }

    public ResultSet getData(String sql) {
        ResultSet result = null;
        try {
            //Khoi tao Statement de createStatement tu tren xuong duoi qua TYPE FORWARD ONLY va cho phep update ResultSet truc tiep qua CONCUR_UPDATABLE
            Statement statement = connect.createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_UPDATABLE);
            result = statement.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DBConnect.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
}
