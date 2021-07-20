package com.shop.team2.service;

import java.util.HashMap;
import java.util.List;

import com.shop.team2.dto.UserDto;

public interface OrderService {
	public List<UserDto> userInfo(String u_id);
	public void orderOk(HashMap<String, String> form);
	public void orderItem(HashMap<String, String> form);
}
