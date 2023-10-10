package com.board.mapper;

import org.apache.ibatis.annotations.Mapper;
import com.board.entity.Member;

@Mapper
public interface MemberMapper {
	
	// 닉네임 상세 조회
	public Member memberSelect(String memId);
	
	
	
	
	
}
