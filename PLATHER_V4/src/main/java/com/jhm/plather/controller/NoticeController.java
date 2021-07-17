package com.jhm.plather.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhm.plather.dao.CommentDao;
import com.jhm.plather.dao.NoticeDao;
import com.jhm.plather.model.CommentDTO;
import com.jhm.plather.model.NoticeDTO;
import com.jhm.plather.model.NoticeVO;
import com.jhm.plather.service.NoticeService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/notice")
public class NoticeController {

	@Qualifier("notionService")
	protected final NoticeService nService;
	protected final NoticeDao nDao;
	protected final CommentDao cDao;

	@RequestMapping(value = { "/", "" }, method = RequestMethod.GET)
	public String list(Model model) {
		List<NoticeVO> nvList = nService.selectAll();
		model.addAttribute("NOTICES", nvList);
		log.debug(nvList.toString());
		return "notice/notice_list";
	}

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(String n_code, Model model) {
		NoticeVO nVO = nService.findByNcode(n_code);
		nDao.updateHit(n_code);
		List<CommentDTO> comList = cDao.findByCbcode(n_code);
		model.addAttribute("NT", nVO);
		model.addAttribute("COMS", comList);
		return "notice/notice_detail";
	}

	@RequestMapping(value = "/input", method = RequestMethod.GET)
	public String input() {
		return "notice/notice_input";
	}

	@RequestMapping(value = "/input", method = RequestMethod.POST)
	public String input(NoticeVO noticeVO) {

		nService.insert(noticeVO);
		return "redirect:/notice";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(String n_code) {
		nDao.delete(n_code);
		return "redirect:/notice";
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(String n_code, Model model) {
		NoticeVO nVO = nService.findByNcode(n_code);
		model.addAttribute("NT", nVO);
		return "notice/notice_input";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(NoticeVO noticeVO) {
		nDao.update(noticeVO);
		return "redirect:/notice";
	}

	@RequestMapping(value = "/search/{CAT}", method = RequestMethod.GET)
	public String search(@PathVariable(name = "CAT") String cat, Model model,
			@RequestParam(name = "text", required = false, defaultValue = "") String text) {
		if (cat.equalsIgnoreCase("TITLE")) {
			List<NoticeVO> searchTitle = nDao.findByTitle(text);
			model.addAttribute("SearchResult", searchTitle);
		} else if (cat.equalsIgnoreCase("NICK")) {
			List<NoticeVO> searchNick = nDao.findByNick(text);
			model.addAttribute("SearchResult", searchNick);
		} else if (cat.equalsIgnoreCase("CONTENT")) {
			List<NoticeVO> searchContent = nDao.findByContent(text);
			model.addAttribute("SearchResult", searchContent);
		}
		model.addAttribute("TEXT", text);
		return "notice/notice_search";
	}
}
