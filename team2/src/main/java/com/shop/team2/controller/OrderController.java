package com.shop.team2.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.team2.dto.CartDto;
import com.shop.team2.dto.UserDto;
import com.shop.team2.service.CartService;
import com.shop.team2.service.OrderService;

import myUtil.HanConv;

@Controller
public class OrderController {
	@Autowired
	private CartService cartService;
	@Autowired
	private OrderService orderService;
	
	//선택상품 주문서
	@RequestMapping("/cartSelectOrder")
	public String cartSelectOrder(@RequestParam int[] select_cart_no, HttpSession session, Model model) {
		System.out.println("@@@### cartSelectOrder()");
		String u_id = (String) session.getAttribute("id");
		List<CartDto> list = cartService.cartSelectOrder(select_cart_no);
		model.addAttribute("list", list);
		List<UserDto> info = orderService.userInfo(u_id);
		model.addAttribute("info", info);
		return "orderWrite";
	}
	
	//전체상품 주문서
	@RequestMapping("/cartAllOrder")
	public String cartAllOrder(HttpServletRequest request, Model model) throws Exception {
		System.out.println("@@@### cartAllOrder()");
		String u_id = request.getParameter("u_id");
		model.addAttribute("total", request.getParameter("total"));
		List<CartDto> list = cartService.cartList(u_id);
		model.addAttribute("list", list);
		List<UserDto> info = orderService.userInfo(u_id);
		model.addAttribute("info", info);
		return "orderWrite";
	}
	
	@RequestMapping("/orderOk")
	public String orderOk(@RequestParam HashMap<String, String> form, Model model) {
		System.out.println("@@@### orderOk()");
		
		//주문번호 생성 
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym =year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";
		for (int i = 1; i < 5; i++) {
			subNum += (int)(Math.random()*10);
		}
		String order_number = ymd+"_"+subNum;
		form.put("order_number", order_number);
		
		//주소 합치기
		String order_address = form.get("order_zipcode") + form.get("order_addr1") + form.get("order_addr2");
		//order_address = HanConv.toKor2(order_address);
		form.put("order_address", order_address);
		
		//orders에 insert 
		orderService.orderOk(form);
		model.addAttribute("order_number", order_number);
		
		//order_items에 insert 
		orderService.orderItem(form);
		return "orderOk";
	}
}
