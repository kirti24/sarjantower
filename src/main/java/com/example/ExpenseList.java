package com.example;

import java.sql.Timestamp;

public class ExpenseList {
	private int ID;
	private String category;
	private String item;
	private double amount;
	private String paidby;
	private Timestamp ts;
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public int getID() {
		return ID;
	}
	public String getPaidby() {
		return paidby;
	}
	public void setPaidby(String paidby) {
		this.paidby = paidby;
	}
	public Timestamp getTs() {
		return ts;
	}
	public void setTs(Timestamp ts) {
		this.ts = ts;
	}
	public ExpenseList(int ID, String category, String item, double amount,
			String paidby, Timestamp ts) {
		super();
		this.ID = ID;
		this.category = category;
		this.item = item;
		this.amount = amount;
		this.paidby = paidby;
		this.ts = ts;
	}
	
}
