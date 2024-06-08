<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Liste des Impressions</title>
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
