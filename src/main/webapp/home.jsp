<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Home</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #3E65A0; /* Changed body background color */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .card {
            background-color: #FFFFFF; /* Changed card background color to white */
            color: #000000; /* Changed text color to black */
            width: 400px; /* Decreased width */
            text-align: center;
            padding: 20px;
        }

        h3 {
            font-size: 3.5rem; /* Smaller font size */
        }

        h1 {
            color: #000000; /* Changed h1 text color to black */
            font-weight: bold; /* Text made bold */
        }

        .btn {
            font-size: 1rem; /* Smaller font size for button */
            padding: 10px 20px; /* Reduced padding for button */
        }
    </style>
</head>
<body>
<main>
    <section class="py-lg-8 py-5">
        <div class="container my-lg-8">
            <div class="row align-items-center">
                <div class="col-lg-12 mb-6 mb-lg-0">
                    <div class="card">
                        <img src="${pageContext.request.contextPath}/assets/logoiit.png" class="img-fluid mx-auto d-block mb-4" alt="Your Logo">
                        <h1 class=" mb-4">
                            <strong>Printer Management System</strong>
                        </h1>
                        <a class="btn btn-primary" href="login.jsp">Login</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>
</body>
</html>
