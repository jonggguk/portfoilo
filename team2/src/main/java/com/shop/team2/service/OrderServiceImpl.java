package com.shop.team2.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.shop.team2.dao.OrderDao;
import com.shop.team2.dto.UserDto;

@Service
public class OrderServiceImpl implements OrderService{
	@Inject
	private OrderDao dao;
	@Override
	public List<UserDto> userInfo(String u_id) {
		return dao.userInfo(u_id);
	}
	@Override
	public void orderOk(HashMap<String, String> form) {
		dao.orderOk(form);
	}
	@Override
	public void orderItem(HashMap<String, String> form) {
		dao.orderItem(form);
	}

}
