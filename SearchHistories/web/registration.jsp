<%-- 
    Document   : registration
    Created on : Feb 25, 2015, 1:51:46 PM
    Author     : user
--%>

<%

    String msg = request.getParameter("msg");
    msg = (msg == null ? "" : msg);

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Registration Form</title>
        <style type="text/css">
            body { font-family: Arial, Helvetica, sans-serif; width: 500px; }
            form fieldset { -moz-border-radius: 6px; -webkit-border-radius: 6px; border: 1px solid #dfe6ee; padding: 10px 15px; }
            form fieldset legend { font-size: 22px; }
            form fieldset input { margin-bottom: 4px; padding: 3px; font-size: 17px; font-weight: bold; font-family: Arial, Helvetica, sans-serif; color: #51555b; }
            form fieldset label { font-weight: bold; padding: 0 0 0 15px; }
            form fieldset p.error {
                margin: 0; background: #fdb5b5; -webkit-border-radius-bottomleft: 5px; -moz-border-radius-bottomleft: 5px; -webkit-border-radius-bottomright: 5px; -moz-border-radius-bottomright: 5px;
                border-left: 2px solid #cd4646; border-right: 2px solid #cd4646; border-bottom: 2px solid #cd4646; text-transform: lowercase; font-size: 13px; font-weight: bold;
                display: none; margin: 0 0 5px 0; padding: 4px; width: 200px; }
            </style>
            <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
            <script type="text/javascript">//#fdb5b5
                $(document).ready(function(){
                    $("form.register").change(function() {
                        $.post("check.jsp", $("form.register").serialize(), function( data ) {
                                                      
                            if( data.trim() === "inuse" ){
                                //alert(data+"--1---"+( data == "inuse" ));
                                $("p#username_error").slideDown();
                            }else{
                                //alert(data+"---2--"+( data == "inuse" ));
                                $("p#username_error").hide();}
                            
                            if( data.trim() === "missmatch" ){
                                //alert(data+"--3---"+( data === "missmatch" ));
                                $("p#password_error").slideDown();
                            }else{
                                //alert(data+"---4--"+( data === "missmatch" ));
                                $("p#password_error").hide();}
                            
                            if( data.trim() === "notvalid" ){
                                //alert(data+"--5---"+( data === "notvalid" ));
                                $("p#email_error").slideDown();
                            }else{
                                //alert(data+"--6---"+( data === "notvalid" ));
                                $("p#email_error").hide();}
                        });
                    });
                });
            </script>
        </head>
        <body bgcolor="dimgrey" align="left">
            <form action="Registration" method="post" class="register">
            <fieldset>
                <a href='index.jsp'>(Home)</a><h4 align="center"><font color="red"><%=msg%></font></h4>
                <legend>Search Histories - Registration</legend>
                <input type="text" name="username" value="" />
                <label>Email</label>
                <!--p id="username_error" class="error">Email is not Valid</p-->         
                <p id="email_error" class="error">Email is not Valid</p>
                <input type="text" name="email" value="" />
                <label>Confirm Email</label>
                <p id="email_error" class="error">Email is not Valid</p>
                <input type="password" name="password" value="" />
                <label>Password</label>
                <input type="password" name="password_again" value="" />
                <label>Confirm Password</label>
                <p id="password_error" class="error">Passwords do not Match</p>
                <input type="submit" name="submit" value="Register" />
            </fieldset>
        </form>
    </body>
</html>