<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="tn.iit.projetjee.entity.User" %>
<html>
<head>
    <title>Liste des Impressions</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
    <style>
        .logo-img {
            height: 3rem;
            position: relative;
            align-items: center;
        }
        .navbar-vertical {
            position: fixed;
            height: 100%;
            width: 250px;
            background-color: #3E65A0;
            color: white;
        }
        .nav-item {
            color: white;
        }
        .nav-item a {
            color: white !important;
            text-decoration: none; /* To remove underline */
        }
        #page-content {
            margin-left: 250px;
            padding: 20px;
        }
    </style>
</head>
<body>
<script src="https://kit.fontawesome.com/ab18cab0ff.js" crossorigin="anonymous"></script>

<!-- Sidebar -->
<nav class="navbar-vertical navbar">
    <%
        User userr = (User) session.getAttribute("user");
    %>
    <div class="vh-100" data-simplebar>
        <!-- Brand logo -->
        <a class="navbar-brand" href="HomeServlet" style="color: white">
            <h5 >Printer managment IIT </h5>
        </a>

        <!-- Navbar nav -->
        <% String userRole = userr.getRole(); %>
        <ul class="navbar-nav flex-column" id="sideNavbar">
            <% if (userr.getRole().equals("admin")) { %>
            <li class="nav-item">
                <a class="nav-link" href="admindasboard">
                    <i class="nav-icon fe fe-home me-2"></i>
                    Dashboard
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="AdminServlet">
                     <span>
                       <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-tabler icons-tabler-outline icon-tabler-users-group"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M10 13a2 2 0 1 0 4 0a2 2 0 0 0 -4 0"/><path d="M8 21v-1a2 2 0 0 1 2 -2h4a2 2 0 0 1 2 2v1"/><path d="M15 5a2 2 0 1 0 4 0a2 2 0 0 0 -4 0"/><path d="M17 10h2a2 2 0 0 1 2 2v1"/><path d="M5 5a2 2 0 1 0 4 0a2 2 0 0 0 -4 0"/><path d="M3 13v-1a2 2 0 0 1 2 -2h2"/></svg>
                   Gestion Utilisateurs
                    </span>

                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="RoleServlet">

                     <span>
                       <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-tabler icons-tabler-outline icon-tabler-users-group"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M10 13a2 2 0 1 0 4 0a2 2 0 0 0 -4 0"/><path d="M8 21v-1a2 2 0 0 1 2 -2h4a2 2 0 0 1 2 2v1"/><path d="M15 5a2 2 0 1 0 4 0a2 2 0 0 0 -4 0"/><path d="M17 10h2a2 2 0 0 1 2 2v1"/><path d="M5 5a2 2 0 1 0 4 0a2 2 0 0 0 -4 0"/><path d="M3 13v-1a2 2 0 0 1 2 -2h2"/></svg>
                     Gestion Roles
                    </span>

                </a>
            </li>
            <!-- Nav item -->
            <li class="nav-item">
                <a class="nav-link" href="MatiereServlet">
                    <span>
                       <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-tabler icons-tabler-outline icon-tabler-school"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M22 9l-10 -4l-10 4l10 4l10 -4v6"/><path d="M6 10.6v5.4a6 3 0 0 0 12 0v-5.4"/></svg>
                    </span>
                    <span class="ms-2">Gestion Matieres</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="GroupServlet">
                    <span>
                       <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-tabler icons-tabler-outline icon-tabler-users-group"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M10 13a2 2 0 1 0 4 0a2 2 0 0 0 -4 0"/><path d="M8 21v-1a2 2 0 0 1 2 -2h4a2 2 0 0 1 2 2v1"/><path d="M15 5a2 2 0 1 0 4 0a2 2 0 0 0 -4 0"/><path d="M17 10h2a2 2 0 0 1 2 2v1"/><path d="M5 5a2 2 0 1 0 4 0a2 2 0 0 0 -4 0"/><path d="M3 13v-1a2 2 0 0 1 2 -2h2"/></svg>
                    </span>
                    <span class="ms-2">Gestion Groupes</span>
                </a>
            </li>
            <% } %>

            <% if (userr.getRole().equals("admin") || userr.getRole().equals("enseignant")) { %>
            <li class="nav-item">
                <a class="nav-link" href="usermatiere">
                    <span>
                       <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-tabler icons-tabler-outline icon-tabler-select"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M3 3m0 2a2 2 0 0 1 2 -2h14a2 2 0 0 1 2 2v14a2 2 0 0 1 -2 2h-14a2 2 0 0 1 -2 -2z"/><path d="M9 11l3 3l3 -3"/></svg>
                    </span>
                    <span class="ms-2">Select Matieres</span>
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="Impression">
                    <span>
                       <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-tabler icons-tabler-outline icon-tabler-calendar-repeat"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M12.5 21h-6.5a2 2 0 0 1 -2 -2v-12a2 2 0 0 1 2 -2h12a2 2 0 0 1 2 2v3"/><path d="M16 3v4"/><path d="M8 3v4"/><path d="M4 11h12"/><path d="M20 14l2 2h-3"/><path d="M20 18l2 -2"/><path d="M19 16a3 3 0 1 0 2 5.236"/></svg>
                    </span>
                    <span class="ms-2">Demande De Tirage</span>
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="ImpressionListServlet">
                    <span>
                       <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-tabler icons-tabler-outline icon-tabler-file-type-pdf"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M14 3v4a1 1 0 0 0 1 1h4"/><path d="M5 12v-7a2 2 0 0 1 2 -2h7l5 5v4"/><path d="M5 18h1.5a1.5 0 0 0 0 -3h-1.5v6"/><path d="M17 18h2"/><path d="M20 15h-3v6"/><path d="M11 15v6h1a2 2 0 0 0 2 -2v-2a2 2 0 0 0 -2 -2h-1z"/></svg>
                    </span>
                    <span class="ms-2">Mes Demandes</span>
                </a>
            </li>
            <% } %>

            <% if (userr.getRole().equals("admin") || userr.getRole().equals("agent")) { %>
            <!-- Nav item -->
            <li class="nav-item">
                <a class="nav-link" href="AgentImpression">
                    <span>
                     <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-tabler icons-tabler-outline icon-tabler-printer"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M17 17h2a2 2 0 0 0 2 -2v-4a2 2 0 0 0 -2 -2h-14a2 2 0 0 0 -2 2v4a2 2 0 0 0 2 2h2"/><path d="M17 9v-4a2 2 0 0 0 -2 -2h-6a2 2 0 0 0 -2 2v4"/><path d="M7 13m0 2a2 2 0 0 1 2 -2h6a2 2 0 0 1 2 2v4a2 2 0 0 1 -2 2h-6a2 2 0 0 1 -2 -2z"/></svg>
                    </span>
                    <span class="ms-2">Liste des Impressions</span>
                </a>
            </li>
            <!-- Nav item -->
            <li class="nav-item">
                <a class="nav-link" href="AgentCalendarServlet">
                    <span>
                       <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-tabler icons-tabler-outline icon-tabler-calendar-week"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M4 7a2 2 0 0 1 2 -2h12a2 2 0 0 1 2 2v12a2 2 0 0 1 -2 2h-12a2 2 0 0 1 -2 -2v-12z"/><path d="M16 3v4"/><path d="M8 3v4"/><path d="M4 11h16"/><path d="M8 14v4"/><path d="M12 14v4"/><path d="M16 14v4"/></svg>
                    </span>
                    <span class="ms-2">Calendrier</span>
                </a>
            </li>
            <li class="nav-item">
                <div class="nav-divider"></div>
            </li>
            <% } %>
        </ul>
    </div>
