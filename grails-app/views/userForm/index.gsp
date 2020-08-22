<%@ page import="userinfo.Country" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<head>
    <title>User Registration Form</title>
    <script
            src="https://code.jquery.com/jquery-3.5.1.js"
            integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
            crossorigin="anonymous"></script>
    <style>
    body {
        background-color: #10213b;
        text-align: center;
        color: white;
        font-family: Arial, Helvetica, sans-serif;
    }
    </style>

</head>
<body>
    <br><br>
    <g:form name = "myform" url = "[controller: 'UserForm', action: 'add']">
        <g:submitButton name = "registerButton" value = "Register" />
    </g:form>
</body>
</html>
