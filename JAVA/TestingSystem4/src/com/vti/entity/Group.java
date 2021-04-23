package com.vti.entity;

import java.sql.Array;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;

public class Group {
	public short id;
	public String name;
	public Account creator;
	public LocalDate createDate;
	public Account[] accounts;
	
	// a, 
	
	
	public Group() {
		super();
	}
//b)

	@Override
	public String toString() {
		return "Group [id=" + id + ", name=" + name + ", creator=" + creator + ", createDate=" + createDate
				+ ", accounts=" + Arrays.toString(accounts) + "]";
	}


	public Group(String name, Account creator, LocalDate createDate, String[] usernames) {
		super();
		this.name = name;
		this.creator = creator;
		this.createDate = createDate;
		Account acccount1 = new Account();
		ArrayList<String> userNames = new ArrayList<String>();
		
	}
	
	
	
	
	
}
