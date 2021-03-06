package com.vti.FrontEnd;

import java.time.LocalDate;

import com.vti.entity.Account;
import com.vti.entity.Department;
import com.vti.entity.Gender;
import com.vti.entity.Group;
import com.vti.entity.Position;
import com.vti.entity.PositionName;

public class SwitchCase {
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

// Question 5: L???y ra s??? l?????ng account trong nh??m th??? 1 v?? in ra theo format sau:
//		N???u s??? l?????ng account = 1 th?? in ra "Nh??m c?? m???t th??nh vi??n"
//				N???u s??? l?????ng account = 2 th?? in ra "Nh??m c?? hai th??nh vi??n"
//				N???u s??? l?????ng account = 3 th?? in ra "Nh??m c?? ba th??nh vi??n"
//				C??n l???i in ra "Nh??m c?? nhi???u th??nh vi??n"

		System.out.println("Question 5:");
		if (group1.accounts == null) {
			System.out.println("Group s??? 1 ch??a c?? th??nh vi??n n??o tham gia");
		} else {
			int countAccInGroup = group1.accounts.length;
			switch (countAccInGroup) {
			case 1:
				System.out.println("Nh??m c?? m???t th??nh vi??n");
				break;
			case 2:
				System.out.println("Nh??m c?? hai th??nh vi??n");
				break;
			case 3:
				System.out.println("Nh??m c?? ba th??nh vi??n");
				break;
			default:
				System.out.println("Nh??m c?? nhi???u th??nh vi??n");

			}
		}
		System.out.println("\n");
// Question 6: S??? d???ng switch case ????? l??m l???i Question 2

		System.out.println("Question 6:");

		if (account2.groups == null) {
			System.out.println("Nh??n vi??n s??? 2 n??y ch??a c?? group");
		} else {

			int countGroupsInAccount = account2.groups.length;
			switch (countGroupsInAccount) {
			case 1:
				System.out.println("Group c???a nh??n vi??n n??y l?? Java Fresher, C# Fresher");
			case 2:
				System.out.println("Group c???a nh??n vi??n n??y l?? Java Fresher, C# Fresher");
			case 3:
				System.out.println("Nh??n vi??n n??y l?? ng?????i quan tr???ng, tham gia nhi???u group");
			case 4:
				System.out.println("Nh??n vi??n n??y l?? ng?????i h??ng chuy???n, tham gia t???t c??? c??c group");
			}

		}
		System.out.println("\n");

// Question 7: S??? d???ng switch case ????? l??m l???i Question 4
		System.out.println("Question 7:");

		String name = account1.position.name.toString();
		switch (name) {
		case "DEV":
			System.out.println("????y l?? Developer");
			break;

		default:
			System.out.println("Ng?????i n??y kh??ng ph???i l?? Developer");
			break;
		}

		
		
	}
}
