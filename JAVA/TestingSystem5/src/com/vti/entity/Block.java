package com.vti.entity;

public class Block {

	private String name;
	private String subject;

	public Block(String name) {
		super();
		this.name = name;
	}


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSubject() {
		switch (this.name) {
		case "A":
			this.subject = "Toán, Lý, Hóa";
			break;
		case "B":
			this.subject = "Toán, Hóa, Sinh";
			break;
		case "C":
			this.subject = "Văn, Sử, Địa";
			break;
		}
		return this.subject;

	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	@Override
	public String toString() {
		return "Block [name=" + name + ", subject=" + subject + "]";
	}

}
