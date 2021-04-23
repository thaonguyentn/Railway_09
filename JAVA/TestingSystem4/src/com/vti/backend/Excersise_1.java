package com.vti.backend;

import java.time.LocalDate;

import com.vti.entity.Account;
import com.vti.entity.Department;
import com.vti.entity.Group;
import com.vti.entity.Position;
import com.vti.entity.PositionName;

public class Excersise_1 {

//	Question 1: Tạo constructor cho department:
//		a) không có parameters
//		b) Có 1 parameter là nameDepartment và default id của Department = 0
//		Khởi tạo 1 Object với mỗi constructor ở trên

	public void question_1() {

		Department dep1 = new Department();
		dep1.id = 1;
		dep1.name = "dep1";
		System.out.println(dep1.toString());

		Department dep2 = new Department("dep2");
		System.out.println(dep2.toString());
	}

//	Question 2: Tạo constructor cho Account:
//	a) Không có parameters
//	b) Có các parameter là id, Email, Username, FirstName, LastName (với FullName = FirstName + LastName)

	public void question_2() {
		Account acc1 = new Account(1, "mds", "thaonguyen", "Thi", "NguyenThiThao");
		System.out.println(acc1.toString());
		System.out.println("\n");

//	c) Có các parameter là id, Email, Username, FirstName, LastName (với FullName = FirstName + LastName) và Position của User, default createDate = now

		Position pos1 = new Position();
		pos1.id = 1;
		pos1.name = PositionName.SCRUM_MASTER;
		Account acc2 = new Account(1, "thao@", "thaonguyen", "Nguyen", "Thi Thao", pos1);
		System.out.println(acc2.toString());
		System.out.println("\n");

//	d) Có các parameter là id, Email, Username, FirstName, LastName (với FullName = FirstName + LastName) và
//		Position của User, createDate Khởi tạo 1 Object với mỗi constructor ở trên

		Account acc3 = new Account(1, "duytung@gmail.com", "thaonguyen", "Nguyễn", "Duy Tùng", pos1,
				LocalDate.of(2021, 04, 21));
		System.out.println(acc3.toString());
		System.out.println("\n");
	}

//	Question 3: Tạo constructor cho Group:
//		a) không có parameters
//		b) Có các parameter là GroupName, Creator, array Account[] accounts, CreateDate
//		c) Có các parameter là GroupName, Creator, array String[] usernames , CreateDate
//			Với mỗi username thì sẽ khởi tạo 1 Account (chỉ có thông tin username, các thông tin còn lại = null).

	public void question_3() {
		Group group1 = new Group("abc", null, null, null);
	

	}
}
