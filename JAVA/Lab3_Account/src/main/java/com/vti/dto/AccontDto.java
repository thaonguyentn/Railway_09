package com.vti.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.vti.enumurate.PositionName;

public class AccontDto {

	private Integer id;
	private String email;
	private String username;
	private String fullname;
	private String department;
	private PositionName position;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date createDate;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public PositionName getPosition() {
		return position;
	}

	public void setPosition(PositionName position) {
		this.position = position;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public AccontDto(Integer id, String email, String username, String fullname, String department,
			PositionName position, Date createDate) {
		super();
		this.id = id;
		this.email = email;
		this.username = username;
		this.fullname = fullname;
		this.department = department;
		this.position = position;
		this.createDate = createDate;
	}

	@Override
	public String toString() {
		return "AccontDto [id=" + id + ", email=" + email + ", username=" + username + ", fullname=" + fullname
				+ ", department=" + department + ", position=" + position + ", createDate=" + createDate + "]";
	}

}
