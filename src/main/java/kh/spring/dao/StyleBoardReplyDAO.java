package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.StyleBoardReplyDTO;

@Repository
public class StyleBoardReplyDAO {
	@Autowired
	private SqlSession mybatis;

	public int insert(StyleBoardReplyDTO dto) {
		return mybatis.insert("StyleBoardReply.insert",dto);
	}
	
	public List<StyleBoardReplyDTO> selectByParent(int parent_seq){
		return mybatis.selectList("StyleBoardReply.selectByParent",parent_seq);
	}
	
	public int delete(int seq) {
		return mybatis.delete("StyleBoardReply.delete", seq);
	}
	
	public int update(StyleBoardReplyDTO dto) {
		return mybatis.update("StyleBoardReply.update", dto);
	}
	
	// 댓글 개수 출력
	public int getCmtCount(int parent_seq) {
		return mybatis.selectOne("StyleBoardReply.getCmtCount", parent_seq);
	}
	
	// 프로필 사진 수정
	public int updateProfile(String profileSysName, String loginId) {
		Map<String, String> param = new HashMap<>();
		param.put("profileSysName", profileSysName);
		param.put("loginId", loginId);
		return mybatis.update("StyleBoardReply.updateProfile", param);
	}
}
