  package com.vti.backend;

import java.util.ArrayList;
import java.util.Scanner;

import com.vti.entity.News;

public class Question1_Interface {
	private Scanner sc;
	private ArrayList<News> listNews;

	public Question1_Interface() {
		sc = new Scanner(System.in);
		listNews = new ArrayList<News>();
	}

	public void question1() {

		while (true) {
			System.out.println("Wellcome !");
			System.out.println(" Xin mời lựa chọn chức năng bạn muốn thực hiện: ");
			System.out.println("1.Insert news");
			System.out.println("2.View list news");
			System.out.println("3.Average rate.");
			System.out.println("4.Exit.");

			System.out.println("======================================================================");
			int menuChoose = sc.nextInt();
			switch (menuChoose) {
			case 1:
				insertNews();
				System.out.println("nhập giá trị Title");
				String title = sc.next();
				System.out.println("nhập giá trị PublishDate");
				String publishDate = sc.next();
				System.out.println("nhập giá trị Author");
				String author = sc.next();
				System.out.println("nhập giá trị Content");
				String content = sc.nextLine();

				System.out.println(" Nhập vào đánh giá 1 ");
				int rate1 = sc.nextInt();
				System.out.println(" Nhập vào đánh giá 2 ");
				int rate2 = sc.nextInt();
				System.out.println(" Nhập vào đánh giá 3 ");
				int rate3 = sc.nextInt();

				int[] rates = { rate1, rate2, rate3 };

				News news = new News(title, publishDate, author, content, rates);
				listNews.add(news);
				break;

			case 2:
				viewListNews();
				for (News news1 : listNews) {
					news1.Display();

				}
				break;
			case 3:
				averageRate();

				for (News caculate1 : listNews) {
					System.out.println("id :" + caculate1.getId() + " avg: " + caculate1.Calculate());

				}
				break;

			case 4:
				return;

			default:
				System.out.println("Lựa chọn đúng số trên menu");
				break;

			}
		}
	}

	private void exit() {
		// TODO Auto-generated method stub

	}

	private void averageRate() {
		// TODO Auto-generated method stub

	}

	private void viewListNews() {
		// TODO Auto-generated method stub

	}

	private void insertNews() {

	}
}
