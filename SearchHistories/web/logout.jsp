<%-- 
    Document   : logout
    Created on : Feb 25, 2015, 4:11:44 PM
    Author     : user
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    String user = (String) session.getAttribute("user");


    session = request.getSession(false);

    
    if (session != null) {
        session.invalidate();
        request.getRequestDispatcher("/index.jsp?msg=Succesfully Logged Out!").forward(request, response);
    }
    


%>
