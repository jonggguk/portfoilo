package com.shop.team2.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.shop.team2.dto.UserDto;


public interface OrderDao {
	public List<UserDto> userInfo(String u_id);
	public void orderOk(HashMap<String, String> form);
	public void orderItem(HashMap<String, String> form);
}
