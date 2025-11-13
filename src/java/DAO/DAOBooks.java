/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import entity.Books;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

/**
 *
 * @author tranh
 */
public class DAOBooks extends DBConnect {

    public Vector<Books> getAllBooks() {
        Vector<Books> bookList = new Vector<>();
        String sql = "SELECT * FROM books";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
//                
                Books book = new Books(
                        rs.getInt(1), // id
                        rs.getString(2), // title
                        rs.getString(3), // author
                        rs.getString(4), // description
                        rs.getFloat(5), // price
                        rs.getInt(6), // stock
                        rs.getInt(7), // view_count
                        rs.getString(8), // language
                        rs.getInt(9),
                        rs.getString(11), // cover_image
                        rs.getTimestamp(12) // created_at
                );
                bookList.add(book);
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return bookList;
    }

    public Vector<Books> getPopularBooks() {
        Vector<Books> bookList = new Vector<>();
        String sql = "SELECT *\n"
                + "FROM books\n"
                + "ORDER BY view_count DESC;";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
//                
                Books book = new Books(
                        rs.getInt(1), // id
                        rs.getString(2), // title
                        rs.getString(3), // author
                        rs.getString(4), // description
                        rs.getFloat(5), // price
                        rs.getInt(6), // stock
                        rs.getInt(7), // view_count
                        rs.getString(8), // language
                        rs.getInt(9),
                        rs.getString(11), // cover_image
                        rs.getTimestamp(12) // created_at
                );
                bookList.add(book);
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return bookList;
    }

    public Vector<Books> getTop3Books() {
        Vector<Books> bookList = new Vector<>();
        String sql = "SELECT TOP 3 *\n"
                + "FROM books\n"
                + "ORDER BY view_count DESC;";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
//                
                Books book = new Books(
                        rs.getInt(1), // id
                        rs.getString(2), // title
                        rs.getString(3), // author
                        rs.getString(4), // description
                        rs.getFloat(5), // price
                        rs.getInt(6), // stock
                        rs.getInt(7), // view_count
                        rs.getString(8), // language
                        rs.getInt(9),
                        rs.getString(11), // cover_image
                        rs.getTimestamp(12) // created_at
                );
                bookList.add(book);
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return bookList;
    }

    public Vector<Books> getLatestBooks() {
        Vector<Books> bookList = new Vector<>();
        String sql = "SELECT *\n"
                + "FROM books\n"
                + "ORDER BY created_at DESC;";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
//                
                Books book = new Books(
                        rs.getInt(1), // id
                        rs.getString(2), // title
                        rs.getString(3), // author
                        rs.getString(4), // description
                        rs.getFloat(5), // price
                        rs.getInt(6), // stock
                        rs.getInt(7), // view_count
                        rs.getString(8), // language
                        rs.getInt(9),
                        rs.getString(11), // cover_image
                        rs.getTimestamp(12) // created_at
                );
                bookList.add(book);
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return bookList;
    }

    public Vector<Books> getLatest3Books() {
        Vector<Books> bookList = new Vector<>();
        String sql = "SELECT TOP 3 *\n"
                + "FROM books\n"
                + "ORDER BY created_at DESC;";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
//                
                Books book = new Books(
                        rs.getInt(1), // id
                        rs.getString(2), // title
                        rs.getString(3), // author
                        rs.getString(4), // description
                        rs.getFloat(5), // price
                        rs.getInt(6), // stock
                        rs.getInt(7), // view_count
                        rs.getString(8), // language
                        rs.getInt(9),
                        rs.getString(11), // cover_image
                        rs.getTimestamp(12) // created_at
                );
                bookList.add(book);
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return bookList;
    }

    public Vector<Books> getSimilarBooks(String cid) {
        Vector<Books> bookList = new Vector<>();
        String sql = "SELECT *\n"
                + "FROM books\n"
                + "WHERE category_id = (\n"
                + "    SELECT category_id\n"
                + "    FROM books\n"
                + "    WHERE id = ?\n"
                + ")\n"
                + "AND id <> ?;";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, cid);
            statement.setString(2, cid);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
//                
                Books book = new Books(
                        rs.getInt(1), // id
                        rs.getString(2), // title
                        rs.getString(3), // author
                        rs.getString(4), // description
                        rs.getFloat(5), // price
                        rs.getInt(6), // stock
                        rs.getInt(7), // view_count
                        rs.getString(8), // language
                        rs.getInt(9),
                        rs.getString(11), // cover_image
                        rs.getTimestamp(12) // created_at
                );
                bookList.add(book);
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return bookList;
    }

    public Vector<Books> getBooksBySellerId(int sid) {
        Vector<Books> bookList = new Vector<>();
        String sql = "SELECT * FROM books\n"
                + "WHERE seller_id = ?;";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, sid);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
