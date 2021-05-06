package com.vti.entity;

public class Student implements IStudent {
	private int id;
	private String name;
	private int group;
	public static int COUNT = 0;

	public Student(String name, int group) {
		COUNT++;
		this.id = COUNT;
		this.name = name;
		this.group = group;

	}

	public Student(String string, int i, int j) {
		// TODO Auto-generated constructor stub
	}

	public void setGroup(int group) {
		this.group = group;
	}

	public int getGroup() {
		return group;
	}

	@Override
	public String toString() {
		return "Student [id=" + id + ", name=" + name + ", group=" + group + "]";
	}

		
	
	@Override
	public void attendant() {
		// TODO Auto-generated method stub
		System.out.println(name + "điểm danh ");
	}

	@Override
	public void learning() {
		// TODO Auto-generated method stub
		System.out.println(name + " đang học bài.");
	}

	@Override
	public void goToCleaning() {
		// TODO Auto-generated method stub
		System.out.println(name + " đang dọn vệ sinh ");
	}
	

}
