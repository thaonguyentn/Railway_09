package com.vti.entity;

import com.vti.ultis.ScannerUltis;

public class Student {
	private int id;
	private String name;
	public static int moneyGroup;
	public static String collect = "Đại học Bách Khoa";
	public static int COUNT = 0;

	public Student() {
		COUNT++;
		this.id = COUNT;
		System.out.println(" Nhập vào tên của sinh viên: ");
		this.name = ScannerUltis.inputString();

	}

	@Override
	public String toString() {
		return "Student [id=" + id + ", name= " + name + " collect: " + collect + "]";
	}

	public static String getCollect() {
		return collect;
	}

	public static void setCollect(String newCollect) {
		Student.collect = newCollect;
	}

}
