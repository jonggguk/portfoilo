package com.shop.team2.dto;

public class CartDto {
	private int c_code;
	private String u_id;
	private int item_number;
	private String item_name;
	private String c_option1;
	private String c_option2;
	private int c_qty;
	private int c_price;
	private int c_to_next;
	private int remains;
	
	public int getC_code() {
		return c_code;
	}
	public void setC_code(int c_code) {
		this.c_code = c_code;
	}
	public int getItem_number() {
		return item_number;
	}
	public void setItem_number(int item_number) {
		this.item_number = item_number;
	}
	
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getC_option1() {
		return c_option1;
	}
	public void setC_option1(String c_option1) {
		this.c_option1 = c_option1;
	}
	public String getC_option2() {
		return c_option2;
	}
	public void setC_option2(String c_option2) {
		this.c_option2 = c_option2;
	}

	public int getC_qty() {
		return c_qty;
	}
	public void setC_qty(int c_qty) {
		this.c_qty = c_qty;
	}
	public int getC_price() {
		return c_price;
	}
	public void setC_price(int c_price) {
		this.c_price = c_price;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public int getC_to_next() {
		return c_to_next;
	}
	public void setC_to_next(int c_to_next) {
		this.c_to_next = c_to_next;
	}
	public int getRemains() {
		return remains;
	}
	public void setRemains(int remains) {
		this.remains = remains;
	}

}
