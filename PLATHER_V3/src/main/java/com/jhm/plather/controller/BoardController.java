package com.jhm.plather.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhm.plather.dao.CommentDao;
import com.jhm.plather.model.BoardAndSongDTO;
import com.jhm.plather.model.BoardVO;
import com.jhm.plather.model.CommentDTO;
import com.jhm.plather.model.SongVO;
import com.jhm.plather.service.BoardService;
import com.jhm.plather.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
@RequestMapping(value = "/board")
public class BoardController {

	protected final BoardService bSer;
	protected final MemberService mSer;
	protected final CommentDao cDao;

	@RequestMapping(value = { "/", "" }, method = RequestMethod.GET)
	public String list(Model model) {
		List<BoardVO> bList = bSer.selectAll();
		model.addAttribute("BOARDLIST", bList);
		return "playlist/play_list";
	}

	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String boarInsert(Model model) {
		mSer.findByIdBaord("yub");
		return "playlist/play_insert";
	}

	@ResponseBody
	// 게시물 등록 우선 임시로
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String boardInsert(@RequestBody Map<String, Object> bsMaps) {

		log.debug("bsMaps: {}", bsMaps.toString());
		BoardVO boardVO = new BoardVO();
		boardVO.setB_title((String) bsMaps.get("b_title"));
		boardVO.setB_content((String) bsMaps.get("b_content"));

		List<SongVO> songList = (List<SongVO>) bsMaps.get("playList");
		log.debug("Song List {}", songList.toString());
		int ret = bSer.register(boardVO, songList);
		if (ret > 0) {
			return "OK";
		} else {
			return "FAIL";
		}

		// List<SongVO> playList = null;
		// bSer.register(boardVO,playList);

//		 return "redirect:/board";
	}

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(Long b_code, Model model) {
		// 게시물 코드를 받아와 게시글 불러오기

		BoardAndSongDTO bsDTO = bSer.findByIdWithList(b_code);
		model.addAttribute("BOARD_DETAIL", bsDTO);
		
		// 코멘트 리스트!!
		List<CommentDTO> comList = cDao.findByCbcode(b_code);
		model.addAttribute("COMS", comList);
		return "playlist/play_detail";

	}

	/////////////////// 게시물 수정/////////
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String boardModify(Long b_code, Model model) {

		BoardAndSongDTO bsDTO = bSer.findByIdWithList(b_code);
		model.addAttribute("BOARD_DETAIL", bsDTO);

		return "playlist/play_modify";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String boardModifyPost(BoardVO vo) {

		bSer.update(vo);
		return "redirect:/board";
	}

	/////////////////// 게시물 삭제////////////////////
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String boardDelete(Long b_code) {

		bSer.delete(b_code);
		return "redirect:/board";
	}

}