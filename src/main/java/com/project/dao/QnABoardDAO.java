package com.project.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.service.QnABoardService;

@Service
public class QnABoardDAO implements QnABoardService{

	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	
	@Override
	public int insertBoardOne(Map<String, Object> map) {
		return sqlSession.insert("QboardMapper.insertBoardOne", map);
	}
	
	@Override
	public List<Map<String, Object>> selectBoardList() {
		return sqlSession.selectList("QboardMapper.selectBoardList");
	}

	@Override
	public int updateBoardOne(Map<String, Object> map) {
		return sqlSession.update("QboardMapper.updateBoardOne", map);
	}

	@Override
	public Map<String, Object> selectBoardOne(int no) {
		return sqlSession.selectOne("QboardMapper.selectBoardOne", no);
	}

	@Override
	public int updateBoardHit(int no) {
		return sqlSession.update("QboardMapper.updateBoardHit", no);
	}

	@Override
	public int selectBoardPrev(int no) {
		return sqlSession.selectOne("QboardMapper.selectBoardPrev", no);
	}

	@Override
	public int selectBoardNext(int no) {
		return sqlSession.selectOne("QboardMapper.selectBoardNext", no);
	}

	@Override
	public int deleteBoardOne(int no) {
		return sqlSession.delete("QboardMapper.deleteBoardOne", no);
	}
}
