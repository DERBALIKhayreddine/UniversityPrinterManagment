<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Demande Tirage</title>
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
                            <h1 class="mb-1 h2 fw-bold">Demande Tirage</h1>
                            <!-- Breadcrumb -->
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item">
                                        <a href="admin-dashboard.html">Dashboard</a>
                                    </li>

                                    <li class="breadcrumb-item active" aria-current="page">Demande Tirage</li>
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
                            <h4 class="mb-0">Demande Tirage</h4>
                        </div>
                        <form  class="needs-validation" novalidate action="Impression" method="post" enctype="multipart/form-data">
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
                                            <label for="postTitle" class="form-label">Groupe</label>
                                            <select name="groupe" id="groupe" class="form-select">
                                                <c:forEach items="${groups}" var="group" >
                                                    <option value="${group.id}">${group.nom} - ${group.nbetudiants} étudiants</option>
                                                </c:forEach>
                                            </select>
                                        </div>

                                        <div class="mb-3 col-md-12">
                                            <!-- Title -->
                                            <label for="postTitle" class="form-label">Matière</label>
                                            <select name="matiere" id="matiere" class="form-select">
                                                <c:forEach items="${matieres}" var="matiere">
                                                    <option value="${matiere.id}">${matiere.nom}</option>
                                                </c:forEach>
                                            </select>
                                        </div>

                                        <div class=" col-md-12">
                                            <!-- Title -->
                                            <label for="dateImpression">Date d'impression:</label>
                                            <input type="date" name="dateImpression" id="dateImpression" class="form-control">
                                        </div>

                                        <div class="mb-3 col-md-12 d-block">

                                            <label for="document">Document:</label>
                                            <input type="file" name="document" id="document" class="dropzone mt-4 border-dashed rounded-2 w-100">

                                        </div>


                                        <!-- Slug -->



                                    </div>
                                </div>
                                <!-- Editor -->
                                <div class="text-end">
                                    <button type="submit" class="btn btn-primary">Enregister</button>
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
