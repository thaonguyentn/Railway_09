package com.vti.FrontEnd;

import java.time.LocalDate;
import java.util.Iterator;

import com.vti.entity.Account;
import com.vti.entity.Department;
import com.vti.entity.Gender;
import com.vti.entity.Group;
import com.vti.entity.Position;
import com.vti.entity.PositionName;

public class ForEach {
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

//FOREACH
//Question 8: In ra thông tin các account bao gồm: Email, FullName và tên phòng ban của họ

		Account[] accArray = { account1, account2, account3, account4, account5, account6, account7 };
		for (Account account : accArray) {
			System.out.println(" AccountID: " + account.email + " FullName: " + account.fullName + " Department: "
					+ account.department.name);
		}
		System.out.println("\n");

//Question 9: In ra thông tin các phòng ban bao gồm: id và name

		Department[] depArray = { department1, department2, department3, department4, department5 };
		for (Department department : depArray) {
			System.out.println(" ID: " + department.id + " Name: " + department.name);
		}
		System.out.println("\n");

//FOR CLAUSE/////////////////////////////////////////////////////////////////////

// Question 10: In ra thông tin các account bao gồm: Email, FullName và tên phòng ban của họ theo định dạng như sau:

		for (int i = 0; i < accArray.length; i++) {

			System.out.println("Thông tin Account thứ" + (i + 1) + "là");
			System.out.println("Email:" + accArray[i].email);
			System.out.println("Fullname" + accArray[i].fullName);
			System.out.println("Phòng Ban " + accArray[i].department.name);
		}

		System.out.println("\n");

// Question 11: In ra thông tin các phòng ban bao gồm: id và name theo định dạng sau:

		for (int i = 0; i < depArray.length; i++) {

			System.out.println("Thông tin department thứ" + (i + 1) + "là");
			System.out.println("id:" + depArray[i].id);
			System.out.println("name" + depArray[i].name);

		}
		System.out.println("\n");

//	Question 12: Chỉ in ra thông tin 2 department đầu tiên theo định dạng như Question 10
		for (int i = 0; i < 2; i++) {

			System.out.println("Thông tin Account thứ" + (0 + 1) + "là");
			System.out.println("Email:" + accArray[0].email);
			System.out.println("Fullname" + accArray[0].fullName);
			System.out.println("Phòng Ban " + accArray[0].department.name);

			System.out.println("Thông tin Account thứ" + (1 + 1) + "là");
			System.out.println("Email:" + accArray[1].email);
			System.out.println("Fullname" + accArray[1].fullName);
			System.out.println("Phòng Ban " + accArray[1].department.name);
		}

//Question 13: In ra thông tin tất cả các account ngoại trừ account thứ 2
		for (int i = 0; i < accArray.length; i++) {
			if (i == 1) {
				continue;
			}

			System.out.println("Thông tin Account thứ " + (i + 1) + " là");
			System.out.println("id: " + accArray[i].id);
			System.out.println("Email:" + accArray[i].email);
			System.out.println("Fullname" + accArray[i].fullName);
			System.out.println("Phòng Ban: " + accArray[i].department.name);
			System.out.println("createDate: " + accArray[i].createDate);
			System.out.println("gender: " + accArray[i].gender);
			System.out.println("position: " + accArray[i].position.name);
			System.out.println("\n");
		}

//Question 14: In ra thông tin tất cả các account có id < 4	
		for (int i = 0; i < 3; i++) {
			System.out.println("Thông tin Account thứ " + (i + 1) + " là");
			System.out.println("id: " + accArray[i].id);
			System.out.println("Email:" + accArray[i].email);
			System.out.println("Fullname" + accArray[i].fullName);
			System.out.println("Phòng Ban: " + accArray[i].department.name);
			System.out.println("createDate: " + accArray[i].createDate);
			System.out.println("gender: " + accArray[i].gender);
			System.out.println("position: " + accArray[i].position.name);
			System.out.println("\n");
		}

//Question 15: In ra các số chẵn nhỏ hơn hoặc bằng 20		
		for (int i = 0; i < 20; i+=2) {
			System.out.println(i);
		}
		
		
		
	}
}
