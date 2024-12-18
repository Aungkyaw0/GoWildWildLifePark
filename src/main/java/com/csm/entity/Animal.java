package com.csm.entity;

public class Animal {
	private int Animal_ID;
	private String Animal_Name;
	private String Animal_Gender;
	private int Arrive_Year;
	private int Keepers_Keeper_ID;
	private int Enclosures_Enclosure_ID;
	private int Diet_Diet_ID;
	private int Species_Species_ID;
	private int Keeper_ID;
	private String Keeper_Name;
	private int Total_Animal;
	public Animal(String name, String gen, int yr, int kID, int eID, int dID, int sID) {
		Animal_Name = name;
		Animal_Gender = gen;
		Arrive_Year = yr;
		Keepers_Keeper_ID = kID;
		Enclosures_Enclosure_ID = eID;
		Diet_Diet_ID = dID;
		Species_Species_ID = sID;
	}
	
	
	public Animal(String Kname, int total) {
		Keeper_Name = Kname;
		Total_Animal = total;
	}
	
	public Animal(int A_ID, String A_Name, String A_Gender, int A_Arrive, int K_ID, String K_Name ) {
		Animal_ID = A_ID;
		Animal_Name = A_Name;
		Animal_Gender = A_Gender;
		Arrive_Year = A_Arrive;
		Keeper_ID = K_ID;
		Keeper_Name = K_Name;
	}
	
	
	public Animal(int animalID, String name, String gen, int yr, int kID, int eID, int dID, int sID) {
		Animal_ID = animalID;
		Animal_Name = name;
		Animal_Gender = gen;
		Arrive_Year = yr;
		Keepers_Keeper_ID = kID;
		Enclosures_Enclosure_ID = eID;
		Diet_Diet_ID = dID;
		Species_Species_ID = sID;
	}

	public int getAnimal_ID() {
		return Animal_ID;
	}

	public void setAnimal_ID(int animal_ID) {
		Animal_ID = animal_ID;
	}

	public String getAnimal_Name() {
		return Animal_Name;
	}

	public void setAnimal_Name(String animal_Name) {
		Animal_Name = animal_Name;
	}

	public String getAnimal_Gender() {
		return Animal_Gender;
	}

	public void setAnimal_Gender(String animal_Gender) {
		Animal_Gender = animal_Gender;
	}

	public int getArrive_Year() {
		return Arrive_Year;
	}

	public void setArrive_Year(int arrive_Year) {
		Arrive_Year = arrive_Year;
	}

	public int getKeepers_Keeper_ID() {
		return Keepers_Keeper_ID;
	}

	public void setKeepers_Keeper_ID(int keepers_Keeper_ID) {
		Keepers_Keeper_ID = keepers_Keeper_ID;
	}

	public int getEnclosures_Enclosure_ID() {
		return Enclosures_Enclosure_ID;
	}

	public void setEnclosures_Enclosure_ID(int enclosures_Enclosure_ID) {
		Enclosures_Enclosure_ID = enclosures_Enclosure_ID;
	}

	public int getDiet_Diet_ID() {
		return Diet_Diet_ID;
	}

	public void setDiet_Diet_ID(int diet_Diet_ID) {
		Diet_Diet_ID = diet_Diet_ID;
	}

	public int getSpecies_Species_ID() {
		return Species_Species_ID;
	}

	public void setSpecies_Species_ID(int species_Species_ID) {
		Species_Species_ID = species_Species_ID;
	}

	public int getKeeper_ID() {
		return Keeper_ID;
	}

	public void setKeeper_ID(int keeper_ID) {
		Keeper_ID = keeper_ID;
	}

	public String getKeeper_Name() {
		return Keeper_Name;
	}

	public void setKeeper_Name(String keeper_Name) {
		Keeper_Name = keeper_Name;
	}
	public int getTotal_Animal() {
		return Total_Animal;
	}

	public void setTotal_Animal(int total_Animal) {
		Total_Animal = total_Animal;
	}

	
	
	

	
	
}
