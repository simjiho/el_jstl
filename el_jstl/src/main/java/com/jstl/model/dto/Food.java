package com.jstl.model.dto;

public class Food {
	private String name;
	private int price;
	private String flavor;
	
	public Food() {
		// TODO Auto-generated constructor stub
	}
	//alt + s + a + g

	public Food(String name, int price, String flavor) {
		super();
		this.name = name;
		this.price = price;
		this.flavor = flavor;
	}
	
	//alt + s + r + a + r

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getFlavor() {
		return flavor;
	}

	public void setFlavor(String flavor) {
		this.flavor = flavor;
	}
	
	
}
