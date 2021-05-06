package com.vti.entity;

public class Rectangle {
	private Float a;
	private Float b;

	public Float caculatePerimeter() {
		return 2 * (a + b);
	}

	public Float caculateArea() {
		return a * b;
	}

	public Rectangle(Float a, Float b) {
		super();
		this.a = a;
		this.b = b;
	}
	
	
}
