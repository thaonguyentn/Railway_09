package com.vti.FrontEnd;

import java.util.Scanner;

import com.vti.entity.Account;
import com.vti.entity.Position;
import com.vti.entity.PositionName;

public class Demo2 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("Mời bạn nhập vào thông tin Account");
		Account acc = new Account();
		System.out.println("Mời bạn nhập id");
		acc.id = sc.nextInt();
		System.out.println("Mời bạn nhập Email");
		acc.email = sc.next();
		System.out.println("Mời bạn nhập useName");
		acc.userName = sc.next();
		System.out.println("Mời bạn nhập fullName");
		acc.fullName = sc.next();
		System.out.println("Nhập vào số từ 1 đến 4: DEV, PM, SCRUM_MASTER, TEST ");
		int posNum = sc.nextInt();
		switch (posNum) {
		case 1:
			Position position1 = new Position();
			position1.name = PositionName.DEV;
			acc.position = position1;
			break;
		case 2:
			Position position2 = new Position();
			position2.name = PositionName.PM;
			acc.position = position2;
			break;	
		
		case 3:
			Position position3 = new Position();
			position3.name = PositionName.SCRUM_MASTER;
			acc.position = position3;
			break;
			
		case 4:
			Position position4 = new Position();
			position4.name = PositionName.TEST;
			acc.position = position4;
			break;
			
		
		}
	}
}
