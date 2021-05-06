package com.vti.backend;

import java.util.Scanner;

import com.vti.entity.Square;

public class Exercise2_Q3 {
	private Square sq;
	private Scanner sc;

	public Exercise2_Q3() {
		sc = new Scanner(System.in);
	}

	public void question3() {
		while (true) {
			System.out.println(" Chương trình tính CHu vi và diện tích ");
			System.out.println(" Mời bạn chọn chức năng: ");
			System.out.println("=== 1. Create Square.===");
			System.out.println("=== 2. Caculating Perimeter. ===");
			System.out.println("=== 3. Caculating Area. ===");
			System.out.println("=== 4. Exit.===");
			System.out.println("=======================================================================");
			int menuChoose = sc.nextInt();
			switch (menuChoose) {
			case 1:
				System.out.println(" Nhập vào độ dài một cạnh của hình vuông (Square): ");
				Float a = sc.nextFloat();
				Float b = sc.nextFloat();
				sq = new Square(a, b);
				System.out.println(" Đã tạo thành công hình vuông.");
				break;
			case 2:
				System.out.println(" Chu vi hình vuông (Perimeter of Square) là: " + sq.caculatePerimeter());
				break;
			case 3:
				System.out.println(" Diện tích hình vuông (Area of Square is) là: " + sq.caculateArea());
				break;
			case 4:
				return;
			default:
				System.out.println(" Xin mời nhập đúng chức năng!!");
				break;

			}
		}
	}
}
