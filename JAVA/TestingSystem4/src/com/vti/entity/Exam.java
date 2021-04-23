package com.vti.entity;

import java.time.LocalDate;
import java.util.Date;

public class Exam {
	public short examID;
	public short code;
	public String title;
	public CategoryQuestion category;
	public byte duration;
	public Account creator;
	public LocalDate createDate;
	public Question[] questions;

}
