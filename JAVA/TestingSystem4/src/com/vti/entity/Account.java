package com.vti.entity;

import java.time.LocalDate;
import java.util.Arrays;

import javax.sound.midi.VoiceStatus;

public class Account {
	public int id;
	public String email;
	public String userName;
	public String fullName;
	public Gender gender;
	public Department department;
	public Position position;
	public LocalDate createDate;
	public Group[] groups;

	
	public Account() {
		
	}
	void accessAccount() {
		System.out.println("staffs Login Account");
	}

	void findDepartment() {
		System.out.println("staffz Finding Department");

	}
// b)
	

	public Account(int id, String email, String username, String lastname, String Firstname) {
		super();
		this.id = id;
		this.email = email;
		this.userName = username;
		this.fullName = lastname + Firstname;

	}

// c:
	public Account(int id, String email, String userName, String Firstname, String lastname, Position position) {
		super();
		this.id = id;
		this.email = email;
		this.userName = userName;
		this.fullName = lastname + Firstname;
		this.position = position;
		this.createDate = LocalDate.now();
	}

//d:
	public Account(int id, String email, String userName,String Firstname, String lastname, Position position, LocalDate createDate) {
		super();
		this.id = id;
		this.email = email;
		this.userName = userName;
		this.fullName = Firstname + lastname;
		this.position = position;
		this.createDate = createDate;
	}

	
	
	public Account(String userName) {
	super();
	this.userName = userName;
}

	@Override
	public String toString() {
		return "Account [id=" + id + ", email=" + email + ", userName=" + userName + ", fullName=" + fullName
				+ ", gender=" + gender + ", department=" + department + ", position=" + position + ", createDate="
				+ createDate + ", groups=" + Arrays.toString(groups) + "]";
	}

}
