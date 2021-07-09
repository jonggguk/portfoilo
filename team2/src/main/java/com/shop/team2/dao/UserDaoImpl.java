package com.shop.team2.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.shop.team2.dto.UserDto;

@Repository
public class UserDaoImpl implements UserDao {

	@Inject
	private SqlSession sqlsession;

	private static String namespace = "mappers.userMapper";

	@Override
	public List<UserDto> showUser(String u_id) throws Exception {

		return sqlsession.selectList(namespace + ".showUser", u_id);
	}
	@Override
	public UserDto readUser(String u_id) throws Exception {
		
		return (UserDto) sqlsession.selectOne(namespace+".readUser", u_id);
	}

	@Override
	public UserDto loginOk(UserDto userDto) throws Exception {

		return sqlsession.selectOne(namespace + ".loginOk", userDto);
	}

	@Override
	public void signup(UserDto userDto) throws Exception {
		sqlsession.insert(namespace + ".signup", userDto);
	}

	@Override
	public UserDto idCheck(String u_id) throws Exception {
		return sqlsession.selectOne(namespace + ".idCheck", u_id);
	}

	@Override
	public void deleteUser(UserDto userDto) throws Exception {
		sqlsession.delete(namespace + ".deleteUser", userDto);
	}

	@Override
	public void updateUser(UserDto userDto) throws Exception {
		sqlsession.update(namespace + ".updateUser", userDto);
	}

	@Override
	public void changeOk(UserDto userDto) throws Exception {
		sqlsession.update(namespace+".changeOk", userDto);
	}
	@Override
	public int updatePw(UserDto userDto) throws Exception {
		return sqlsession.update(namespace+".updatePw", userDto);
	}
}
