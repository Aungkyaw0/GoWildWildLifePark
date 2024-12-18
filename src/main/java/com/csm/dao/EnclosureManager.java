package com.csm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.csm.DBManager;
import com.csm.entity.Enclosure;


public class EnclosureManager {
	
	public int insertEnclosure(Enclosure e) throws ClassNotFoundException, SQLException{
		int result = -1;
		//Establishing Connection
		DBManager dbM = new DBManager();
		Connection con = dbM.getConnection();
		//Data Insertion with prepare statement
		String qury = "INSERT INTO enclosures(Enclosure_Type, Enclosure_Location) values(?, ?)";
		PreparedStatement pst = con.prepareStatement(qury);
		pst.setString(1, e.getEnclosure_Type());
		pst.setString(2, e.getEnclosure_Location());
		result = pst.executeUpdate(); // if it is successful result will be 1 else -1;
		return result;
	}
	

	public ArrayList<Enclosure>fetchAll() throws ClassNotFoundException, SQLException{
			ArrayList<Enclosure> enclosureArr = new ArrayList<Enclosure>();
			Enclosure e;
			//get connection
			DBManager dbMgr = new DBManager();
			Connection conn = dbMgr.getConnection();
			//query
			String sql = "select * from gwwp.enclosures";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()){
				e = new Enclosure(rs.getInt("Enclosure_ID"),
						rs.getString("Enclosure_Type"),
						rs.getString("Enclosure_Location"));
						
				enclosureArr.add(e);
			}
			return enclosureArr;
		}
		

	public int update(Enclosure e)throws ClassNotFoundException,
	SQLException{
		
		int result = -1;
		
		//get connection
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		
		//prepare statement
		String sql = "UPDATE gwwp.enclosures SET " +
				"Enclosure_Type = ?, " +
				"Enclosure_Location = ?"  +
				" WHERE Enclosure_ID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, e.getEnclosure_Type());
		pstmt.setString(2, e.getEnclosure_Location());
		pstmt.setInt(3, e.getEnclosure_ID());
		//execute statement
		result = pstmt.executeUpdate();
		return result;
	}



//getting Enclosure id
	public Enclosure getById (int EnclosureId) throws ClassNotFoundException, SQLException{
		String sql;
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		
		//prepare statement
		sql = "SELECT * FROM gwwp.enclosures WHERE Enclosure_ID = ? ";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt (1, EnclosureId);
		ResultSet rs = pstmt.executeQuery();
		
		Enclosure en = null;
		
		while (rs.next()){
			en = new Enclosure(rs.getInt("Enclosure_ID"),
					rs.getString("Enclosure_Type"),
					rs.getString("Enclosure_Location"));
		}
		return en;
	}
}
