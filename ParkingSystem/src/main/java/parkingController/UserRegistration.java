
package parkingController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class UserRegistration extends HttpServlet
{

   /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
   {
       response.sendRedirect("firstPage.html");
   }
   public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException
   {
       response.sendRedirect("registration.jsp");
       
   }

}
