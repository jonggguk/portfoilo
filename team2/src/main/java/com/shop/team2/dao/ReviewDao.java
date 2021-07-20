package com.shop.team2.dao;

import java.util.List;

import com.shop.team2.dto.ReviewDto;

public interface ReviewDao {
	// 게시물 목록
	public List<ReviewDto> list() throws Exception;
	
	// 게시물 작성
	public void write(ReviewDto vo) throws Exception;

	// 게시물 조회
	public ReviewDto view(int r_num) throws Exception;
	
	// 게시물 수정
	public void modify(ReviewDto vo) throws Exception;
	
	// 게시뮬 삭제
	public void delete(int r_num) throws Exception;

	
	
	// 게시물 총 갯수
	public int count() throws Exception;	

	
	
	// 게시물 목록 + 페이징
	public List<ReviewDto> listPage(int displayPost, int postNum) throws Exception;
	
	
	
	// 게시물 목록 + 페이징 + 검색
	public List<ReviewDto> listPageSearch(
			int displayPost, int postNum, String searchType, String keyword) throws Exception;
	
	// 게시물 총 갯수 + 검색 적용
	public int searchCount(String searchType, String keyword) throws Exception;	
}
