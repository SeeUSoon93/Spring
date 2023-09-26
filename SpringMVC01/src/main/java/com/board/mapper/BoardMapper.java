package com.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.board.entity.Board;

@Mapper
public interface BoardMapper {
	// 게시글 전체 조회
	public List<Board> boardSelectList();
	
	// 게시글 상세 조회
	public Board boardSelect(int idx);
	
	// 게시글 작성
	public int boardInsert(Board board);
	
	// 게시글 삭제
	public int boardDelete(int idx);
	
	// 게시글 수정
	public int boardUpdate(Board board);
	
	// 게시글 조회수 수정
	public int boardCountUpdate(int idx);
	
	// 게시글 추천
	public int boardGood(int idx);
	public int boardBad(int idx);
	
	
	
	
}
