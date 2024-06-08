<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Demandes </title>
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
                            <h1 class="mb-1 h2 fw-bold">Mes Demandes Impressions</h1>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item">
                                        <a href="admin-dashboard.html">Dashboard</a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">Mes Demandes</li>
                                    <li class="breadcrumb-item active" aria-current="page">Mes Demandes Impressions</li>
                                </ol>
                            </nav>
                        </div>
                        <div>
                            <a href="Impression" class="btn btn-primary">Demande de tirage</a>
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

                                        <th>Enseignant </th>
                                        <th>Groupe</th>
                                        <th>Matière</th>
                                        <th>Date d'Impression</th>
                                        <th>Document</th>
                                        <th>État</th>
                                        <th>Nombre de Pages</th>
                                        <th>Actions</th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${impressions}" var="impression">
                                        <tr>

                                            <td>${impression.enseignantNom}</td>
                                            <td>${impression.groupeNom}</td>
                                            <td>${impression.matiereNom}</td>
                                            <td>${impression.dateImpression}</td>
                                            <td>${impression.document}</td>
                                            <td>${impression.etat}</td>
                                            <td>${impression.nombreDePages}</td>
                                            <td>

                                                <a class="btn btn-danger btn-sm"  onclick="openDeleteConfirmationModal(${impression.id})">
                                                    <i class="fe fe-trash "></i>
                                                    Supprimer
                                                </a>

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

<div class="modal fade" id="deleteConfirmationModal" tabindex="-1" aria-labelledby="deleteConfirmationModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteConfirmationModalLabel">Confirmation de la suppression</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Êtes-vous sûr de vouloir supprimer cet Demande Impression ?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                <a id="deleteUserLink" class="btn btn-danger" href="#">Supprimer</a>
            </div>
        </div>
    </div>
</div>

<!-- Link to trigger modal -->


<script>
    function openDeleteConfirmationModal(id) {
        var deleteUserLink = document.getElementById('deleteUserLink');
        deleteUserLink.href = "listimpressions?action=delete&id=" + id;
        $('#deleteConfirmationModal').modal('show');
    }
</script>

</body>
</html>
