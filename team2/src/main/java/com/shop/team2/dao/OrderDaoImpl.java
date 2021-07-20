package com.shop.team2.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.shop.team2.dto.UserDto;

@Repository
public class OrderDaoImpl implements OrderDao{
	@Inject
	private SqlSession sqlSession;
	
	private static final String Namespace = "mappers.orderMapper";
	
	@Override
	public List<UserDto> userInfo(String u_id){
		return sqlSession.selectList(Namespace+".userInfo",u_id);
	}

	@Override
	public void orderOk(HashMap<String, String> form) {
		sqlSession.insert(Namespace+".orderOk", form);
	}

	@Override
	public void orderItem(HashMap<String, String> form) {
		sqlSession.insert(Namespace+".orderItem", form);
	}

}
