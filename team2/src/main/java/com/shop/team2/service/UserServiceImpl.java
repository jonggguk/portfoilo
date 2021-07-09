package com.shop.team2.service;

import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.shop.team2.dao.UserDao;
import com.shop.team2.dto.UserDto;

@Service
public class UserServiceImpl implements UserService {
	
	@Inject
	private UserDao dao;
	
	@Override
	public List<UserDto> showUser(String u_id) throws Exception {
		return dao.showUser(u_id);
	}
	@Override
	public UserDto readUser(String u_id) throws Exception {
		return dao.readUser(u_id);
	}
	@Override
	public UserDto loginOk(UserDto userDto) throws Exception {
		return dao.loginOk(userDto);
	}
	@Override
	public void signup(UserDto userDto) throws Exception {
		dao.signup(userDto);
	}
	@Override
	public UserDto idCheck(String u_id) throws Exception {
		return dao.idCheck(u_id);
	}
	@Override
	public void deleteUser(UserDto userDto) throws Exception {
		dao.deleteUser(userDto);
	}
	@Override
	public void updateUser(UserDto userDto) throws Exception {
		dao.updateUser(userDto);
	}
	@Override
	public void changeOk(UserDto userDto) throws Exception {
		dao.changeOk(userDto);
	}
	@Override
	public int updatePw(UserDto userDto) throws Exception {
		
		return dao.updatePw(userDto);
	}
	
	
}
