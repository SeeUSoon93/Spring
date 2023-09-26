package com.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestAttributes;

import com.board.entity.Board;
import com.board.mapper.BoardMapper;

// Handler(Controller-POJO) Mapping이 Controller를 찾기위해 @Controller로 명시해야 함
@Controller
public class BoardController {
	
	@Autowired
	private BoardMapper boardMapper;
	
	// 게시글 작성 - boardInsert.do
	@RequestMapping("/boardInsert.do")
	public String boardInsert(Board board) {
		System.out.println("[게시글 작성]");
		System.out.println(board.toString());	
		
		// 개행해서 DB에 저장
		String content = board.getContent();
		content = content.replace("\r\n","<br>");		
		board.setContent(content);
		
		boardMapper.boardUpdate(board);
		
		// sendRedirect 방식으로 요청 URL 알려주기
		return "redirect:/boardSelectList.do";
	}
	
	// 게시글 작성하는 jsp로 이동 - boardForm.do
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
		List<Board> boardList = boardMapper.boardSelectList();		
		System.out.println(boardList.get(0).getTitle());
		
		// vo1, vo2, vo3를 jsp로 보낼건데 -> request가 아닌 좀 더 작은 영역인 model을 사용
		// 객체바인딩(동적바인딩)
		model.addAttribute("boardList",boardList);		
		return "boardList";
	}
	
	// 게시글 상세보기 - boardContent.do
	@RequestMapping("/boardContent.do")
	public String boardSelect(@RequestParam("idx") int idx, Model model) {
		
		System.out.println("[게시글 상세조회]");
		System.out.println(idx+"번 게시글");
		boardMapper.boardCountUpdate(idx);
		Board board = boardMapper.boardSelect(idx);		
		System.out.println(board.getTitle());	
		model.addAttribute("board",board);
		return "boardDetail";
	}
	
	// 게시글 수정하는 jsp로 이동 - boardUpdateForm.do
	@RequestMapping("/boardUpdateForm.do")
	public String boardUpdateForm(@RequestParam("idx") int idx, Model model) {
				
		Board board = boardMapper.boardSelect(idx);		
		System.out.println(board.getTitle());	
		model.addAttribute("board",board);
		
		return "boardUpdate";
	}	
	
	// 게시글 수정 - boardUpdate.do
	@RequestMapping("/boardUpdate.do")
	public String boardUpdate(Board board, Model model) {
		
		System.out.println("[게시글 수정]");
		System.out.println(board.toString());	
		
		// 개행해서 DB에 저장
		String content = board.getContent();
		content = content.replace("\r\n","<br>");		
		board.setContent(content);
		
		boardMapper.boardUpdate(board);
		
		return "redirect:/boardContent.do?idx="+board.getIdx();
	}
	
	// 게시글 삭제 - boardDelete.do
	@RequestMapping("/boardDelete.do")
	public String boardDelete(@RequestParam("idx") int idx) {
		
		System.out.println("[게시글 삭제]");
		System.out.println(idx+"번 게시글 삭제");

		boardMapper.boardDelete(idx);	
		
		return "redirect:/boardSelectList.do";
	}
		
	
	// 게시글 추천 - boardGood.do
	@RequestMapping("/boardGood.do")
	public void boardGood(@RequestParam("idx") int idx, HttpServletResponse response) throws IOException{
		
		System.out.println("[게시글 추천]");
		
		boardMapper.boardGood(idx);
		
		Board board = boardMapper.boardSelect(idx);		
		System.out.println("추천 수 :"+board.getGood());	
		
		PrintWriter out = response.getWriter();
		out.print(board.getGood());
		
	}
	
	// 게시글 비추 - boardBad.do
	@RequestMapping("/boardBad.do")
	public void boardBad(@RequestParam("idx") int idx, HttpServletResponse response) throws IOException{
		
		System.out.println("[게시글 비추]");
		
		boardMapper.boardBad(idx);
		
		Board board = boardMapper.boardSelect(idx);		
		System.out.println("추천 수 :"+board.getBad());	
		
		PrintWriter out = response.getWriter();
		out.print(board.getBad());
		
	}
	
}
