package com.sectors.model;

import java.util.Set;

public class User {
	private int id;
	private String name;
	private boolean agreed;
	private Set<Integer> selectedSectors;

	public User(int id, String name, boolean agreed) {
		super();
		this.id = id;
		this.name = name;
		this.agreed = agreed;
	}
	public User() {
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public boolean isAgreed() {
		return agreed;
	}
	public void setAgreed(boolean agreed) {
		this.agreed = agreed;
	}
	public Set<Integer> getSelectedSectors() {
		return selectedSectors;
	}
	public void setSelectedSectors(Set<Integer> selectedSectors) {
		this.selectedSectors = selectedSectors;
	}
	
}
