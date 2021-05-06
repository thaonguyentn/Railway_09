package com.vti.entity;

import java.util.ArrayList;
import java.util.Scanner;

public class TuyenSinh implements ITuyenSinh {

	private static final Object id = null;
	private ArrayList<Infor_Student> listInfors;
	private Scanner sc;

	public TuyenSinh() {
		listInfors = new ArrayList<Infor_Student>();
		sc = new Scanner(System.in);
	}

	@Override
	public void addInfor() {
		System.out.println(" Nhập tên của thí sinh");
		String name = sc.next();
		System.out.println(" Nhập địa chỉ của thí sinh");
		String address = sc.next();
		System.out.println(" Nhập mức độ ưu tiên của thí sinh ");
		String priority = sc.next();
		System.out.println(" Nhập vào khối thi mà thí sinh muốn thi A,B,C ");
		String block = sc.next();
		Infor_Student contestant = new Infor_Student(name, address, priority, new Block(block));
		listInfors.add(contestant);

	}

	@Override
	public void showInfoStudent() {
		for (Infor_Student contestant : listInfors) {
			System.out.println(contestant);
		}
	}

	@Override
	public void findByIdNum(int id) {
		for (Infor_Student contestant : listInfors) {
			if (contestant.getIdNum() == id) {
				System.out.println(contestant);
			}
		}

	}
}
