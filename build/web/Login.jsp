<%-- 
    Document   : Login
    Created on : Jul 14, 2025, 6:29:14 AM
    Author     : tranh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Login - Booker</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-light">
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card shadow">
                        <div class="card-body">
                            <h2 class="text-center text-success mb-4">Login</h2>
                            <form action="login" method="post">
                                <div class="mb-3">
                                    <label for="email" class="form-label">Email</label>
                                    <input type="email"
                                           class="form-control"
                                           id="email"
                                           name="email"
                                           required
                                           pattern="^[a-zA-Z0-9._%+-]+@gmail\.com$"
                                           title="Please enter a valid Gmail address (example@gmail.com)">
                                </div>
                                <div class="mb-3">
                                    <label for="password" class="form-label">Password</label>
                                    <input type="password" class="form-control" id="password" name="password" required>
                                </div>
                                <p class="text-danger">${message}</p>
                                <div class="d-grid">
                                    <button type="submit" class="btn text-white" style="background-color: #61B87C;">Login</button>
                                </div>
                            </form>
                            <div class="text-center mt-3">
                                <p>Don't have an account? <a href="Register.jsp" class="text-success">Register here</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>>
