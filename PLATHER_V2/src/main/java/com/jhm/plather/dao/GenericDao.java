package com.jhm.plather.dao;

import java.util.List;


public interface GenericDao<VO, PK, DTO> {

	public List<DTO> selectAll();
	
	public DTO findById(PK pk);

	public int insert(VO vo);

	public int update(VO vo);

	public int delete(PK pk);
}
