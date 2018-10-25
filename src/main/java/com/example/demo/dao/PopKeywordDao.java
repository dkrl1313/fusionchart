package com.example.demo.dao;

import com.example.demo.domain.DayKeywordTop;
import com.example.demo.domain.KeywordList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PopKeywordDao {
	
	@Autowired
	private MongoTemplate mongoTemplate;

	public List<KeywordList> getKeywordList(String date) {
		Query query = new Query();
		query.addCriteria(Criteria.where("_id").is(date));
		
		List<DayKeywordTop> tops = mongoTemplate.find(query, DayKeywordTop.class, "tDayKeywordTop1000");
		
		if(tops.size()>0){
			return tops.get(0).getKeywordList();
		}else{
			return null;
		}
	}

}
