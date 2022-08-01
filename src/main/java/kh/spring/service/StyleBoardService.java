package kh.spring.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kh.spring.dao.StyleBoardDAO;
import kh.spring.dto.BoardLikeDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.ProductImageDTO;
import kh.spring.dto.StyleBoardDTO;

@Service
public class StyleBoardService {
	@Autowired
	private StyleBoardDAO dao;

	public void dropInsert(String loginId, String contents, String realPath, MultipartHttpServletRequest request, String profileSysName) throws Exception {
		File realPathFile = new File(realPath);
		if(!realPathFile.exists())realPathFile.mkdir();
		
	      Map<String, MultipartFile> fileMap = request.getFileMap();
	      
	      for(MultipartFile m : fileMap.values()) {
	         String oriName = m.getOriginalFilename();
	         String sysName = UUID.randomUUID() + "_" + oriName;
	         m.transferTo(new File(realPath + "/" + sysName));
	         dao.insert(new StyleBoardDTO(0, loginId, contents, profileSysName, sysName, 0, null, "", 0));
	      }
		
		
	}
	public int insert(String loginId, String contents, String realPath, MultipartFile styleFile, String profileSysName) throws Exception {
		File realPathFile = new File(realPath);
		if(!realPathFile.exists())realPathFile.mkdir();
		String oriName = styleFile.getOriginalFilename();
		String sysName = UUID.randomUUID() + "_" + oriName;
		
		styleFile.transferTo(new File(realPath+"/"+sysName));
		
		
		return dao.insert(new StyleBoardDTO(0, loginId, contents, profileSysName, sysName, 0, null, "", 0));
	}
	
	public List<StyleBoardDTO> selectAll(){
		return dao.selectAll();
	}
	
	//	좋아요순 정렬
	public List<StyleBoardDTO> orderByLikey(){
		return dao.orderByLikey();
	}
	
	public List<StyleBoardDTO> selectById(String loginId){
		return dao.selectById(loginId);
	}
	
	// 게시글 Count
	public int boardCount(String writer) {
		return dao.boardCount(writer);
	}
	
	public StyleBoardDTO selectBySeq(int seq) {
		return dao.selectBySeq(seq);
	}
	
	public int deleteBySeq(int seq, String imageSysName, String realPath) {
		// 업로드된 파일 먼저 삭제
		File targetFile = new File(realPath + "/" + imageSysName);
		if(targetFile.exists()) { // 파일이 존재하면
			targetFile.delete(); // 파일 삭제	
		}
		return dao.deleteBySeq(seq);
	}
	
	public int deleteByWriter(String writer) {
		return dao.deleteByWriter(writer);
	}
	
	public int updateBySeq(int seq, String loginId, String contents, MultipartFile imageSysName, String realPath, String oriImageSysName) throws Exception {
		
		// 글만 수정
		if(imageSysName == null) {
			return dao.updateBySeq(new StyleBoardDTO(seq, loginId, contents, "", oriImageSysName, 0 , null, "", 0));
		
		// 사진 같이 수정
		}else {
			// 기존에 업로드된 파일 먼저 삭제
			File targetFile = new File(realPath + "/" + oriImageSysName);
			if(targetFile.exists()) { // 파일이 존재하면
				targetFile.delete(); // 파일 삭제	
			}
			
			// 새로운 이미지 파일을 업로드
			File realPathFile = new File(realPath);
			if(!realPathFile.exists())realPathFile.mkdir();
			String oriName = imageSysName.getOriginalFilename();
			String sysName = UUID.randomUUID() + "_" + oriName;
			
			imageSysName.transferTo(new File(realPath+"/"+sysName));
			
			return dao.updateBySeq(new StyleBoardDTO(seq, loginId, contents, "", sysName, 0, null, "", 0));
		}
	}
	
	// profileSysName 수정
	public int updateProfile(String profileSysName, String loginId) {
		return dao.updateProfile(profileSysName, loginId);
	}
	
//	댓글 count
	public int updateReplyCount(int seq) {
		return dao.updateReplyCount(seq);
	}
	
	public int deleteReplyCount(int seq) {
		return dao.deleteReplyCount(seq);
	}
	
//좋아요 추가
   public int like(int seq) {
      return dao.like(seq);
   }
   //좋아요 취소
   public int dislike(int seq) {
      return dao.dislike(seq);
   }
   
   //좋아요 정보 추가
   public int likeInfo(BoardLikeDTO dto) {
      return dao.likeInfo(dto);
   }
   //좋아요 정보 삭제
   public int dislikeInfo(int seq, String id) {
      return dao.dislikeInfo(seq, id);
   }
   //좋아요 중복 확인
   public int likeCheck(int seq, String id) {
      int likeCheck = dao.likeCheck(seq, id);
      return likeCheck;
   }
	
}
