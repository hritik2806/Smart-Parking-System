
package parkingController;

import java.io.IOException;
import javaLogics.EntryLoginAuthentication;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class EntryLoginChecker extends HttpServlet
{
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
            response.sendRedirect("homePage.jsp");
        }
        else
        {
            response.sendRedirect("firstPage.html");
        }
    }
   
}
