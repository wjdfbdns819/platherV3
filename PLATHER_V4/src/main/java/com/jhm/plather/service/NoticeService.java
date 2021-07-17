package com.jhm.plather.service;

import java.util.List;

import com.jhm.plather.model.NoticeDTO;
import com.jhm.plather.model.NoticeVO;

public interface NoticeService {

	public List<NoticeVO> selectAll();
	public int insert(NoticeVO noticeVO);
	public NoticeVO findByNcode(String n_code);
}
