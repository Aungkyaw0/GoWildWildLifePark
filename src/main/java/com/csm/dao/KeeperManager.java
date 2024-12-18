package com.csm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.csm.DBManager;
import com.csm.entity.Keeper;

public class KeeperManager {
	public int insertKeeper(Keeper k) throws ClassNotFoundException, SQLException{
		int result = -1;
		//Establishing Connection
		DBManager dbM = new DBManager();
		Connection con = dbM.getConnection();
		//Data Insertion with prepare statement
		String qury = "INSERT INTO keepers(Keeper_Name, Keeper_DOB, Keeper_Rank) values(?, ?, ?)";
		PreparedStatement pst = con.prepareStatement(qury);
		pst.setString(1, k.getKeeper_Name());
		pst.setDate(2, java.sql.Date.valueOf(k.getKeeper_DOB()));
		pst.setString(3,k.getKeeper_Rank());
		result = pst.executeUpdate(); // if it is successful result will be 1 else -1;
		return result;
	}
	
	public ArrayList<Keeper>fetchKeeper() throws ClassNotFoundException, SQLException{
		ArrayList<Keeper> keeperArr = new ArrayList<Keeper>();
		Keeper k;
		//get connection
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		//query
		String sql = "select * from gwwp.keepers";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()){
			k = new Keeper(rs.getInt("Keeper_ID"),
					rs.getString("Keeper_Name"),
					rs.getString("Keeper_DOB"),
					rs.getString("Keeper_Rank"));
			keeperArr.add(k);
		}
		return keeperArr;
	}
	

	public int update(Keeper k)throws ClassNotFoundException,
	SQLException{
		
		int result = -1;
		
		//get connection
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		
		//prepare statement
		String sql = "UPDATE gwwp.keepers SET " +
				"Keeper_Name = ?, " +
				"Keeper_DOB = ?, "  +
				"Keeper_Rank = ?" +
				" WHERE Keeper_ID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, k.getKeeper_Name());
		pstmt.setString(2, k.getKeeper_DOB());
		pstmt.setString(3, k.getKeeper_Rank());
		pstmt.setInt(4, k.getKeeper_ID());
		//execute statement
		result = pstmt.executeUpdate();
		return result;
	}



//getting Keeper id
	public Keeper getById (int KeeperId) throws ClassNotFoundException, SQLException{
		String sql;
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		
		//prepare statement
		sql = "SELECT * FROM gwwp.keepers WHERE Keeper_ID = ? ";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt (1, KeeperId);
		ResultSet rs = pstmt.executeQuery();
		
		Keeper kp = null;
		
		while (rs.next()){
			kp = new Keeper(rs.getInt("Keeper_ID"),
					rs.getString("Keeper_Name"),
					rs.getString("Keeper_DOB"),
					rs.getString("Keeper_Rank"));
		}
		return kp;
	}
	
	
}
