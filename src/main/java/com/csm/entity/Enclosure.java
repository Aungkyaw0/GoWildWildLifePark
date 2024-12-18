package com.csm.entity;

public class Enclosure {
	private int Enclosure_ID;
	private String Enclosure_Type;
	private String Enclosure_Location;
	
	public Enclosure(String eType, String eLocation ) {
		super();
		Enclosure_Type = eType;
		Enclosure_Location = eLocation;
	}
	
	public Enclosure(int eID, String eType, String eLocation ) {
		super();
		Enclosure_ID = eID;
		Enclosure_Type = eType;
		Enclosure_Location = eLocation;
	}
	
	public int getEnclosure_ID() {
		return Enclosure_ID;
	}
	public void setEnclosure_ID(int enclosure_ID) {
		Enclosure_ID = enclosure_ID;
	}
	public String getEnclosure_Type() {
		return Enclosure_Type;
	}
	public void setEnclosure_Type(String enclosure_Type) {
		Enclosure_Type = enclosure_Type;
	}
	public String getEnclosure_Location() {
		return Enclosure_Location;
	}
	public void setEnclosure_Location(String enclosure_Location) {
		Enclosure_Location = enclosure_Location;
	}
	
}
