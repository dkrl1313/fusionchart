package com.example.demo.domain;

import java.util.List;

import org.springframework.data.annotation.Id;

public class DayKeywordTop {

	@Id
	private String id;
	
	private List<KeywordList> keywordList;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public List<KeywordList> getKeywordList() {
		return keywordList;
	}

	public void setKeywordList(List<KeywordList> keywordList) {
		this.keywordList = keywordList;
	}
	
}
