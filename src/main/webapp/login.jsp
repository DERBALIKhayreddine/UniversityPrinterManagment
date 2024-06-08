
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Authentification</title>
</head>
<body>

<main>
    <section class="container d-flex flex-column vh-100">
        <div class="row align-items-center justify-content-center g-0 h-lg-100 py-8">
            <div class="col-lg-5 col-md-8 py-8 py-xl-0">
                <!-- Card -->
                <div class="card shadow">
                    <!-- Card body -->
                    <div class="card-body p-6">
                        <div class="mb-4 text-center">
                            <a href="../index.html"><img src="${pageContext.request.contextPath}/assets/logoISB2.png" class="mb-4 logo-img" alt="logo-icon"></a>

                            <style>
                                .logo-img {
                                    height: 15rem;
                                }

                            </style>
                        </div>
                        <!-- Form -->
                        <% if (request.getAttribute("errorMessage") != null) { %>
                        <p style="color: red;"><%= request.getAttribute("errorMessage") %></p>
                        <% } %>
                        <form action="Login" method="post" class="needs-validation" novalidate>
                            <!-- Username -->
                            <div class="mb-3">
                                <label for="email" class="form-label">Adresse E-mail</label>
                                <input type="text" id="email" name="email" class="form-control"  placeholder="Adresse E-mail" required>
                                <div class="invalid-feedback">Veuillez saisir un Adresse E-mail.</div>
                            </div>
                            <!-- Password -->
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" id="password" name="password" class="form-control" name="password" placeholder="**************" required>
                                <div class="invalid-feedback">Please enter valid password.</div>
                            </div>


                            <div>
                                <!-- Button -->
                                <div class="d-grid mt-2">
                                    <button type="submit" value="login" class="btn btn-primary">Se connecter</button>
                                </div>
                            </div>
                            <hr class="my-4">

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

</main>

</body>
</html>
