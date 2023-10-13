package com.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import com.board.entity.Board;
import com.board.entity.Member;

@Mapper
public interface MemberMapper {

	public Member registerCheck(String memId);

	public int join(Member m);

	public Member login(Member m);

	public int update(Member m);

	public int updateImage(Member mvo);



}







