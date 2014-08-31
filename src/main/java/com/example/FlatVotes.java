package com.example;

public class FlatVotes {
	private String flatno;
	private String event;
	public String getFlatno() {
		return flatno;
	}
	public void setFlatno(String flatno) {
		this.flatno = flatno;
	}
	public String getEvent() {
		return event;
	}
	public void setEvent(String event) {
		this.event = event;
	}
	public FlatVotes(String flatno, String event) {
		super();
		this.flatno = flatno;
		this.event = event;
	}
}
