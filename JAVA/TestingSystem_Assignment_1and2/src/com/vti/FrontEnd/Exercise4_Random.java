package com.vti.FrontEnd;

import java.lang.reflect.Array;
import java.util.Locale;
import java.util.Random;
import java.util.Scanner;

public class Exercise4_Random {

	public static void main(String[] args) {
// Example
		Scanner scanner = new Scanner(System.in);
		System.out.print(" Bạn hãy nhập vào một số bất kì: ");
		if (scanner.hasNextInt()) {

			int a = scanner.nextInt();
			System.out.print(" Bạn vừa nhập vào số: " + a);
		} else {
			System.out.println(" Bạn vừa nhập sai dữ liệu ! ");

		}
		scanner.close();
		System.out.println("\n");

// Lấy ngẫu nhiên trong 100
		Random random = new Random();
		int w = random.nextInt(100);
		System.out.print(" Số nguyên ngẫu nhiên là: " + w);
		System.out.println("\n");
		
// Lấy trong khoảng 20-35
		Random random3 = new Random();
		int z = random3.nextInt(16) + 20;
		System.out.print(" Số nguyên ngẫu nhiên là: " + z);
		System.out.println("\n");

//		Question 1: in ngẫu nhiên ra 1 số nguyên

		Random random1 = new Random();
		int j = random1.nextInt();
		System.out.print(" Số nguyên ngẫu nhiên là: " + j);
		System.out.println("\n");
		
//		Question 2: In ngẫu nhiên ra 1 số thực		

		Random random2 = new Random();
		float y = random2.nextFloat();
		System.out.print(" Số thực ngẫu nhiên là: " + y);
		System.out.println("\n");
		

//		Question 3: Khai báo 1 array bao gồm các tên của các bạn trong lớp, sau đó in ngẫu nhiên ra tên của 1 bạn

//		Question 4: Lấy ngẫu nhiên 1 ngày trong khoảng thời gian 24-07-1995 tới ngày 20-12-1995
//		Question 5: Lấy ngẫu nhiên 1 ngày trong khoảng thời gian 1 năm trở lại đây
//		Question 6: Lấy ngẫu nhiên 1 ngày trong quá khứ
//		Question 7: Lấy ngẫu nhiên 1 số có 3 chữ số		

		Random random31 = new Random();
		int m = random31.nextInt(900) + 100;
		System.out.print(" Số ngẫu nhiên có 3 chữ số là: " + m);
		System.out.println("\n");
	}

}
