<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Liste Matiéres</title>
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
                <!-- Page Header -->
                <div class="col-lg-12 col-md-12 col-12">
                    <div class="border-bottom pb-3 mb-3 d-flex align-items-center justify-content-between">
                        <div>
                            <h1 class="mb-1 h2 fw-bold">Liste Matiéres</h1>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item">
                                        <a href="admin-dashboard.html">Dashboard</a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">Gestion Matiéres</li>

                                    <li class="breadcrumb-item active" aria-current="page">Matiéres</li>
                                </ol>
                            </nav>
                        </div>
                        <div>
                            <a href="addMatiere.jsp" class="btn btn-primary">Ajouter une matiere</a>
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
                                        <th>Matiere</th>
                                        <th>Description</th>
                                        <th>Actions</th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="matiere" items="${matieres}">
                                        <tr>
                                            <td>${matiere.nom}</td>
                                            <td>${matiere.description}</td>
                                            <td>
                                                    		<span class="dropdown dropstart">
                                                                <a class="btn-icon btn btn-ghost btn-sm rounded-circle"
                                                                   href="#" role="button" id="courseDropdown1"
                                                                   data-bs-toggle="dropdown" data-bs-offset="-20,20"
                                                                   aria-expanded="false">
                                                                    <i class="fe fe-more-vertical"></i>
                                                                </a>
                                                                <span class="dropdown-menu"
                                                                      aria-labelledby="courseDropdown1">
                                                                    <span class="dropdown-header">Paramétres</span>
                                                                    <a class="dropdown-item" href="Matiere?action=edit&id=${matiere.id}">
                                                                        <i class="fe fe-edit dropdown-item-icon"></i>
                                                                        Modifier
                                                                    </a>


                                                                    <a class="dropdown-item" href="#" onclick="openDeleteConfirmation(${matiere.id})">
																	    <i class="fe fe-trash dropdown-item-icon"></i>
																	    Supprimer
																	</a>
                                                                </span>
                                                            </span>
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
                Êtes-vous sûr de vouloir supprimer cet Matiére ?
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
        deleteUserLink.href = "MatiereServlet?action=delete&id=" + id;
        $('#deleteConfirmation').modal('show');
    }
</script>
</body>
</html>
