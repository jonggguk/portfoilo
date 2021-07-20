package com.shop.team2.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.shop.team2.dto.NoticeDto;

@Repository
public class NoticeDaoImpl implements NoticeDao{

	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.shop.team2.mappers.notice";

	// 게시물 목록
	@Override
	public List<NoticeDto> list() throws Exception {	
		
		return sql.selectList(namespace + ".list");
	}

	// 게시물작성
	@Override
	public void write(NoticeDto vo) throws Exception {
			
		sql.insert(namespace + ".write", vo);
	}

	// 게시물 조회
	@Override
	public NoticeDto view(int n_num) throws Exception {
	
		return sql.selectOne(namespace + ".view", n_num);
	}

	// 게시물 수정
	@Override
	public void modify(NoticeDto vo) throws Exception {
		sql.update(namespace + ".modify", vo);
	}

	// 게시물 삭제
	@Override
	public void delete(int n_num) throws Exception {
		sql.delete(namespace + ".delete", n_num);
	}

	
	
	// 게시물 총 갯수
	@Override
	public int count() throws Exception {
		return sql.selectOne(namespace + ".count");	
	}

}

