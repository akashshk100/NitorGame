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
}
