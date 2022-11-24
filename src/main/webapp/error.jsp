<%@ page import="com.example.lab_2.models.Point" %>
<%@ page import="java.util.Arrays" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap">
    <title>Error</title>
</head>
<body style="font-family: 'Roboto', sans-serif;">

<div style="display: flex; flex-direction: column; justify-content: center; align-items: center; height:  100%">
    <% if (response.getStatus() == 400) { %>
    <h1 style="font-size: 30px; color: red; text-align: center; ">
        ${error}
    </h1>
    <% }%>
    <div>
        <a href="/" style="font-size: 20px; text-align: center; text-decoration: none">To the main page</a>
    </div>
</div>
</body>
</html>