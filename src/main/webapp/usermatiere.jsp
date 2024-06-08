
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Matiére Enseignant</title>
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
                            <h1 class="mb-1 h2 fw-bold">Selectioné les matieres</h1>
                            <!-- Breadcrumb -->
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item">
                                        <a href="admin-dashboard.html">Dashboard</a>
                                    </li>

                                    <li class="breadcrumb-item active" aria-current="page">Selectioné les matieres</li>
                                </ol>
                            </nav>
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
                            <h4 class="mb-0">Select matiere</h4>


                        </div>
                        <form action="usermatiere" method="post" class="needs-validation" novalidate>
                            <!-- Card body -->
                            <div class="card-body">

                                <!-- Add the "Upload" button -->
                                <div class="mt-4">
                                    <!-- Form -->
                                    <div class="row">
                                        <!-- Date -->
                                        <input type="hidden" name="action" value="add">
                                        <div class="mb-3 col-md-12">
                                            <!-- Title -->

                                            <c:forEach var="matiere" items="${matieres}">
                                                <input type="checkbox" class="form-check-input fs-3" name="subject" value="${matiere.id}" ${matiereIds.contains(matiere.id) ? 'checked' : ''}>
                                                <label class="form-check-label fs-3" for="flexCheckDefault">
                                                        ${matiere.nom}
                                                </label>
                                                <br>
                                            </c:forEach>






                                        </div>




                                    </div>
                                </div>
                                <!-- Editor -->

                                <!-- button -->
                                <button type="submit" class="btn btn-primary">Enregister</button>

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
