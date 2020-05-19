package com.dxteam.onboard.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dxteam.onboard.service.BoardService;

@Controller
public class MainController {
	
//	@Resource
//	private BoardService service;

	@RequestMapping("/")
	public String index() {
		return "test";
	}
}
