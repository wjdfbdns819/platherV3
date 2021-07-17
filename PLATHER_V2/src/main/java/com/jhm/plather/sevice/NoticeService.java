package com.jhm.plather.sevice;

import java.util.List;

import com.jhm.plather.model.NoticeDTO;
import com.jhm.plather.model.NoticeVO;

public interface NoticeService {

	public List<NoticeDTO> selectAll();
	public int insert(NoticeVO noticeVO);
	public NoticeDTO findByNcode(String n_code);
}
