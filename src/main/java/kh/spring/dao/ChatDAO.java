package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.ChatDTO;

@Repository
public class ChatDAO {

	@Autowired
	private SqlSession mybatis;
	
	// 채팅 저장
	public int insert(ChatDTO dto){
		return mybatis.insert("Multichat.insert",dto);
	}
	
	// 채팅 출력
	public List<ChatDTO> selectAll(){
		return mybatis.selectList("Multichat.selectAll");
	}
	
	// 최신글 하나 출력
	public ChatDTO selectOne(String loginId) {
		return mybatis.selectOne("Multichat.selectOne", loginId);
	}
	
	// profileSysName 수정
	public int updateProfile(String profileSysName, String loginId) {
		Map<String, String> param = new HashMap<>();
		param.put("profileSysName", profileSysName);
		param.put("loginId", loginId);
		
		return mybatis.update("Multichat.updateProfile", param);
	}
	
}
