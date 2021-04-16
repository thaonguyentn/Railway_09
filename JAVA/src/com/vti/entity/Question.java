package com.vti.entity;

import java.time.LocalDate;

public class Question {
	public short questionID;
	public String content;
	public CategoryQuestion id;
	public TypeQuestion typeid;
	public Group creator;
	public LocalDate createDate;
	public Exam[] exams;
	
}
