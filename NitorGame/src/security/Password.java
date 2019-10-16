package security;
import dao.DBConnection;
import random.RandomGenerator;
import java.sql.*;
public class Password {

	public String encrypt(String password){
		RandomGenerator rg=new RandomGenerator();
		char[] pass_array = password.toCharArray();
		int len = pass_array.length;
		int[] pass_array_ascii = new int [len];
		
		for(int i=0;i<len;i++){
			pass_array_ascii[i] = pass_array[i]-(i+1);
		}
		
		int k=0,j=0;
		int[] temp_array_1=new int[3*len];
		while(k<3*len){
			if(k%3==0){
				if(pass_array_ascii[j]==92)
					temp_array_1[k]=32;
				else
					temp_array_1[k]=pass_array_ascii[j];
				j++;
			}
			else{
				temp_array_1[k]=rg.rand_number(122,97);
			}
			k++;
		}
		
		char [] encrypted_password=new char[3*len];
		for(int i=0;i<3*len;i++){
			encrypted_password[i]=(char)temp_array_1[i];
		}
		
		return new String(encrypted_password);
		
	}
	
	public String decrypt(String password){
		
		char[] pass_array = password.toCharArray();
		
		int len = pass_array.length;
		
		int[] pass_array_ascii = new int [len];
		int i=0,j=0;
		for(i=0;i<len;i++){
			pass_array_ascii[i]=(int)pass_array[i];
		}
		
		int []temp_array_1=new int[len/3];
		i=0;
		while(i<len){
			temp_array_1[j]=pass_array_ascii[i];
			i+=3;
			j++;
		}
		for(i=0;i<len/3;i++){
			if(temp_array_1[i]==32)
				temp_array_1[i]=92;
			temp_array_1[i]=temp_array_1[i]+(i+1);
		}
		
		char[] decrypted_password=new char[len/3];
		for(i=0;i<len/3;i++){
			decrypted_password[i]=(char)temp_array_1[i];
		}
		
		return new String(decrypted_password);
	}
	
	public boolean verifyPassword(String gname,String password) {
		Statement st;
		try {
			st = DBConnection.getConnection().createStatement();
			String psw2=null;
			ResultSet rs = st.executeQuery("select password from user where gname='"+gname+"'");
	        if(rs.next()){
	                psw2 = decrypt(rs.getString(1)); 
	        }         
	        if(password.equals(psw2)){
	           return true;     
	        }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
        return false;
	}
}
