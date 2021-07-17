package com.jhm.plather.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhm.plather.model.NoticeDTO;
import com.jhm.plather.sevice.NoticeService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class HomeController {

	protected final NoticeService nService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		return "member/login";
	}

	@RequestMapping(value = "/home", method = RequestMethod.POST)
	public String mainPage(NoticeDTO noticeDTO, Model model) {

		List<NoticeDTO> ntList = nService.selectAll();
		model.addAttribute("NTLIST", ntList);
		return "main";
	}

}
