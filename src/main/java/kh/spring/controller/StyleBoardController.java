package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kh.spring.dto.BoardLikeDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.StyleBoardDTO;
import kh.spring.dto.StyleBoardReplyDTO;
import kh.spring.service.BoardLikeService;
import kh.spring.service.MemberService;
import kh.spring.service.StyleBoardReplyService;
import kh.spring.service.StyleBoardService;

@Controller
@RequestMapping("/style/")
public class StyleBoardController {
	
	@Autowired
	private HttpSession session;
	@Autowired
	private StyleBoardService stServ;
	@Autowired
	private StyleBoardReplyService strServ;
	@Autowired
	private BoardLikeService bServ;
	@Autowired
	private MemberService mServ;

	@RequestMapping("toStyleMain")
	public String toMain(Model model) {
		String loginId = (String)session.getAttribute("loginId");
		
		if(loginId !=null) {
	      List<BoardLikeDTO> likeList = bServ.getLike(loginId);
	      model.addAttribute("likeList", likeList);
		}
		List<StyleBoardDTO> list = stServ.selectAll();
		
		model.addAttribute("list", list);
		model.addAttribute("loginId", loginId);
		
		return "/style/styleMain";
	}
	
	// 인기순
	@RequestMapping("famousStyle")
	public String famousStyle(Model model) {
		String loginId = (String)session.getAttribute("loginId");
		
		if(loginId !=null) {
	      List<BoardLikeDTO> likeList = bServ.getLike(loginId);
	      model.addAttribute("likeList", likeList);
		}
		List<StyleBoardDTO> orderByLikey = stServ.orderByLikey();
		model.addAttribute("orderByLikey", orderByLikey);
		return "/style/famousStyle";
	}
	// 최신순
	@RequestMapping("newStyle")
	public String newStyle(Model model) {
		String loginId = (String)session.getAttribute("loginId");
		
		if(loginId !=null) {
			List<BoardLikeDTO> likeList = bServ.getLike(loginId);
			model.addAttribute("likeList", likeList);
		}
		List<StyleBoardDTO> listByNew = stServ.selectAll();
		model.addAttribute("listByNew", listByNew);
		return "/style/newStyle";
	}
	
	// myStylePage + id 클릭시 그 사람 StylePage로 이동
	   @RequestMapping("toStylePage")
	   public String toStylePage(String writer, Model model) throws Exception {
		 try {
	      String loginId = (String)session.getAttribute("loginId");
	      
	      // writer 클릭시 stylePage 이동
	      if(writer != null) {
	         List<StyleBoardDTO> list = stServ.selectById(writer);
	         model.addAttribute("list", list);
	         
	         if(list.size() == 0) {
	        	 MemberDTO mDTO = mServ.myPage(writer);
	        	 model.addAttribute("mDTO", mDTO);
	         }
	         
	         int boardCount = stServ.boardCount(writer);
	         model.addAttribute("boardCount", boardCount);
	         
	         // 해당 Wrtier가 member로 존재하는가?
	         int isExistWriter = mServ.isExistWriter(writer);
//		         System.out.println("isExistWriter : " + isExistWriter);
	         model.addAttribute("isExistWriter",isExistWriter);
	      
	      // myStylePage로 이동   
	      }else {
	         List<StyleBoardDTO> list = stServ.selectById(loginId);
	         model.addAttribute("list", list);
	        
	         if(list.size() == 0) {
	        	 MemberDTO mDTO = mServ.myPage(loginId);
	        	 model.addAttribute("mDTO", mDTO);
	         }
	         
	         int boardCount = stServ.boardCount(loginId);
	         model.addAttribute("boardCount", boardCount);
	      }
	      
	      // loginId가 좋아요한 게시글 불러옴
	      if(loginId != null) {
	         List<BoardLikeDTO> likeList = bServ.getLike(loginId);
	         model.addAttribute("likeList", likeList);
	      }
	      
	      // 게시글 Count
//		      int boardCount = stServ.boardCount(writer);
//		      System.out.println("boardCount : "+boardCount);
//		      model.addAttribute("boardCount", boardCount);
	      
	      model.addAttribute("loginId", loginId);
	      return "style/myStylePage";
		 }catch(Exception e) {
				model.addAttribute("error", "error");
				
				return "/style/styleDetail";
		}
	   }
	
	
	@RequestMapping("toStyleWrite")
	public String toStyleWrite() {
		
		return "/style/styleWrite";
	}
	
	// draganddrop
	@RequestMapping("dropInsert")
	public String insert(String contents, MultipartHttpServletRequest request) throws Exception {
		String realPath = session.getServletContext().getRealPath("upload");
		
		String loginId = (String)session.getAttribute("loginId");
	
		// 로그인한 정보 넘겨서 댓글 프로필 사진 불러오기. 로그인 안했을 시에는 /upload/default_profile.png로 사용
		MemberDTO mDto = mServ.myPage(loginId);
		String profileSysName = mDto.getImageSysName();
		
		stServ.dropInsert(loginId, contents, realPath, request, profileSysName);
		return "redirect:/style/toStyleMain";
	}
	
