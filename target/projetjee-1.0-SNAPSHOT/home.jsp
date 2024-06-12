<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="tn.iit.projetjee.entity.User" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<html lang="en" class="h-100">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Your Name">
    <title>Cover Template · Bootstrap v5.0</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }
        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
        .cover-container {
            max-width: 42em;
        }
    </style>
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/cover.css" rel="stylesheet">
</head>
<body class="d-flex h-100 text-center text-white bg-dark">
<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
    <header class="mb-auto">
        <div>
            <nav class="nav nav-masthead justify-content-center float-md-end">
                <%
                    User user = (User) session.getAttribute("user");
                    if (user == null) {
                %>
                <% } else { %>
                <li class="dropdown ms-2 d-inline-block position-static">
                    <a class="rounded-circle" href="#" data-bs-toggle="dropdown" data-bs-display="static" aria-expanded="false">
                        <div class="avatar avatar-md avatar-indicators avatar-online">
                            <img alt="avatar" src="${pageContext.request.contextPath}/assets/images/avatar/avatar-5.jpg" class="rounded-circle" />
                        </div>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end position-absolute mx-3 my-5">
                        <div class="dropdown-item">
                            <div class="d-flex">
                                <div class="avatar avatar-md avatar-indicators avatar-online">
                                    <img alt="avatar" src="${pageContext.request.contextPath}/assets/images/avatar/avatar-5.jpg" class="rounded-circle" />
                                </div>
                                <div class="ms-3 lh-1">
                                    <h5 class="mb-1"><%= user.getNom() %></h5>
                                    <p class="mb-0"><%= user.getEmail() %></p>
                                </div>
                            </div>
                        </div>
                        <div class="dropdown-divider"></div>
                        <ul class="list-unstyled">
                            <li>
                                <a class="dropdown-item" href="profile-edit.html">
                                    <i class="fe fe-user me-2"></i>
                                    Profile
                                </a>
                            </li>
                            <% if (user.getRole().equals("admin")) { %>
                            <li>
                                <a class="dropdown-item" href="AdminServlet">
                                    <i class="fe fe-settings me-2"></i>
                                    Admin Space
                                </a>
                            </li>
                            <% } %>
                            <% if (user.getRole().equals("agent")) { %>
                            <li>
                                <a class="dropdown-item" href="AgentImpression">
                                    <i class="fe fe-settings me-2"></i>
                                    Agent Space
                                </a>
                            </li>
                            <% } %>
                            <% if (user.getRole().equals("enseignant")) { %>
                            <li>
                                <a class="dropdown-item" href="Impression">
                                    <i class="fe fe-settings me-2"></i>
                                    Enseignant Space
                                </a>
                            </li>
                            <% } %>
                        </ul>
                        <div class="dropdown-divider"></div>
                        <ul class="list-unstyled">
                            <li>
                                <a class="dropdown-item" href="LogoutServlet">
                                    <i class="fe fe-power me-2"></i>
                                    Sign Out
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
                <% } %>
            </nav>
        </div>
    </header>

    <main class="px-3">
        <h1>Printer Management System</h1>
        <p class="lead">Manage your printing tasks efficiently and effectively.</p>
        <% if (user == null) { %>
        <p class="lead">
            <a href="login.jsp" class="btn btn-primary" style="color: black">Login</a>
        </p>
        <% } %>
    </main>

    <footer class="mt-auto text-white-50">
        <p>Printer Management System , by <a href="https://twitter.com/mdo" class="text-white">DERBALI Khayreddine</a>.</p>
    </footer>
</div>
</body>
</html>
