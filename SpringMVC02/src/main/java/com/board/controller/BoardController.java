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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;

import com.board.entity.Board;
import com.board.mapper.BoardMapper;

// Handler(Controller-POJO) Mapping이 Controller를 찾기위해 @Controller로 명시해야 함
@Controller
public class BoardController {

	@Autowired
	private BoardMapper boardMapper;
	
	// main.jsp로 이동하는 동기방식 메소드
	@RequestMapping("/")
	public String main() {
		return "main";
	}
	
	// 게시글 전체조회 /boardSelectList.do
	// @ResponseBody -> 비동기방식으로 요청이 되어서 사용하는 것이기 때문에
	//					무조건 명시해줘야 함, JSON 형태로 뿌려줌
	@RequestMapping("/boardSelectList.do")
	public @ResponseBody List<Board> boardSelectList(){
		System.out.println("게시글 전체조회 할거냐?");
		List<Board> list = boardMapper.boardSelectList();
		return list;
	}
	
	// 게시글 작성 / boardInsert.do
	@RequestMapping("/boardInsert.do")
	public @ResponseBody void boardInsert(Board board){
		System.out.println("게시글 작성 할거냐?");
		boardMapper.boardInsert(board);
		System.out.println("게시글 작성 했냐?");
	}
	
	// 하는 중
	// 게시글 조회 / boardSelect.do
	@RequestMapping("/boardSelect.do")
	public @ResponseBody Board boardSelect(int idx){
		System.out.println("게시글 조회 할거냐?");
		Board board = boardMapper.boardSelect(idx);
		System.out.println("게시글 불러왔냐?");
		return board;
	}
	
	
}
