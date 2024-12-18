package com.csm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.csm.DBManager;
import com.csm.entity.Animal;

public class AnimalManager {
	public String fKID = "";
	public String fSID = "";
	public String fDID = "";
	public String fEID = "";
	public String errorText = "";

	public int insertAnimal(Animal a) throws ClassNotFoundException, SQLException {
		int result = -1;
		// Establishing Connection
		DBManager dbM = new DBManager();
		Connection con = dbM.getConnection();
		int isValid = 1;
		if (!isKeeperExists(a.getKeepers_Keeper_ID())) {
			isValid = -1;
			fKID = "Keeper ID";
		}
		if (!isDietExists(a.getDiet_Diet_ID())) {
			isValid = -1;
			fDID = "Diet ID";
		}
		if (!isSpeciesExists(a.getSpecies_Species_ID())) {
			isValid = -1;
			fSID = "Species ID";
		}
		if (!isEnclosureExists(a.getEnclosures_Enclosure_ID())) {
			isValid = -1;
			fEID = "Enclosure ID";
		}
		if (!fKID.isEmpty()) {
			errorText = fKID;
		}

		if (!fDID.isEmpty()) {
			if (!errorText.isEmpty()) {
				errorText += ", ";
			}
			errorText += fDID;
		}
		if (!fSID.isEmpty()) {
			if (!errorText.isEmpty()) {
				errorText += ", ";
			}
			errorText += fSID;
		}
		if (!fEID.isEmpty()) {
			if (!errorText.isEmpty()) {
				errorText += ", ";
			}
			errorText += fEID;
		}
		if (isValid == 1) {
			// Data Insertion with prepare statement
			String qury = "INSERT INTO animal(Animal_Name,Animal_Gender,Arrive_Year,Keepers_Keeper_ID,Enclosures_Enclosure_ID , Diet_Diet_ID, Species_Species_ID) values(?,?,?,?,?,?,?)";
			PreparedStatement pst = con.prepareStatement(qury);
			pst.setString(1, a.getAnimal_Name());
			pst.setString(2, a.getAnimal_Gender());
			pst.setInt(3, a.getArrive_Year());
			pst.setInt(4, a.getKeepers_Keeper_ID());
			pst.setInt(5, a.getEnclosures_Enclosure_ID());
			pst.setInt(6, a.getDiet_Diet_ID());
			pst.setInt(7, a.getSpecies_Species_ID());
			result = pst.executeUpdate(); // if it is successful result will be 1 else -1;
		} else if (isValid == -1) {
			result = -1;
		}
		return result;
	}

