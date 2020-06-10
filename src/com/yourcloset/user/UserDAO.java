package com.yourcloset.user;

import java.util.List;

public interface UserDAO {

	boolean isUser(String userid);
	String login(String userId, String password);
	int signUp(UserVO user);
	UserVO selectUserByUserId(String userId);
	int updateUserInfo(String userid, String column, Object value);
	List<UserVO> selectAllUser();

}