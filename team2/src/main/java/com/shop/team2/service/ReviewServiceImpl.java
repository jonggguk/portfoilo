package com.shop.team2.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.shop.team2.dao.ReviewDao;
import com.shop.team2.dto.ReviewDto;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Inject
	private ReviewDao dao;
	
	// 게시물 목록
	@Override
	public List<ReviewDto> list() throws Exception {

		return dao.list();
	}

	// 게시물 작성
	@Override
	public void write(ReviewDto vo) throws Exception {
		
		dao.write(vo);
	}

	// 게시물 조회
	@Override
	public ReviewDto view(int r_num) throws Exception {

		return dao.view(r_num);
	}

	// 게시물 수정
	@Override
	public void modify(ReviewDto vo) throws Exception {
		
		dao.modify(vo);
	}

	// 게시물 삭제
	@Override
	public void delete(int r_num) throws Exception {
		dao.delete(r_num);
	}

	
	
	// 게시물 총 갯수
	@Override
	public int count() throws Exception {
		return dao.count();
	}

	
	
	// 게시물 목록 + 페이징
	@Override
	public List<ReviewDto> listPage(int displayPost, int postNum) throws Exception {
		return dao.listPage(displayPost, postNum);
	}

	
	
	// 게시물 목록 + 페이징 + 검색
	@Override
	public List<ReviewDto> listPageSearch(
			int displayPost, int postNum, String searchType, String keyword) throws Exception {
		return  dao.listPageSearch(displayPost, postNum, searchType, keyword);
	}
	
	// 게시물 총 갯수
	@Override
	public int searchCount(String searchType, String keyword) throws Exception {
		return dao.searchCount(searchType, keyword);
	}
}
