package com.shop.team2.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.team2.dto.UserDto;

public interface UserService {
	public List<UserDto> showUser(String u_id)throws Exception;
	public UserDto readUser(String u_id) throws Exception;
	public UserDto loginOk(UserDto userDto) throws Exception;
	public void signup(UserDto userDto) throws Exception;
	public UserDto idCheck(String u_id) throws Exception;
	public void deleteUser(UserDto userDto) throws Exception;
	public void updateUser(UserDto userDto)throws Exception;
	public void changeOk(UserDto userDto) throws Exception;
	public int updatePw(UserDto userDto) throws Exception;
}
