package com.project.service;

import java.util.List;
import java.util.Map;

import com.project.dao.User;
import com.project.dao.Word;

public interface WordService {
	
	public List<Word> selectWordList(String word);
	
	public int createWordList(Map<String, String> map);
}
