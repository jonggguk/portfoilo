package com.shop.team2.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.team2.dto.ReviewDto;
import com.shop.team2.dto.Page;
import com.shop.team2.dto.ReplyVO;
import com.shop.team2.service.ReplyService;
import com.shop.team2.service.ReviewService;


@Controller
@RequestMapping("/review/*")
public class ReviewController {

	@Inject
	private ReviewService service;
	
	@Inject
	private ReplyService replyService;

	// 게시물 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(Model model) throws Exception {
		System.out.println("review_list_start");
		
		List<ReviewDto> list = null; 
		list = service.list();
		model.addAttribute("list", list);		
		
		System.out.println("review_list_end");
	}
	
	// 게시물 작성
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void getWirte() throws Exception {
		 
	}
	
	// 게시물 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String posttWirte(ReviewDto vo) throws Exception {
		System.out.println("review_write_start");
		
		 service.write(vo);
		 
		 System.out.println("review_write_end");
		 return "redirect:/review/list";
	}
	
	// 게시물 조회
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("r_num") int r_num, Model model) throws Exception {
		
		ReviewDto vo = service.view(r_num);
		 
		model.addAttribute("view", vo);
		 
		
		// 댓글 조회
		List<ReplyVO> reply = null;
		reply = replyService.list(r_num);
		model.addAttribute("reply", reply);
		
	}
	
	// 게시물 수정
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void getModify(@RequestParam("r_num") int r_num, Model model) throws Exception {

		ReviewDto vo = service.view(r_num);
		 
		model.addAttribute("view", vo);
	}
	
	// 게시물 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(ReviewDto vo) throws Exception {

		service.modify(vo);
		 
		 return "redirect:/review/view?r_num=" + vo.getR_num();
	}
	
	// 게시물 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String getDelete(@RequestParam("r_num") int r_num) throws Exception {
		
		service.delete(r_num);		

		return "redirect:/review/list";
	} 
	
	
	
	// 게시물 목록 + 페이징 추가
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void getListPage(Model model, @RequestParam("num") int num) throws Exception {

		
		Page page = new Page();
		
		page.setNum(num);
		page.setCount(service.count());		
		
		List<ReviewDto> list = null; 
		list = service.listPage(page.getDisplayPost(), page.getPostNum());
		
		model.addAttribute("list", list);
	
		
		model.addAttribute("page", page);
		
		model.addAttribute("select", num);
		
	}


	
	// 게시물 목록 + 페이징 추가 + 검색
	@RequestMapping(value = "/listPageSearch", method = RequestMethod.GET)
	public void getListPageSearch(Model model, @RequestParam("num") int num, 
			@RequestParam(value = "searchType",required = false, defaultValue = "r_title") String searchType,
			@RequestParam(value = "keyword",required = false, defaultValue = "") String keyword
			) throws Exception {
	
		
		Page page = new Page();
		
		page.setNum(num);
		page.setCount(service.searchCount(searchType, keyword));
		
		page.setSearchType(searchType);
		page.setKeyword(keyword);
				
		List<ReviewDto> list = null; 
		list = service.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);
		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);
	}
}
