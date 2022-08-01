package kh.spring.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kh.spring.dto.ChatDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.service.ChatService;
import kh.spring.service.MemberService;

@Controller
@RequestMapping("/chat/")
public class ChatController {
	
	@Autowired
	private HttpSession hsession;
	@Autowired
	private ChatService cServ;
	@Autowired
	private MemberService mServ;
	
	private static Gson gson = new Gson();

	@RequestMapping("chatHome")
	public String home() {
		return "/chat/chatHome";
	}
	
	@ResponseBody
	@RequestMapping("onOpen")
	public String onOpen() {
		List<ChatDTO> list = cServ.selectAll();
		SimpleDateFormat sdf = new SimpleDateFormat("a hh:mm");
		for(int i = 0; i < list.size(); i++) {
			list.get(i).setFormedDate(sdf.format(list.get(i).getWriteDate()));
		}
		return gson.toJson(list);
	}

	@ResponseBody
	@RequestMapping(value="upload", produces = "text/html;charset=utf8")
	public String upload(MultipartFile file) throws Exception{
		String realPath = hsession.getServletContext().getRealPath("upload");
		String loginId = (String)hsession.getAttribute("loginId");
		
		MemberDTO mDto = mServ.myPage(loginId);
		String profileSysName = mDto.getImageSysName();
	
		String sysName = cServ.upload(realPath, file, loginId, profileSysName);
//		System.out.println("성공!!!!");
		
		return sysName;
	}
}
