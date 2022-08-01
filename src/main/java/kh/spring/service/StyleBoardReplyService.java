package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.StyleBoardReplyDAO;
import kh.spring.dto.StyleBoardReplyDTO;

@Service
public class StyleBoardReplyService {
	@Autowired
	private StyleBoardReplyDAO strDao;
	
	public int insert(StyleBoardReplyDTO dto) {
		return strDao.insert(dto);
	}
	
	public List<StyleBoardReplyDTO> selectByParent(int parent_seq){
		return strDao.selectByParent(parent_seq);
	}
	
	public int delete(int seq) {
		return strDao.delete(seq);
	}
	
	public int update(StyleBoardReplyDTO dto) {
		return strDao.update(dto);
	}
	
	// 댓글 개수 출력
	public int getCmtCount(int parent_seq) {
		return strDao.getCmtCount(parent_seq);
	}
	
	// profileSysName 수정
	public int updateProfile(String profileSysName, String loginId) {
		return strDao.updateProfile(profileSysName, loginId);
	}
}
