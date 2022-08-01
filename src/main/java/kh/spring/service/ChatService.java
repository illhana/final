package kh.spring.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dao.ChatDAO;
import kh.spring.dto.ChatDTO;

@Service
public class ChatService {

	@Autowired
	private ChatDAO dao;

	public int insert(ChatDTO dto) {
		return dao.insert(dto);
	}
	
	public List<ChatDTO> selectAll(){
		return dao.selectAll();
	}
	
	public ChatDTO selectOne(String loginId) {
		return dao.selectOne(loginId);
	}
	
	public String upload(String realPath, MultipartFile file, String loginId, String profileSysName) throws Exception {
		File realPathFile = new File(realPath);
		if(!realPathFile.exists())realPathFile.mkdir();
		
		String oriName = file.getOriginalFilename();
		String sysName = UUID.randomUUID() + "_" + oriName;
		
		file.transferTo(new File(realPath+"/"+sysName));
		
		dao.insert(new ChatDTO(0,loginId, "", profileSysName, sysName, null));
		return sysName;
	}
	
	// profileSysName 수정
	public int updateProfile(String profileSysName, String loginId) {
		return dao.updateProfile(profileSysName, loginId);
	}
}
