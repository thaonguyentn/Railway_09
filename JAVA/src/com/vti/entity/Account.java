package com.vti.entity;

import java.time.LocalDate;

public class Account {
	public int accountID;
	public String email;
	public String userName;
	public String fullName;
	public Gender gender;
	public Department department;
	public Position position ; 
	public LocalDate createDate;
	public Group[] groups;
}
