package com.vti.backend;

import java.util.Iterator;

import com.vti.entity.Student;

public class Excercise1_Q1 {

	public void question1() {
		Student[] studentArray = new Student[3];
		System.out.println(" Khởi tạo 3 sinh viên");

		for (int i = 0; i < 3; i++) {
			System.out.println(" Sinh viên " + (i + 1 + ":"));
			Student st = new Student();
			studentArray[i] = st;

		}
		System.out.println(" Thông tin các sin viên vừa nhập:");
		for (int i = 0; i < studentArray.length; i++) {
			System.out.println(studentArray[i]);

		}

		Student.collect = " Chuyển sang Đại học công nghệ ";
		System.out.println(" Thông tin sinh viên sau khi chuyển: ");
		for (int i = 0; i < studentArray.length; i++) {
			System.out.println(studentArray[i]);

		}
	}

	public void question2() {
		System.out.println(" question 2");
		System.out.println(" Mỗi Sinh viên nộp quỹ chung 100k-- ");
		System.out.println(" Tổng quỹ là: " + (Student.moneyGroup += 300));
		System.out.println(" Sinh viên thứ 1 lấy 50 mua bim bim, kẹo về liên quan.");
		System.out.println(" Tổng quỹ là: " + (Student.moneyGroup -= 50));
		System.out.println(" Student thứ 2 lấy 20k đi mua bánh mì");
		System.out.println(" Tổng quỹ là: " + (Student.moneyGroup -= 20));
		System.out.println(" Student thứ 3 lấy 150k đi mua đồ dùng học tập cho nhóm");
		System.out.println(" Tổng quỹ là: " + (Student.moneyGroup -= 150));
		System.out.println(" Cả nhóm mỗi người lại đóng quỹ mỗi người 50k");
		System.out.println(" Tổng quỹ là: " + (Student.moneyGroup += 50));
	}

	public void question3() {

	}

	public void question4() {
		System.out.println(" Collect là: " + (Student.getCollect()));
		System.out.println(" Thay đổi collect ");
		System.out.println(" Thay đổi tên trường đại học thành Đại học Hà Nội ");
		Student.setCollect(" Đại học Hà Nội");
		System.out.println(" Đại học là: " + Student.getCollect());

		System.out.println(" Thông tin sinh viên sau khi chuyển: ");

	}
}
