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
	public Position position ; 
	public LocalDate createDate;
	public Group[] groups;
	
	void accessAccount() {
		System.out.println("staffs Login Account");
	}
	
	void findDepartment() {
		System.out.println("staffz Finding Department");
		
	}

	public Account(int id, String email, String fullName, Department department) {
		super();
		this.id = id;
		this.email = email;
		this.fullName = fullName;
		this.department = department;
	
	}
	
	public Account() {
		super();
	}

	@Override
	public String toString() {
		return "Account [id=" + id + ", email=" + email + ", fullName=" + fullName + ", department=" + department
				+ ", position=" + position + "]";
	}
}