</nav>
<!-- Page Content -->
<main id="page-content">
    <header class="p-3 ">
        <div class="container">
            <div class="d-flex flex-wrap align-items-center justify-content-between">
                <!-- Left side: Avatar and Email -->
                <div class="d-flex align-items-center">
                    <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                        <div class="avatar avatar-md avatar-indicators avatar-online">
                            <img alt="avatar" src="${pageContext.request.contextPath}/assets/avatar.png" class="rounded-circle" width="50px" height="50px" />
                        </div>
                    </a>
                    <ul class="nav col-12 col-lg-auto mb-2 mb-lg-0 ms-3">
                        <li class="nav-item">
                            <%
                                User user = (User) session.getAttribute("user");
                            %>
                            <span class="nav-link text-black">
                            <%= user.getEmail() %>
                        </span>
                        </li>
                    </ul>
                </div>

                <!-- Right side: Search and Sign-up -->
                <div class="d-flex align-items-center">
                    <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-3">
                        <input type="search" class="form-control form-control-dark" placeholder="Search..." aria-label="Search">
                    </form>
                    <div class="text-end">
                        <a href="LogoutServlet"><button type="button" class="btn btn-warning">Log out</button></a>
                    </div>
                </div>
            </div>
        </div>
    </header>
        <section class="container-fluid p-4">
            <div class="row">
                <!-- Page Header -->
                <div class="col-lg-12 col-md-12 col-12">
                    <div class="border-bottom pb-3 mb-3 d-flex align-items-center justify-content-between">
                        <div>
                            <h1 class="mb-1 h2 fw-bold">Liste des Impressions</h1>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item">
                                        <a href="admin-dashboard.html">Dashboard</a>
                                    </li>

                                    <li class="breadcrumb-item active" aria-current="page">Liste des Impressions</li>
                                </ol>
                            </nav>
                        </div>

                        <div>

                        </div>
                        <div class="text-end">
                            <a href="agentimpressionslog" class="btn btn-primary">Historique</a>
                            <a href="AgentCalendarServlet" class="btn btn-primary">Voir le calendrier</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <!-- basic table -->
                <div class="col-md-12 col-12 mb-5">
                    <div class="card">

                        <div class="card-body">
                            <div class="table-card">
                                <table id="dataTableBasic" class="table table-hover" style="width: 100%">
                                    <thead class="table-light">
                                    <tr>
                                        <th>Détails</th>
                                        <th>Enseignant</th>
                                        <th>Groupe</th>


                                        <th>Jours restants</th>

                                        <th>État</th>

                                        <th>Actions</th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${impressions}" var="impression">
                                        <tr>
                                            <td>

                                                <a href="#" class="text-inherit">
                                                    <div class="d-flex align-items-center">
                                                        <div>
                                                            <img src="${pageContext.request.contextPath}/assets/pdfimg.png" alt="" class="img-4by3-lg rounded">
                                                        </div>
                                                        <div class="ms-3">
                                                            <h4 class="mb-1 text-primary-hover">${impression.nombreDePages} pages pour la matiere ${impression.matiereNom}</h4>
                                                            <span>${impression.dateImpression}</span>
                                                        </div>
                                                    </div>
                                                </a>
                                            </td>
                                            <td>${impression.enseignantNom}</td>
                                            <td>${impression.groupeNom}</td>



                                            <td>
                                                <c:set var="today" value="<%= new java.util.Date() %>" />

                                                <c:set var="dateFormat" value="<%= new java.text.SimpleDateFormat(\"yyyy-MM-dd\") %>" />
                                                <c:set var="dateImpression" value="${dateFormat.parse(impression.dateImpression)}" />
                                                <c:set var="joursRestants" value="${(dateImpression.time - today.time) / (1000 * 60 * 60 * 24)}" />

                                                <c:set var="joursRestantsInt" value="${joursRestants.intValue()}" />

                                                    ${joursRestantsInt} jour(s) restant(s)









                                            </td>

                                            <td>
                                                <c:if test="${impression.etat eq 'En attente'}">
                                                <span class="badge bg-info-soft">${impression.etat}</span>
                                                </c:if>
                                                <c:if test="${impression.etat ne 'En attente'}">
                                                <span class="badge bg-danger">${impression.etat}</span>
                                                </c:if>


                                            <td>
                                                <div class="col-md-12 row">
                                                    <div class="col-md-6">
                                                        <a class="btn btn-secondary btn-sm mx-2" href="agentimpressions?action=imprime&id=${impression.id}">
                                                            <span class="fe fe-download "></span>
                                                            Imprimer
                                                        </a>
                                                    </div>
                                                    <div class="col-md-6">


                                                        <a class="btn btn-danger btn-sm"  onclick="openDeleteConfirmation(${impression.id})">
                                                            <i class="fe fe-trash "></i>
                                                            Supprimer
                                                        </a>
                                                    </div>


                                                </div>

                                            </td>


                                        </tr>
                                    </c:forEach>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>
    </main>
</div>
<div class="modal fade" id="deleteConfirmation" tabindex="-1" aria-labelledby="deleteConfirmationLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteConfirmationLabel">Confirmation de la suppression</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Êtes-vous sûr de vouloir supprimer cet Demande ?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                <a id="deleteUserLink" class="btn btn-danger" href="#">Supprimer</a>
            </div>
        </div>
    </div>
</div>



<script>
    function openDeleteConfirmation(id) {
        var deleteUserLink = document.getElementById('deleteUserLink');
        deleteUserLink.href = "agentimpressions?action=delete&id=" + id;
        $('#deleteConfirmation').modal('show');
    }
</script>
</body>
</html>
