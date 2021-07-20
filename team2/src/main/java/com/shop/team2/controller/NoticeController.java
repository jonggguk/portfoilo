package com.shop.team2.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.team2.dto.*;
import com.shop.team2.service.NoticeService;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {

	@Inject
	private NoticeService service;

	// 게시물 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(Model model) throws Exception {
		
		List<NoticeDto> list = null; 
		list = service.list();
		model.addAttribute("list", list);		 
	}
	
	// 게시물 작성
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void getWirte() throws Exception {
		 
	}
	
	// 게시물 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String posttWirte(NoticeDto vo) throws Exception {
		 service.write(vo);
		 
		 return "redirect:/notice/list";
	}
	
	// 게시물 조회
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("n_num") int n_num, Model model) throws Exception {
		
		NoticeDto vo = service.view(n_num);
		 
		model.addAttribute("view", vo);
		
	}
	
	// 게시물 수정
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void getModify(@RequestParam("n_num") int n_num, Model model) throws Exception {

		NoticeDto vo = service.view(n_num);
		 
		model.addAttribute("view", vo);
	}
	
	// 게시물 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(NoticeDto vo) throws Exception {

		service.modify(vo);
		 
		 return "redirect:/notice/view?n_num=" + vo.getN_num();
	}
	
	// 게시물 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String getDelete(@RequestParam("n_num") int n_num) throws Exception {
		
		service.delete(n_num);		

		return "redirect:/notice/list";
	} 
}