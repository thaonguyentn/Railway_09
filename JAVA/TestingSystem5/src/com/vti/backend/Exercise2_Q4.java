package com.vti.backend;

import java.util.Scanner;

import com.vti.entity.MyMath;

public class Exercise2_Q4 {
	public Exercise2_Q4() {

	}

	public void question4() {
		Scanner sc = new Scanner(System.in);
		MyMath myMath = new MyMath();
		while (true) {
			System.out.println("======Xin chào bạn đến với chương trình tính tổng hai số bất kì========");
			System.out.println("=================Lựa chọn chức năng bạn muốn sử dụng===================");
			System.out.println("=== 1. Tính tổng 2 số kiểu int. ===");
			System.out.println("=== 2. Tính tổng 2 số kiểu byte. ===");
			System.out.println("=== 3. Tính tổng 2 số kiểu Float. ===");
			System.out.println("=== 4. Tính tổng 2 số kiểu int và float. ===");
			System.out.println("=== 5. Tính tổng 2 số kiểu Byte và float. ===");
			System.out.println("=== 6. Exit. ===");
			System.out.println("=======================================================================");
			int menuChoose = sc.nextInt();
			switch (menuChoose) {
			case 1:
				System.out.println(" Nhập vào số int thứ 1: ");
				int int1 = sc.nextInt();
				System.out.println(" Nhập vào số int thứ 2: ");
				int int2 = sc.nextInt();
				System.out.println(" Tổng hai số int là: " + "'" + myMath.sum(int1, int2) + "'");
				break;

			case 2:
				System.out.println(" Nhập vào số byte thứ 1: ");
				byte byte1 = sc.nextByte();
				System.out.println(" Nhập vào số byte thứ 2: ");
				byte byte2 = sc.nextByte();
				System.out.println(" Tổng hai số byte là:  " + myMath.sum(byte1, byte2));

			case 3:
				System.out.println(" Nhập vào số float thứ 1: ");
				float float1 = sc.nextFloat();
				System.out.println(" Nhập vào số float thứ 2: ");
				float float2 = sc.nextFloat();
				System.out.println(" Tổng hai số float là: " + myMath.sum(float1, float2));

			case 4:
				System.out.println(" Nhập vào số inta: ");
				int intb = sc.nextInt();
				System.out.println(" Nhập vào số floata: ");
				float floata = sc.nextFloat();
				System.out.println(" Tổng hai số int và float là: " + myMath.sum(intb, floata));

			case 5:
				System.out.println(" Nhập vào số float: ");
				float float_b = sc.nextFloat();
				System.out.println(" Nhập vào số byte: ");
				byte byte_a = sc.nextByte();
				System.out.println(" Tổng của hai số float và byte là: " + myMath.sum(byte_a, float_b));
			case 6:
				return;

			default:
				System.out.println("Lựa chọn đúng số trên menu");
				break;
			}

		}
	}

}
