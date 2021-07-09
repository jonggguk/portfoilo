package com.shop.team2.dao;

import java.util.List;

import com.shop.team2.dto.UserDto;

public interface UserDao {
	
	
	/* 유저 정보 가져오기 */
	public List<UserDto> showUser(String u_id) throws Exception;
	public UserDto readUser(String u_id) throws Exception;

	/* 로그인 */
	public UserDto loginOk(UserDto userDto) throws Exception;

	/* 회원가입 */
	public void signup(UserDto userDto) throws Exception;

	/* 아이디 중복체크 */
	public UserDto idCheck(String u_id) throws Exception;

	/* 회원삭제 */
	public void deleteUser(UserDto userDto) throws Exception;

	/* 회원정보 수정 */
	public void updateUser(UserDto userDto) throws Exception;

	/* 비밀번호변경 */
	public void changeOk(UserDto userDto) throws Exception;

	/* 임시비번 변경 */
	public int updatePw(UserDto userDto) throws Exception;
	

}
