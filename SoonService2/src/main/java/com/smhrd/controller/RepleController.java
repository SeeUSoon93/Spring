package com.smhrd.controller;

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

import com.smhrd.entity.Board;
import com.smhrd.entity.reple;
import com.smhrd.mapper.BoardMapper;
import com.smhrd.mapper.RepleMapper;

// Handler(Controller-POJO) Mapping이 Controller를 찾기위해 @Controller로 명시해야 함
@Controller
public class RepleController {

	@Autowired
	private RepleMapper RepleMapper;
	
	// 리플 전체조회 
	@RequestMapping("/repleSelectList.do")
	public @ResponseBody List<reple> repleSelectList(@RequestParam("bTitle") String bTitle){
		System.out.println("리플 전체 조회 할거냐?");
		System.out.println(bTitle);
		List<reple> list = RepleMapper.repleSelectList(bTitle);
		if(list.size() != 0) {
			System.out.println(list.get(0).toString());
		}
		return list;
	}
	
	/*
	 * // 게시글 작성 / boardInsert.do
	 * 
	 * @RequestMapping("/boardInsert.do") public @ResponseBody void
	 * boardInsert(Board board){ System.out.println("게시글 작성 할거냐?");
	 * boardMapper.boardInsert(board); System.out.println("게시글 작성 했냐?"); }
	 */
	
}
