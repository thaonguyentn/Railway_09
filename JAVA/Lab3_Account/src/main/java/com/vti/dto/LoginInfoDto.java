package com.vti.dto;

public class LoginInfoDto {
	private Integer id;
	private String fullName;

	public LoginInfoDto(Integer id, String fullName) {
		this.id = id;
		this.fullName = fullName;
	}

	public Integer getId() {
		return id;
	}

	public String getFullName() {
		return fullName;
	}
}
