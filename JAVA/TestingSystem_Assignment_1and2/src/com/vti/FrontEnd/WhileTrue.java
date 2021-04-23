package com.vti.FrontEnd;

import java.util.Scanner;

public class WhileTrue {
	public static void main(String[] args) {
		System.out.println("Demo Menu");
		Scanner sc = new Scanner(System.in);
		int choose;
		while (true) {
			System.out.println("Mời bạn chọn chức năng: 1. Tạo Account hoặc 2. Tạo Department");
			choose = sc.nextInt();
			if (choose == 1 || choose == 2) {
				switch (choose) {
				case 1:
					System.out.println("Tạo Account");
					break;
				case 2:
					System.out.println("Tạo Department");
					break;
				}
				return;
			} else {
				System.out.println("Nhập Lại 1 hoặc 2");
			}
		}
		
		
		
	}

}