	public ArrayList<Animal> fetchAnimal() throws ClassNotFoundException, SQLException {
		ArrayList<Animal> animalArr = new ArrayList<Animal>();
		Animal anm;
		// get connection
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		// query
		String sql = "select * from gwwp.animal";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			anm = new Animal(rs.getInt("Animal_ID"),
					rs.getString("Animal_Name"), 
					rs.getString("Animal_Gender"),
					rs.getInt("Arrive_Year"), 
					rs.getInt("Keepers_Keeper_ID"), 
					rs.getInt("Enclosures_Enclosure_ID"),
					rs.getInt("Diet_Diet_ID"), 
					rs.getInt("Species_Species_ID"));
			animalArr.add(anm);
		}
		return animalArr;
	}

	public ArrayList<Animal> fetchDaveOrTemi() throws ClassNotFoundException, SQLException { // select all
		ArrayList<Animal> animal = new ArrayList<Animal>();
		Animal animalInfo;
		// get connection
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();

		// query
		Statement dst = conn.createStatement();
		String dSql = "DELETE FROM gwwp.namesorting";
		dst.executeUpdate(dSql);
		//
		Statement st = conn.createStatement();
		String sqlIn = "INSERT INTO gwwp.namesorting(A_ID, A_Name, A_Gender, A_Arrive, K_ID, K_Name) "
				+ "Select Animal_ID, Animal_Name, Animal_Gender, Arrive_Year, Keeper_ID, Keeper_Name from gwwp.animal "
				+ "INNER JOIN gwwp.keepers ON gwwp.animal.Keepers_Keeper_ID=gwwp.keepers.Keeper_ID "
				+ "where Keeper_Name in ('Dave', 'Temi');";
		st.executeUpdate(sqlIn);
		dst.close();
		st.close();
		// query
		String sql = "SELECT * FROM gwwp.namesorting order by K_Name;"; // calling report
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {
			animalInfo = new Animal(rs.getInt("A_ID"), rs.getString("A_Name"), rs.getString("A_Gender"),
					rs.getInt("A_Arrive"), rs.getInt("K_ID"), rs.getString("K_Name"));
			animal.add(animalInfo); // add entity into collection to arraylist
		}

		return animal;

	}


	public ArrayList<Animal> fetchAnimalGroupByKeeper()throws ClassNotFoundException, SQLException{ //select all
		ArrayList<Animal> animalArr = new ArrayList<Animal>();
		Animal animalinfobykeeper;
		// get connection
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		// query
		String sql = "SELECT Keeper_Name, count(Animal_ID) as Total_Animal FROM gwwp.Keepers INNER Join gwwp.animal \r\n"
				+ "ON keepers.Keeper_ID=animal.Keepers_Keeper_ID Group by Keeper_Name;";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			animalinfobykeeper = new Animal(
					rs.getString("Keeper_Name"),
					rs.getInt("Total_Animal"));
			animalArr.add(animalinfobykeeper); //add entity into collection to arraylist
		}
		return animalArr;

	}	
	
	public boolean isKeeperExists(int keeperID) throws ClassNotFoundException, SQLException {
		boolean result = false;
		// Establishing Connection
		DBManager dbM = new DBManager();
		Connection con = dbM.getConnection();
		// Query to check if keeper ID exists in keepers table
		String query = "SELECT COUNT(*) FROM keepers WHERE Keeper_ID = ?";
		PreparedStatement pst = con.prepareStatement(query);
		pst.setInt(1, keeperID);
		ResultSet rs = pst.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		if (count > 0) {
			result = true;
		}
		// Closing Connection
		rs.close();
		pst.close();
		con.close();
		return result;
	}

	public boolean isDietExists(int dietID) throws ClassNotFoundException, SQLException {
		boolean result = false;
		// Establishing Connection
		DBManager dbM = new DBManager();
		Connection con = dbM.getConnection();
		// Query to check if keeper ID exists in keepers table
		String query = "SELECT COUNT(*) FROM diet WHERE Diet_ID = ?";
		PreparedStatement pst = con.prepareStatement(query);
		pst.setInt(1, dietID);
		ResultSet rs = pst.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		if (count > 0) {
			result = true;
		}
		// Closing Connection
		rs.close();
		pst.close();
		con.close();
		return result;
	}

	public boolean isSpeciesExists(int speciesID) throws ClassNotFoundException, SQLException {
		boolean result = false;
		// Establishing Connection
		DBManager dbM = new DBManager();
		Connection con = dbM.getConnection();
		// Query to check if keeper ID exists in keepers table
		String query = "SELECT COUNT(*) FROM species WHERE Species_ID = ?";
		PreparedStatement pst = con.prepareStatement(query);
		pst.setInt(1, speciesID);
		ResultSet rs = pst.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		if (count > 0) {
			result = true;
		}
		// Closing Connection
		rs.close();
		pst.close();
		con.close();
		return result;
	}

	public boolean isEnclosureExists(int enclosureID) throws ClassNotFoundException, SQLException {
		boolean result = false;
		// Establishing Connection
		DBManager dbM = new DBManager();
		Connection con = dbM.getConnection();
		// Query to check if enclosure ID exists in enclosures table
		String query = "SELECT COUNT(*) FROM enclosures WHERE Enclosure_ID = ?";
		PreparedStatement pst = con.prepareStatement(query);
		pst.setInt(1, enclosureID);
		ResultSet rs = pst.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		if (count > 0) {
			result = true;
		}
		// Closing Connection
		rs.close();
		pst.close();
		con.close();
		return result;
	}
	
	public int update(Animal an)throws ClassNotFoundException,
	SQLException{
		int result = -1;
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		String sql = "UPDATE gwwp.animal SET Animal_Name = ?, Animal_Gender = ?, "  +
				"Arrive_Year = ?, Keepers_Keeper_ID = ?, "  +
				"Enclosures_Enclosure_ID = ?, Diet_Diet_ID = ?, "  +
				"Species_Species_ID = ? WHERE Animal_ID = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, an.getAnimal_Name());
		pstmt.setString(2,an.getAnimal_Gender());
		pstmt.setInt(3, an.getArrive_Year());
		pstmt.setInt(4, an.getKeepers_Keeper_ID());
		pstmt.setInt(5, an.getEnclosures_Enclosure_ID());
		pstmt.setInt(6, an.getDiet_Diet_ID());
		pstmt.setInt(7, an.getSpecies_Species_ID());
		pstmt.setInt(8, an.getAnimal_ID());
		result = pstmt.executeUpdate();
		return result;
	}
	public Animal getById (int AnimalId) throws ClassNotFoundException, SQLException{
		String sql;
		DBManager dbMgr = new DBManager();
		Connection conn = dbMgr.getConnection();
		sql = "SELECT * FROM gwwp.animal WHERE Animal_ID = ? ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt (1, AnimalId);
		ResultSet rs = pstmt.executeQuery();
		Animal an = null;
		while (rs.next()){
			an = new Animal(rs.getInt("Animal_ID"),
					rs.getString("Animal_Name"),
					rs.getString("Animal_Gender"),
					rs.getInt("Arrive_Year"),
					rs.getInt("Keepers_Keeper_ID"),
					rs.getInt("Enclosures_Enclosure_ID"),
					rs.getInt("Diet_Diet_ID"),
					rs.getInt("Species_Species_ID"));
		}
		return an;
	}

}
