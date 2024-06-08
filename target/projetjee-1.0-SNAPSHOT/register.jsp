<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        .form-container {
            max-width: 400px;
            margin: auto;
        }
    </style>
    <title>Register</title>
</head>
<body class="d-flex h-100 text-center text-white bg-dark">
<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
    <header class="mb-auto">
        <div>
            <h3 class="float-md-start mb-0">Printer</h3>
            <nav class="nav nav-masthead justify-content-center float-md-end">
                <a class="nav-link active" aria-current="page" href="home.jsp">Home</a>
                <a class="nav-link" href="login.jsp">Log in</a>
            </nav>
        </div>
    </header>

    <main class="px-3">
        <div class="form-container">
            <form class="form-signin" action="register" method="post">
                <h1 class="h3 mb-3 fw-normal">Register</h1>

                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingFirstName" name="name" placeholder="First Name" required>
                    <label for="floatingFirstName" style="color: black">First Name</label>
                </div>

                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingLastName" name="lname" placeholder="Last Name" required>
                    <label for="floatingLastName" style="color: black">Last Name</label>
                </div>

                <div class="form-floating mb-3">
                    <input type="email" class="form-control" id="floatingEmail" name="email" placeholder="name@example.com" required>
                    <label for="floatingEmail" style="color: black">Email</label>
                </div>

                <div class="form-floating mb-3">
                    <input type="password" class="form-control" id="floatingPassword" name="password" placeholder="Password" required>
                    <label for="floatingPassword" style="color: black">Password</label>
                </div>

                <div class="form-floating mb-3">
                    <select class="form-control" id="floatingRole" name="role" required>
                        <option value="teacher">Teacher</option>
                        <option value="admin">Admin</option>
                        <option value="agent">Agent</option>
                    </select>
                    <label for="floatingRole" style="color: black">Role</label>
                </div>

                <button class="w-100 btn btn-lg btn-danger" type="submit">Register</button>
                <p class="mt-5 mb-3 text-muted">&copy; 2021–2024</p>
            </form>
        </div>
    </main>

    <footer class="mt-auto text-white-50">
        <p>This project is created by <a href="#" class="text-white">Khayreddine Derbali</a>.</p>
    </footer>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
