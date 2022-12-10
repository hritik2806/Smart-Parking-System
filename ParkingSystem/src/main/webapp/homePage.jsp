<%-- 
    Document   : homePage
    Created on : 2 Oct, 2021, 5:16:18 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Parking System</title>
        <link href="externalCss.css" rel="stylesheet" type="text/css" />
    </head>
    <body background="img/home2.png">
        <%
           String username  = (String)session.getAttribute("username");
           if(username==null)
           {
               response.sendRedirect("firstPage.html");
           }
           else
           {
               String userId =(String) session.getAttribute("userID");
           }
        %>
        
        <div style="float: left;width: 100%;">
            <h1></h1>
        </div>
        <%--
        FOR USER REGISTRATION
        --%>
            <form action="UserRegistration" method="post">
                <div style="background-color:lightgray;padding: 10px;width: 10%;float:left;"> 
                 <input type="submit" value="User Registration" />
                  </div>
            </form>
            
        <div style="width: 40%;float: left;">
            <h1></h1>
        </div>
        
            <form action="logOut.jsp">
                <div style="background-color:lightgray;padding: 10px;width: 10%;float:left; ">
                     <input type="submit" value="Log Out" />
                 </div>    
            </form>
       
        <div style="padding: 50px;">
            <h></h>
        </div>
            

            <div style="width: 25%;background-color:lightgray;padding-bottom: 27% ;float: left;">
                
                <h1><font color="black" > For Registered User</font></h1>  
                <form action="homePage1.jsp" method="post">
                    
                    <table>
                        <tr>
                            <td><b>User ID:</b></td>
                            <td><input type="text" name="userID" placeholder="Enter User Id" /></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><b><input type="Submit" ></b></td>
                        </tr>
                    </table>
                    
                </form>
                
            </div>
            
            <div style="width: 5%;float: left;">
                <h1></h1>
            </div>
            
            <div style="width: 35%;float: left;background-color: lightgray;padding-bottom: 6%;">
                <h1><font color="black" >&nbsp;&nbsp; Customer Details</font></h1>
                <form action="" method="post">
                    <table height="300" width="400">
                    <tr>
                        <td><font color="black"><b>Customer Name: </b></font></td>
                        <td><input type="text" name="" value="" /></td>
                    </tr>
                    
                     <tr>
                         <td><b><font color="black">Vehicle Number: </font></b></td>
                        <td><input type="text" name="" value="" /></td>
                    </tr>
                     <tr>
                         <td><b><font color="black">Date: </font></b></td>
                        <td><input type="text" name="" value="" /></td>
                    </tr>
                     <tr>
                         <td><b><font color="black">Time: </font></b></td>
                        <td><input type="text" name="" value="" /></td>
                    </tr>
                     <tr>
                         <td><b><font color="black">Vehicle Type: </font></b></td>
                        <td><input type="text" name="" value="" /></td>
                    </tr>
                    <tr>
                         <td><b><font color="black">Address: </font></b></td>
                        <td><input type="text" name="address" value="" /></td>
                    </tr>
                     <tr>
                         <td><b><font color="black">Contact: </font></b></td>
                        <td><input type="text" name="contact" value="" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Get Token"/></td>
                    </tr>
                </table>
                
                </form>
            </div>
            
        
    </body>
</html>
