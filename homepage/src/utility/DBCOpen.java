package utility;

import java.sql.*;

public class DBCOpen {

	public static Connection open(){
		Connection con = null;
		
		try {
			Class.forName(Constent.driver);
			
			con= DriverManager.getConnection(Constent.url, Constent.user, Constent.password);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch(Exception e){
			e.printStackTrace();
		}
		return con;
	}


}
