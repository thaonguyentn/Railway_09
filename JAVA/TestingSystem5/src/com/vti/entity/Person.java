package com.vti.entity;

import java.time.LocalDate;
import java.util.Scanner;

public class Person {
	private String name;
	private Gender gender;
	private LocalDate birthday;
	private String address;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Gender getGender() {
		return gender;
	}

	public void setGender(Gender gender) {
		this.gender = gender;
	}

	public LocalDate getBirthday() {
		return birthday;
	}

	public void setBirthday(LocalDate birthday) {
		this.birthday = birthday;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Person() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Person(String name, Gender gender, LocalDate birthday, String address) {
		super();
		this.name = name;
		this.gender = gender;
		this.birthday = birthday;
		this.address = address;
	}

	public void inputInfor() {
		Scanner sc = new Scanner(System.in);
		System.out.println(" Nhập thông tin Person từ bàn phím vào: ");
		System.out.println(" Name: ");
		this.name = sc.next();
		System.out.println(" Chọn giới tính của bạn: ");
		System.out.println(" Gender 1.Male, 2.Female, 3.Unknown: ");
		int chooseGender = sc.nextInt();
		switch (chooseGender) {
		case 1:
			this.gender = Gender.MALE;
			break;

		case 2:
			this.gender = Gender.FEMALE;
			break;

		case 3:
			this.gender = Gender.UNKNOW;
			break;
		}

		System.out.println(" Nhập ngày tháng năm sinh theo định dang yyyy-MM-dd: ");
		this.birthday = LocalDate.parse(sc.next());

		System.out.println(" Nhập địa chỉ của bạn: ");
		this.address = sc.next();

	}

	public String showInfor() {
		return "Person [name=" + name + ", gender=" + gender + ",birthday=" + birthday + ", address= " + address + "]";
	}
}
