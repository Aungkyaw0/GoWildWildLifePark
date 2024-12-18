package com.csm.entity;

public class Species {
	private int Species_ID;
	private String Species_Type;
	private String Species_Group;
	private String Species_LifeStyle;
	private String Conservation_Status;
	
	public Species(String type, String group, String ls, String status) {
		super();
		Species_Type = type;
		Species_Group = group;
		Species_LifeStyle = ls;
		Conservation_Status = status;
	}
	
	public Species(int id, String type, String group, String ls, String status) {
		super();
		Species_ID = id;
		Species_Type = type;
		Species_Group = group;
		Species_LifeStyle = ls;
		Conservation_Status = status;
	}
	
	
	
	public int getSpecies_ID() {
		return Species_ID;
	}
	public void setSpecies_ID(int species_ID) {
		Species_ID = species_ID;
	}
	public String getSpecies_Type() {
		return Species_Type;
	}
	public void setSpecies_Type(String species_Type) {
		Species_Type = species_Type;
	}
	public String getSpecies_Group() {
		return Species_Group;
	}
	public void setSpecies_Group(String species_Group) {
		Species_Group = species_Group;
	}
	public String getSpecies_LifeStyle() {
		return Species_LifeStyle;
	}
	public void setSpecies_LifeStyle(String species_LifeStyle) {
		Species_LifeStyle = species_LifeStyle;
	}
	public String getConservation_Status() {
		return Conservation_Status;
	}
	public void setConservation_Status(String conservation_Status) {
		Conservation_Status = conservation_Status;
	}
	
	
}
