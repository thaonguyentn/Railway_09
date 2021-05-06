package com.vti.entity;

public class News implements INews {
	private int id;
	public static int COUNT = 0;
	private String title;
	private String PublishDate;
	private String author;
	private String content;
	private Float averageRate;

	private int[] rate;

	public News() {
		super();
		
	}

	public News(String title, String publishDate, String author, String content, int[] rate) {
		COUNT++;
		this.id = COUNT;
		this.title = title;
		this.PublishDate = publishDate;
		this.author = author;
		this.content = content;
		this.rate = rate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPublishDate() {
		return PublishDate;
	}

	public void setPublishDate(String publishDate) {
		PublishDate = publishDate;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public float getAverageRate() {
		return averageRate;
	}

	@Override
	public void Display() {
		// TODO Auto-generated method stub
		System.out.println(
				"News [id=" + id + ", title=" + title + ", PublishDate=" + PublishDate + ", author=" + author + "]");
	}

	@Override
	public float Calculate() {

		this.averageRate = (float) ((rate[0] + rate[1] + rate[2]) / 3);
		
		return averageRate;

	}

}
