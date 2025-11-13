/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;


import DAO.DAOBooks;
import DAO.DAOCategories;
import entity.Accounts;
import entity.Books;
import entity.Categories;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Vector;

/**
 *
 * @author tranh
 */
public class EditBookController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditBookController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditBookController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        String BookIdResult = request.getParameter("bid");
        DAOBooks books = new DAOBooks();
        DAOCategories categories = new DAOCategories();
        Books book = books.getBooksByID(BookIdResult);
        Vector<Categories> listCategory = categories.getAllCategories();
        request.setAttribute("listCategory", listCategory);
        request.setAttribute("book", book);
        request.getRequestDispatcher("EditBook.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        request.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        int viewCount = Integer.parseInt(request.getParameter("viewCount"));
        String language = request.getParameter("language");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        String coverImage = request.getParameter("coverImage");

        Books updatedBook = new Books();
        updatedBook.setId(id);
        updatedBook.setTitle(title);
        updatedBook.setAuthor(author);
        updatedBook.setDescription(description);
        updatedBook.setPrice(price);
        updatedBook.setStock(stock);
        updatedBook.setViewCount(viewCount);
        updatedBook.setLanguage(language);
        updatedBook.setCategoryId(categoryId);
        updatedBook.setCoverImage(coverImage);

        DAOBooks books = new DAOBooks(); 
        books.editBook(title, author, description, stock, stock, viewCount, language, categoryId, coverImage, id);

        // Redirect or forward
        response.sendRedirect("bookManage"); 
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
