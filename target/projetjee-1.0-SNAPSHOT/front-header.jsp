<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="tn.iit.projetjee.entity.User" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<nav class="navbar navbar-expand-lg">
    <div class="container-fluid px-0">
        <div class="d-flex">
            <a class="navbar-brand" href="HomeServlet"><img src="${pageContext.request.contextPath}/assets/logoISB2.png" class="logo-img" alt="Geeks" /></a>
            <style>
                .logo-img {
                    height: 3rem;
                }

            </style>

        </div>
        <div class="order-lg-3">
            <div class="d-flex align-items-center">
                <div class="dropdown">
                    <button class="btn btn-light btn-icon rounded-circle d-flex align-items-center" type="button" aria-expanded="false" data-bs-toggle="dropdown" aria-label="Toggle theme (auto)">
                        <i class="bi theme-icon-active"></i>
                        <span class="visually-hidden bs-theme-text">Toggle theme</span>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-end shadow" aria-labelledby="bs-theme-text">
                        <li>
                            <button type="button" class="dropdown-item d-flex align-items-center" data-bs-theme-value="light" aria-pressed="false">
                                <i class="bi theme-icon bi-sun-fill"></i>
                                <span class="ms-2">Light</span>
                            </button>
                        </li>
                        <li>
                            <button type="button" class="dropdown-item d-flex align-items-center" data-bs-theme-value="dark" aria-pressed="false">
                                <i class="bi theme-icon bi-moon-stars-fill"></i>
                                <span class="ms-2">Dark</span>
                            </button>
                        </li>
                        <li>
                            <button type="button" class="dropdown-item d-flex align-items-center active" data-bs-theme-value="auto" aria-pressed="true">
                                <i class="bi theme-icon bi-circle-half"></i>
                                <span class="ms-2">Auto</span>
                            </button>
                        </li>
                    </ul>
                </div>
                <%

                    User user = (User) session.getAttribute("user");
                    String userRole = null;
                    if (user != null) {
                        userRole = user.getRole();
                    }
                %>



                <% if (user == null) { %>
                <!-- Display these links if user is not logged in -->
                <a href="LoginServlet" class="btn btn-outline-primary ms-2 d-none d-lg-block">Sign in</a>

                <% } else { %>
                <!-- Display these links if user is logged in -->
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
                <!-- Button -->
                <button
                        class="navbar-toggler collapsed ms-2 ms-lg-0"
                        type="button"
                        data-bs-toggle="collapse"
                        data-bs-target="#navbar-default"
                        aria-controls="navbar-default"
                        aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span class="icon-bar top-bar mt-0"></span>
                    <span class="icon-bar middle-bar"></span>
                    <span class="icon-bar bottom-bar"></span>
                </button>
            </div>
        </div>


    </div>
</nav>