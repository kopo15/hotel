package com.kopo.domain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
public class Criteria {  
// 페이징에 활용하기 위한 클래스

	/*
	 * private int pageNum; //페이지 private int amount; //한번에 보여줄 게시물 수
	 */
	private String keyword; // 검색 키워드
	private String condition; // 검색 조건
	
	/*
	 * public Criteria() { this(1,10); //생성자
	 * 
	 * }
	 * 
	 * public Criteria(int pageNum, int amount) { this.pageNum = pageNum;
	 * this.amount = amount; }
	 */
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

}
