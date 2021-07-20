package com.shop.team2.service;

import java.util.List;

import org.springframework.ui.Model;

import com.shop.team2.dto.CartDto;

public interface CartService {
	public List<CartDto> cartList(String u_id) throws Exception;
	public void cartDelete(int c_code);
	public List<CartDto> cartSelectOrder(int[] select_cart_no);
	public void updateQty(Model model);
}
