package com.vti.frontend;

import com.vti.backend.Exercise2_Polymorphism;
import com.vti.entity.Student;

public class Program_Ex2_Q1 {
	public void main(String[] args) {
		Exercise2_Polymorphism exer5 = new Exercise2_Polymorphism();
		exer5.question_1();

		Student[] students = new Student[10];
		students[0] = new Student("thao", 1);
		students[1] = new Student("thao1", 2);
		students[2] = new Student("thao2", 3);
		students[3] = new Student("thao3", 3);
		students[4] = new Student("thao4", 1);
		students[5] = new Student("thao5", 1);
		students[6] = new Student("thao6", 2);
		students[7] = new Student("thao7", 3);
		students[8] = new Student("thao8", 1);
		students[9] = new Student("thao9", 2);
	}
}
