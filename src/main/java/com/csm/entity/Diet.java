package com.csm.entity;

public class Diet {
	private int Diet_ID;
	private String Diet_Type;
	private int Quantity_Of_Feed_Per_Day;
	private String qofpd;
	public Diet(String type, int numOfFeed) {
		super();
		Diet_Type = type;
		Quantity_Of_Feed_Per_Day = numOfFeed;
	}
	public Diet(String type, String numOfFeed) {
		super();
		Diet_Type = type;
		qofpd = numOfFeed;
	}
	public Diet(int id, String type, int numOfFeed) {
		super();
		Diet_ID = id;
		Diet_Type = type;
		Quantity_Of_Feed_Per_Day = numOfFeed;

	}
	
	public int getDiet_ID() {
		return Diet_ID;
	}
	public void setDiet_ID(int diet_ID) {
		Diet_ID = diet_ID;
	}
	public String getDiet_Type() {
		return Diet_Type;
	}
	public void setDiet_Type(String diet_Type) {
		Diet_Type = diet_Type;
	}
	public int getQuantity_Of_Feed_Per_Day() {
		return Quantity_Of_Feed_Per_Day;
	}
	public void setQuantity_Of_Feed_Per_Day(int quantity_Of_Feed_Per_Day) {
		Quantity_Of_Feed_Per_Day = quantity_Of_Feed_Per_Day;
	}

	public String getQofpd() {
		return qofpd;
	}

	public void setQofpd(String qofpd) {
		this.qofpd = qofpd;
	}
	
	
	
	
	
}
