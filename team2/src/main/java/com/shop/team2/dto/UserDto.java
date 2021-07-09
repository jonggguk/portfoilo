package com.shop.team2.dto;

public class UserDto {
	private String u_name;
	private String u_id;
	private String u_pw;
	private String u_phone;
	private String u_jumin;
	private String u_email;
	private String u_address;
	private int u_point;
	private String u_grade;

	@Override
	public String toString() {
		return "UserDto [u_name=" + u_name + ", u_id=" + u_id + ", u_pw=" + u_pw + ", u_phone=" + u_phone + ", u_jumin="
				+ u_jumin + ", u_email=" + u_email + ", u_address=" + u_address + ", u_point=" + u_point + ", u_grade="
				+ u_grade + "]";
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public String getU_phone() {
		return u_phone;
	}

	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}

	public int getU_point() {
		return u_point;
	}

	public void setU_point(int u_point) {
		this.u_point = u_point;
	}

	public String getU_grade() {
		return u_grade;
	}

	public void setU_grade(String u_grade) {
		this.u_grade = u_grade;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_pw() {
		return u_pw;
	}

	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}

	public String getU_jumin() {
		return u_jumin;
	}

	public void setU_jumin(String u_jumin) {
		this.u_jumin = u_jumin;
	}

	public String getU_address() {
		return u_address;
	}

	public void setU_address(String u_address) {
		this.u_address = u_address;
	}
}
