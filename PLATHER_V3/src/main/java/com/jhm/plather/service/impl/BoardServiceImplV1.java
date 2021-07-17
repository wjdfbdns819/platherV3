package com.jhm.plather.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jhm.plather.dao.BoardDao;
import com.jhm.plather.dao.SongDao;
import com.jhm.plather.model.BoardAndSongDTO;
import com.jhm.plather.model.BoardVO;
import com.jhm.plather.model.SongVO;
import com.jhm.plather.service.BoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@Service
public class BoardServiceImplV1 implements BoardService{

	protected final BoardDao boardDao;
	protected final SongDao songDao;
	

	@Override
	public List<BoardVO> selectAll() {
		List<BoardVO> bList =boardDao.selectAll();
		return bList;
	}

	@Override
	public int register(BoardVO boardVO, List<SongVO> songList) {
		// 먼저 게시물을 insert하고 
		boardDao.insert(boardVO);
		//게시물 코드를 가져온다 : 게시판 코드와 리스트를 같이 insert하기 위해
		Long b_code = boardVO.getB_code();
		//받아온 list의 모든 데이터에 b_code를 세팅
		log.debug("songList>> : {}",songList.toString());
		// List<SongVO> playList = new ArrayList<SongVO>();
		
//		for(SongVO song : songList) {
//			log.debug(song.toString());
		//	song.setS_bcode(b_code);
		//
		//	playList.add(song);
//		}
		return songDao.insertWithList(b_code,songList);
		
	}

	@Override
	public BoardVO findById(Long b_code) {
	
		BoardVO vo= boardDao.findById(b_code);
		return vo;
	}

	@Override
	public int update(BoardVO vo) {
		int ret = boardDao.update(vo);
		return ret;
	}

	@Override
	public int delete(Long b_code) {
		int ret =boardDao.delete(b_code);
		return ret;
	}

	@Override
	public BoardAndSongDTO findByIdWithList(Long b_code) {
		
		BoardAndSongDTO bsDTO = boardDao.findByIdResultMap(b_code);
		return bsDTO;
	}
	
}