//                
                Books book = new Books(
                        rs.getInt(1), // id
                        rs.getString(2), // title
                        rs.getString(3), // author
                        rs.getString(4), // description
                        rs.getFloat(5), // price
                        rs.getInt(6), // stock
                        rs.getInt(7), // view_count
                        rs.getString(8), // language
                        rs.getInt(9),
                        rs.getString(11), // cover_image
                        rs.getTimestamp(12) // created_at
                );
                bookList.add(book);
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return bookList;
    }

    public void deleteBookById(String bid) {
        String sql = "DELETE from books WHERE id = ?;";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, bid);
            statement.executeQuery();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public void editBook(String title, String author, String description, float price, int stock,
            int viewCount, String language, int categoryId, String coverImage, int sellerId) {
        String sql = "UPDATE books SET "
                + "title = ?, "
                + "author = ?, "
                + "description = ?, "
                + "price = ?, "
                + "stock = ?, "
                + "view_count = ?, "
                + "language = ?, "
                + "category_id = ?, "
                + "cover_image = ? "
                + "WHERE id = ?";

        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, title);
            statement.setString(2, author);
            statement.setString(3, description);
            statement.setDouble(4, price);
            statement.setInt(5, stock);
            statement.setInt(6, viewCount);
            statement.setString(7, language);
            statement.setInt(8, categoryId);
            statement.setString(9, coverImage);
            statement.setInt(10, sellerId);

            statement.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public void addBook(String title, String author, String description, float price, int stock,
            int viewCount, String language, int categoryId, String coverImage, int sellerId) {
        String sql = "INSERT INTO books (title, author, description, price, stock, view_count, language, category_id, cover_image, seller_id, created_at) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, GETDATE())";

        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, title);
            statement.setString(2, author);
            statement.setString(3, description);
            statement.setFloat(4, price);
            statement.setInt(5, stock);
            statement.setInt(6, viewCount);
            statement.setString(7, language);
            statement.setInt(8, categoryId);
            statement.setString(9, coverImage);
            statement.setInt(10, sellerId);

            statement.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    //Tham so cid de dang String SQL van hieu va tim duoc sang integer
    public Vector<Books> getBooksByCategory(int cid) {
        Vector<Books> bookList = new Vector<>();
        String sql = "SELECT * FROM books WHERE category_id = ?;";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, cid);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
//                
                Books book = new Books(
                        rs.getInt(1), // id
                        rs.getString(2), // title
                        rs.getString(3), // author
                        rs.getString(4), // description
                        rs.getFloat(5), // price
                        rs.getInt(6), // stock
                        rs.getInt(7), // view_count
                        rs.getString(8), // language
                        rs.getInt(9),
                        rs.getString(11), // cover_image
                        rs.getTimestamp(12) // created_at
                );
                bookList.add(book);
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return bookList;
    }

    public Books getBooksByID(String bid) {
        String sql = "SELECT * FROM books WHERE id = ?;";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, bid);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Books book = new Books(
                        rs.getInt(1), // id
                        rs.getString(2), // title
                        rs.getString(3), // author
                        rs.getString(4), // description
                        rs.getFloat(5), // price
                        rs.getInt(6), // stock
                        rs.getInt(7), // view_count
                        rs.getString(8), // language
                        rs.getInt(9),
                        rs.getString(11), // cover_image
                        rs.getTimestamp(12) // created_at
                );
                return book;
            }

        } catch (SQLException e) {
            System.err.println(e);
        }
        return null;
    }
    
     public Vector<Books> getBooksByTitle(String search) {
        Vector<Books> bookList = new Vector<>();
        String sql = "SELECT * FROM books WHERE title LIKE ?;";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, "%" + search + "%");
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
//                
                Books book = new Books(
                        rs.getInt(1), // id
                        rs.getString(2), // title
                        rs.getString(3), // author
                        rs.getString(4), // description
                        rs.getFloat(5), // price
                        rs.getInt(6), // stock
                        rs.getInt(7), // view_count
                        rs.getString(8), // language
                        rs.getInt(9),
                        rs.getString(11), // cover_image
                        rs.getTimestamp(12) // created_at
                );
                bookList.add(book);
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return bookList;
    }
}
