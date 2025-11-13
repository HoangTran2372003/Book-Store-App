/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import entity.Accounts;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author tranh
 */
public class DAOAccounts extends DBConnect {
        public Accounts Login(String email, String password) {
        String sql = "SELECT * FROM accounts WHERE email = ? AND password = ?;";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, password);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                return new Accounts(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getTimestamp(7), rs.getInt(8));
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return null;
    }

    public Accounts CheckAccountExist(String email) {
        String sql = "SELECT * FROM accounts WHERE email = ?;";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, email);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                return new Accounts(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getTimestamp(7), rs.getInt(8));
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return null;
    }

    public boolean register(String firstName, String lastName, String email, String password) {
        String sql = "INSERT INTO accounts (first_name, last_name, email, password, is_seller, createdAt, isAdmin) "
                + "VALUES (?, ?, ?, ?, 0, GETDATE(), 0);";

        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, firstName);
            statement.setString(2, lastName);
            statement.setString(3, email);
            statement.setString(4, password);

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            System.err.println(e);
            return false;
        }
    }
}
