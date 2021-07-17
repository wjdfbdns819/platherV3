package com.jhm.plather.service;

import java.util.List;

import com.jhm.plather.model.BoardAndSongDTO;
import com.jhm.plather.model.BoardVO;
import com.jhm.plather.model.SongVO;

public interface BoardService {

	public List<BoardVO> selectAll();

	public BoardVO findById(Long b_code);

	public int register(BoardVO boardVO,List<SongVO> list);

	public int update(BoardVO vo);

	public int delete(Long b_code);
	
	public BoardAndSongDTO findByIdWithList(Long b_code);
	
} 