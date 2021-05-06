package com.vti.entity;

import java.util.Scanner;

public class Student_Person extends Person {
	private int id;
	public static int COUNT = 0;
	private Float averageMark;
	private String email;

	public Student_Person(int id, Float averageMark, String email) {
		COUNT++;
		this.id = COUNT;
		this.averageMark = averageMark;
		this.email = email;
	}

	public Student_Person() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void inputInfor() {
		Scanner sc = new Scanner(System.in);
		super.inputInfor();
		System.out.println(" Nhập averageMark: ");
		this.averageMark = sc.nextFloat();
		System.out.println(" Nhập email: ");
		this.email = sc.next();
	}

	@Override
	public String showInfor() {
		return super.showInfor() + " averageMark= " + averageMark + ", email=" + email + "]";

	}

	public boolean Scholarship() {
		return averageMark > 8.0 ? true : false;
	}
}
