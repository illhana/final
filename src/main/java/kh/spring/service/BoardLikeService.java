package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.BoardLikeDAO;
import kh.spring.dto.BoardLikeDTO;

@Service
public class BoardLikeService {
   
   @Autowired
   private BoardLikeDAO dao;
   
   public List<BoardLikeDTO> getLike(String loginId){
      return dao.getLike(loginId);
   }
   
   public int findLike(int seq, String id) {
      int findLike = dao.findLike(seq, id);
      return findLike;
   }
}