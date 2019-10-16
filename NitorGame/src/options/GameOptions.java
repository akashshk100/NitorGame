package options;
import java.sql.*;

import dao.DBConnection;

public class GameOptions {
	public void addUser(String name,String gname,String password) {
		Statement st;
		try{
			st = DBConnection.getConnection().createStatement();
            st.executeUpdate("insert into user(name,gname,password) values('"+name+"','"+gname+"','"+password+"')");
    }
		catch(Exception e){
            System.out.println(e);
		}       
	}
	
	public boolean verifyAns(int n,String ans){
		/*try{
			Statement st=DBConnection.getConnection().createStatement();
			ResultSet rs=st.executeQuery("select ans from hint where h_id="+n);
			if(rs.next()){
				if(ans.equals(rs.getString(1)))
					return true;
			}
		}catch(Exception e){System.out.println(e);}
		return false;*/
		return true;
	}
}
