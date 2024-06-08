<%@ page import="tn.iit.projetjee.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%
    HttpSession session1 = request.getSession(false);
    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<html>
<head>
    <meta charset="utf-8" />
    <title>Dashboard Agent</title>
</head>
<body>
<div class="navbar">
    <div class="logo">
        <h6>Dashboard Agent</h6>
    </div>
    <div>
        <a href="logout">Sign Out</a>
    </div>
</div>
<div class="main-content">
    <h1>Dashboard Agent</h1>
</div>
<footer>
    &copy; 2024 Your Company. All rights reserved.
</footer>
</body>
</html>
