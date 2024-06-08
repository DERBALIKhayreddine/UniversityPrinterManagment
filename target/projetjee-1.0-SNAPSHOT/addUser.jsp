<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="tn.iit.projetjee.entity.Matiere" %>
<%@ page import="tn.iit.projetjee.entity.Role" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Ajouter User</title>
</head>
<body>
<div id="db-wrapper">
    <!-- navbar vertical -->


    <!-- navbar vertical -->
    <!-- Sidebar -->
    <%@ include file="admin-sidebar.jsp" %>


    <!-- Page Content -->
    <main id="page-content">
        <div class="header">
            <!-- navbar -->

            <%@ include file="admin-header.jsp" %>
        </div>

        <!-- Container fluid -->
        <section class="container-fluid p-4">
            <div class="row">
                <!-- Page header -->
                <div class="col-lg-12 col-md-12 col-12">
                    <div class="border-bottom pb-3 mb-3 d-md-flex align-items-center justify-content-between">
                        <div class="mb-3 mb-md-0">
                            <h1 class="mb-1 h2 fw-bold">Ajouter un utilisateur</h1>
                            <!-- Breadcrumb -->
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item">
                                        <a href="admin-dashboard.html">Dashboard</a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">Gestion Utilisateurs</li>

                                    <li class="breadcrumb-item active" aria-current="page">Ajouter un utilisateur</li>
                                </ol>
                            </nav>
                        </div>
                        <div>
                            <a href="AdminServlet" class="btn btn-outline-secondary">Retour</a>
                        </div>

                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-12 col-lg-12 col-md-12 col-12">
                    <!-- Card -->
                    <div class="card border-0 mb-4">
                        <!-- Card header -->
                        <div class="card-header">
                            <h4 class="mb-0">Ajouter un utilisateur</h4>
                        </div>
                        <form  action="AdminServlet?action=add" method="post" >
                            <!-- Card body -->
                            <div class="card-body">
                                <% if (request.getAttribute("error") != null) { %>
                                <p style="color: red;"><%= request.getAttribute("error") %></p>
                                <% } %>
                                <!-- Add the "Upload" button -->
                                <div class="mt-4">
                                    <!-- Form -->
                                    <div class="row">
                                        <!-- Date -->


                                        <div class=" col-md-6">
                                            <!-- Title -->
                                            <label for="dateImpression"  class="form-label">Nom:</label>
                                            <input type="text" name="nom" id="nom" class="form-control" placeholder="Nom" required>
                                            <div class="invalid-feedback">Veuillez saisir un nom.</div>
                                        </div>
                                        <div class=" col-md-6">
                                            <!-- Title -->
                                            <label for="dateImpression"  class="form-label">Prénom:</label>
                                            <input type="text" name="prenom" id="prenom" class="form-control" placeholder="Prénom"required>
                                            <div class="invalid-feedback">Veuillez saisir un prenom.</div>
                                        </div>
                                        <div class=" col-md-6">
                                            <!-- Title -->
                                            <label for="dateImpression"  class="form-label">Adresse E-mail:</label>
                                            <input type="email" name="email" id="email" class="form-control" placeholder="Adresse E-mail"required>
                                            <div class="invalid-feedback">Veuillez saisir un Adresse E-mail.</div>


                                        </div>
                                        <div class=" col-md-6">

                                            <!-- Title -->
                                            <label for="dateImpression"  class="form-label">Mot de passe :</label>
                                            <input type="text" name="password" id="password" class="form-control" placeholder="Mot de passe" required>
                                            <div class="invalid-feedback">Veuillez saisir un mot de passe.</div>

                                        </div>

                                        <div class="col-md-6">
                                            <!-- Title -->
                                            <label for="postTitle" class="form-label">Role</label>
                                            <select name="role" id="role"  class="form-select">
                                                <%-- Utiliser une boucle pour afficher les options des matières --%>
                                                <% List<Role> roles = (List<Role>) request.getAttribute("roles");
                                                    if (roles != null) {
                                                        for (Role role : roles) { %>
                                                <option value="<%= role.getName() %>"><%= role.getName() %></option>
                                                <%     }
                                                } %>
                                            </select>
                                        </div>

                                        <div class=" col-md-6 mt-5">
                                            <!-- Title -->
                                            <label for="dateImpression "  class="form-label">Activer le compte :</label>
                                            <input type="checkbox" class="form-check-input " name="activeCheckbox" id="activeCheckbox" >
                                            <input type="hidden" name="active" id="activeHiddenInput" value="true">
                                        </div>




                                    </div>
                                </div>
                                <!-- Editor -->
                                <div class="text-end">
                                    <button type="submit" class="btn btn-primary" value="Ajouter">Enregister</button>
                                </div>
                                <!-- button -->


                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </main>
</div>

</body>
</html>
