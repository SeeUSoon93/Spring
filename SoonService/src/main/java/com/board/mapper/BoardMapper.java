package com.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import com.board.entity.Board;

@Mapper
public interface BoardMapper {
	// 게시글 리스트 조회
	public List<Board> boardSelectList();
	
	
	
}
