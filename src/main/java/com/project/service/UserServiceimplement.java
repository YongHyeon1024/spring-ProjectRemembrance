package com.project.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.User;

@Service
public class UserServiceimplement implements UserService{

	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	
	@Override
	public int insertUserOne(User user) {
		return sqlSession.insert("userMapper.insertUserOne", user);
	}

	@Override
	public User selectUserLogin(User user) {
		return sqlSession.selectOne("userMapper.selectUserLogin", user);
	}

	@Override
	public User selectUserOne(User user) {
		//System.out.println("서비스 객체에서의 user : " + user.toString());
		return sqlSession.selectOne("userMapper.selectUserOne", user);
	}

	@Override
	public User selectUserAll(String id) {
		return sqlSession.selectOne("userMapper.selectUserAll", id);
	}

	@Override
	public int updateUserOne(User user) {
		return sqlSession.update("userMapper.updateUserOne", user);
	}

	@Override
	public int deleteUserOne(String id) {
		return sqlSession.delete("userMapper.deleteUserOne", id);
	}

	@Override
	public int userHitUpdate(String id) {
		return sqlSession.update("userMapper.userHitUpdate", id);
	}

	@Override
	public List<User> selectUserList() {
		return sqlSession.selectList("userMapper.selectUserList");
	}

	@Override
	public User selectUserPw(String value) {
		return sqlSession.selectOne("userMapper.selectUserPw", value);
	}


}
