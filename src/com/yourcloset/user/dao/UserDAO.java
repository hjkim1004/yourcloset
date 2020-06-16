package com.yourcloset.user.dao;

import java.util.List;

import com.yourcloset.user.vo.UserVO;

public interface UserDAO {

	boolean isUser(String user_id);
	String login(String user_id, String password);
	int signUp(UserVO user);
	
	UserVO selectUserByUserId(String user_id);
	int updateUserInfo(String user_id, String column, Object value);
	List<UserVO> selectAllUser();

}