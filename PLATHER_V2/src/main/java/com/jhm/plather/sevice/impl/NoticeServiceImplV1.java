package com.jhm.plather.sevice.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jhm.plather.dao.NoticeDao;
import com.jhm.plather.model.NoticeDTO;
import com.jhm.plather.model.NoticeVO;
import com.jhm.plather.sevice.NoticeService;

import lombok.RequiredArgsConstructor;

@Service("notionService")
@RequiredArgsConstructor
public class NoticeServiceImplV1 implements NoticeService {

	protected final NoticeDao nDao;

	@Override
	public List<NoticeDTO> selectAll() {

		List<NoticeDTO> nvList = nDao.selectAll();
		return nvList;
	}

	@Override
	public int insert(NoticeVO noticeVO) {

		String n_code = nDao.findByMaxNcode();
		if (n_code == null || n_code.equals("")) {
			n_code = String.format("N%04d", 1);
		} else {
			String num = n_code.substring(1);
			Integer ncode = Integer.valueOf(num) + 1;
			n_code = String.format("N%04d", ncode);
		}
		noticeVO.setN_code(n_code);
		nDao.insert(noticeVO);
		return 0;
	}

	@Override
	public NoticeDTO findByNcode(String n_code) {
		// TODO Auto-generated method stub
		NoticeDTO nDTO = nDao.findById(n_code);
		return nDTO;
	}

}
