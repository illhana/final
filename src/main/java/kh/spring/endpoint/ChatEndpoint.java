package kh.spring.endpoint;


import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kh.spring.configurator.CTXProvider;
import kh.spring.configurator.WebSocketConfigurator;
import kh.spring.dto.ChatDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.service.ChatService;
import kh.spring.service.MemberService;

@ServerEndpoint(value="/chat", configurator = WebSocketConfigurator.class)


public class ChatEndpoint {
	
	private static Gson gson = new Gson();

	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<>());
	private HttpSession hSession;

	private ChatService cServ = CTXProvider.ctx.getBean(ChatService.class);
	private MemberService mServ = CTXProvider.ctx.getBean(MemberService.class);

	@OnOpen
	public void onConnect(Session session, EndpointConfig config) throws Exception {
		this.hSession = (HttpSession)config.getUserProperties().get("hSession");	// 우리가 보낸 Session 정보를 받아온다.
//
		clients.add(session);
		
	}
	
	@OnMessage
	public void onMessages(String message) throws Exception {
		
//		System.out.println("클라이언트에서 넘어오는 값 : "+message);
		String loginId = (String)hSession.getAttribute("loginId");
	
		MemberDTO mDto = mServ.myPage(loginId);
		String profileSysName = mDto.getImageSysName();
//		System.out.println(profileSysName);
		
		if(!message.contains("{=}")) {
			cServ.insert(new ChatDTO(0, loginId, message, profileSysName, "", null));
		}
		
		ChatDTO dto = cServ.selectOne(loginId);
		
		SimpleDateFormat sdf = new SimpleDateFormat("a hh:mm");
		dto.setFormedDate(sdf.format(dto.getWriteDate()));
		
//		else {
//			dto = cServ.selectOne(loginId);
//			
//			SimpleDateFormat sdf = new SimpleDateFormat("a hh:mm");
//			dto.setFormedDate(sdf.format(dto.getWriteDate()));
//		}
		
//		for(int i = 0; i < list.size(); i++) {
//			list.get(i).setFormedDate(sdf.format(list.get(i).getWriteDate()));
//		}
		synchronized(clients) {
			for(Session s : clients) {
				try {
					//s.getBasicRemote().sendText(arr.toString());
					s.getBasicRemote().sendText(gson.toJson(dto));
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

//	@OnMessage
//	public void onMessages(String message) {
//		
//		String loginId = (String)hSession.getAttribute("loginID");
//		
//		cServ.insert(new ChatDTO(0, loginId, message, "", "", null));
//		
//		// 메세지 출력 (+ FormedDate에 format)
//		
//		
//		List<ChatDTO> list = cServ.select();
//		
//		SimpleDateFormat sdf = new SimpleDateFormat("a hh:mm");
//		for(int i = 0; i < list.size(); i++) {
//			list.get(i).setFormedDate(sdf.format(list.get(i).getWriteDate()));
//		}
//
//		synchronized(clients) {
//			for(Session s : clients) {
//				try {
//					//s.getBasicRemote().sendText(arr.toString());
//					s.getBasicRemote().sendText(gson.toJson(list));
//				} catch(Exception e) {
//					e.printStackTrace();
//				}
//			}
//		}
//	}
	
//	@OnMessage
//	public void onFile(ByteBuffer msg) {
//		 System.out.println("Binary message");
//
//		 String realPath = hSession.getServletContext().getRealPath("upload");
//		 
//	        FileOutputStream fos = null;
//	        File file = new File(realPath);
//	       
//	        System.out.println("리얼패스 : "+realPath);
//	        System.out.println("파일 : "+ file.getName());
//	        try {
//	            fos = new FileOutputStream(file);
//	        } catch (FileNotFoundException e) {         
//	            e.printStackTrace();
//	        }
//
//	        byte readdata = (byte) -999;
//	        while(readdata!=-1) {
//	            readdata=msg.get();
//	            try {
//	                fos.write(readdata);
//	                System.out.println("뭔가  되긴했음...");
//	            } catch (IOException e) {               
//	                e.printStackTrace();
//	            }
//	        }
//	}

	@OnClose
	public void onClose(Session session) {
		clients.remove(session);
	}

	@OnError
	public void onError(Session session, Throwable t) {
		t.printStackTrace();
		clients.remove(session);
	}
}
