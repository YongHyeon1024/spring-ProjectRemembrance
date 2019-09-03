package com.project.service;

import java.util.List;
import java.util.Map;

public interface QnABoardService {

	public int updateBoardOne(Map<String, Object> map); //게시물 수정
	
	public List<Map<String, Object>> selectBoardList(); //게시물 목록
	
	public Map<String, Object> selectBoardOne(int no); //게시물 내용
	
	public int insertBoardOne( Map<String, Object> map ); //게시물 글쓰기
	
	public int updateBoardHit(int no); //글번호가 넘어오면 조회수 1증가
	
	public int selectBoardPrev(int no); //이전글
	
	public int selectBoardNext(int no); //다음글
	
	public int deleteBoardOne(int no); ////게시물 삭제

}
