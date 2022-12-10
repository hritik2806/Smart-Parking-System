/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parkingController;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dell
 */
public class GetToken extends HttpServlet 
{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws IOException,ServletException
    {
        response.sendRedirect("firstPage.html");
    }
    public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
    {
       
        String userID = session.getAttribute("userID");
        
        String customerName = request.getParameter("username");
         request.getParameter("vehicleNumber");
         request.getParameter("currentDate");
         request.getParameter("currentTime");
         request.getParameter("vehicleType");
        System.out.println("436787547645dfjfdjdgfjkjfgjdsfhjhkfdhkdfhkdfhdfhfdhfhffjgfbjghfsdhj kfdhjfhjffgfghjhgjfghfkhgfjkgjkfgjkghjfkghghfjghjfj");
        System.out.println("userID = "+userID);
        System.out.println("username = "+customerName);
    }
       
}


    
