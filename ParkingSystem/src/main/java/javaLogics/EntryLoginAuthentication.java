
package javaLogics;


public class EntryLoginAuthentication 
{
    public boolean isLogin(String username,String password)
    {
        if(username!=null && password!=null && username.equalsIgnoreCase("admin") && password.equals("admin"))
        {
            return true;
        }
        return false;
    }
    
}
