package com.vti.entity;

public class Square extends Rectangle {

	public Float caculateArea(float a) {
		return this.caculateArea(a,a);
	}

	private Float caculateArea(float a, float aa) {
		// TODO Auto-generated method stub
		return null;
	}

	public Square(Float a, Float b) {
		super(a, b);
		// TODO Auto-generated constructor stub
	}

	@Override
	public Float caculatePerimeter() {
		return super.caculatePerimeter();
	}

	@Override
	public Float caculateArea() {
		return super.caculateArea();
	}
}
