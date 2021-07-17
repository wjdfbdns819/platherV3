package com.jhm.plather.service.impl;

import org.springframework.stereotype.Service;

import com.jhm.plather.dao.CommentDao;
import com.jhm.plather.model.CommentVO;
import com.jhm.plather.service.CommentService;

import lombok.RequiredArgsConstructor;

@Service("commentServiceV1")
@RequiredArgsConstructor
public class CommentServiceImplV1 implements CommentService{

	protected final CommentDao cDao;
	
	@Override
	public int insert(CommentVO cVO) {
		// TODO Auto-generated method stub
		
		cDao.insert(cVO);
		return 0;
	}

}
