package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.BoardLikeDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.StyleBoardDTO;

@Repository
public class StyleBoardDAO {
	@Autowired
	private SqlSession mybatis;

	public int insert(StyleBoardDTO dto) {
		return mybatis.insert("StyleBoard.insert",dto);
	}
	
	public List<StyleBoardDTO> selectAll(){
		return mybatis.selectList("StyleBoard.selectAll");
	}
	
	//	좋아요순 정렬
	public List<StyleBoardDTO> orderByLikey(){
		return mybatis.selectList("StyleBoard.orderByLikey");
	}
	
	public List<StyleBoardDTO> selectById(String loginId){
		return mybatis.selectList("StyleBoard.selectById", loginId);
	}
	
	// 게시글 Count
	public int boardCount(String writer) {
		return mybatis.selectOne("StyleBoard.boardCount", writer);
	}
	
	public StyleBoardDTO selectBySeq(int seq) {
		return mybatis.selectOne("StyleBoard.selectBySeq", seq);
	}
	
	public int deleteBySeq(int seq) {
		return mybatis.delete("StyleBoard.deleteBySeq", seq);
	}
	public int deleteByWriter(String writer) {
		return mybatis.delete("StyleBoard.deleteByWriter", writer);
	}
	
	public int updateBySeq(StyleBoardDTO dto) {
		return mybatis.update("StyleBoard.updateBySeq",dto);
	}
	
	// profileSysName 수정
	public int updateProfile(String profileSysName, String loginId) {
		Map<String, String> param = new HashMap<>();
		param.put("profileSysName", profileSysName);
		param.put("loginId", loginId);
		
		return mybatis.update("StyleBoard.updateProfile", param);
	}
	
//	댓글 count(*)
	public int updateReplyCount(int seq) {
		return mybatis.update("StyleBoard.updateReplyCount",seq);
	}
	
	public int deleteReplyCount(int seq) {
		return mybatis.update("StyleBoard.deleteReplyCount",seq);
	}
	
   //좋아요 추가
   public int like(int seq) {
      return mybatis.update("StyleBoard.like", seq);
   }
   //좋아요 취소
   public int dislike(int seq) {
      return mybatis.update("StyleBoard.dislike", seq);
   }
   //좋아요 누른 정보 추가
   public int likeInfo(BoardLikeDTO dto) {
      return mybatis.insert("StyleBoard.likeInfo", dto);
   }
   //좋아요 취소 정보 추가
   public int dislikeInfo(int seq, String id) {
//      System.out.println("DAO에서 dislikeinfo: "+seq+id);
      Map<String, Object> map = new HashMap<>();
      map.put("seq", seq);
      map.put("loginId", id);
      return mybatis.delete("StyleBoard.dislikeInfo", map);
   }
   //좋아요했는지 확인
   public int likeCheck(int seq, String id) {
      Map<String, Object> map = new HashMap<>();
      map.put("seq", seq);
      map.put("loginId", id);
      return mybatis.selectOne("StyleBoard.likeCheck", map);
   }
   
   
   // 탈퇴한 계정의 게시글에 접근
//   public List<MemberDTO> isExistWriter(){
//	   return mybatis.selectList("StyleBoard.memberOutWriter");
//   }
}
