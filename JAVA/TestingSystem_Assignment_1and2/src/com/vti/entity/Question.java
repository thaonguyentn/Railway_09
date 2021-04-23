package com.vti.entity;

import java.time.LocalDate;

public class Question {
	public int quesid;
	public String content;
	public CategoryQuestion category;
	public TypeQuestion type;
	public Group creator;
	public LocalDate createDate;
	public Exam[] exams;
	
}
