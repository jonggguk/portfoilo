package com.shop.team2.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.shop.team2.dao.CartDao;
import com.shop.team2.dto.CartDto;


@Service
public class CartServiceImpl implements CartService{
	@Inject
	private CartDao dao;
	
	@Override
	public List<CartDto> cartList(String u_id) throws Exception {
		return dao.cartList(u_id);
	}

	@Override
	public void cartDelete(int c_code) {
		dao.cartDelete(c_code); 
	}

	@Override
	public List<CartDto> cartSelectOrder(int[] select_cart_no) {
		return dao.cartSelectOrder(select_cart_no);
	}

	@Override
	public void updateQty(Model model) {
		dao.updateQty(model);
	}

}
