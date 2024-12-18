package com.csm.dao;
import java.sql.*;
import com.csm.DBManager;

public class Delete {
	public int delete (int ID, String entity, String C_ID) throws ClassNotFoundException,
	SQLException{
		int result = -1;
		//get connection
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		
		//prepare statement
		String sql = "DELETE FROM gwwp." + entity  +" WHERE " + C_ID +" = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, ID);
		System.out.println(" PS: "+ pstmt);
		//execute statement
		result = pstmt.executeUpdate();
		System.out.println("Successfull Deleted" + result);
		return result;
	}

//	public static void main(String[] args) {
//		Delete d = new Delete();
//		try {
//			 d.delete(33, "Diet");
//		} catch (ClassNotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
}
