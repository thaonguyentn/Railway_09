package com.vti.entity;

import java.time.LocalDate;

public class Group {
	public short groupID;
	public String name;
	public Account creator;
	public LocalDate createDate;
	public Account[] accounts;
}
