package com.dxteam.onboard.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.RedirectView;

import com.dxteam.onboard.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService service;
	
	@RequestMapping("/board/list")
	public String list(Model model) {
		//페이지 네이션 위해서 addAttribute 를 통해서 데이터 전체의 정보 값을 받아올 수 있다. 코드추가요망
		model.addAttribute("list", service.list());
		return "board/list3";
	}
	
	@RequestMapping("/board/write")
	public String wirte() {
		return "board/write";
	}
	
	@RequestMapping(value="/board/insert", method=RequestMethod.POST)
	public RedirectView insert(HttpServletRequest  httpServletRequest ) {
		String name = httpServletRequest.getParameter("board_name");
		String subject = httpServletRequest.getParameter("board_subject");
		String content = httpServletRequest.getParameter("board_content");
		System.out.println(name);
		System.out.println(subject);
		System.out.println(content);
		
		service.insert(name, subject, content);
		
		return new RedirectView("list");
	}
//	
//	@RequestMapping("/board/view")
//	public String view(Model model) {
//		
//		model.addAttribute("view", service.view());
//		
//		return "board/view";
//	}
}
