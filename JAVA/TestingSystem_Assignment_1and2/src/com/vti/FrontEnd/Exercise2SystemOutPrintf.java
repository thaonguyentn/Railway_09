package com.vti.FrontEnd;

import java.time.LocalDate;
import java.util.Locale;

import com.vti.entity.Account;
import com.vti.entity.Department;
import com.vti.entity.Gender;
import com.vti.entity.Group;
import com.vti.entity.Position;
import com.vti.entity.PositionName;

public class Exercise2SystemOutPrintf {
public static void main(String[] args) {
	
	Department department1 = new Department();
	department1.id = 1;
	department1.name = "Sale";

	Department department2 = new Department();
	department2.id = 2;
	department2.name = "Marketing";

	Department department3 = new Department();
	department3.id = 3;
	department3.name = "Accounting";

	Department department4 = new Department();
	department4.id = 4;
	department4.name = "ReaserchAndDevelopment";

	Department department5 = new Department();
	department5.id = 5;
	department5.name = "Security";

	// Position
	Position position1 = new Position();
	position1.id = 1;
	position1.name = PositionName.DEV;

	Position position2 = new Position();
	position2.id = 2;
	position2.name = PositionName.PM;

	Position position3 = new Position();
	position3.id = 3;
	position3.name = PositionName.SCRUM_MASTER;

	Position position4 = new Position();
	position4.id = 4;
	position4.name = PositionName.TEST;

//acc for grouu;

	Account account3 = new Account();
	account3.id = 3;
	account3.email = "mylinh2000@gmail.com";
	account3.userName = "mylinh2000";
	account3.fullName = "DoMyLinh";
	account3.gender = Gender.FEMALE;
	account3.department = department1;
	account3.position = position2;
	account3.createDate = LocalDate.of(2020, 03, 14);

	Account account4 = new Account();
	account4.id = 4;
	account4.email = "bangpham@gmail.com";
	account4.userName = "bangpham";
	account4.fullName = "PhamBangBang";
	account4.gender = Gender.FEMALE;
	account4.department = department5;
	account4.position = position4;
	account4.createDate = LocalDate.of(2020, 03, 14);

	// Group///

	Group group1 = new Group();
	group1.id = 1;
	group1.name = "groupName1";
	group1.creator = account3;
	group1.createDate = LocalDate.of(2020, 03, 14);

	Group group2 = new Group();
	group2.id = 2;
	group2.name = "groupName2";
	group2.creator = account4;
	group2.createDate = LocalDate.of(2020, 03, 14);

	Group group3 = new Group();
	group3.id = 3;
	group3.name = "groupName2";
	group3.creator = account4;
	group3.createDate = LocalDate.of(2020, 03, 14);

	// Account

	Account account1 = new Account();
	account1.id = 1;
	account1.email = "thaonguyentn25598@gmail.com";
	account1.userName = "thaonguyen";
	account1.fullName = "NguyenThiThao";
	account1.gender = Gender.FEMALE;
	account1.department = department1;
	account1.position = position4;
	account1.createDate = LocalDate.of(2020, 03, 14);
	account1.groups = new Group[] { group1, group2 };

	Account account2 = new Account();
	account2.id = 2;
	account2.email = "hochiminh@gmail.com";
	account2.userName = "hochiminh";
	account2.fullName = "HoChiMinh";
	account2.gender = Gender.MALE;
	account2.department = department2;
	account2.position = position2;
	account2.createDate = LocalDate.of(2020, 03, 14);
	account2.groups = new Group[] { group1, group2 };
//	Question 1: Khai báo 1 số nguyên = 5 và sử dụng lệnh System out printf để in ra số nguyên đó
	int a = 5;
	System.out.printf("%d%n",a);
	System.out.printf( "simple integer: %d%n", 25598);
	
//	Question 2: Khai báo 1 số nguyên = 100 000 000 và sử dụng lệnh System out printf để in
//		ra số nguyên đó thành định dạng như sau: 100,000,000
	
	System.out.printf(Locale.US, "%,d %n", 100000000);
	System.out.printf(Locale.ITALY, "%,d %n", 100000000);
	
//	Question 3: Khai báo 1 số thực = 5,567098 và sử dụng lệnh System out printf để in ra số thực đó chỉ bao gồm 4 số đằng sau
	
	float b = 5.567098f;
	System.out.printf("%f%n", 5.567098);
	System.out.printf("'%5.4f'%n", 5.567098);
	
	
//	Question 4: Khai báo Họ và tên của 1 học sinh và in ra họ và tên học sinh đó theo định dạng như sau:
//		Tên tôi là "Nguyễn Văn A" và tôi đang độc thân.
	String fullName = "Nguyễn Duy Tùng";
	System.out.println("Tên tôi là "+ fullName + " và tôi đang độc thân.");
	
//	Question 5: Lấy thời gian bây giờ và in ra theo định dạng sau: 24/04/2020 11h:16p:20s
	
	System.out.println("23,07,1998");
	
	
//	Question 6: In ra thông tin account (như Question 8 phần FOREACH) theo định dạng table (giống trong Database)
	System.out.printf("%25s %20s %33s %n", "FullName", "Email", "DepartmentName");
	System.out.printf("%s %20s %30s %17s %n", "Account1", "Nguyễn Thị Thảo", "thaonguyentn25598@gmail.com", "Marketing");
	System.out.printf("%s %20s %30s %17s %n", "Account2" + account1.fullName + account1.email + account1.department.name  );

	
	}

}
