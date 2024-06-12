<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Authentification</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <style>
        body {
            background-color: #343a40; /* Setting background color */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .card {
            max-width: 400px; /* Increase the card size horizontally */
            width: 400px;
        }

        .logo-img {
            height: 10rem; /* Adjust logo size if needed */
        }
    </style>
</head>
<body>
<main>
    <section class="container d-flex flex-column">
        <div class="row align-items-center justify-content-center g-0 h-lg-100 py-8">
            <div class="col-lg-12 col-md-12 py-5 py-xl-5">
                <!-- Card -->
                <div class="card shadow mx-auto">
                    <!-- Card body -->
                    <div class="card-body p-6">
                        <div class="mb-4 text-center">
                            <a href="../index.html"><img src="${pageContext.request.contextPath}/assets/logoiit.png" class="mb-4 logo-img" alt="logo-icon"></a>
                        </div>
                        <!-- Form -->
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
                                <input type="password" id="password" name="password" class="form-control" name="password" placeholder="*******" required>
                                <div class="invalid-feedback">Please enter valid password.</div>
                            </div>
                            <div>
                                <!-- Button -->
                                <div class="d-flex justify-content-center mt-2">
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

<script>
    $(document).ready(function() {
        <% if (request.getAttribute("errorMessage") != null) { %>
        toastr.error('<%= request.getAttribute("errorMessage") %>', 'Erreur');
        <% } %>
    });
</script>
</body>
</html>
