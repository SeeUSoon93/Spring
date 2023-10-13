package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.board.entity.Board;
import com.board.mapper.BoardMapper;

// 비동기 통신만 가능
// 데이터, 객체를 리턴
// 페이지 이동 불가

@RestController
@RequestMapping("/board")
public class BoardRestController {

	
		@Autowired
		private BoardMapper boardMapper;
	
		// 게시글 전체조회 /boardSelectList.do
		// @ResponseBody -> 비동기방식으로 요청이 되어서 사용하는 것이기 때문에
		//                  무조건 명시해줘야 함. JSON 형태로 뿌려줌
		@GetMapping("/all")
		public List<Board> boardSelectList(){
			System.out.println("[게시글 전체조회]");
			List<Board> list = boardMapper.boardSelectList();
			return list;
		}
		
		// 게시글 등록
		@PostMapping("/new")
		public void boardInsert(Board board) {
			boardMapper.boardInsert(board);
		}
		
		// 게시글 상세보기 /board/{idx}
		@GetMapping("/{idx}")
		public Board boardContent(@PathVariable("idx") int idx) {
			Board board = boardMapper.boardContent(idx);
			return board;
		}
		
		// 게시글 삭제
		@DeleteMapping("/{idx}")
		public void boardDelete(@PathVariable("idx") int idx) {
			boardMapper.boardDelete(idx);
		}
		
		// 조회수 올리기
		@PutMapping("/count/{idx}")
		public void boardCount(@PathVariable("idx") int idx) {
			boardMapper.boardCount(idx);
		}
		
		// 게시글 수정하기
		@PutMapping("/update")
		public void boardUpdate(@RequestBody Board board) {
			boardMapper.boardUpdate(board);
		}
}
