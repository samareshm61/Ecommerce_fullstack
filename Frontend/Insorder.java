/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Frontend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
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
public class Insorder extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
           Connection con= Dbcon.getcon();
         Statement stmt=con.createStatement();
         
         String bname=request.getParameter("bname");
         String bemail=request.getParameter("bemail");
         String bphone=request.getParameter("bphone");
         String baddress=request.getParameter("baddress");
         
         String sname=request.getParameter("sname");
         String semail=request.getParameter("semail");
         String sphone=request.getParameter("sphone");
         String saddress=request.getParameter("saddress");
         
         HttpSession session=request.getSession();
         String cust_id=(String)session.getAttribute("cust_id");
       
       
        int last_id= stmt.executeUpdate("INSERT INTO morder SET bname='"+bname+"',bemail='"+bemail+"',bphone='"+bphone+"',baddress='"+baddress+"',sname='"+sname+"',semail='"+semail+"',sphone='"+sphone+"',saddress='"+saddress+"',cid='"+cust_id+"'",Statement.RETURN_GENERATED_KEYS);
         
        
        ResultSet rs=stmt.executeQuery("SELECT * FROM cart WHERE cid='"+cust_id+"'");
        
        
   
       String st="";
       int i=0;
     while(rs.next()){
        i=i+1;
        if(i==1){
            st=st+"('"+rs.getString("pid")+"','"+rs.getString("cid")+"','"+rs.getString("price")+"','"+rs.getString("qty")+"','"+rs.getString("total")+"','"+last_id+"')"; 
        }else{
    st=st+",('"+rs.getString("pid")+"','"+rs.getString("cid")+"','"+rs.getString("price")+"','"+rs.getString("qty")+"','"+rs.getString("total")+"','"+last_id+"')";
        }
         } 
     
   
     
     stmt.executeUpdate("INSERT INTO sorder(pid,cid,price,qty,total,order_id)values"+st);
        
     stmt.executeUpdate("DELETE FROM cart WHERE cid='"+cust_id+"'");
        
         }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Insorder.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Insorder.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Insorder.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Insorder.class.getName()).log(Level.SEVERE, null, ex);
        }
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
