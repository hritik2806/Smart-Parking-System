
package parkingController;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.DBConnector;



public class Registration1 extends HttpServlet 
{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
     
    public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
    {
        response.sendRedirect("firstPage.html");
        
    }
    
     public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
    {
       
        HttpSession session = request.getSession(true);
        
         
        String username = request.getParameter("username");
        String vehicleNumber = request.getParameter("vehicleNumber");
        String contact = request.getParameter("contact");
        String vehicleType =   request.getParameter("vehicleType");
        String address = request.getParameter("address");
        System.out.println("username = "+username);
     
        
            try
            {
            	Statement  st=DBConnector.getStatement();
                String query="insert into registeruser (username, vehicleNumber, contact, vehicleType, address) values('"+username+"','"+vehicleNumber+"','"+contact+"','"+vehicleType+"','"+address+"')"; 
                System.out.println(query);
                int i=st.executeUpdate(query);
                if(i>0)
                {
                    System.out.println(i+"Registration Successfull");
                   
                    session.setAttribute("username",username);
                    session.setAttribute("vehicleNumber",vehicleNumber);
                    session.setAttribute("contact",contact);
                    session.setAttribute("vehicleType",vehicleType);
                    session.setAttribute("address",address);
                   // session.setAttribute("userID", userID);
                    response.sendRedirect("registrationSuccessful.jsp");
                    
                }
                else
                {
                    System.out.println("registration fail");
                }
            }
            catch(SQLException e)
            {
                System.out.println(e);
            }
        }
    

    
}
