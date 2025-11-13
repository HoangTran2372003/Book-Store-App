<%-- 
    Document   : Cart.jsp
    Created on : Aug 26, 2025, 12:51:45 AM
    Author     : tranh
--%>

<%@ page import="model.Cart, entity.CartItems" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>Your Cart</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container mt-4">
    <h2 class="mb-4">Your Shopping Cart</h2>

    <%
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null || cart.getItems().isEmpty()) {
    %>
        <div class="alert alert-info">Your cart is empty.</div>
        <a href="home.jsp" class="btn btn-primary">Continue Shopping</a>
    <%
        } else {
    %>
        <table class="table table-bordered table-striped">
            <thead class="table-dark">
            <tr>
                <th>Book ID</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Subtotal</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <%
                double total = 0;
                for (CartItems item : cart.getItems()) {
                    double subtotal = item.getPrice() * item.getQuantity();
                    total += subtotal;
            %>
                <tr>
                    <td><%= item.getBook_id() %></td>
                    <td>
                        <form action="CartServlet" method="post" class="d-flex">
                            <input type="hidden" name="action" value="update"/>
                            <input type="hidden" name="bookId" value="<%= item.getBook_id() %>"/>
                            <input type="number" name="quantity" value="<%= item.getQuantity() %>" min="1"
                                   class="form-control form-control-sm w-50 me-2"/>
                            <button type="submit" class="btn btn-sm btn-warning">Update</button>
                        </form>
                    </td>
                    <td>$<%= item.getPrice() %></td>
                    <td>$<%= subtotal %></td>
                    <td>
                        <form action="CartServlet" method="post">
                            <input type="hidden" name="action" value="remove"/>
                            <input type="hidden" name="bookId" value="<%= item.getBook_id() %>"/>
                            <button type="submit" class="btn btn-sm btn-danger">Remove</button>
                        </form>
                    </td>
                </tr>
            <%
                }
            %>
            </tbody>
        </table>

        <div class="d-flex justify-content-between align-items-center mt-3">
            <h4>Total: $<%= total %></h4>
            <div>
                <form action="CartServlet" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="clear"/>
                    <button type="submit" class="btn btn-outline-danger">Clear Cart</button>
                </form>
                <a href="checkout.jsp" class="btn btn-success ms-2">Checkout</a>
            </div>
        </div>
    <%
        }
    %>
</div>
</body>
</html>

