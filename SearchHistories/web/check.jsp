<%-- 
    Document   : check
    Created on : Feb 25, 2015, 2:02:32 PM
    Author     : user
--%>

<%@page import="query.EmailValidator"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    Map params = request.getParameterMap();
    Iterator i = params.keySet().iterator();

    while (i.hasNext()) {
        String key = (String) i.next();
        String value = ((String[]) params.get(key))[ 0];

        System.out.println("<br />key : " + key + " value : " + value);

    }

    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String password_again = request.getParameter("password_again");

    if (!EmailValidator.isValidEmailAddress(username)) {
        out.println("notvalid".trim());
        return;
    }
    if (!EmailValidator.isValidEmailAddress(email)) {
        out.println("notvalid".trim());
        return;
    }
    if (!password.trim().equals(password_again.trim())) {
        out.println("missmatch".trim());
        return;
    }


%>
