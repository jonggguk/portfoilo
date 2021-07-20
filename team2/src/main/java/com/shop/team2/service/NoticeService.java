package com.shop.team2.service;

import java.util.List;

import com.shop.team2.dto.NoticeDto;

public interface NoticeService {
	// 게시물 목록
	public List<NoticeDto> list() throws Exception;
	
	// 게시물 작성
	public void write(NoticeDto vo) throws Exception;

	// 게시물 조회
	public NoticeDto view(int n_num) throws Exception;

	// 게시물 수정
	public void modify(NoticeDto vo) throws Exception;
	
	// 게시물 삭제
	public void delete(int n_num) throws Exception;
	
	// 게시물 총 갯수
	public int count() throws Exception;

		
}
