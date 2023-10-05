package com.smhrd.entity;

import java.math.BigDecimal;
import java.security.Timestamp;

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
	private String bTitle;
	private String bContent;
	private String nick;
	private String bDate;
	private int bGood;
	
	}
