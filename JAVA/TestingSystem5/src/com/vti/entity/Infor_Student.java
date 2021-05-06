package com.vti.entity;

public class Infor_Student {

	private int idNum;
	private String fullName;
	private String address;
	private String priority;
	private Block block;
	public static int COUNT = 0;

	public Infor_Student(String fullName, String address, String priority, com.vti.entity.Block block) {
		COUNT++;
		this.idNum = COUNT;
		this.fullName = fullName;
		this.address = address;
		this.priority = priority;
		this.block = block;

	}

	@Override
	public String toString() {
		return "Infor_Student [fullName=" + fullName + ", address=" + address + ", priority=" + priority + ", Block="
				+ block.getName() + "Subject=" + block.getSubject() + "]";
	}

	public int getIdNum() {
		// TODO Auto-generated method stub
		return 0;
	}

}
