/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package query;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class LoginValidator extends HttpServlet {

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

            String email = request.getParameter("LoginForm[username]");
            String password = request.getParameter("LoginForm[password]");

            dbfunction dbfunc = new dbfunction();
            dbfunc.createConnection();

            String tableName = "users";

            String query = "select * from " + tableName.trim() + " where email='" + email.trim() + "' and password='" + password.trim() + "'";

            ResultSet rsett = dbfunc.queryRecord(query);

            if (rsett.next()) {

                if (rsett.getString("usertype").trim().equals("admin")) {
                    //Obtain the session object, create a new session if doesn't exist
                    HttpSession session = request.getSession(true);
                    session.setAttribute("user", rsett.getString("email").trim());
                    session.setMaxInactiveInterval(600);
                    response.sendRedirect("admin.html");
                }
                if (rsett.getString("usertype").trim().equals("user")) {
                    //Obtain the session object, create a new session if doesn't exist
                    HttpSession session = request.getSession(true);
                    session.setAttribute("user", rsett.getString("email").trim());                    
                    session.setMaxInactiveInterval(600);

                    response.sendRedirect("userlogin.jsp?msg=Login Successfull!");
                }

                //response.sendRedirect(web.Resource.getmyIp()+"index.jsp");
            } else {
                response.sendRedirect("index.jsp?msg=" + "<br><b>Invalid user id. Plz Register.");
                return;
            }
        } catch (Exception ex) {
            Logger.getLogger(LoginValidator.class.getName()).log(Level.SEVERE, null, ex);
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
