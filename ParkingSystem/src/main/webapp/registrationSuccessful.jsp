<%-- 
    Document   : registrationSuccessful
    Created on : 7 Oct, 2021, 11:47:24 PM
    Author     : dell
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Parking System</title>
    </head>
    <body bgcolor="yellow">
        <%
            String tableUserID = "";
            Statement st = null;
           st=database.DBConnector.getStatement();
           HttpSession session1 = request.getSession(true);
           String username  = (String)session.getAttribute("username");
           
           if(username==null)
           {
               response.sendRedirect("firstPage.html");
           }
        
           else
           {
                String username1 = (String)session.getAttribute("username");
                String vehicleNumber1 = (String)session.getAttribute("vehicleNumber");
                String contact1 = (String)session.getAttribute("contact");
                String vehicleType1 = (String)session.getAttribute("vehicleType");
                String address1 = (String)session.getAttribute("address");
               try
            {
                
                
           String query = "select UserID from registeruser where username= '"+username1+"' and vehicleNumber= '"+vehicleNumber1+"' and contact= '"+contact1+"' and vehicletype= '"+vehicleType1+"' and address='"+address1+"' ";
                System.out.println(query);
                ResultSet  rs = st.executeQuery(query);
                while(rs.next())
                {
                    tableUserID = rs.getString(1);
                    session.setAttribute("userID", tableUserID);
                    
                }
                %>
            <center>
                <h1>Congrats <%=  username1%>...!  </h1>
                <h1>You are Registered now..</h1>
                
                <h2>Your User ID: <%= tableUserID%> </h2>  
                <br/>
                <form action="homePage.jsp" method="post">
                    <div style="background-color:lightgray;padding: 10px;width: 10%;"> 
                         <input type="submit" value="Go Back To Home" />
                    </div>
                </form>
            </center>s
                
                
                <%
            } 
            catch (SQLException e) 
            {
                System.out.println(e);
            }
               }
       
        
            
        %>
       
    </body>
</html>
