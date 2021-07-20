package com.shop.team2.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.shop.team2.dto.ReviewDto;

@Repository
public class ReviewDaoImpl implements ReviewDao{
	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.shop.team2.mappers.review";

	// 게시물 목록
	@Override
	public List<ReviewDto> list() throws Exception {	
		
		return sql.selectList(namespace + ".list");
	}

	// 게시물작성
	@Override
	public void write(ReviewDto vo) throws Exception {
			
		sql.insert(namespace + ".write", vo);
	}

	// 게시물 조회
	@Override
	public ReviewDto view(int r_num) throws Exception {
	
		return sql.selectOne(namespace + ".view", r_num);
	}

	// 게시물 수정
	@Override
	public void modify(ReviewDto vo) throws Exception {
		sql.update(namespace + ".modify", vo);
	}

	// 게시물 삭제
	@Override
	public void delete(int r_num) throws Exception {
		sql.delete(namespace + ".delete", r_num);
	}

	
	
	// 게시물 총 갯수
	@Override
	public int count() throws Exception {
		return sql.selectOne(namespace + ".count");	
	}

	
	
	// 게시물 목록 + 페이징
	@Override
	public List<ReviewDto> listPage(int displayPost, int postNum) throws Exception {

		HashMap<String, Integer> data = new HashMap<String, Integer>();
		
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		
		return sql.selectList(namespace + ".listPage", data);
	}

	
	
	// 게시물 목록 + 페이징 + 검색
	@Override
	public List<ReviewDto> listPageSearch(
			int displayPost, int postNum, String searchType, String keyword) throws Exception {

		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		
		data.put("searchType", searchType);
		data.put("keyword", keyword);
		
		return sql.selectList(namespace + ".listPageSearch", data);
	}
	
	// 게시물 총 갯수 + 검색 적용
	@Override
	public int searchCount(String searchType, String keyword) throws Exception {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("searchType", searchType);
		data.put("keyword", keyword);
		
		return sql.selectOne(namespace + ".searchCount", data);	
	}

		

}
