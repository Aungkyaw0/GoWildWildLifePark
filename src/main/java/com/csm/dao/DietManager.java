package com.csm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.csm.DBManager;
import com.csm.entity.Diet;

public class DietManager {

	public int insertDiet(Diet d) throws ClassNotFoundException, SQLException{
		int result = -1;
		//Establishing Connection
		DBManager dbM = new DBManager();
		Connection con = dbM.getConnection();
		//Data Insertion with prepare statement
		String qury = "INSERT INTO Diet(Diet_Type, Quantity_Of_Feed_Per_Day) Values(?, ?)";
		PreparedStatement pst = con.prepareStatement(qury);
		pst.setString(1, d.getDiet_Type());
		pst.setInt(2, d.getQuantity_Of_Feed_Per_Day());
		result = pst.executeUpdate(); // if it is successful result will be 1 else -1;
		return result;
	}
	public ArrayList<Diet>fetchAll() throws ClassNotFoundException, SQLException{
			ArrayList<Diet> diets = new ArrayList<Diet>();
			Diet d;
			//get connection
			DBManager dbMgr = new DBManager();
			Connection conn = dbMgr.getConnection();
			//query
			String sql = "select * from gwwp.diet";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()){
				d = new Diet(rs.getInt("Diet_ID"),
						rs.getString("Diet_Type"),
						rs.getInt("Quantity_Of_Feed_Per_Day"));
						
				diets.add(d);
			}
			return diets;
		}
	
	public int update(Diet c)throws ClassNotFoundException,
	SQLException{
		
		int result = -1;
		
		//get connection
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		
		//prepare statement
		String sql = "UPDATE gwwp.diet SET " +
				"Diet_Type = ?, " +
				"Quantity_Of_Feed_Per_Day = ?" +
				" WHERE Diet_ID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		
		pstmt.setString(1, c.getDiet_Type());
		pstmt.setInt(2, c.getQuantity_Of_Feed_Per_Day());
		pstmt.setInt(3, c.getDiet_ID());
		
		//execute statement
		result = pstmt.executeUpdate();
		return result;
	}
//getting Diet id
	public Diet getById (int DietId) throws ClassNotFoundException, SQLException{
		String sql;
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		
		//prepare statement
		sql = "SELECT * FROM gwwp.diet WHERE Diet_ID = ? ";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt (1, DietId);
		ResultSet rs = pstmt.executeQuery();
		
		Diet diet = null;
		
		while (rs.next()){
			diet = new Diet(rs.getInt("Diet_ID"),
					rs.getString("Diet_Type"),
					rs.getInt("Quantity_Of_Feed_Per_Day"));
		}
		return diet;
	}
}
