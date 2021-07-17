package com.jhm.plather.dao;

import java.util.List;

import com.jhm.plather.model.BoardAndSongDTO;
import com.jhm.plather.model.BoardVO;

public interface BoardDao extends GenericDao<BoardVO, Long>{
	// 게시글 제목으로 찾기(게시글만)
	public List<BoardVO> findByTitle(String b_title);
	// userid로 찾기 
	public List<BoardVO> findByUserId(String b_id);
	//게시글 코드로 게시글 찾기
	public BoardAndSongDTO findByIdResultMap(Long b_code);
}