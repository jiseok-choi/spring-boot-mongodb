package com.dxteam.onboard.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Sort;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
//import org.springframework.data.domain.Sort.Order;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.dxteam.onboard.dto.BoardDTO;

@Repository
public class BoardDAO {
	
	@Resource
	private MongoTemplate mongoTemplate;
	
	//게시판 리스트
	public List<BoardDTO> list() {
		System.out.println(getClass().getSimpleName() + ".list()");

		Query query = new Query();
		
		//mongoTemplate.find(조건, 돌려받을 클래스, 컬렉션)
		return mongoTemplate.find(query, BoardDTO.class, "board");
	}
	
	//게시글 생성
	public void insert(String name, String subject, String content) {
		System.out.println(getClass().getSimpleName() + ".insert()");
		BoardDTO dto = new BoardDTO();
		
		dto.setWriter(name);
		dto.setTitle(subject);
		dto.setContent(content);
		dto.setWriteDate(new Date());
		dto.setHit(0);
		mongoTemplate.insert(dto);
		
	}
	
	//게시글 보기
//	public BoardDTO find
}
