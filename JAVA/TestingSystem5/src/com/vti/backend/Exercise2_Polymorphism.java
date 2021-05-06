package com.vti.backend;

import java.util.ArrayList;
import java.util.Random;
import java.util.Scanner;

import com.vti.entity.Student;

public class Exercise2_Polymorphism {
	private static final char[] student = null;
	private ArrayList<Student> listStudent;
	private Random random;
	private Scanner sc;

	public Exercise2_Polymorphism() {
		listStudent = new ArrayList<Student>();
		random = new Random();
		sc = new Scanner(System.in);
	}

	public void question_1() {
		while (true) {
			System.out.println(" Xin chaò bạn ! Chúc bạn môt ngày mới tốt lành ");
			System.out.println("=======================================================================");
			System.out.println("=================Lựa chọn chức năng bạn muốn sử dụng===================");
			System.out.println("=== 1. Tạo danh sách sinh viên. ===");
			System.out.println("=== 2. Hiển thị ds sv trong lớp. ===");
			System.out.println("=== 3. Điểm danh lớp ===");
			System.out.println("=== 4. Gọi nhóm 1 đi học bài ===");
			System.out.println("=== 5. Gọi nhóm 2 đi dọn vệ sinh ===");
			System.out.println("=== 6. Exit. ===");
			System.out.println("=======================================================================");
			int menuchoose = sc.nextInt();
			switch (menuchoose) {
			case 1:
				createStudent();
				System.out.println(" Tạo thành công 10 sinh viên ");

				break;
			case 2:
				for (Student student : listStudent) {
					System.out.println(student);
				}
				break;
			case 3:
				System.out.println(" Cả lớp điểm danh ");
				for (Student student : listStudent) {
					student.attendant();
				}
				break;
			case 4:
				System.out.println(" Nhóm 1 đi học bài : ");
				for (Student student : listStudent) {
					if (student.getGroup() == 1) {
						student.learning();
					}
				}
				break;

			case 5:
				System.out.println(" Nhóm 2 đi dọn vệ sinh ");
				for (Student student : listStudent) {
					if (student.getGroup() == 2) {
						student.goToCleaning();
					}
				}
			case 6:
				return;
			default:
				System.out.println(": Lựa chọn đúng chức năng");
				break;
			}
		}
	}

	private void createStudent() {
		for (int i = 0; i < 10; i++) {
			Student st = new Student("name", (i + 1), random.nextInt(3) + 1);
			listStudent.add(st);
		}

	}

}
