package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.BoardLikeDTO;

@Repository
public class BoardLikeDAO {

   @Autowired
   private SqlSession mybatis;
   
   public List<BoardLikeDTO> getLike(String loginId){
      return mybatis.selectList("BoardLike.getLike", loginId);
   }
   
   public int findLike(int seq, String id) {
      Map<String, Object> map = new HashMap<>();
      map.put("seq", seq);
      map.put("loginId", id);
      return mybatis.selectOne("BoardLike.findLike", map);
   }
}