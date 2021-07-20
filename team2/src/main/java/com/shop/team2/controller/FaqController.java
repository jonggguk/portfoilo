package com.shop.team2.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.team2.dto.FaqDto;
import com.shop.team2.dto.Page;
import com.shop.team2.service.FaqService;


@Controller
@RequestMapping("/faq/*")
public class FaqController {

	@Inject
	private FaqService service;

	// 게시물 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(Model model) throws Exception {
		
		List<FaqDto> list = null; 
		list = service.list();
		model.addAttribute("list", list);		 
	}
	
	// 게시물 작성
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void getWirte() throws Exception {
		 
	}
	
	// 게시물 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String posttWirte(FaqDto vo) throws Exception {
		 service.write(vo);
		 
		 return "redirect:/faq/list";
	}
	
	// 게시물 조회
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("f_num") int f_num, Model model) throws Exception {
		
		FaqDto vo = service.view(f_num);
		 
		model.addAttribute("view", vo);
	}
	
	// 게시물 수정
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void getModify(@RequestParam("f_num") int f_num, Model model) throws Exception {

		FaqDto vo = service.view(f_num);
		 
		model.addAttribute("view", vo);
	}
	
	// 게시물 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(FaqDto vo) throws Exception {

		service.modify(vo);
		 
		 return "redirect:/faq/view?f_num=" + vo.getF_num();
	}
	
	// 게시물 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String getDelete(@RequestParam("f_num") int f_num) throws Exception {
		System.out.println("faq delete start");
		
		service.delete(f_num);		

		System.out.println("qna delete end");
		return "redirect:/faq/list";
	} 
	
	
	
	// 게시물 목록 + 페이징 추가
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void getListPage(Model model, @RequestParam("num") int num) throws Exception {

		
		Page page = new Page();
		
		page.setNum(num);
		page.setCount(service.count());		
		
		List<FaqDto> list = null; 
		list = service.listPage(page.getDisplayPost(), page.getPostNum());
		
		model.addAttribute("list", list);
	
		
		model.addAttribute("page", page);
		
		model.addAttribute("select", num);
		
	}


	
	// 게시물 목록 + 페이징 추가 + 검색
	@RequestMapping(value = "/listPageSearch", method = RequestMethod.GET)
	public void getListPageSearch(Model model, @RequestParam("num") int num, 
			@RequestParam(value = "searchType",required = false, defaultValue = "title") String searchType,
			@RequestParam(value = "keyword",required = false, defaultValue = "") String keyword
			) throws Exception {
	
		
		Page page = new Page();
		
		page.setNum(num);
		page.setCount(service.searchCount(searchType, keyword));
		
		page.setSearchType(searchType);
		page.setKeyword(keyword);
				
		List<FaqDto> list = null; 
		list = service.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);
		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);
		
	}
}