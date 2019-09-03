package com.project.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.service.WordService;

@Service
public class WordServiceDAO implements WordService {

	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	
	@Override
	public List<Word> selectWordList(String value) {
		System.out.println("서비스 객체에서 받은 level : " + value);
		return sqlSession.selectList("wordMapper.selectWordList", value);
	}


	@Override
	public int createWordList(Map<String, String> map) {
		return sqlSession.update("wordMapper.createWordList", map);
	}

}
