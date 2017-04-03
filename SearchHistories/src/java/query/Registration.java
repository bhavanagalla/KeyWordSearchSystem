/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package query;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
public class Registration extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String email = request.getParameter("email");
            String email2 = request.getParameter("username");
            email = (email == null ? null : email.trim());
            email2 = (email2 == null ? null : email2.trim());

            String password = request.getParameter("password");
            String password2 = request.getParameter("password_again");
            password = (password == null ? null : password.trim());
            password2 = (password2 == null ? null : password2.trim());


            if (email.trim().length() <= 0 || email2.trim().length() <= 0 || !email.trim().equals(email2.trim()) || !email.contains("@") || !email2.contains("@")) {
                response.sendRedirect("registration.jsp?msg=Check Mail Addresses");
                return;
            }

            if (password.trim().length() <= 0 || password2.trim().length() <= 0 || !password.trim().equals(password2.trim())) {
                response.sendRedirect("registration.jsp?msg=Check Passwords");
                return;
            }           

            

            dbfunction obj = new dbfunction();
            obj.createConnection();

            String insert = "insert into  users (email,password,usertype) values";
            insert += "('" + email + "','" + password + "','user')";
            obj.updateRecord(insert);           
          
            response.sendRedirect("registration.jsp?msg=Successfully Regsitered.");



        } catch (SQLException ex) {
            Logger.getLogger(Registration.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(Registration.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
