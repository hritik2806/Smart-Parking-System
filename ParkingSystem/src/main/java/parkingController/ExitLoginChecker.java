/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parkingController;

import java.io.IOException;

import javaLogics.EntryLoginAuthentication;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author dell
 */
public class ExitLoginChecker extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.sendRedirect("firstPage.html");
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        EntryLoginAuthentication l1 = new EntryLoginAuthentication();
        boolean login = l1.isLogin(username,password);
        if(login)
        {
            HttpSession session = request.getSession(true);
            session.setAttribute("username",username);
            response.sendRedirect("exitHomePage.jsp");
        }
        else
        {
            response.sendRedirect("firstPage.html");
        }
    }
}
