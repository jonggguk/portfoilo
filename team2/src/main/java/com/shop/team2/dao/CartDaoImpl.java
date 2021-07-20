package com.shop.team2.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.shop.team2.dto.CartDto;


@Repository
public class CartDaoImpl implements CartDao{
	@Inject
	private SqlSession sqlSession;
	
	private static final String Namespace = "mappers.cartMapper";

	@Override
	public List<CartDto> cartList(String u_id) throws Exception {
		return sqlSession.selectList(Namespace+".cartList",u_id);
	}

	@Override
	public void cartDelete(int c_code){
		sqlSession.delete(Namespace+".cartDelete", c_code);
	}

	@Override
	public List<CartDto> cartSelectOrder(int[] select_cart_no) {
		return sqlSession.selectList(Namespace+".cartSelectOrder",select_cart_no);
	}

	@Override
	public void updateQty(Model model) {
		sqlSession.update(Namespace+".updateQty",model);
	}

}