   @RequestMapping("insert")
   public String insert(String contents, MultipartFile styleFile) throws Exception {
	   
	  String realPath = session.getServletContext().getRealPath("upload");
      
      String loginId = (String)session.getAttribute("loginId");
   
      // 로그인한 정보 넘겨서 댓글 프로필 사진 불러오기. 로그인 안했을 시에는 /upload/default_profile.png로 사용
      MemberDTO mDto = mServ.myPage(loginId);
      String profileSysName = mDto.getImageSysName();
      
      stServ.insert(loginId, contents, realPath, styleFile, profileSysName);
      return "redirect:/style/toStyleMain";
   }
	
	// 게시글 디테일 이동 + 댓글
	@RequestMapping("toDetail")
	public String selectBySeq(int seq, Model model) throws Exception {
		
		try {
			
		// 해당 게시글
		StyleBoardDTO sDto = stServ.selectBySeq(seq);
		model.addAttribute("sDto", sDto);
		// 해당 Wrtier가 member로 존재하는가?
		int isExistWriter = mServ.isExistWriter(sDto.getWriter());
		model.addAttribute("isExistWriter",isExistWriter);
		
		// 댓글 불러오기
		List<StyleBoardReplyDTO> replyList = strServ.selectByParent(seq);
		if(replyList.size() != 0) {
			model.addAttribute("replyList", replyList);
		}
		
		// loginId == writer 경우 확인 위해 loginId 넘김
		String loginId = (String)session.getAttribute("loginId");
		if(loginId != null) {
//			System.out.println("loginId : "+loginId);
			model.addAttribute("loginId", loginId);

		// 로그인한 정보 넘겨서 댓글 프로필 사진 불러오기. 로그인 안했을 시에는 /upload/default_profile.png로 사용
		MemberDTO mDto = mServ.myPage(loginId);
		model.addAttribute("mDto", mDto);
		
       
		// 좋아요
		int likeResult = bServ.findLike(seq, loginId);
//		System.out.println("likeResult : "+likeResult);
        model.addAttribute("likeResult", likeResult);
		}
		return "/style/styleDetail";
		
		} catch(Exception e) {
			model.addAttribute("error", "error");
			
			return "/style/styleDetail";
		}
		
	}
	
	// 게시글 삭제
	@ResponseBody
	@RequestMapping("delete")
	public String deleteBySeq(int seq, String imageSysName) {
		String realPath = session.getServletContext().getRealPath("upload");
		int result = stServ.deleteBySeq(seq, imageSysName, realPath);
		return String.valueOf(result);
	}

	// 게시글 수정 페이지로 이동
	@RequestMapping("toUpdatePage")
	public String toUpdatePage(int seq, Model model) {
		StyleBoardDTO sDto = stServ.selectBySeq(seq);
		model.addAttribute("sDto", sDto);
		return "/style/updatePage";
	}
	
	// 게시글 수정
	@RequestMapping("update")
	public String update(int seq, String contents, String oriImageSysName,MultipartFile imageSysName) throws Exception {
		
		String loginId = (String)session.getAttribute("loginId");
		System.out.println(oriImageSysName);
		
		// 1. 글만 수정
		if(imageSysName.isEmpty()) {
			stServ.updateBySeq(seq, loginId, contents, null, "", oriImageSysName);
		
		// 2. 사진만 수정 && 3. 글과 사진 모두 수정
		}else if(imageSysName.getSize() > 0) {
			String realPath = session.getServletContext().getRealPath("upload");
			stServ.updateBySeq(seq, loginId, contents, imageSysName, realPath, oriImageSysName);
		}
		
		return "redirect:/style/toDetail?seq="+seq;
	}
	
	// 댓글 insert
	@RequestMapping("replyInsert")
	public String insert(int parent_seq, String writer, String reply, String imageSysName){
		strServ.insert(new StyleBoardReplyDTO(0, parent_seq, writer, reply, imageSysName, null, ""));
		// 댓글 작성시 style_board에 replyCount+1
		stServ.updateReplyCount(parent_seq);
		
		return "redirect:/style/toDetail?seq="+parent_seq;
	}
	
	// 댓글 delete
	@ResponseBody
	@RequestMapping("replyDelete")
	public String delete(int seq, int parent_seq) {
		String result = Integer.toString(strServ.delete(seq));
		stServ.deleteReplyCount(parent_seq);
		return result;
	}
	
	// 댓글 update
	@ResponseBody
	@RequestMapping("replyUpdate")
	public String update(int seq, String replyUpdate) {
		int result = strServ.update(new StyleBoardReplyDTO(seq,0,"",replyUpdate,"",null,""));
		return String.valueOf(result);
	}

	// 좋아요
   @ResponseBody
   @RequestMapping("StyleLike")
   public String like(int seq, String id) {
      String loginId = (String)session.getAttribute("loginId");
      
      if(loginId != null) {
         int likeCheck = stServ.likeCheck(seq, id);
         if(likeCheck == 0) { //좋아요 처음 누르면
            stServ.likeInfo(new BoardLikeDTO(0, id, seq)); //누른 정보 등록
            stServ.like(seq); //좋아요 +1
            likeCheck = 1;
         } else if (likeCheck == 1) { //좋아요 눌려있으면
            stServ.dislike(seq); //좋아요 취소
            stServ.dislikeInfo(seq, id); //취소했으니 정보 삭제
            likeCheck = 0;
         }
         return String.valueOf(likeCheck);
      } 
      else {
         return "noLoginId";
      }
   }
	
	
	@ExceptionHandler
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}
}
