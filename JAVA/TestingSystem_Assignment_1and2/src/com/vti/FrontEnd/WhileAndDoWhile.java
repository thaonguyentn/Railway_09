package com.vti.FrontEnd;

import java.time.LocalDate;

import com.vti.entity.Account;
import com.vti.entity.Department;
import com.vti.entity.Gender;
import com.vti.entity.Group;
import com.vti.entity.Position;
import com.vti.entity.PositionName;

public class WhileAndDoWhile {

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

//	acc for grouu;

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

		Account account5 = new Account();
		account5.id = 5;
		account5.email = "hochiminh@gmail.com";
		account5.userName = "nguyentuan93";
		account5.fullName = "NguyenNgocTuan";
		account5.gender = Gender.MALE;
		account5.department = department1;
		account5.position = position3;
		account5.createDate = LocalDate.of(2020, 03, 14);

		Account account6 = new Account();
		account6.id = 6;
		account6.email = "nhatvuong@gmail.com";
		account6.userName = "nhatvuong";
		account6.fullName = "PhamNhatVuong";
		account6.gender = Gender.MALE;
		account6.department = department1;
		account6.position = position2;
		account6.createDate = LocalDate.of(2020, 03, 14);
		account6.groups = new Group[] { group1, group2 };

		Account account7 = new Account();
		account7.id = 7;
		account7.email = "huongnguyen@gmail.com";
		account7.userName = "huongnguyen";
		account7.fullName = "NguyenThiHuong";
		account7.gender = Gender.FEMALE;
		account7.department = department3;
		account7.position = position2;
		account7.createDate = LocalDate.of(2020, 03, 14);
		account7.groups = new Group[] { group1, group2 };

		System.out.println("\n");

//		WHILE
//		Question 16: Làm lại các Question ở phần FOR bằng cách sử dụng WHILE kết hợp với lệnh break, continue
//		Q10: In ra thông tin các account bao gồm: Email, FullName và tên phòng ban của họ theo định dạng như sau:

		System.out.println("Question 16-10:");
		Account[] accArray1 = { account1, account2, account3, account4, account5, account6 };
		int x = 0;

		while (x < accArray1.length) {
			System.out.println("Thông tin Account thứ" + (x + 1) + "là");
			System.out.println("Email:" + accArray1[x].email);
			System.out.println("Fullname" + accArray1[x].fullName);
			System.out.println("Phòng Ban " + accArray1[x].department.name);
			x++;
		}
		System.out.println("\n");

//		Q11: In ra thông tin các phòng ban bao gồm: id và name
		System.out.println("Question 16-10:");
		Department[] accArray3 = { department1, department2, department3, department4, department5 };
		int y = 0;
		while (y < accArray3.length) {
			System.out.println("Thông tin department thứ" + (y + 1) + "là");
			System.out.println("id:" + accArray3[y].id);
			System.out.println("name" + accArray3[y].name);
			y++;
		}
		System.out.println("\n");
//		Question 17: Làm lại các Question ở phần FOR bằng cách sử dụng DO-WHILE kết hợp với lệnh break, continue	
//		Q10: In ra thông tin các account bao gồm: Email, FullName và tên phòng ban của họ theo định dạng như sau:

		System.out.println("Question 17-10");
		Account[] accArray4 = { account1, account2, account3, account4, account5, account6, account7 };
		int z = 0;
		do {
			System.out.println("Thông tin Account thứ" + (z + 1) + "là");
			System.out.println("Email:" + accArray4[z].email);
			System.out.println("Fullname:" + accArray4[z].fullName);
			System.out.println("Phòng Ban:" + accArray4[z].department.name);
			z++;
		} while (z < accArray4.length);

	}

}
