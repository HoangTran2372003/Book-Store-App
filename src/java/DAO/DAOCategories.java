/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import entity.Categories;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

/**
 *
 * @author tranh
 */
public class DAOCategories extends DBConnect{
        public Vector<Categories> getAllCategories() {
        Vector<Categories> categoriesList = new Vector<>();
        String sql = "SELECT * FROM categories";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Categories category = new Categories(
                        rs.getInt(1),
                        rs.getString(2)
                );
                categoriesList.add(category);
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return categoriesList;
    }
}
