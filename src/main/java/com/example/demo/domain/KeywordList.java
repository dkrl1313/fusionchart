package com.example.demo.domain;

import java.time.LocalDate;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.SortedMap;
import java.util.TreeMap;

public class KeywordList {
	
	private String keyword;
	private Integer count;
	private Integer ycount;
	private Integer rank;
	private Integer flow;
	private List<Integer> countList;
	private List<List<Object>> hostList;
	
	private SortedMap<String, Integer> sparkMap;
	private LinkedHashMap<String, Integer> hostMap;
	
	private String ad;

	public KeywordList(){
		sparkMap = new TreeMap<>();
		hostMap = new LinkedHashMap<String, Integer>();
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public Integer getYcount() {
		return ycount;
	}

	public void setYcount(Integer ycount) {
		this.ycount = ycount;
	}

	public Integer getRank() {
		return rank;
	}

	public void setRank(Integer rank) {
		this.rank = rank;
	}

	public Integer getFlow() {
		return flow;
	}

	public void setFlow(Integer flow) {
		this.flow = flow;
	}

	public SortedMap<String, Integer> getSparkMap() {
		return sparkMap;
	}

	public void setSparkMap(SortedMap<String, Integer> sparkMap) {
		this.sparkMap = sparkMap;
	}

	public List<Integer> getCountList() {
		return countList;
	}

	public void setCountList(List<Integer> countList) {
		this.countList = countList;
	}

	public List<List<Object>> getHostList() {
		return hostList;
	}

	public void setHostList(List<List<Object>> hostList) {
		this.hostList = hostList;
	}
	
	public LinkedHashMap<String, Integer> getHostMap() {
		return hostMap;
	}

	public void setHostMap(LinkedHashMap<String, Integer> hostMap) {
		this.hostMap = hostMap;
	}
	
	public void setSparkMapData(LocalDate date){
		int cnt = 6;
		for(Integer sparkCount : this.countList){
			this.sparkMap.put(date.minusDays(cnt).toString(), sparkCount);
			cnt--;
		}
	}
	
	public void setHostMapData(){
		Integer cnt = null;
		String host = null;
		for(List<Object> list : this.hostList){
			for(Object object : list){
				try {
					cnt = Integer.parseInt(object.toString());
				} catch (NumberFormatException e) {
					host = object.toString();
				}				
			}
			hostMap.put(host, cnt);
		}
	}

	public String getAd() {
		return ad;
	}

	public void setAd(String ad) {
		this.ad = ad;
	}
}
