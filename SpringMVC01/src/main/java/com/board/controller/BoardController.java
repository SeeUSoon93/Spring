package com.board.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.board.entity.Board;

// Handler(Controller-POJO) Mapping이 Controller를 찾기위해 @Controller로 명시해야 함
@Controller
public class BoardController {
	
	// 게시글 작성하는 jsp - boardForm.do
	@RequestMapping("/boardForm.do")
	public String boardForm() {
		
		return "boardForm";
	}
	
	
	// 게시글 전체조회 - boardSelectList.do
	@RequestMapping("/boardSelectList.do")
	public String boardSelectList(Model model) {
		System.out.println("[게시글 전체조회]");
		// DB로부터 게시글 정보를 불러오기
		// 번호, 제목, 내용, 작성자, 작성일, 조회수
		// 하나의 게시글 작성
		Board vo1 = new Board(1, "치킨먹고싶다1","광주에서 제일 큰 BHC로 집합","최윤석","2023.09.25",12983);
		Board vo2 = new Board(2, "치킨먹고싶다2","광주에서 제일 큰 BHC로 집합","최윤석","2023.09.25",12983);
		Board vo3 = new Board(3, "치킨먹고싶다3","광주에서 제일 큰 BHC로 집합","최윤석","2023.09.25",12983);
		System.out.println(vo1.toString());
		System.out.println(vo2.toString());
		System.out.println(vo3.toString());

		List<Board> voList = new ArrayList<Board>();
		voList.add(vo1);
		voList.add(vo2);
		voList.add(vo3);
		
		// vo1, vo2, vo3를 jsp로 보낼건데 -> request가 아닌 좀 더 작은 영역인 model을 사용
		// 객체바인딩(동적바인딩)
		model.addAttribute("voList",voList);
		
		return "boardList";
	}
	
	
	// 게시글 수정 - boardUpdate.do
	
	// 게시글 삭제 - boardDelete.do
	
	// 게시글 상세보기 - boardContent.do
		
}
