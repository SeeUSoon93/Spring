package com.board.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString // -> 필드들을 문자열로 보여줌
public class Board {

	private int idx;
	private String title;
	private String content;
	private String writer;
	private String indate;
	private int count;
	private int good;
	private int bad;
	
}
