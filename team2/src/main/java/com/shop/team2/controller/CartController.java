package com.shop.team2.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.team2.dto.CartDto;
import com.shop.team2.service.CartService;

@Controller
public class CartController {
	@Autowired
	private CartService service;
	
	//장바구니 리스트
	@RequestMapping("/cart")
	public String cartList(HttpSession session, Model model) throws Exception{
		System.out.println("@@@### cartList()");
		String u_id;
		if(session.getAttribute("id") == null) {
			return "login";
		}else {
			u_id = (String) session.getAttribute("id");
		}
		
		List<CartDto> cartList = service.cartList(u_id);
		model.addAttribute("list", cartList);
		return "cart";
	}
	
	//장바구니 리스트 한개삭제
	@RequestMapping("/cartDelete")
	public String cartDelete(@RequestParam int c_code) {
		System.out.println("@@@### cartDelete()");
		
		service.cartDelete(c_code);
		
		return "redirect:cart";
	}
	
	//장바구니 상품 수량변경
	@RequestMapping("/updateQty")
	public String updateQty(HttpServletRequest request, Model model) {
		System.out.println("@@@### updateQty()");
		model.addAttribute("c_code", request.getParameter("c_code"));
		model.addAttribute("c_qty", request.getParameter("c_qty"));
		service.updateQty(model);
		return "redirect:cart";
	}
}
