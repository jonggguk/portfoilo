package com.shop.team2.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.shop.team2.dao.NoticeDao;
import com.shop.team2.dto.NoticeDto;

@Service("NoticeService")
public class NoticeServiceImpl implements NoticeService{

	@Inject
	private NoticeDao dao;
	
	// 게시물 목록
	@Override
	public List<NoticeDto> list() throws Exception {

		return dao.list();
	}

	// 게시물 작성
	@Override
	public void write(NoticeDto vo) throws Exception {
		
		dao.write(vo);
	}

	// 게시물 조회
	@Override
	public NoticeDto view(int n_num) throws Exception {

		return dao.view(n_num);
	}

	// 게시물 수정
	@Override
	public void modify(NoticeDto vo) throws Exception {
		
		dao.modify(vo);
	}

	// 게시물 삭제
	@Override
	public void delete(int n_num) throws Exception {
		dao.delete(n_num);
	}
	
	// 게시물 총 갯수
	@Override
	public int count() throws Exception {
		return dao.count();
	}
}
