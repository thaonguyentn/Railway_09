package com.vti.backend;

import java.util.ArrayList;
import java.util.Scanner;

import com.vti.entity.Block;
import com.vti.entity.Infor_Student;
import com.vti.entity.TuyenSinh;

public class Exercise1_Optional {

	private TuyenSinh tuyensinh;
	private Scanner sc;
	private ArrayList<Infor_Student> listInfors;

	public Exercise1_Optional() {
		sc = new Scanner(System.in);
		tuyensinh = new TuyenSinh();
	}

	public void question2() {
		loadMenu();

		while (true)

		{

			System.out.println("=================Lựa chọn chức năng bạn muốn sử dụng===================");
			System.out.println("=== 1. Insert Contestant. ===");
			System.out.println("=== 2. View Contestant. ===");
			System.out.println("=== 3. Find by idNum Contestant . ===");
			System.out.println("=== 4. Exit. ===");
			System.out.println("=======================================================================");

			int menuChoose = sc.nextInt();
			switch (menuChoose) {
			case 1:
				tuyensinh.addInfor();
				break;
			case 2:
				tuyensinh.showInfoStudent();
				break;
			case 3:
				System.out.println("Nhập vào ID cần tìm kiếm: ");
				int id = sc.nextInt();
				tuyensinh.findByIdNum(id);
				break;
			case 4:
				return;
			default:
				System.out.println("Alarm: Lựa chọn đúng số trên menu");
				break;

			}
		}
	}

	private void loadMenu() {
		// TODO Auto-generated method stub

	}
}
