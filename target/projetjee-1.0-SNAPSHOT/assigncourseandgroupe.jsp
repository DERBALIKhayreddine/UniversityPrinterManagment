<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="tn.iit.projetjee.entity.User" %>
<%@ page import="tn.iit.projetjee.entity.Groupe" %>
<%@ page import="java.util.List" %>
<%@ page import="tn.iit.projetjee.entity.Course" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>

<%
    List<User> userList = (List<User>) request.getAttribute("userList");
    List<Course> courseList = (List<Course>) request.getAttribute("courseList");
    List<Groupe> groupList = (List<Groupe>) request.getAttribute("groupList");

    System.out.println("User List in JSP: " + userList);
    System.out.println("Course List in JSP: " + courseList);
    System.out.println("Group List in JSP: " + groupList);
%>

<html>
<head>
    <title>Assign Courses and Groups to Teachers</title>
</head>
<body>
<h2>Assign Courses and Groups to Teachers</h2>
<form action="AssignCoursesAndGroupsServlet" method="post">
    <select name="teacherId">
        <option value="">Select Teacher</option>
        <% if (userList != null && !userList.isEmpty()) {
            for (User teacher : userList) { %>
        <option value="<%= teacher.getUserId() %>"><%= teacher.getName() %></option>
        <%  }
        } else { %>
        <option value="">No Teachers Available</option>
        <% } %>
    </select>
    <select name="courseId">
        <option value="">Select Course</option>
        <% if (courseList != null && !courseList.isEmpty()) {
            for (Course course : courseList) { %>
        <option value="<%= course.getCourseId() %>"><%= course.getName() %></option>
        <%  }
        } else { %>
        <option value="">No Courses Available</option>
        <% } %>
    </select>
    <select name="groupId">
        <option value="">Select Group</option>
        <% if (groupList != null && !groupList.isEmpty()) {
            for (Groupe group : groupList) { %>
        <option value="<%= group.getGroupeId() %>"><%= group.getName() %></option>
        <%  }
        } else { %>
        <option value="">No Groups Available</option>
        <% } %>
    </select>
    <button type="submit">Assign</button>
</form>
</body>
</html>
