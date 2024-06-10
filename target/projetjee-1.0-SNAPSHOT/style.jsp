<%@ page language="java" contentType="text/css; charset=UTF-8" pageEncoding="UTF-8"%>

body {
    background: url('${pageContext.request.contextPath}/assets/netflix-background.jpg') no-repeat center center fixed;
    background-size: cover;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
    font-family: Arial, sans-serif;
}

.container {
    background-color: rgba(0, 0, 0, 0.75);
    padding: 2rem;
    border-radius: 10px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.5);
}

.card {
    border: none;
}

.card-body {
    color: white;
}

.form-control {
    background-color: #333;
    border: none;
    color: white;
}

.form-control::placeholder {
    color: #999;
}

.btn-primary {
    background-color: #e50914;
    border: none;
}

.btn-primary:hover {
    background-color: #f6121d;
}

.invalid-feedback {
    color: #e87c03;
}
