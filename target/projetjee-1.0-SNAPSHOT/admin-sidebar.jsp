<%@ page import="tn.iit.projetjee.entity.User" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar-vertical navbar">
    <%
        User userr = (User) session.getAttribute("user");
    %>

    <div class="vh-100" data-simplebar>
        <!-- Brand logo -->
        <a class="navbar-brand" href="HomeServlet">
            <img src="${pageContext.request.contextPath}/assets/logoISB2.png" class="logo-img" alt="Geeks" />
        </a>
        <style>
            .logo-img {
                height: 3rem;
            }

        </style>
        <!-- Navbar nav -->
        <% var userRole = userr.getRole(); %>
        <ul class="navbar-nav flex-column" id="sideNavbar">
            <% if (userr.getRole().equals("admin")) { %>

            <li class="nav-item">
                <a class="nav-link   " href="admindasboard" >
                    <i class="nav-icon fe fe-home me-2"></i>
                    Dashboard
                </a>

            </li>


            <!-- Nav item -->
            <li class="nav-item">
                <a class="nav-link  collapsed " href="#" data-bs-toggle="collapse" data-bs-target="#navProfile"
                   aria-expanded="false" aria-controls="navProfile">
                    <i class="nav-icon fe fe-user me-2"></i>
                    User
                </a>
                <div id="navProfile" class="collapse " data-bs-parent="#sideNavbar">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link " href="AdminServlet">Gestion Utilisateurs</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="RoleServlet">Gestion Roles</a>
                        </li>
                    </ul>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link " href="MatiereServlet">
                            <span>
                               <svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-school"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M22 9l-10 -4l-10 4l10 4l10 -4v6" /><path d="M6 10.6v5.4a6 3 0 0 0 12 0v-5.4" /></svg>
                            </span>
                    <span class="ms-2">Gestion Matieres</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link " href="GroupServlet">
                            <span>
                               <svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-users-group"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M10 13a2 2 0 1 0 4 0a2 2 0 0 0 -4 0" /><path d="M8 21v-1a2 2 0 0 1 2 -2h4a2 2 0 0 1 2 2v1" /><path d="M15 5a2 2 0 1 0 4 0a2 2 0 0 0 -4 0" /><path d="M17 10h2a2 2 0 0 1 2 2v1" /><path d="M5 5a2 2 0 1 0 4 0a2 2 0 0 0 -4 0" /><path d="M3 13v-1a2 2 0 0 1 2 -2h2" /></svg>
                            </span>
                    <span class="ms-2">Gestion Groupes</span>
                </a>
            </li>
            <% } %>


            <% if (userr.getRole().equals("admin") || userr.getRole().equals("enseignant")) { %>

            <li class="nav-item">
                <a class="nav-link " href="usermatiere">
                            <span>
                               <svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-select"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M3 3m0 2a2 2 0 0 1 2 -2h14a2 2 0 0 1 2 2v14a2 2 0 0 1 -2 2h-14a2 2 0 0 1 -2 -2z" /><path d="M9 11l3 3l3 -3" /></svg>
                            </span>
                    <span class="ms-2">Select Matieres</span>
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link " href="Impression">
                            <span>
                               <svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-calendar-repeat"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M12.5 21h-6.5a2 2 0 0 1 -2 -2v-12a2 2 0 0 1 2 -2h12a2 2 0 0 1 2 2v3" /><path d="M16 3v4" /><path d="M8 3v4" /><path d="M4 11h12" /><path d="M20 14l2 2h-3" /><path d="M20 18l2 -2" /><path d="M19 16a3 3 0 1 0 2 5.236" /></svg>
                            </span>
                    <span class="ms-2">Demande De Tirage</span>
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link " href="ImpressionListServlet">
                            <span>
                               <svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-file-type-pdf"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M14 3v4a1 1 0 0 0 1 1h4" /><path d="M5 12v-7a2 2 0 0 1 2 -2h7l5 5v4" /><path d="M5 18h1.5a1.5 1.5 0 0 0 0 -3h-1.5v6" /><path d="M17 18h2" /><path d="M20 15h-3v6" /><path d="M11 15v6h1a2 2 0 0 0 2 -2v-2a2 2 0 0 0 -2 -2h-1z" /></svg>
                            </span>
                    <span class="ms-2">Mes Demandes</span>
                </a>
            </li>
            <% } %>


            <% if (userr.getRole().equals("admin") || userr.getRole().equals("agent")) { %>
            <!-- Nav item -->
            <li class="nav-item">
                <a class="nav-link " href="AgentImpression">
                            <span>
                             <svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-printer"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M17 17h2a2 2 0 0 0 2 -2v-4a2 2 0 0 0 -2 -2h-14a2 2 0 0 0 -2 2v4a2 2 0 0 0 2 2h2" /><path d="M17 9v-4a2 2 0 0 0 -2 -2h-6a2 2 0 0 0 -2 2v4" /><path d="M7 13m0 2a2 2 0 0 1 2 -2h6a2 2 0 0 1 2 2v4a2 2 0 0 1 -2 2h-6a2 2 0 0 1 -2 -2z" /></svg>
                            </span>
                    <span class="ms-2">Liste des Impressions</span>
                </a>
            </li>
            <!-- Nav item -->
            <li class="nav-item">
                <a class="nav-link " href="AgentCalendarServlet">
                            <span>
                               <svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-calendar-week"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M4 7a2 2 0 0 1 2 -2h12a2 2 0 0 1 2 2v12a2 2 0 0 1 -2 2h-12a2 2 0 0 1 -2 -2v-12z" /><path d="M16 3v4" /><path d="M8 3v4" /><path d="M4 11h16" /><path d="M8 14v4" /><path d="M12 14v4" /><path d="M16 14v4" /></svg>
                            </span>
                    <span class="ms-2">Calendrier</span>
                </a>
            </li>
            <li class="nav-item">
                <div class="nav-divider"></div>
            </li>
            <% } %>
            <!-- Nav item -->

        </ul>
        <!-- Card -->

    </div>
</nav>
