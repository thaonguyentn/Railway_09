package com.vti.backend;

import java.util.Scanner;

import com.vti.entity.Person;
import com.vti.entity.Student_Person;

public class Exercise2_Q2 {
	private Scanner sc;

	public Exercise2_Q2() {
		super();
		sc = new Scanner(System.in);
	}

	public void question2() {
		while (true) {
			System.out.println("=======================================================================");
			System.out.println("=================Lựa chọn chức năng bạn muốn sử dụng===================");
			System.out.println("=== 1. Demo Person.===");
			System.out.println("=== 2. Demo Stusent.===");
			System.out.println("=== 3. Exit.===");
			System.out.println("=======================================================================");
			int menuChoose = sc.nextInt();
			switch (menuChoose) {
			case 1:
				demoStudent();
				break;

			case 2:
				demoPerson();
				break;
			}
		}

	}

	private void demoStudent() {
		Student_Person st = new Student_Person();
		st.inputInfor();
		System.out.println(" Thông tin Student vừa nhập vào: ");
		System.out.println(st.showInfor());
		if (st.Scholarship()) {
			System.out.println(" Sinh viên này đạt được học bổng ");

		} else {
			System.out.println(" Sinh viên này không được học bổng ");
		}
	}

	private void demoPerson() {
		Person person = new Person();
		person.inputInfor();
		System.out.println(" Thông tin của Person vừa nhập vào ");
		System.out.println(person.showInfor());

	}
}
