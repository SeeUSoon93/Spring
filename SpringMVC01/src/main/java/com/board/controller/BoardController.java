package com.board.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

// Handler(Controller-POJO) Mapping이 Controller를 찾기위해 @Controller로 명시해야 함
@Controller
public class BoardController {
	
	// 게시글 전체조회 - boardSelectList.do
	@RequestMapping("boardSelectList.do")
	public String boardSelectList() {
		System.out.println("[게시글 전체조회]");
		
		return "template";
	}
	
	// 게시글 작성 - boardInsert.do
	
	// 게시글 수정 - boardUpdate.do
	
	// 게시글 삭제 - boardDelete.do
	
	// 게시글 상세보기 - boardContent.do
		
}
