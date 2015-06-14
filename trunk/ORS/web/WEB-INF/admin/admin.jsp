

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../../lib/bootstrap-3.3.4-dist/css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="b"/>
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap-responsive.min.css"/>
        <link rel="stylesheet" href="../../css/Login/css/styles.css"/>
        <script src="../../css/Login/js/script.js"></script>
        <script src="../../lib/jquery-1.11.3.min.js"></script>
        <!--[if lt IE 9]>
          <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->


        <script>
            function validateForm()
            {
                var x=document.forms["login"]["txtUsername"].value;
                var y=document.forms["login"]["txtPassword"].value;
                if (x==null || x=="")
                {
                    alert("Username must be filled out");
                    return false;
                }
                if (y==null || y=="")
                {
                    alert("Password must be filled out");
                    return false;
                }
            }
        </script>
        <title>Manager Page Login</title>
    </head>
    <body>
        <div id="formContainer">
            <form id="login" action="${pageContext.request.contextPath}/admin" method="post" onsubmit="return validateForm()">
                <input type="text" name="txtUsername" id="loginEmail" value placeholder="UserName" />
                <input type="password" name="txtPassword" id="loginPass" value placeholder="Password" />
                <input type="submit" name="action" value="login" />
                <input type="reset" name="123" value="Reset" />
            </form>
        </div>
    </body>


</html>



