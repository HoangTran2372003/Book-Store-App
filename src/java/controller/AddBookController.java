/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;


import DAO.DAOBooks;
import DAO.DAOCategories;
import entity.Accounts;
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
public class AddBookController extends HttpServlet {

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
            out.println("<title>Servlet AddBookController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddBookController at " + request.getContextPath() + "</h1>");
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
        DAOCategories categories = new DAOCategories();
        Vector<Categories> listCategory = categories.getAllCategories();
        request.setAttribute("listCategory", listCategory);
        request.getRequestDispatcher("AddBook.jsp").forward(request, response);
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
        String bookTitleResult = request.getParameter("title");
        String bookAuthorResult = request.getParameter("author");
        String bookDescriptionResult = request.getParameter("description");
        float bookPriceResult = Float.parseFloat(request.getParameter("price"));
        int bookStockResult = Integer.parseInt(request.getParameter("stock"));
        int bookViewCountResult = Integer.parseInt(request.getParameter("viewCount"));
        String bookLanguageResult = request.getParameter("language");
        String bookCoverImageResult = request.getParameter("coverImage");
        int bookCategoryIdResult = Integer.parseInt(request.getParameter("categoryId"));
        HttpSession session = request.getSession();
        Accounts account = (Accounts) session.getAttribute("account");
        int bookSellerIdResult = account.getId();
        DAOBooks books = new DAOBooks();
        books.addBook(bookTitleResult, bookAuthorResult, bookDescriptionResult, bookPriceResult, bookStockResult, bookViewCountResult, bookLanguageResult, bookCategoryIdResult, bookCoverImageResult, bookSellerIdResult);
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
