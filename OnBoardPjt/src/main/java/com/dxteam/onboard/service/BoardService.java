package com.dxteam.onboard.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dxteam.onboard.dao.BoardDAO;
import com.dxteam.onboard.dto.BoardDTO;

@Service
public class BoardService {

	@Autowired
	private BoardDAO dao;
	
	public List<BoardDTO> list() {
		return dao.list();
	}
	
	public void insert(String name, String subject, String content) {
		this.dao.insert(name, subject, content);
		//return dao.insert();
	}
//	
//	public BoardDTO view() {
//		return dao.find();
//	}
}
