package com.vti.entity;

public class Department {
	public byte id;
	public String name;

	public Department() {

	}
//Q1-b;
	public Department(String name) {
		super();
		this.id = 0;
		this.name = name;
	}

	@Override
	public String toString() {
		return "ID= " + id + "Name =" + name;

	}

}
