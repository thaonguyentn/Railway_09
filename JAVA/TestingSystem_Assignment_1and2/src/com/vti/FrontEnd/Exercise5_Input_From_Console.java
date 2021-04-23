package com.vti.FrontEnd;

import java.util.Scanner;

public class Exercise5_Input_From_Console {
	public static void main(String[] arg) {
		
//		Example 1: viết lệnh nhập vào 1 số nguyên

		System.out.println("Example 1 ");
		Scanner scanner1 = new Scanner(System.in);
		System.out.print(" Bạn hãy nhập vào một số nguyên: ");
		int b = scanner1.nextInt();
		System.out.print(" Bạn vừa in ra một số nguyên là: " + b);
		scanner1.close();
		System.out.println("\n");

//		Example 2: viết lệnh nhập vào 1 số thực

		System.out.println("Example 2 ");
		Scanner scanner2 = new Scanner(System.in);
		System.out.println(" Bạn hãy nhập vào một số thực bất kỳ: ");
		float c = scanner2.nextFloat();
		System.out.println(" Bạn vừa in ra một số thực là: " + c);
		scanner2.close();
		System.out.println("\n");

//		Question 1: Viết lệnh cho phép người dùng nhập 3 số nguyên vào chương trình
		System.out.println("Question 1 ");
		Scanner scanner = new Scanner(System.in);
		System.out.print("Hãy nhập vào số nguyên thứ nhất: ");
		int a = scanner.nextInt();
		System.out.print("Hãy nhập vào số nguyên thứ hai: ");
		int e = scanner.nextInt();
		System.out.print("Hãy nhập vào số nguyên thứ ba: ");
		int f = scanner.nextInt();
		System.out.print(" Những số nguyên bạn vừa nhập là: " + a + "," + e + " và " + f);
		scanner.close();
		System.out.println("\n");

//		Question 2: Viết lệnh cho phép người dùng nhập 2 số thực vào chương trình

		System.out.println("Question 2 ");
		Scanner scanner3 = new Scanner(System.in);
		System.out.print("Hãy nhập vào số thực thứ nhất: ");
		float d = scanner3.nextFloat();
		System.out.print("Hãy nhập vào số thực thứ hai: ");
		float g = scanner3.nextFloat();
		System.out.print(" Những số thực bạn vừa nhập là: " + d + " và " + g);
		scanner3.close();
		System.out.println("\n");

//		Question 3: Viết lệnh cho phép người dùng nhập họ và tên

		System.out.println("Question 3 ");
		Scanner scanner4 = new Scanner(System.in);
		System.out.print(" Nhập vào Họ và Tên: ");
		String h = scanner4.next();
		System.out.print("Họ và Tên: " + h);
		scanner4.close();
		System.out.println("\n");

//		Question 4: Viết lệnh cho phép người dùng nhập vào ngày sinh nhật của họ

	}
}
