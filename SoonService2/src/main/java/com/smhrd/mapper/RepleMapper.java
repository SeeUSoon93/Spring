package com.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import com.smhrd.entity.Board;
import com.smhrd.entity.reple;

@Mapper
public interface RepleMapper {
	
	public List<reple> repleSelectList(String bTitle);

	public void repleInsert(reple reple);

	
	
	
}
