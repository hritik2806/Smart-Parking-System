<%-- 
    Document   : registration
    Created on : 6 Oct, 2021, 10:26:24 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Parking System</title>
    </head>
    <body background="img/home1.jpg">
        <form action="homePage.jsp" method="post">
            <div style="width: 5%;float: left;background-color:lightgrey;padding: 10px; ">
            <input type="submit" value="Home" />
            </div>
        </form>
        <br />
        <br/>
        <br/>
        <form action="Registration1" method="post">
            <div style="width: 30%;">
                <table border="3" bordercolor="blue" width="500" height="500">
                <tr>
                    <td><font color="white"><b>Customer Name: </b><font></td>
                    <td><input type="text" name="username" placeholder="Enter Customer Name" /></td>
                </tr>
                <tr>
                    <td><font color="white"><b> Vehicle Number: </b></font></td>
                    <td><input type="text" name="vehicleNumber" placeholder="Enter Vehicle Number" /></td>
                </tr>
                
                <tr>
                    <td><font color="white"><b>Contact Number: </b></font></td>
                    <td><input type="text" name="contact" placeholder="Enter Contact Number" /></td>
                </tr>
                <tr>
                    <td><font color="white"><b>Vehicle Type: </b></font></td>
                    <td>
                        <select name="vehicleType">
                            <option>Select</option>
                            <option>2</option>
                            <option>4</option>
                        </select>
                    </td>
                </tr>
                 <tr>
                    <td><font color="white"><b>Address: </b></font></td>
                    <td><input type="text" name="address" placeholder="Enter Your Address" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" /></td>
                </tr>
                </tr>
                
            </table>
            </div>
        </form>
    </body>
</html>
