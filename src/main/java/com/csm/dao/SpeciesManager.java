package com.csm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.csm.DBManager;
import com.csm.entity.Species;
public class SpeciesManager {

	public int insertSpecies(Species s) throws ClassNotFoundException, SQLException{
		int result = -1;
		//Establishing Connection
		DBManager dbM = new DBManager();
		Connection con = dbM.getConnection();
		//Data Insertion with prepare statement
		String qury = "INSERT INTO species(Species_Type, Species_Group, Species_LifeStyle, Conservation_Status) values(?, ?, ?, ?)";
		PreparedStatement pst = con.prepareStatement(qury);
		pst.setString(1, s.getSpecies_Type());
		pst.setString(2, s.getSpecies_Group());
		pst.setString(3, s.getSpecies_LifeStyle());
		pst.setString(4, s.getConservation_Status());
		result = pst.executeUpdate(); // if it is successful result will be 1 else -1;
		return result;
	}
	
	public ArrayList<Species>fetchSpecies() throws ClassNotFoundException, SQLException{
		ArrayList<Species> species = new ArrayList<Species>();
		Species s;
		//get connection
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		//query
		String sql = "select * from gwwp.species";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()){
			s = new Species(rs.getInt("Species_ID"),
					rs.getString("Species_Type"),
					rs.getString("Species_Group"), 
					rs.getString("Species_LifeStyle"),
					rs.getString("Conservation_Status")
					);
			species.add(s);
		}
		return species;
	}
	
	public int update(Species s)throws ClassNotFoundException,SQLException{
		int result = -1;
		//get connection
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		//prepare statement
		String sql = "UPDATE gwwp.species SET " +
				"Species_Type = ?, " +
				"Species_Group = ?, "  +
				"Species_LifeStyle = ?, "+
				"Conservation_Status = ?" +
				" WHERE Species_ID = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, s.getSpecies_Type());
		pstmt.setString(2, s.getSpecies_Group());
		pstmt.setString(3, s.getSpecies_LifeStyle());
		pstmt.setString(4, s.getConservation_Status());
		pstmt.setInt(5, s.getSpecies_ID());
		//execute statement
		result = pstmt.executeUpdate();
		return result;
	}
	//getting Species id
	public Species getById (int SpeciesId) throws ClassNotFoundException, SQLException{
		String sql;
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		//prepare statement
		sql = "SELECT * FROM gwwp.species WHERE Species_ID = ? ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt (1, SpeciesId);
		ResultSet rs = pstmt.executeQuery();
		Species sp = null;
		while (rs.next()){
			sp = new Species(rs.getInt("Species_ID"),
					rs.getString("Species_Type"),
					rs.getString("Species_Group"),
					rs.getString("Species_LifeStyle"),
					rs.getString("Conservation_Status")
					);
		}
		return sp;
	}
}
