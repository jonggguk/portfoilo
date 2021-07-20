package com.shop.team2.service;

import java.util.List;

import com.shop.team2.dto.FaqDto;

public interface FaqService {

	// 게시물 목록
	public List<FaqDto> list() throws Exception;
	
	// 게시물 작성
	public void write(FaqDto vo) throws Exception;

	// 게시물 조회
	public FaqDto view(int f_num) throws Exception;

	// 게시물 수정
	public void modify(FaqDto vo) throws Exception;
	
	// 게시물 삭제
	public void delete(int f_num) throws Exception;
	
	
	
	// 게시물 총 갯수
	public int count() throws Exception;

	
	
	// 게시물 목록 + 페이징
	public List<FaqDto> listPage(int displayPost, int postNum) throws Exception;
	
	
	
	// 게시물 목록 + 페이징 + 검색
	public List<FaqDto> listPageSearch(
			int displayPost, int postNum, String searchType, String keyword) throws Exception;
	
	// 게시물 총 갯수 + 검색 적용
	public int searchCount(String searchType, String keyword) throws Exception;
}
