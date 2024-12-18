package com.csm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.csm.DBManager;
import com.csm.entity.Keeper;

public class Login {
	
	public static int loginStatus = 0;
	
	public Keeper keeperLogin(String kname) throws ClassNotFoundException, SQLException {
		DBManager dbm = new DBManager();
		Connection conn = dbm.getConnection();
		String sql = "select * from gwwp.keepers";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		Keeper k = null;
		Keeper res = null;
		System.out.print("KNAME = " + kname);
		while (rs.next()){
			k = new Keeper(rs.getInt("Keeper_ID"),
					rs.getString("Keeper_Name"),
					rs.getString("Keeper_DOB"),
					rs.getString("Keeper_Rank"));
			if(k.getKeeper_Name().equals(kname)) {
				res = k;
				break;
			}
		}
		return res;
	}
}
